package com.app.statForge.reader;

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
     * Читает записи из InputStream
     *
     * @param inputStream  поток данных CSV
     * @param recordsCount число обрабатываемых записей (-1 для всех)
     * @return список RecordDto объектов
     */
    public List<RecordDto> convertRecords(InputStream inputStream, int recordsCount) {
        List<RecordDto> records = new ArrayList<>();

        try (CSVReader reader = new CSVReader(new InputStreamReader(inputStream))) {
            List<String[]> csvData = reader.readAll();

            // Пропускаем первую строку (заголовок)
            for (int i = 1; i < csvData.size(); i++) {
                if (recordsCount > 0 && records.size() >= recordsCount) {
                    break;
                }

                String[] row = csvData.get(i);
                RecordDto record = parser.parseRowToRecord(row);

                if (Objects.nonNull(record)) {
                    records.add(record);
                }
            }
        } catch (IOException | CsvException e) {
            log.error("Ошибка при чтении CSV из InputStream", e);
        }

        return records;
    }


}
