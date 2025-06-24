-- create table with
CREATE TABLE r_weapon_codes (
                                   id bigserial NOT NULL PRIMARY KEY,
                                   create_date timestamp with time zone not null DEFAULT now(),

                                   uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                                   code bigint NOT NULL,
                                   name varchar(255) NOT NULL,
                                   description varchar(255),

                                   CONSTRAINT uq_r_weapon_codes UNIQUE(uuid),
                                   CONSTRAINT uq_r_weapon_codes_1 UNIQUE(code)
);


select setval('r_weapon_codes_id_seq', 1, true);


COMMENT ON TABLE r_weapon_codes IS 'Код оружия и примеры применения';
COMMENT ON COLUMN r_weapon_codes.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_weapon_codes.create_date IS 'Дата создания';
COMMENT ON COLUMN r_weapon_codes.uuid IS 'Уникальный идентификатор записи справочника';
COMMENT ON COLUMN r_weapon_codes.code IS 'Код оружия';
COMMENT ON COLUMN r_weapon_codes.name IS 'Наименование оружия';
COMMENT ON COLUMN r_weapon_codes.description IS 'Описание применения оружия';