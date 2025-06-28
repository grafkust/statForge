package com.app.statForge.controller;

import com.app.statForge.service.ConverterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/convert")
@Slf4j
public class SaveRecordsController {

    private final ConverterService converterService;


    @GetMapping("/{cityAlias}")
    public void convertLA(@PathVariable String cityAlias,
                          @RequestParam(required = false, defaultValue = "1") Integer count) {
        converterService.convertRecords(count, cityAlias);
    }

}
