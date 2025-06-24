package com.app.statForge.reader;

import com.app.statForge.model.CsvColumn;
import com.app.statForge.model.RecordDto;
import com.app.statForge.util.SaveParseUtil;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * Класс для преобразования содержимого scv файлов в DTO записи
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class Converter {

    private final SaveParseUtil parser;


    @Value("${file-path.los-angeles}")
    private String LosAngelesFilePath;

    @Value("${file-path.new-york}")
    private String NewYorkFilePath;

    /**
     * Читает все записи из CSV файла
     *
     * @param filePath путь к CSV файлу
     * @return список RecordDto объектов
     */
    public List<RecordDto> convertAllRecords(String filePath) {
        return convertRecords(filePath, -1);
    }

    /**
     * Читает указанное количество записей из CSV файла
     *
     * @param filePath   путь к CSV файлу
     * @param maxRecords максимальное количество записей для чтения (-1 для всех)
     * @return список RecordDto объектов
     */
    public List<RecordDto> convertRecords(String filePath, int maxRecords) {
        List<RecordDto> records = new ArrayList<>();

        try (CSVReader reader = new CSVReader(new FileReader(filePath))) {
            List<String[]> csvData = reader.readAll();

            // Пропускаем заголовок (первую строку)
            for (int i = 1; i < csvData.size(); i++) {
                if (maxRecords > 0 && records.size() >= maxRecords) {
                    break;
                }

                String[] row = csvData.get(i);
                RecordDto record = parseRowToRecord(row);
                if (record != null) {
                    records.add(record);
                }
            }

            log.info("Успешно конвертировано {} записей из файла {}", records.size(), filePath);

        } catch (IOException | CsvException e) {
            log.error("Ошибка при чтении CSV файла: {}", filePath, e);
        }

        return records;
    }

    /**
     * Читает записи из InputStream
     *
     * @param inputStream поток данных CSV
     * @param maxRecords  максимальное количество записей (-1 для всех)
     * @return список RecordDto объектов
     */
    public List<RecordDto> convertRecords(InputStream inputStream, int maxRecords) {
        List<RecordDto> records = new ArrayList<>();

        try (CSVReader reader = new CSVReader(new InputStreamReader(inputStream))) {
            List<String[]> csvData = reader.readAll();

            // Пропускаем заголовок (первую строку)
            for (int i = 1; i < csvData.size(); i++) {
                if (maxRecords > 0 && records.size() >= maxRecords) {
                    break;
                }

                String[] row = csvData.get(i);
                RecordDto record = parseRowToRecord(row);
                if (record != null) {
                    records.add(record);
                }
            }

            log.info("Успешно конвертировано {} записей из InputStream", records.size());

        } catch (IOException | CsvException e) {
            log.error("Ошибка при чтении CSV из InputStream", e);
        }

        return records;
    }

    /**
     * Преобразует строку CSV в объект RecordDto
     *
     * @param row массив строк из CSV
     * @return объект RecordDto или null в случае ошибки
     */
    private RecordDto parseRowToRecord(String[] row) {
        try {
            if (row.length < CsvColumn.MINIMUM_COLUMNS) {
                log.warn("Недостаточно колонок в строке CSV: ожидается {}, получено {}",
                        CsvColumn.MINIMUM_COLUMNS, row.length);
                return null;
            }

            return RecordDto.builder()
                    .occurrenceReportNumber(parser.parseInteger(CsvColumn.DR_NO.getValue(row)))
                    .reportCreateDate(parser.parseDate(CsvColumn.DATE_RPTD.getValue(row)))
                    .occurrenceDate(parser.parseDate(CsvColumn.DATE_OCC.getValue(row)))
                    .occurrenceTime(CsvColumn.TIME_OCC.getValue(row))
                    .areaCode(CsvColumn.AREA.getValue(row))
                    .areaName(CsvColumn.AREA_NAME.getValue(row))
                    .reportingAreaNumber(parser.parseInteger(CsvColumn.RPT_DIST_NO.getValue(row)))
                    .crimeCategory(parser.parseShort(CsvColumn.PART_1_2.getValue(row)))
                    .crimeCode(parser.parseInteger(CsvColumn.CRM_CD.getValue(row)))
                    .crimeCodeDescription(CsvColumn.CRM_CD_DESC.getValue(row))
                    .modusOperandiCodes(CsvColumn.MOCODES.getValue(row))
                    .victimAge(parser.parseInteger(CsvColumn.VICT_AGE.getValue(row)))
                    .victimSex(parser.parseCharacter(CsvColumn.VICT_SEX.getValue(row)))
                    .victimDescentCode(parser.parseInteger(CsvColumn.VICT_DESCENT.getValue(row)))
                    .premiseCode(parser.parseInteger(CsvColumn.PREMIS_CD.getValue(row)))
                    .premiseDescription(CsvColumn.PREMIS_DESC.getValue(row))
                    .weaponCode(parser.parseInteger(CsvColumn.WEAPON_USED_CD.getValue(row)))
                    .weaponDescription(CsvColumn.WEAPON_DESC.getValue(row))
                    .status(CsvColumn.STATUS.getValue(row))
                    .statusDescription(CsvColumn.STATUS_DESC.getValue(row))
                    .additionalCrimeCode1(parser.parseLong(CsvColumn.CRM_CD_1.getValue(row)))
                    .additionalCrimeCode2(parser.parseLong(CsvColumn.CRM_CD_2.getValue(row)))
                    .additionalCrimeCode3(parser.parseLong(CsvColumn.CRM_CD_3.getValue(row)))
                    .additionalCrimeCode4(parser.parseLong(CsvColumn.CRM_CD_4.getValue(row)))
                    .location(CsvColumn.LOCATION.getValue(row))
                    .crossStreet(CsvColumn.CROSS_STREET.getValue(row))
                    .latitude(parser.parseDouble(CsvColumn.LAT.getValue(row)))
                    .longitude(parser.parseDouble(CsvColumn.LON.getValue(row)))
                    .build();

        } catch (Exception e) {
            log.error("Ошибка при парсинге строки CSV: {}", String.join(",", row), e);
            return null;
        }
    }


}
