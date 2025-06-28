package com.app.statForge.controller;

import com.app.statForge.model.FilePaths;
import com.app.statForge.service.ConverterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/convert")
@Slf4j
public class SaveRecordsController {

    private final ConverterService converterService;
    private final FilePaths filePaths;

    @GetMapping("/LA")
    public void convertLA(@RequestParam(required = false, defaultValue = "1") Integer recordsCount) {
        converterService.convertRecordsBatch(recordsCount, filePaths.getLosAngeles());
    }


    @GetMapping("/NY")
    public void convertNY(@RequestParam(required = false, defaultValue = "1") Integer recordsCount) {
        converterService.convertRecordsBatch(recordsCount, filePaths.getNewYork());
    }


}
