CREATE TABLE r_premise_codes (
                                       id bigserial NOT NULL PRIMARY KEY,
                                       create_date timestamp with time zone not null DEFAULT now(),
                                       uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                                       code integer not null,
                                       description text not null,
                                       description_rus text,

                                       CONSTRAINT uq_r_premise_codes_uuid UNIQUE(uuid),
                                       CONSTRAINT uq_r_premise_codes_code UNIQUE(code)
);

COMMENT ON TABLE r_premise_codes IS 'Справочник кодов мест преступления';
COMMENT ON COLUMN r_premise_codes.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_premise_codes.create_date IS 'Дата создания записи';
COMMENT ON COLUMN r_premise_codes.uuid IS 'Уникальный идентификатор записи справочника';

COMMENT ON COLUMN r_premise_codes.code IS 'Уникальный код места происшествия';
COMMENT ON COLUMN r_premise_codes.description IS 'Наименование места происшествия';
COMMENT ON COLUMN r_premise_codes.description_rus IS 'Наименование места происшествия на русском яз.';