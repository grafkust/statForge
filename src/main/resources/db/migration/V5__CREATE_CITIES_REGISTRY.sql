CREATE TABLE r_cities (
                          id bigserial NOT NULL PRIMARY KEY,
                          create_date timestamp with time zone not null DEFAULT now(),
                          uuid uuid NOT NULL DEFAULT uuid_generate_v4(),
                          
                          name varchar(100),
                          name_rus varchar(100),

                          CONSTRAINT uq_r_cities UNIQUE(uuid)
);

COMMENT ON TABLE r_cities IS 'Справочник городов';
COMMENT ON COLUMN r_cities.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_cities.create_date IS 'Дата создания записи';
COMMENT ON COLUMN r_cities.uuid IS 'Уникальный идентификатор записи справочника';
        
COMMENT ON COLUMN r_cities.name IS 'Название города';
COMMENT ON COLUMN r_cities.name_rus IS 'Название города на русс.яз';

INSERT INTO r_cities (name, name_rus)
VALUES
    ('New-York', 'Нью-Йорк'),
    ('Los Angeles', 'Лос-Анджелес');