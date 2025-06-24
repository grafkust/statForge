package com.app.statForge.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * Enum для определения порядка колонок в CSV файле
 */
@Getter
public enum CsvColumn {

    DR_NO(0, "DR_NO"),
    DATE_RPTD(1, "Date Rptd"),
    DATE_OCC(2, "DATE OCC"),
    TIME_OCC(3, "TIME OCC"),
    AREA(4, "AREA"),
    AREA_NAME(5, "AREA NAME"),
    RPT_DIST_NO(6, "Rpt Dist No"),
    PART_1_2(7, "Part 1-2"),
    CRM_CD(8, "Crm Cd"),
    CRM_CD_DESC(9, "Crm Cd Desc"),
    MOCODES(10, "Mocodes"),
    VICT_AGE(11, "Vict Age"),
    VICT_SEX(12, "Vict Sex"),
    VICT_DESCENT(13, "Vict Descent"),
    PREMIS_CD(14, "Premis Cd"),
    PREMIS_DESC(15, "Premis Desc"),
    WEAPON_USED_CD(16, "Weapon Used Cd"),
    WEAPON_DESC(17, "Weapon Desc"),
    STATUS(18, "Status"),
    STATUS_DESC(19, "Status Desc"),
    CRM_CD_1(20, "Crm Cd 1"),
    CRM_CD_2(21, "Crm Cd 2"),
    CRM_CD_3(22, "Crm Cd 3"),
    CRM_CD_4(23, "Crm Cd 4"),
    LOCATION(24, "LOCATION"),
    CROSS_STREET(25, "Cross Street"),
    LAT(26, "LAT"),
    LON(27, "LON");

    private final int index;
    private final String headerName;

    CsvColumn(int index, String headerName) {
        this.index = index;
        this.headerName = headerName;
    }


    /**
     * Минимальное количество колонок в валидной CSV строке
     */
    public static final int MINIMUM_COLUMNS = values().length;

    /**
     * Безопасное получение значения из массива строк
     *
     * @param row массив значений строки CSV
     * @return значение колонки или null если индекс выходит за границы
     */
    public String getValue(String[] row) {
        if (row == null || index >= row.length) {
            return null;
        }
        String value = row[index];
        return (value == null || value.trim().isEmpty()) ? null : value.trim();
    }
}
