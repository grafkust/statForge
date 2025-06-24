package com.app.statForge.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.function.Function;

@Component
@Slf4j
public class SaveParseUtil {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");

    public Integer parseInteger(String value) {
        return safeParse(value, Integer::valueOf);
    }

    public Short parseShort(String value) {
        return safeParse(value, Short::valueOf);
    }


    public Long parseLong(String value) {
        return safeParse(value, Long::valueOf);
    }


    public Double parseDouble(String value) {
        return safeParse(value, Double::valueOf);
    }


    public Character parseCharacter(String value) {
        String trimmedValue = validateAndTrim(value);
        if (trimmedValue == null) {
            return null;
        }
        return trimmedValue.charAt(0);
    }


    public Date parseDate(String value) {
        String trimmedValue = validateAndTrim(value);
        if (trimmedValue == null) {
            return null;
        }

        try {
            return DATE_FORMAT.parse(trimmedValue);
        } catch (ParseException e) {
            log.warn("Не удалось распарсить дату: '{}'", value);
            return null;
        }
    }


    /**
     * Проверяет, что строка не null и не пустая после trim
     *
     * @param value строка для проверки
     * @return trimmed строка или null если пустая/null
     */
    private String validateAndTrim(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return value.trim();
    }

    /**
     * Универсальный метод для безопасного парсинга с функцией преобразования
     *
     * @param value строка для парсинга
     * @param parser функция парсинга
     * @param <T> тип результата
     * @return распарсенное значение или null
     */
    private <T> T safeParse(String value, Function<String, T> parser) {
        String trimmedValue = validateAndTrim(value);
        if (trimmedValue == null) {
            return null;
        }

        try {
            return parser.apply(trimmedValue);
        } catch (NumberFormatException e) {
            log.debug("Не удалось распарсить значение '{}': {}", value, e.getMessage());
            return null;
        }
    }
}