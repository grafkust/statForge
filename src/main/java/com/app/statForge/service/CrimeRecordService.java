package com.app.statForge.service;

import com.app.statForge.model.RecordDto;
import io.micrometer.common.util.StringUtils;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Slf4j
public class CrimeRecordService {

    private final NamedParameterJdbcTemplate jdbcTemplate;

    public CrimeRecordService(NamedParameterJdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    /**
     * Batch сохранение для импорта CSV
     */
    @Transactional
    public void saveRecordsBatch(List<RecordDto> records, Integer cityId) {
        log.info("Начинаем batch сохранение {} записей", records.size());

        for (RecordDto record : records) {
            saveRecord(record, cityId);
        }
        log.info("Batch сохранение завершено");
    }

    /**
     * Сохраняет запись преступления с автоматическим созданием связанных справочников
     */
    @Transactional
    public void saveRecord(RecordDto recordDto, Integer cityId) {

        if (isRecordAlreadyExists(recordDto.getOccurrenceReportNumber())) {
            log.warn("Запись с occurrence_report_number {} уже существует, пропускаем сохранение",
                    recordDto.getOccurrenceReportNumber());
            return;
        }

        try {
            // 1. Создаем premise_codes если нужно
            Long premiseCodeId = ensurePremiseCodeExists(recordDto.getPremiseCode(), recordDto.getPremiseDescription());

            // 2. Разбираем modus operandi коды
            List<Long> modusOperandiIds = parseModusOperandiCodes(recordDto.getModusOperandiCodes());

            // 3. Выполняем основной INSERT с подзапросами для получения ID
            String insertSql = buildInsertQuery();

            MapSqlParameterSource params = buildParameters(recordDto, cityId, premiseCodeId, modusOperandiIds);

            UUID recordUuid = jdbcTemplate.queryForObject(insertSql, params, UUID.class);

        } catch (Exception e) {
            log.error("Ошибка при сохранении записи: {}", e.getMessage(), e);
            throw new RuntimeException("Не удалось сохранить запись преступления", e);
        }
    }

    /**
     * Проверяет существование записи по occurrence_report_number
     */
    private boolean isRecordAlreadyExists(Integer occurrenceReportNumber) {
        if (occurrenceReportNumber == null) {
            return false; // если номера нет, считаем что записи не существует
        }
        try {
            String checkSql = "SELECT COUNT(*) FROM t_crime_records WHERE occurrence_report_number = :reportNumber";

            Integer count = jdbcTemplate.queryForObject(checkSql,
                    Map.of("reportNumber", occurrenceReportNumber),
                    Integer.class);

            return count != null && count > 0;
        } catch (Exception e) {
            log.error("Ошибка при проверке записи: {}", e.getMessage(), e);
            throw new RuntimeException("Не удалось проверить запись на существование", e);
        }


    }

    /**
     * Создает premise_code если его нет
     */
    private Long ensurePremiseCodeExists(Integer premiseCode, String premiseDescription) {
        if (Objects.isNull(premiseCode)) return null;

        String checkSql = """
                SELECT id FROM r_premise_codes WHERE code = :code
                """;

        try {
            return jdbcTemplate.queryForObject(checkSql,
                    Map.of("code", premiseCode), Long.class);
        } catch (EmptyResultDataAccessException e) {
            if (!StringUtils.isEmpty(premiseDescription) && !StringUtils.isEmpty(premiseDescription)) {
                String insertSql = """
                    INSERT INTO r_premise_codes (code, description) 
                    VALUES (:code, :description) 
                    RETURNING id
                    """;

                return jdbcTemplate.queryForObject(insertSql,
                        Map.of("code", premiseCode, "description", premiseDescription),
                        Long.class);
            }
        }
        return null;
    }

    /**
     * Разбирает строку modus operandi кодов и возвращает список ID
     */
    private List<Long> parseModusOperandiCodes(String modusOperandiCodes) {
        if (StringUtils.isBlank(modusOperandiCodes)) {
            return Collections.emptyList();
        }

        String[] codes = modusOperandiCodes.split("[,\\s]+");
        List<Long> ids = new ArrayList<>();

        for (String code : codes) {
            if (StringUtils.isNotBlank(code)) {
                int modusCode = Integer.parseInt(code.trim());

                Long existingId = findExistingModusOperandi(modusCode);

                if (Objects.nonNull(existingId)) {
                    ids.add(existingId);
                } else {
                    Long newId = createNewModusOperandi(modusCode);
                    ids.add(newId);
                }
            }
        }

        return ids;
    }

    private Long findExistingModusOperandi(Integer modusCode) {
        String sql = "SELECT id FROM r_modus_operandi WHERE code = :code";
        String rootSql = "SELECT id FROM r_root_modus_operandi WHERE code = :code";

        try {
            return jdbcTemplate.queryForObject(sql, Map.of("code", modusCode), Long.class);
        } catch (EmptyResultDataAccessException e) {
            try {
                return jdbcTemplate.queryForObject(rootSql, Map.of("code", modusCode), Long.class);
            } catch (EmptyResultDataAccessException e1) {
                return null;
            }
        }
    }

    private Long createNewModusOperandi(Integer modusCode) {
        String insertSql = "INSERT INTO r_modus_operandi (code) VALUES (:code) RETURNING id";

        Long newId = jdbcTemplate.queryForObject(insertSql, Map.of("code", modusCode), Long.class);
        log.info("Создан новый modus operandi: код {} -> id {}", modusCode, newId);

        return newId;
    }

    /**
     * Строит SQL запрос для вставки
     */
    private String buildInsertQuery() {
        return """
                INSERT INTO t_crime_records (
                    occurrence_report_number,
                    report_create_date,
                    occurrence_date,
                    city_id,
                    area_name,
                    reporting_area_number,
                    crime_category,
                    crime_code_id,
                    victim_age,
                    victim_sex,
                    victim_descent_id,
                    premise_code_id,
                    weapon_code_id,
                    case_status,
                    status_description,
                    crime_code_1_id,
                    crime_code_2_id,
                    crime_code_3_id,
                    crime_code_4_id,
                    location,
                    cross_street,
                    latitude,
                    longitude,
                    modus_operandi_1_id,
                    modus_operandi_2_id,
                    modus_operandi_3_id,
                    modus_operandi_4_id,
                    modus_operandi_5_id,
                    modus_operandi_6_id,
                    modus_operandi_7_id,
                    modus_operandi_8_id,
                    modus_operandi_9_id,
                    modus_operandi_10_id
                ) VALUES (
                    :occurrenceReportNumber,
                    :reportCreateDate,
                    :occurrenceDate,
                    :cityId,
                    :areaName,
                    :reportingAreaNumber,
                    :crimeCategory,
                    (SELECT id FROM r_crime_codes WHERE code = :crimeCode),
                    :victimAge,
                    :victimSex,
                    (SELECT id FROM r_victim_descent WHERE alias = :victimDescentCode),
                    :premiseCodeId,
                    (SELECT id FROM r_weapon_codes WHERE code = :weaponCode),
                    :status,
                    :statusDescription,
                    (SELECT id FROM r_crime_codes WHERE code = :additionalCrimeCode1),
                    (SELECT id FROM r_crime_codes WHERE code = :additionalCrimeCode2),
                    (SELECT id FROM r_crime_codes WHERE code = :additionalCrimeCode3),
                    (SELECT id FROM r_crime_codes WHERE code = :additionalCrimeCode4),
                    :location,
                    :crossStreet,
                    :latitude,
                    :longitude,
                    :modusOperandi1Id,
                    :modusOperandi2Id,
                    :modusOperandi3Id,
                    :modusOperandi4Id,
                    :modusOperandi5Id,
                    :modusOperandi6Id,
                    :modusOperandi7Id,
                    :modusOperandi8Id,
                    :modusOperandi9Id,
                    :modusOperandi10Id
                ) RETURNING uuid
                """;
    }

    /**
     * Строит параметры для запроса
     */
    private MapSqlParameterSource buildParameters(RecordDto dto, Integer cityId,
                                                  Long premiseCodeId, List<Long> modusOperandiIds) {
        MapSqlParameterSource params = new MapSqlParameterSource();

        params.addValue("occurrenceReportNumber", dto.getOccurrenceReportNumber());
        params.addValue("reportCreateDate", dto.getReportCreateDate());
        params.addValue("occurrenceDate", dto.getOccurrenceDate());
        params.addValue("cityId", cityId);
        params.addValue("areaName", dto.getAreaName());
        params.addValue("reportingAreaNumber", dto.getReportingAreaNumber());
        params.addValue("crimeCategory", dto.getCrimeCategory());
        params.addValue("crimeCode", dto.getCrimeCode());
        params.addValue("victimAge", (dto.getVictimAge() != null && dto.getVictimAge() >= 0) ? dto.getVictimAge() : null);
        params.addValue("victimSex", dto.getVictimSex());
        params.addValue("victimDescentCode", dto.getVictimDescentCode());
        params.addValue("premiseCodeId", premiseCodeId);
        params.addValue("weaponCode", dto.getWeaponCode());
        params.addValue("status", dto.getStatus());
        params.addValue("statusDescription", dto.getStatusDescription());
        params.addValue("additionalCrimeCode1", dto.getAdditionalCrimeCode1());
        params.addValue("additionalCrimeCode2", dto.getAdditionalCrimeCode2());
        params.addValue("additionalCrimeCode3", dto.getAdditionalCrimeCode3());
        params.addValue("additionalCrimeCode4", dto.getAdditionalCrimeCode4());
        params.addValue("location", dto.getLocation());
        params.addValue("crossStreet", dto.getCrossStreet());
        params.addValue("latitude", dto.getLatitude());
        params.addValue("longitude", dto.getLongitude());

        // Modus operandi (до 10 штук)
        for (int i = 1; i <= 10; i++) {
            Long modusId = i <= modusOperandiIds.size() ? modusOperandiIds.get(i - 1) : null;
            params.addValue("modusOperandi" + i + "Id", modusId);
        }

        return params;
    }


}


