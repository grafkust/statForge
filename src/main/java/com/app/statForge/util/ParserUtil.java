package com.app.statForge.util;

import com.app.statForge.model.CatalogItemDto;
import com.app.statForge.model.CsvColumn;
import com.app.statForge.model.RecordDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
@Slf4j
public class ParserUtil {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");

    /**
     * Преобразует CSV строку в объект RecordDto
     *
     * @param row массив строк из CSV
     * @return объект RecordDto или null в случае ошибки
     */
    public RecordDto parseRowToRecord(String[] row) {
        try {
            return RecordDto.builder()
                    .occurrenceReportNumber(parseInteger(CsvColumn.DR_NO.getValue(row)))
                    .reportCreateDate(parseDate(CsvColumn.DATE_RPTD.getValue(row)))
                    .occurrenceDate(parseDate(CsvColumn.DATE_OCC.getValue(row)))
                    .occurrenceTime(parseTime(CsvColumn.TIME_OCC.getValue(row)))
                    .areaCode(CsvColumn.AREA.getValue(row))
                    .areaName(CsvColumn.AREA_NAME.getValue(row))
                    .reportingAreaNumber(parseInteger(CsvColumn.RPT_DIST_NO.getValue(row)))
                    .crimeCategory(parseShort(CsvColumn.PART_1_2.getValue(row)))
                    .crimeCode(parseInteger(CsvColumn.CRM_CD.getValue(row)))
                    .crimeCodeDescription(CsvColumn.CRM_CD_DESC.getValue(row))
                    .modusOperandiCodes(CsvColumn.MOCODES.getValue(row))
                    .victimAge(parseInteger(CsvColumn.VICT_AGE.getValue(row)))
                    .victimSex(parseCharacter(CsvColumn.VICT_SEX.getValue(row)))
                    .victimDescentCode(parseCharacter(CsvColumn.VICT_DESCENT.getValue(row)))
                    .premiseCode(parseInteger(CsvColumn.PREMIS_CD.getValue(row)))
                    .premiseDescription(CsvColumn.PREMIS_DESC.getValue(row))
                    .weaponCode(parseInteger(CsvColumn.WEAPON_USED_CD.getValue(row)))
                    .weaponDescription(CsvColumn.WEAPON_DESC.getValue(row))
                    .status(CsvColumn.STATUS.getValue(row))
                    .statusDescription(CsvColumn.STATUS_DESC.getValue(row))
                    .additionalCrimeCode1(parseLong(CsvColumn.CRM_CD_1.getValue(row)))
                    .additionalCrimeCode2(parseLong(CsvColumn.CRM_CD_2.getValue(row)))
                    .additionalCrimeCode3(parseLong(CsvColumn.CRM_CD_3.getValue(row)))
                    .additionalCrimeCode4(parseLong(CsvColumn.CRM_CD_4.getValue(row)))
                    .location(CsvColumn.LOCATION.getValue(row))
                    .crossStreet(CsvColumn.CROSS_STREET.getValue(row))
                    .latitude(parseDouble(CsvColumn.LAT.getValue(row)))
                    .longitude(parseDouble(CsvColumn.LON.getValue(row)))
                    .build();

        } catch (Exception e) {
            log.error("Ошибка при парсинге строки CSV: {}", String.join(",", row), e);
            return null;
        }
    }

    public List<CatalogItemDto> getCatalogItems(List<Map<String, Object>> rawData) {
        return rawData.stream()
                .map(CatalogItemDto::new)
                .collect(Collectors.toList());
    }


    private Integer parseInteger(String value) {
        return safeParse(value, Integer::valueOf);
    }

    private Short parseShort(String value) {
        return safeParse(value, Short::valueOf);
    }

    private Long parseLong(String value) {
        return safeParse(value, Long::valueOf);
    }

    private Double parseDouble(String value) {
        return safeParse(value, Double::valueOf);
    }

    private Character parseCharacter(String value) {
        String trimmedValue = validateAndTrim(value);
        if (Objects.isNull(trimmedValue)) {
            return null;
        }
        return trimmedValue.charAt(0);
    }


    private LocalDate parseDate(String value) {
        String trimmedValue = validateAndTrim(value);
        if (Objects.isNull(trimmedValue)) {
            return null;
        }

        try {
            Date fullDate = DATE_FORMAT.parse(trimmedValue);

            return fullDate.toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate();

        } catch (Exception e) {
            log.error("Не удалось распарсить дату: '{}'. Error message: '{}'", value, e.getMessage());
            return null;
        }
    }

    /**
     * Форматирует время из формата "0845" в "08:45:00"
     */
    public LocalTime parseTime(String value) {
        String trimmedValue = validateAndTrim(value);

        if (trimmedValue == null || trimmedValue.length() != 4) {
            return null;
        }

        try {
            int hours = Integer.parseInt(trimmedValue.substring(0, 2));
            int minutes = Integer.parseInt(trimmedValue.substring(2, 4));

            return LocalTime.of(hours, minutes);

        } catch (Exception e) {
            log.error("Не удалось отформатировать время: '{}'. Error message: '{}", value, e.getMessage());
            return null;
        }
    }


    /**
     * Проверяет, что строка не null и не пустая после trim
     *
     * @param value строка для проверки
     * @return trimmed строка или null если пустая/null
     */
    private String validateAndTrim(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return value.trim();
    }

    /**
     * Универсальный метод для безопасного парсинга с функцией преобразования
     *
     * @param value  строка для парсинга
     * @param parser функция парсинга
     * @param <T>    тип результата
     * @return распарсенное значение или null
     */
    private <T> T safeParse(String value, Function<String, T> parser) {
        String trimmedValue = validateAndTrim(value);
        if (trimmedValue == null) {
            return null;
        }

        try {
            return parser.apply(trimmedValue);
        } catch (NumberFormatException e) {
            log.error("Не удалось распарсить значение '{}'. Error message: {}", value, e.getMessage());
            return null;
        }
    }
}