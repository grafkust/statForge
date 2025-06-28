package com.app.statForge.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "schema.origin")
@Getter
@Setter
public class SchemaConfig {
    private String cities;
    private String crimeCodes;
    private String weaponCodes;
    private String crimeRecords;
    private String premiseCodes;
    private String victimDescent;
    private String modusOperandi;
    private String rootModusOperandi;
}



