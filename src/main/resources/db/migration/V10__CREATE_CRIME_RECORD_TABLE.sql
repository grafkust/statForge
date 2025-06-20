
CREATE TABLE t_crime_records (
                                 id bigserial NOT NULL PRIMARY KEY,
                                 create_date timestamp with time zone not null DEFAULT now(),

                                 uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                                 occurrence_report_number integer,
                                 report_create_date date,
                                 occurrence_date date,
                                 city_id integer references r_cities(id),
                                 area_name varchar(255),
                                 reporting_area_number integer,
                                 crime_category smallint,
                                 crime_code_id bigint references r_crime_codes(id),
                                 modus_operandi_1_id bigint references r_modus_operandi(id),
                                 modus_operandi_2_id bigint references r_modus_operandi(id),
                                 victim_age integer,
                                 victim_sex char(1),
                                 victim_descent_id bigint references r_victim_descent(id),
                                 premise_code_id bigint references r_premise_codes(id),
                                 weapon_code_id bigint references r_weapon_codes(id),
                                 case_status varchar(255),
                                 status_description varchar(255),
                                 crime_code_1_id bigint references r_crime_codes(id),
                                 crime_code_2_id bigint references r_crime_codes(id),
                                 crime_code_3_id bigint references r_crime_codes(id),
                                 crime_code_4_id bigint references r_crime_codes(id),
                                 location varchar(255),
                                 cross_street varchar(255),
                                 latitude float8,
                                 longitude float8,

                                 CONSTRAINT uq_t_crime_records_uuid UNIQUE(uuid),
                                 CONSTRAINT uq_t_crime_records_rep_num UNIQUE(occurrence_report_number),
                                 CONSTRAINT chk_t_crime_records_victim_age CHECK (victim_age >= 0 AND victim_age <= 120),
                                 CONSTRAINT chk_t_crime_records_victim_sex CHECK (victim_sex IN ('M', 'F', 'U')),
                                 CONSTRAINT chk_t_crime_records_crime_category CHECK (crime_category IN (1, 2)),
                                 CONSTRAINT chk_t_crime_records_latitude CHECK (latitude >= -90 AND latitude <= 90),
                                 CONSTRAINT chk_t_crime_records_longitude CHECK (longitude >= -180 AND longitude <= 180)
);


select setval('t_crime_records_id_seq', 1, true);


COMMENT ON TABLE t_crime_records IS 'Полная запись о преступлении';
COMMENT ON COLUMN t_crime_records.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN t_crime_records.create_date IS 'Дата создания записи';
COMMENT ON COLUMN t_crime_records.uuid IS 'Уникальный идентификатор записи справочника';

COMMENT ON COLUMN t_crime_records.occurrence_report_number IS 'Уникальный номер отчета о происшествии';
COMMENT ON COLUMN t_crime_records.report_create_date IS 'Дата составления отчета';
COMMENT ON COLUMN t_crime_records.occurrence_date IS 'Дата происшествия';
COMMENT ON COLUMN t_crime_records.city_id IS 'Город, в котором совершено преступление';
COMMENT ON COLUMN t_crime_records.area_name IS 'Название района';
COMMENT ON COLUMN t_crime_records.reporting_area_number IS 'Номер отчетного участка';
COMMENT ON COLUMN t_crime_records.crime_category IS 'Категория преступления (1 = тяжкие, 2 = менее тяжкие)';
COMMENT ON COLUMN t_crime_records.crime_code_id IS 'Код преступления';
COMMENT ON COLUMN t_crime_records.modus_operandi_1_id IS 'Первый код метода совершения преступления';
COMMENT ON COLUMN t_crime_records.modus_operandi_2_id IS 'Второй код метода совершения преступления';
COMMENT ON COLUMN t_crime_records.victim_age IS 'Возраст жертвы';
COMMENT ON COLUMN t_crime_records.victim_sex IS 'Пол жертвы (M/F)';
COMMENT ON COLUMN t_crime_records.victim_descent_id IS 'Происхождение жертвы';
COMMENT ON COLUMN t_crime_records.premise_code_id IS 'Код места происшествия';
COMMENT ON COLUMN t_crime_records.weapon_code_id IS 'Код использованного оружия';
COMMENT ON COLUMN t_crime_records.case_status IS 'Статус дела';
COMMENT ON COLUMN t_crime_records.status_description IS 'Описание статуса';
COMMENT ON COLUMN t_crime_records.crime_code_1_id IS 'Дополнительный код преступления 1';
COMMENT ON COLUMN t_crime_records.crime_code_2_id IS 'Дополнительный код преступления 2';
COMMENT ON COLUMN t_crime_records.crime_code_3_id IS 'Дополнительный код преступления 3';
COMMENT ON COLUMN t_crime_records.crime_code_4_id IS 'Дополнительный код преступления 4';
COMMENT ON COLUMN t_crime_records.location IS 'Приблизительный адрес';
COMMENT ON COLUMN t_crime_records.cross_street IS 'Ближайшее пересечение улиц';
COMMENT ON COLUMN t_crime_records.latitude IS 'Широта местоположения';
COMMENT ON COLUMN t_crime_records.longitude IS 'Долгота местоположения';
