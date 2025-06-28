package com.app.statForge.model;

import lombok.Getter;

@Getter
public enum Cities {

    NEW_YORK("NY", "New York"),
    LOS_ANGELES("LA", "Los Angeles");

    private final String alias;
    private final String name;

    Cities(String alias, String name) {
        this.alias = alias;
        this.name = name;
    }
}
