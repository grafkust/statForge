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
public class CitiesDao {

    private final SchemaConfig schemaConfig;
    private final NamedParameterJdbcTemplate jdbcTemplate;


    public CatalogItemDto getCityByAlias (String alias) {
        String sql = String.format("SELECT * FROM %s WHERE alias = :alias", schemaConfig.getCities());
        try {
            Map<String, Object> record =  jdbcTemplate.queryForMap(sql, Map.of("alias", alias));
            return new CatalogItemDto(record);
        } catch (EmptyResultDataAccessException e) {
            return new CatalogItemDto();
        }
    }



}
