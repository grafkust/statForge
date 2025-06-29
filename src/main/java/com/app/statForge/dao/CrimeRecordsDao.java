package com.app.statForge.dao;

import com.app.statForge.model.CatalogItemDto;
import com.app.statForge.model.SchemaConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Slf4j
public class CrimeRecordsDao {

    private final SchemaConfig schemaConfig;
    private final NamedParameterJdbcTemplate jdbcTemplate;

    public CatalogItemDto getCatalogItemByReportNumber(Integer reportNumber) {
        String sql = String.format("SELECT * FROM %s WHERE occurrence_report_number = :reportNumber", schemaConfig.getCrimeRecords());

        try {
            Map<String, Object> record = jdbcTemplate.queryForMap(sql,
                    Map.of("reportNumber", reportNumber));

            return new CatalogItemDto(record);
        } catch (EmptyResultDataAccessException e) {
            return new CatalogItemDto();
        }
    }

    @Transactional
    public Integer createNewRecord(MapSqlParameterSource params) {
        return jdbcTemplate.update(buildInsertQuery(), params);
    }


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
                )
                """;
    }

}
