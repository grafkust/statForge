
CREATE TABLE r_root_modus_operandi (
                                       id bigserial NOT NULL PRIMARY KEY,
                                       create_date timestamp with time zone not null DEFAULT now(),
                                       uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                                       code integer not null,
                                       description text not null,
                                       description_rus text,

                                       CONSTRAINT uq_r_root_modus_operandi_uuid UNIQUE(uuid),
                                       CONSTRAINT uq_r_root_modus_operandi_code UNIQUE(code)
);

COMMENT ON TABLE r_root_modus_operandi IS 'Справочник моделей поведения преступника (базовые категории)';
COMMENT ON COLUMN r_root_modus_operandi.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_root_modus_operandi.create_date IS 'Дата создания записи';
COMMENT ON COLUMN r_root_modus_operandi.uuid IS 'Уникальный идентификатор записи справочника';

COMMENT ON COLUMN r_root_modus_operandi.code IS 'Уникальный код поведения';
COMMENT ON COLUMN r_root_modus_operandi.description IS 'Наименование';
COMMENT ON COLUMN r_root_modus_operandi.description_rus IS 'Наименование на русском яз.';




CREATE TABLE r_modus_operandi (
                                  id bigserial NOT NULL PRIMARY KEY,
                                  create_date timestamp with time zone not null DEFAULT now(),
                                  uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                                  code integer not null,
                                  description text not null,
                                  description_rus text,
                                  parent_id bigint references r_root_modus_operandi(id),

                                  CONSTRAINT uq_r_modus_operandi_uuid UNIQUE(uuid),
                                  CONSTRAINT uq_r_modus_operandi_code UNIQUE(code)
);

COMMENT ON TABLE r_modus_operandi IS 'Справочник моделей поведения преступника';
COMMENT ON COLUMN r_modus_operandi.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_modus_operandi.create_date IS 'Дата создания записи';
COMMENT ON COLUMN r_modus_operandi.uuid IS 'Уникальный идентификатор записи справочника';

COMMENT ON COLUMN r_modus_operandi.code IS 'Уникальный код поведения';
COMMENT ON COLUMN r_modus_operandi.description IS 'Наименование';
COMMENT ON COLUMN r_modus_operandi.description_rus IS 'Наименование на русском яз.';
COMMENT ON COLUMN r_modus_operandi.parent_id IS 'Ссылка на корневой modus';






