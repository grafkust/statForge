package com.app.statForge.service;

import com.app.statForge.model.RecordDto;
import com.app.statForge.util.SaveParseUtil;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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

    /**
     * Читает записи из scv
     *
     * @param recordsCount число обрабатываемых записей (-1 для всех)
     * @param filePath     путь до scv файла
     * @return список RecordDto объектов
     */
    public void convertRecordsBatch(int recordsCount, String filePath) {

        try (InputStream stream = getClass().getClassLoader().getResourceAsStream(filePath)) {

            if (Objects.isNull(stream)) {
                throw new RuntimeException("Файл не найден в ресурсах: " + filePath);
            }

            int processedCount = 0;
            int batchSize = 1000;
            List<RecordDto> batch = new ArrayList<>();

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
                        batch.add(record);
                        processedCount++;

                        // Сохраняем батчами
                        if (batch.size() >= batchSize) {
                            crimeRecordService.saveRecordsBatch(batch, 1);
                            batch.clear();
                            log.info("Обработано {} записей", processedCount);
                        }
                    }
                }

                // Сохраняем остатки
                if (!batch.isEmpty()) {
                    crimeRecordService.saveRecordsBatch(batch, 1);
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


    /**
     * Сохраняет запись в таблицу t_crime_records
     * <p>
     * Важно:
     * СТРУКТУРА БД                                                                    СТРУКТУРА DTO
     * city_id integer references r_cities(id)                        зависит от файла из которого загружается запись (ссылка на r_cities)
     * <p>
     * weapon_code_id bigint references r_weapon_codes(id)            поле weaponCode записи (ссылка на поле code справочника r_weapon_codes)
     * <p>
     * crime_code_id bigint references r_crime_codes(id)              поле crimeCode записи (ссылка на поле code справочника r_crime_codes)
     * crime_code_1_id bigint references r_crime_codes(id)            поле additionalCrimeCode1 записи (ссылка на поле code справочника r_crime_codes)
     * crime_code_2_id bigint references r_crime_codes(id)            поле additionalCrimeCode2 записи (ссылка на поле code справочника r_crime_codes)
     * crime_code_3_id bigint references r_crime_codes(id)            поле additionalCrimeCode3 записи (ссылка на поле code справочника r_crime_codes)
     * crime_code_4_id bigint references r_crime_codes(id)            поле additionalCrimeCode4 записи (ссылка на поле code справочника r_crime_codes)
     * <p>
     * modus_operandi_1_id bigint references r_modus_operandi(id)     поле modusOperandiCodes в dto содержит строку с кодами (может быть до 10).
     * modus_operandi_2_id bigint references r_modus_operandi(id)     каждый код ссылка на поле code справочника r_modus_operandi.
     * <p>
     * victim_descent_id bigint references r_victim_descent(id)       поле victimDescentCode записи (ссылка на поле alias справочника r_victim_descent)
     * premise_code_id bigint references r_premise_codes(id)          нужно создавать запись в r_premise_codes с полями code и description по значению premiseCode и premiseDescription
     */
    @Transactional
    public void saveRecord(RecordDto recordDto) {
        //получаем все необходимые id (а лучше написать SQL на insert с шаблоном и вложенными запросами)
        //если необходимо, сначала создаем запись в r_premise_codes и получаем ее id
        //все делаем в транзакции для одной записи
        //Проверка, что такая запись существует, будет выполняться через unique constraint на occurrence_report_number

    }


}
