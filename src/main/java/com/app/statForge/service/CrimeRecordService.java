package com.app.statForge.service;

import com.app.statForge.dao.CitiesDao;
import com.app.statForge.dao.CrimeRecordsDao;
import com.app.statForge.dao.ModusOperandiDao;
import com.app.statForge.dao.PremiseCodeDao;
import com.app.statForge.model.CatalogItemDto;
import com.app.statForge.model.RecordDto;
import io.micrometer.common.util.StringUtils;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class CrimeRecordService {

    private final CrimeRecordsDao crimeRecordsDAO;
    private final PremiseCodeDao premiseCodeDAO;
    private final ModusOperandiDao modusOperandiDAO;
    private final CitiesDao citiesDao;


    /**
     * Batch сохранение для импорта CSV
     */
    @Transactional
    public void saveRecordsBatch(List<RecordDto> records, Long cityId) {
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
    public void saveRecord(RecordDto recordDto, Long cityId) {

        Integer reportNumber = recordDto.getOccurrenceReportNumber();

        if (Objects.isNull(reportNumber) || !CollectionUtils.isEmpty(crimeRecordsDAO.getCatalogItemByReportNumber(reportNumber))) {
            log.warn("Запись с occurrence_report_number {} не может быть сохранена", reportNumber);
            return;
        }

        try {
            // Создаем premise_codes если нужно
            Long premiseCodeId = ensurePremiseCodeExists(recordDto.getPremiseCode(), recordDto.getPremiseDescription());

            List<Long> modusOperandiIds = parseModusOperandiCodes(recordDto.getModusOperandiCodes());

            // задаем все параметры для выполнения запроса
            MapSqlParameterSource params = buildParameters(recordDto, cityId, premiseCodeId, modusOperandiIds);

            crimeRecordsDAO.createNewRecord(params);

        } catch (Exception e) {
            throw new RuntimeException("Не удалось сохранить запись преступления", e);
        }
    }

    @Transactional
    public Long getCityIdByName(String alias) {
        CatalogItemDto city = citiesDao.getCityByAlias(alias);
        if (CollectionUtils.isEmpty(city)) {
            throw new IllegalArgumentException("Unknown city alias: " + alias);
        }
        return city.getId();
    }


    /**
     * Создает premise_code если его нет
     */
    private Long ensurePremiseCodeExists(Integer premiseCode, String premiseDescription) {
        if (Objects.isNull(premiseCode)) return null;

        CatalogItemDto record = premiseCodeDAO.getPremiseCodeByCode(premiseCode);
        if (CollectionUtils.isEmpty(record) && StringUtils.isNotBlank(premiseDescription)) {
            return premiseCodeDAO.createPremiseCode(premiseCode, premiseDescription);
        }
        return CollectionUtils.isEmpty(record) ? null : record.getId();
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
                    Long newId = modusOperandiDAO.createModusOperandi(modusCode);
                    ids.add(newId);
                }
            }
        }

        return ids;
    }

    private Long findExistingModusOperandi(Integer modusCode) {
        CatalogItemDto record = modusOperandiDAO.getModusOperandiByCode(modusCode);

        if (CollectionUtils.isEmpty(record)) {
            record = modusOperandiDAO.getRootModusOperandiByCode(modusCode);
        }
        return CollectionUtils.isEmpty(record) ? null : record.getId();
    }

    /**
     * Строит параметры для запроса
     */
    private MapSqlParameterSource buildParameters(RecordDto dto, Long cityId,
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


