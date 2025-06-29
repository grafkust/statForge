package com.app.statForge.model;

import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@NoArgsConstructor
public class CatalogItemDto extends HashMap<String, Object> {

    public CatalogItemDto(Map<String, ?> item) {
        super(item);
    }


    public String getUuid() {
        return get("uuid").toString();
    }

    public Long getId() {
        return (Long) get("id");
    }
}
