package com.app.statForge.model;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * Класс описывающий структуру scv записи
 */
@Data
@Builder
public class RecordDto {

    private Integer occurrenceReportNumber;
    private LocalDate reportCreateDate;

    private LocalDate occurrenceDate;
    private LocalTime occurrenceTime;

    private String areaCode;
    private String areaName;

    private Integer reportingAreaNumber;

    private Short crimeCategory;

    private Integer crimeCode;
    private String crimeCodeDescription;

    private String modusOperandiCodes;

    private Integer victimAge;
    private Character victimSex;
    private Character victimDescentCode;

    /**
     * Место происшествия
     */
    private Integer premiseCode;
    private String premiseDescription;

    private Integer weaponCode;
    private String weaponDescription;

    /**
     * Статус дела
     */
    private String status;
    private String statusDescription;

    private Long additionalCrimeCode1;
    private Long additionalCrimeCode2;
    private Long additionalCrimeCode3;
    private Long additionalCrimeCode4;

    private String location;
    private String crossStreet;

    private Double latitude;
    private Double longitude;
}
