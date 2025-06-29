package com.app.statForge.controller;

import com.app.statForge.service.ConverterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/convert")
@Slf4j
public class SaveRecordsController {

    private final ConverterService converterService;


    @GetMapping("/{cityAlias}")
    public ResponseEntity<String> convertCSV(@PathVariable String cityAlias,
                                             @RequestParam(required = false, defaultValue = "1") Integer count) {
        Integer processed = converterService.convertRecords(count, cityAlias);
        return ResponseEntity.ok("Обработано " + processed + " записей из " + count);
    }

    @GetMapping("/{cityAlias}/all")
    public ResponseEntity<String> convertALLsCV(@PathVariable String cityAlias) {
        Integer processed = converterService.convertRecords(-1, cityAlias);
        return ResponseEntity.ok("Обработано " + processed + " записей");
    }

}
