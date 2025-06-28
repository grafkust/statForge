package com.app.statForge.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "file-path")
@Getter
@Setter
public class FilePaths {
    private String losAngeles;
    private String newYork;
}
