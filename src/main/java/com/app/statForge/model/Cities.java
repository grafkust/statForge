package com.app.statForge.model;

import lombok.Getter;

@Getter
public enum Cities {

    NEW_YORK("NY", "New-York"),
    LOS_ANGELES("LA", "Los Angeles");

    private final String alias;
    private final String name;

    public static final String NY_ALIAS = "NY";
    public static final String LA_ALIAS = "LA";

    Cities(String alias, String name) {
        this.alias = alias;
        this.name = name;
    }
}
