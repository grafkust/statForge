package com.app.statForge.service;

import com.app.statForge.model.Cities;
import com.app.statForge.model.CsvColumn;
import com.app.statForge.model.FilePaths;
import com.app.statForge.model.RecordDto;
import com.app.statForge.util.ParserUtil;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Класс для преобразования содержимого scv файла в записи в БД
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class ConverterService {

    private final ParserUtil parser;
    private final CrimeRecordService crimeRecordService;
    private final FilePaths filePaths;

    @Value("${file.batch-size}")
    private int batchSize;

    /**
     * Читает записи из scv и сохраняет в БД
     *
     * @param recordsCount число обрабатываемых записей (-1 для всех)
     */
    public Integer convertRecords(int recordsCount, String cityAlias) {
        String filePath = identifyFilePath(cityAlias);
        int processedCount = 0;

        try (InputStream stream = getClass().getClassLoader().getResourceAsStream(filePath)) {

            if (Objects.isNull(stream)) {
                throw new RuntimeException("Файл не найден в ресурсах: " + filePath);
            }


            List<RecordDto> processingRecords = new ArrayList<>();
            Long cityId = crimeRecordService.getCityIdByName(cityAlias);

            try (CSVReader reader = new CSVReader(new InputStreamReader(stream))) {
                String[] row;
                boolean isFirstRow = true;

                // Читаем по одной строке (не загружаем весь файл в память)
                while ((row = reader.readNext()) != null) {
                    if (isFirstRow) {
                        isFirstRow = false;
                        continue;
                    }

                    if (recordsCount > 0 && processedCount >= recordsCount) {
                        break;
                    }

                    if (row.length == 1 && row[0].contains(",")) {
                        String problematicLine = row[0];
                        log.warn("Обнаружена проблемная строка, необходим ручной разбор: {}", problematicLine);

                        row = parseProblematicLine(problematicLine);
                    }

                    if (row.length < CsvColumn.MINIMUM_COLUMNS) {
                        log.error("Недостаточно колонок в CSV строке: ожидается {}, получено {}. Содержание строки: {}",
                                CsvColumn.MINIMUM_COLUMNS, row.length, row);
                        continue;
                    }

                    RecordDto record = parser.parseRowToRecord(row);
                    if (record != null) {
                        processingRecords.add(record);
                        processedCount++;

                        if (processingRecords.size() >= batchSize) {
                            crimeRecordService.saveRecordsBatch(processingRecords, cityId);
                            processingRecords.clear();
                            log.info("Обработано {} записей", processedCount);
                        }
                    }
                }

                if (!processingRecords.isEmpty()) {
                    crimeRecordService.saveRecordsBatch(processingRecords, cityId);
                    return processedCount;
                }

            } catch (IOException | CsvException e) {
                throw new RuntimeException("Ошибка обработки CSV", e);
            }
        } catch (Exception e) {
            throw new RuntimeException("Ошибка при загрузке файла: " + filePath, e);
        }
        return processedCount;
    }

    /**
     * Метод для обработки экранированных кавычек строки и кавычек в начале/конце строки
     *
     * @param line строка scv записи
     */
    private String[] parseProblematicLine(String line) {
        List<String> fields = new ArrayList<>();
        boolean inQuotes = false; // Флаг: находимся ли мы внутри кавычек
        StringBuilder currentField = new StringBuilder();

        // Проходим по каждому символу строки
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);

            if (c == '"') {
                // Проверяем следующий символ на экранированные кавычки ""
                if (i + 1 < line.length() && line.charAt(i + 1) == '"') {
                    currentField.append('"');
                    i++; // Пропускаем следующую кавычку
                } else {
                    inQuotes = !inQuotes;
                }
            } else if (c == ',' && !inQuotes) {
                // Запятая является разделителем только если мы не внутри кавычек
                fields.add(currentField.toString().trim());
                currentField.setLength(0);
            } else {
                currentField.append(c);
            }
        }

        fields.add(currentField.toString().trim());
        return fields.toArray(new String[0]);
    }


    private String identifyFilePath(String cityAbbreviation) {
        return switch (cityAbbreviation) {
            case (Cities.NY_ALIAS) -> filePaths.getNewYork();
            case (Cities.LA_ALIAS) -> filePaths.getLosAngeles();
            default -> throw new IllegalArgumentException("Unknown city alias: " + cityAbbreviation);
        };
    }

}
