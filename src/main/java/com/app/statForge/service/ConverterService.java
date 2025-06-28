package com.app.statForge.service;

import com.app.statForge.model.Cities;
import com.app.statForge.model.FilePaths;
import com.app.statForge.model.RecordDto;
import com.app.statForge.util.SaveParseUtil;
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
 * Класс для преобразования содержимого scv файлов в записи в БД
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class ConverterService {

    private final SaveParseUtil parser;
    private final CrimeRecordService crimeRecordService;
    private final FilePaths filePaths;

    @Value("${file.batch-size}")
    private int batchSize;

    /**
     * Читает записи из scv и сохраняет в БД
     *
     * @param recordsCount число обрабатываемых записей (-1 для всех)
     */
    public void convertRecords(int recordsCount, String cityAlias) {
        String filePath = identifyFilePath(cityAlias);

        try (InputStream stream = getClass().getClassLoader().getResourceAsStream(filePath)) {

            if (Objects.isNull(stream)) {
                throw new RuntimeException("Файл не найден в ресурсах: " + filePath);
            }

            int processedCount = 0;
            List<RecordDto> processingRecords = new ArrayList<>();
            Integer cityId = crimeRecordService.getCityIdByName(cityAlias);

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
                    log.info("Обработано {} записей (финальный батч)", processedCount);
                }

            } catch (IOException | CsvException e) {
                log.error("Ошибка при чтении CSV из InputStream", e);
                throw new RuntimeException("Ошибка обработки CSV", e);
            }
        } catch (Exception e) {
            throw new RuntimeException("Ошибка при загрузке файла: " + filePath, e);
        }
    }


    private String identifyFilePath(String cityAbbreviation) {
        return switch (cityAbbreviation) {
            case (Cities.NY_ALIAS) -> filePaths.getNewYork();
            case (Cities.LA_ALIAS) -> filePaths.getLosAngeles();
            default -> throw new IllegalArgumentException("Unknown city alias: " + cityAbbreviation);
        };
    }

}
