CREATE TABLE r_crime_codes (
                                id bigserial NOT NULL PRIMARY KEY,
                                create_date timestamp with time zone not null DEFAULT now(),

                                uuid uuid NOT NULL DEFAULT uuid_generate_v4(),

                                code bigint NOT NULL,
                                name varchar(255) NOT NULL,
                                description varchar(255),

                                CONSTRAINT uq_r_crime_codes UNIQUE(uuid),
                                CONSTRAINT uq_r_crime_codes_1 UNIQUE(code)
);


select setval('r_crime_codes_id_seq', 1, true);


COMMENT ON TABLE r_crime_codes IS 'Код оружия и примеры применения';
COMMENT ON COLUMN r_crime_codes.id IS 'Идентификатор версии записи справочника';
COMMENT ON COLUMN r_crime_codes.create_date IS 'Дата создания';
COMMENT ON COLUMN r_crime_codes.uuid IS 'Уникальный идентификатор записи справочника';
COMMENT ON COLUMN r_crime_codes.code IS 'Код преступления';
COMMENT ON COLUMN r_crime_codes.name IS 'Наименование преступления';
COMMENT ON COLUMN r_crime_codes.description IS 'Описание совершенного преступления';


INSERT INTO r_crime_codes (code, name, description)
VALUES
    (110, 'CRIMINAL HOMICIDE', 'Умышленное убийство человека'),
    (121, 'RAPE, FORCIBLE', 'Изнасилование с применением силы'),
    (122, 'RAPE, ATTEMPTED', 'Попытка изнасилования'),
    (210, 'ROBBERY', 'Ограбление магазина с применением оружия'),
    (220, 'ATTEMPTED ROBBERY', 'Неудавшаяся попытка ограбления банка'),
    (230, 'ASSAULT WITH DEADLY WEAPON', 'Нападение с использованием ножа'),
    (231, 'ASSAULT WITH FIREARM', 'Нападение с использованием огнестрельного оружия'),
    (235, 'CHILD ABUSE (PHYSICAL)', 'Физическое насилие над ребенком'),
    (236, 'INTIMATE PARTNER - AGGRAVATED ASSAULT', 'Тяжкое нападение на интимного партнера'),
    (310, 'BURGLARY', 'Взлом и проникновение в дом'),
    (320, 'BURGLARY, ATTEMPTED', 'Попытка взлома магазина'),
    (330, 'BURGLARY FROM VEHICLE', 'Кража из припаркованной машины'),
    (331, 'THEFT FROM MOTOR VEHICLE', 'Кража вещей из салона автомобиля'),
    (341, 'GRAND THEFT ($950.01 & OVER)', 'Кража имущества стоимостью более $950'),
    (343, 'SHOPLIFTING - GRAND THEFT ($950.01 & OVER)', 'Магазинная кража на сумму более $950'),
    (350, 'THEFT, PERSON', 'Карманная кража'),
    (351, 'PURSE SNATCHING', 'Выхватывание сумки у прохожего'),
    (352, 'PICKPOCKET', 'Карманная кража в общественном транспорте'),
    (353, 'GRAND THEFT FROM PERSON', 'Кража ценных вещей непосредственно с человека'),
    (354, 'THEFT OF IDENTITY', 'Кража и использование чужих персональных данных'),
    (420, 'THEFT FROM MOTOR VEHICLE', 'Кража из автомобиля'),
    (421, 'THEFT FROM MOTOR VEHICLE, ATTEMPT', 'Попытка кражи из автомобиля'),
    (433, 'THEFT OF CELLULAR PHONE', 'Кража мобильного телефона'),
    (440, 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Мелкая кража на сумму до $950'),
    (441, 'THEFT PLAIN - ATTEMPT', 'Неудавшаяся попытка кражи'),
    (442, 'SHOPLIFTING - PETTY THEFT ($950 & UNDER)', 'Мелкая магазинная кража до $950'),
    (443, 'SHOPLIFTING - ATTEMPT', 'Попытка магазинной кражи'),
    (450, 'BIKE - STOLEN', 'Кража велосипеда'),
    (451, 'BIKE - ATTEMPTED STOLEN', 'Попытка кражи велосипеда'),
    (480, 'BIKE - PETTY THEFT ($950 & UNDER)', 'Кража велосипеда стоимостью до $950'),
    (485, 'BIKE - ATTEMPTED PETTY THEFT', 'Попытка кражи недорогого велосипеда'),
    (510, 'VEHICLE - STOLEN', 'Угон автомобиля'),
    (520, 'VEHICLE - ATTEMPTED STOLEN', 'Попытка угона автомобиля'),
    (624, 'BATTERY - SIMPLE ASSAULT', 'Нападение без оружия'),
    (625, 'OTHER ASSAULT', 'Другие виды нападений'),
    (626, 'INTIMATE PARTNER - SIMPLE ASSAULT', 'Домашнее насилие без оружия'),
    (627, 'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT', 'Физическое насилие над ребенком без оружия'),
    (647, 'STALKING', 'Преследование человека'),
    (648, 'ARSON', 'Умышленный поджог'),
    (649, 'DOCUMENT FORGERY / STOLEN FELONY', 'Подделка документов'),
    (660, 'COUNTERFEIT', 'Изготовление поддельных денег'),
    (661, 'UNAUTHORIZED COMPUTER ACCESS', 'Незаконный доступ к компьютерной системе'),
    (662, 'BUNCO, GRAND THEFT', 'Мошенничество на крупную сумму'),
    (663, 'BUNCO, PETTY THEFT', 'Мелкое мошенничество'),
    (668, 'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)', 'Растрата крупной суммы'),
    (669, 'EMBEZZLEMENT, PETTY THEFT ($950 & UNDER)', 'Растрата небольшой суммы'),
    (740, 'VANDALISM', 'Порча общественного имущества'),
    (745, 'VANDALISM - FELONY ($400 & OVER)', 'Серьезный вандализм на сумму более $400'),
    (746, 'VANDALISM - MISDEMEANOR ($399 OR UNDER)', 'Мелкий вандализм на сумму до $399'),
    (760, 'LEWD CONDUCT', 'Непристойное поведение в общественном месте'),
    (761, 'BRANDISH WEAPON', 'Угроза оружием'),
    (762, 'LEWD/LASCIVIOUS ACTS WITH CHILD', 'Развратные действия в отношении ребенка'),
    (763, 'TRESPASSING', 'Незаконное проникновение на частную территорию'),
    (805, 'BOMB SCARE', 'Ложное сообщение о бомбе'),
    (810, 'SEX,UNLAWFUL INTERCOURSE', 'Незаконные половые отношения'),
    (812, 'CHILD ABUSE (13 OR UNDER)', 'Жестокое обращение с ребенком до 13 лет'),
    (813, 'CHILD ANNOYING (14 TO 17)', 'Домогательство к несовершеннолетним 14-17 лет'),
    (814, 'CHILD PORNOGRAPHY', 'Детская порнография'),
    (815, 'SEXUAL PENETRATION WITH FOREIGN OBJECT', 'Сексуальное насилие с использованием предметов'),
    (820, 'ORAL COPULATION', 'Принуждение к оральному сексу'),
    (821, 'SODOMY', 'Насильственные действия сексуального характера'),
    (840, 'BRIBERY', 'Взяточничество'),
    (845, 'SEX OFFENDER REGISTRANT OUT OF COMPLIANCE', 'Нарушение регистрации сексуальным преступником'),
    (850, 'INDECENT EXPOSURE', 'Непристойное обнажение в публичном месте'),
    (860, 'BATTERY WITH SEXUAL CONTACT', 'Нападение с сексуальными домогательствами'),
    (900, 'VIOLATION OF COURT ORDER', 'Нарушение судебного предписания'),
    (901, 'VIOLATION OF RESTRAINING ORDER', 'Нарушение запретительного судебного приказа'),
    (902, 'VIOLATION OF TEMPORARY RESTRAINING ORDER', 'Нарушение временного запретительного приказа'),
    (920, 'TELEPHONE PROPERTY - DAMAGE', 'Повреждение телефонного оборудования'),
    (921, 'TELEPHONE REPORT', 'Телефонное хулиганство'),
    (922, 'THREATENING PHONE CALLS', 'Угрожающие телефонные звонки'),
    (930, 'CRIMINAL THREATS - NO WEAPON DISPLAYED', 'Угрозы без демонстрации оружия'),
    (940, 'EXTORTION', 'Вымогательство'),
    (941, 'EXTORTION, ATTEMPTED', 'Попытка вымогательства'),
    (942, 'THREATENING LETTERS', 'Письма с угрозами'),
    (943, 'THREATENING LETTERS, ATTEMPTED', 'Попытка угроз через письма'),
    (944, 'REPLICA FIREARMS(SALE,DISPLAY,MANUFACTURE)', 'Незаконные операции с копиями оружия'),
    (946, 'OTHER MISCELLANEOUS CRIME', 'Прочие преступления'),
    (950, 'DISTURBING THE PEACE', 'Нарушение общественного порядка'),
    (951, 'HARASSMENT', 'Преследование, домогательство'),
    (956, 'LETTERS, LEWD - TELEPHONE CALLS, LEWD', 'Непристойные письма или звонки');
