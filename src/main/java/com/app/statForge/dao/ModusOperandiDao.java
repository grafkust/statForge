package com.app.statForge.dao;

import com.app.statForge.model.CatalogItemDto;
import com.app.statForge.model.SchemaConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Repository
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ModusOperandiDao {

    private final SchemaConfig schemaConfig;
    private final NamedParameterJdbcTemplate jdbcTemplate;


    public CatalogItemDto getModusOperandiByCode(Integer code) {
        String sql = String.format("SELECT * FROM %s WHERE code = :code", schemaConfig.getModusOperandi());
        try {
            Map<String, Object> record = jdbcTemplate.queryForMap(sql, Map.of("code", code));
            return new CatalogItemDto(record);
        } catch (EmptyResultDataAccessException e) {
            return new CatalogItemDto();
        }
    }

    public CatalogItemDto getRootModusOperandiByCode(Integer code) {
        String sql = String.format("SELECT * FROM %s WHERE code = :code", schemaConfig.getRootModusOperandi());
        try {
            Map<String, Object> record =  jdbcTemplate.queryForMap(sql, Map.of("code", code));
            return new CatalogItemDto(record);
        } catch (EmptyResultDataAccessException e) {
            return new CatalogItemDto();
        }
    }

    @Transactional
    public Long createModusOperandi(Integer code) {
        String sql = String.format("INSERT INTO %s (code) VALUES (:code) RETURNING id", schemaConfig.getModusOperandi());
        return jdbcTemplate.queryForObject(sql, Map.of("code", code), Long.class);
    }
}

