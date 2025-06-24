CREATE TABLE r_victim_descent (
                          id bigserial NOT NULL PRIMARY KEY,
                          create_date timestamp with time zone not null DEFAULT now(),
                          uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                          alias varchar(10) NOT NULL,
                          name varchar(100),
                          name_rus varchar(100),
    
                          CONSTRAINT uq_r_victim_descent_uuid UNIQUE(uuid),
                          CONSTRAINT uq_r_victim_descent_alias UNIQUE(alias)
);

COMMENT ON TABLE r_victim_descent IS 'Справочник национальной принадлежности жертвы';
COMMENT ON COLUMN r_victim_descent.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_victim_descent.create_date IS 'Дата создания записи';
COMMENT ON COLUMN r_victim_descent.uuid IS 'Уникальный идентификатор записи справочника';

COMMENT ON COLUMN r_victim_descent.alias IS 'Короткое название национальности';
COMMENT ON COLUMN r_victim_descent.name IS 'Наименование';
COMMENT ON COLUMN r_victim_descent.name_rus IS 'Наименование на русском яз.';


INSERT INTO r_victim_descent (alias, name, name_rus)
VALUES
    ('A', 'Asian', 'Азиат'),
    ('B', 'Black', 'Афроамериканец'),
    ('H', 'Hispanic', 'Латиноамериканец'),
    ('W', 'White', 'Белый'),
    ('O', 'Other', 'Другое'),
    ('K', 'Korean', 'Кореец'),
    ('F', 'Filipino', 'Филиппинец'),
    ('J', 'Japanese', 'Японец'),
    ('C', 'Chinese', 'Китаец'),
    ('V', 'Vietnamese', 'Вьетнамец'),
    ('I', 'American Indian', 'Коренной американец'),
    ('P', 'Pacific Islander', 'Житель тихоокеанских островов'),
    ('X', 'Unknown', 'Неизвестно'),
    ('Z', 'Other Asian', 'Другой азиат');