package com.app.statForge.controller;

import com.app.statForge.model.RecordDto;
import com.app.statForge.reader.Converter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStream;
import java.util.List;
import java.util.Objects;

@RestController
@RequiredArgsConstructor
@RequestMapping("/file")
@Slf4j
public class FileTestController {

    private final Converter converter;

    @Value("${file-path.los-angeles}")
    private String LosAngelesFilePath;


    @GetMapping("/convert")
    public List<RecordDto> convert() {

        try (InputStream records = getClass().getClassLoader().getResourceAsStream(LosAngelesFilePath)){

            if (Objects.isNull(records)) {
                throw new RuntimeException("Файл не найден в ресурсах: " + LosAngelesFilePath);
            }

            return converter.convertRecords(records, 5);
        } catch (Exception e) {
            throw new RuntimeException("Ошибка при загрузке файла: " + LosAngelesFilePath, e);
        }

    }


}
