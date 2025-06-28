
-- Жилые помещения
UPDATE public.r_premise_codes SET description_rus = 'Частный дом' WHERE description = 'SINGLE FAMILY DWELLING';
UPDATE public.r_premise_codes SET description_rus = 'Многоквартирный дом (квартира, дуплекс и т.д.)' WHERE description = 'MULTI-UNIT DWELLING (APARTMENT, DUPLEX, ETC)';
UPDATE public.r_premise_codes SET description_rus = 'Кондоминиум/таунхаус' WHERE description = 'CONDOMINIUM/TOWNHOUSE';
UPDATE public.r_premise_codes SET description_rus = 'Муниципальное/социальное жилье' WHERE description = 'PROJECT/TENEMENT/PUBLIC HOUSING';
UPDATE public.r_premise_codes SET description_rus = 'Другое жилье' WHERE description = 'OTHER RESIDENCE';
UPDATE public.r_premise_codes SET description_rus = 'Жилое крыльцо' WHERE description = 'PORCH, RESIDENTIAL';
UPDATE public.r_premise_codes SET description_rus = 'Одноместное жилье (общежитие)' WHERE description = 'SINGLE RESIDENCE OCCUPANCY (SRO''S) LOCATIONS';
UPDATE public.r_premise_codes SET description_rus = 'Мобильный дом/трейлер/дом на колесах' WHERE description = 'MOBILE HOME/TRAILERS/CONSTRUCTION TRAILERS/RV''S/MOTORHOME';
UPDATE public.r_premise_codes SET description_rus = 'Групповой дом (интернат)' WHERE description = 'GROUP HOME';
UPDATE public.r_premise_codes SET description_rus = 'Транзитное жилье/реабилитационный центр' WHERE description = 'TRANSITIONAL HOUSING/HALFWAY HOUSE';
UPDATE public.r_premise_codes SET description_rus = 'Дом престарелых/пансионат' WHERE description = 'NURSING/CONVALESCENT/RETIREMENT HOME';
UPDATE public.r_premise_codes SET description_rus = 'Приемная семья для мальчиков или девочек' WHERE description = 'FOSTER HOME BOYS OR GIRLS*';
UPDATE public.r_premise_codes SET description_rus = 'Краткосрочная аренда для отдыха' WHERE description = 'SHORT-TERM VACATION RENTAL';

-- Улицы и общественные места
UPDATE public.r_premise_codes SET description_rus = 'Тротуар' WHERE description = 'SIDEWALK';
UPDATE public.r_premise_codes SET description_rus = 'Улица' WHERE description = 'STREET';
UPDATE public.r_premise_codes SET description_rus = 'Переулок' WHERE description = 'ALLEY';
UPDATE public.r_premise_codes SET description_rus = 'Подъездная дорога' WHERE description = 'DRIVEWAY';
UPDATE public.r_premise_codes SET description_rus = 'Автострада' WHERE description = 'FREEWAY';
UPDATE public.r_premise_codes SET description_rus = 'Парк/детская площадка' WHERE description = 'PARK/PLAYGROUND';
UPDATE public.r_premise_codes SET description_rus = 'Пляж' WHERE description = 'BEACH';
UPDATE public.r_premise_codes SET description_rus = 'Пустырь' WHERE description = 'VACANT LOT';
UPDATE public.r_premise_codes SET description_rus = 'Русло реки' WHERE description = 'RIVER BED*';
UPDATE public.r_premise_codes SET description_rus = 'Лагерь бездомных' WHERE description = 'TRANSIENT ENCAMPMENT';
UPDATE public.r_premise_codes SET description_rus = 'Пешеходный мост' WHERE description = 'PEDESTRIAN OVERCROSSING';
UPDATE public.r_premise_codes SET description_rus = 'Подземный переход/мост' WHERE description = 'UNDERPASS/BRIDGE*';
UPDATE public.r_premise_codes SET description_rus = 'Туннель' WHERE description = 'TUNNEL';


-- Парковки и гаражи
UPDATE public.r_premise_codes SET description_rus = 'Парковка' WHERE description = 'PARKING LOT';
UPDATE public.r_premise_codes SET description_rus = 'Подземная парковка/паркинг в здании' WHERE description = 'PARKING UNDERGROUND/BUILDING';
UPDATE public.r_premise_codes SET description_rus = 'Гараж/навес для машины' WHERE description = 'GARAGE/CARPORT';
UPDATE public.r_premise_codes SET description_rus = 'Склад транспортных средств' WHERE description = 'VEHICLE STORAGE LOT (CARS, TRUCKS, RV''S, BOATS, TRAILERS, ETC.)';
UPDATE public.r_premise_codes SET description_rus = 'Парковка MTA' WHERE description = 'MTA PROPERTY OR PARKING LOT';
UPDATE public.r_premise_codes SET description_rus = 'Услуги парковщика' WHERE description = 'VALET';

-- Дворы и территории
UPDATE public.r_premise_codes SET description_rus = 'Двор (жилой/коммерческий)' WHERE description = 'YARD (RESIDENTIAL/BUSINESS)';
UPDATE public.r_premise_codes SET description_rus = 'Патио' WHERE description = 'PATIO*';
UPDATE public.r_premise_codes SET description_rus = 'Балкон' WHERE description = 'BALCONY*';
UPDATE public.r_premise_codes SET description_rus = 'Сарай для хранения' WHERE description = 'STORAGE SHED';
UPDATE public.r_premise_codes SET description_rus = 'Сарай для инструментов' WHERE description = 'TOOL SHED*';
UPDATE public.r_premise_codes SET description_rus = 'Стройплощадка' WHERE description = 'CONSTRUCTION SITE';

-- Торговля и услуги
UPDATE public.r_premise_codes SET description_rus = 'Другой бизнес' WHERE description = 'OTHER BUSINESS';
UPDATE public.r_premise_codes SET description_rus = 'Другой магазин' WHERE description = 'OTHER STORE';
UPDATE public.r_premise_codes SET description_rus = 'Рынок/супермаркет' WHERE description = 'MARKET';
UPDATE public.r_premise_codes SET description_rus = 'Мини-маркет' WHERE description = 'MINI-MART';
UPDATE public.r_premise_codes SET description_rus = 'Торговый центр (общая зона)' WHERE description = 'SHOPPING MALL (COMMON AREA)';
UPDATE public.r_premise_codes SET description_rus = 'Универмаг' WHERE description = 'DEPARTMENT STORE';
UPDATE public.r_premise_codes SET description_rus = 'Магазин одежды' WHERE description = 'CLOTHING STORE';
UPDATE public.r_premise_codes SET description_rus = 'Аптека' WHERE description = 'DRUG STORE';
UPDATE public.r_premise_codes SET description_rus = 'Винный магазин' WHERE description = 'LIQUOR STORE';
UPDATE public.r_premise_codes SET description_rus = 'Ювелирный магазин' WHERE description = 'JEWELRY STORE';
UPDATE public.r_premise_codes SET description_rus = 'Магазин электроники' WHERE description = 'ELECTRONICS STORE (IE:RADIO SHACK, ETC.)';
UPDATE public.r_premise_codes SET description_rus = 'Мебельный магазин' WHERE description = 'FURNITURE STORE';
UPDATE public.r_premise_codes SET description_rus = 'Зоомагазин' WHERE description = 'PET STORE';
UPDATE public.r_premise_codes SET description_rus = 'Книжный магазин' WHERE description = 'BOOK STORE';
UPDATE public.r_premise_codes SET description_rus = 'Магазин дисков/музыки/компьютерных игр' WHERE description = 'RECORD-CD MUSIC/COMPUTER GAME STORE';
UPDATE public.r_premise_codes SET description_rus = 'Дисконт-магазин (99 центов, доллар и т.д.)' WHERE description = 'DISCOUNT STORE (99 CENT,DOLLAR,ETC.';
UPDATE public.r_premise_codes SET description_rus = 'Складской магазин (Costco, Sam''s Club)' WHERE description = 'MEMBERSHIP STORE (COSTCO,SAMS CLUB)*';
UPDATE public.r_premise_codes SET description_rus = 'Строительный/хозяйственный магазин' WHERE description = 'DIY CENTER (LOWE''S,HOME DEPOT,OSH,CONTRACTORS WAREHOUSE)';
UPDATE public.r_premise_codes SET description_rus = 'Хозяйственный магазин' WHERE description = 'HARDWARE/BUILDING SUPPLY';
UPDATE public.r_premise_codes SET description_rus = 'Магазин автозапчастей' WHERE description = 'AUTO SUPPLY STORE*';
UPDATE public.r_premise_codes SET description_rus = 'Магазин косметики' WHERE description = 'BEAUTY SUPPLY STORE';
UPDATE public.r_premise_codes SET description_rus = 'Цветочный магазин/питомник' WHERE description = 'NURSERY/FLOWER SHOP';
UPDATE public.r_premise_codes SET description_rus = 'Табачный магазин' WHERE description = 'TOBACCO SHOP';
UPDATE public.r_premise_codes SET description_rus = 'Ломбард' WHERE description = 'PAWN SHOP';
UPDATE public.r_premise_codes SET description_rus = 'Видеопрокат' WHERE description = 'VIDEO RENTAL STORE';
UPDATE public.r_premise_codes SET description_rus = 'Магазин излишков армии' WHERE description = 'SURPLUS SURVIVAL STORE';

-- Рестораны и питание
UPDATE public.r_premise_codes SET description_rus = 'Ресторан/фастфуд' WHERE description = 'RESTAURANT/FAST FOOD';
UPDATE public.r_premise_codes SET description_rus = 'Кофейня (Starbucks, Coffee Bean и т.д.)' WHERE description = 'COFFEE SHOP (STARBUCKS, COFFEE BEAN, PEET''S, ETC.)';
UPDATE public.r_premise_codes SET description_rus = 'Бар/спорт-бар (работает днем и ночью)' WHERE description = 'BAR/SPORTS BAR (OPEN DAY & NIGHT)';
UPDATE public.r_premise_codes SET description_rus = 'Ночной клуб (работает только вечером)' WHERE description = 'NIGHT CLUB (OPEN EVENINGS ONLY)';
UPDATE public.r_premise_codes SET description_rus = 'Бар/коктейль-бар/ночной клуб' WHERE description = 'BAR/COCKTAIL/NIGHTCLUB';
UPDATE public.r_premise_codes SET description_rus = 'Автокафе' WHERE description = 'DRIVE THRU*';
UPDATE public.r_premise_codes SET description_rus = 'Кейтеринг/фургон мороженого' WHERE description = 'CATERING/ICE CREAM TRUCK';

-- Гостиницы и отели
UPDATE public.r_premise_codes SET description_rus = 'Отель' WHERE description = 'HOTEL';
UPDATE public.r_premise_codes SET description_rus = 'Мотель' WHERE description = 'MOTEL';

-- Транспорт
UPDATE public.r_premise_codes SET description_rus = 'Транспортное средство (легковое/грузовое)' WHERE description = 'VEHICLE, PASSENGER/TRUCK';
UPDATE public.r_premise_codes SET description_rus = 'Коммерческий грузовик' WHERE description = 'TRUCK, COMMERICAL';
UPDATE public.r_premise_codes SET description_rus = 'Такси' WHERE description = 'TAXI';
UPDATE public.r_premise_codes SET description_rus = 'Автобус MTA' WHERE description = 'MTA BUS';
UPDATE public.r_premise_codes SET description_rus = 'Школьный/церковный автобус' WHERE description = 'BUS, SCHOOL, CHURCH';
UPDATE public.r_premise_codes SET description_rus = 'Междугородний автобус Greyhound' WHERE description = 'GREYHOUND OR INTERSTATE BUS';
UPDATE public.r_premise_codes SET description_rus = 'Чартерный/частный автобус' WHERE description = 'BUS-CHARTER/PRIVATE';
UPDATE public.r_premise_codes SET description_rus = 'Другой междугородний/чартерный автобус' WHERE description = 'OTHER INTERSTATE, CHARTER BUS';
UPDATE public.r_premise_codes SET description_rus = 'Муниципальный автобус включая LADOT/DASH' WHERE description = 'MUNICIPAL BUS LINE INCLUDES LADOT/DASH';
UPDATE public.r_premise_codes SET description_rus = 'Автобусная остановка' WHERE description = 'BUS STOP';
UPDATE public.r_premise_codes SET description_rus = 'Автобусная остановка/стоянка' WHERE description = 'BUS STOP/LAYOVER (ALSO QUERY 124)';
UPDATE public.r_premise_codes SET description_rus = 'Автобусное депо/терминал (не MTA)' WHERE description = 'BUS DEPOT/TERMINAL, OTHER THAN MTA';
UPDATE public.r_premise_codes SET description_rus = 'Терминал (не MTA)' WHERE description = 'TERMINAL, OTHER THAN MTA';
UPDATE public.r_premise_codes SET description_rus = 'Поезд Amtrak' WHERE description = 'AMTRAK TRAIN';
UPDATE public.r_premise_codes SET description_rus = 'Поезд Metrolink' WHERE description = 'METROLINK TRAIN';
UPDATE public.r_premise_codes SET description_rus = 'Другой железнодорожный поезд' WHERE description = 'OTHER RR TRAIN (UNION PAC, SANTE FE ETC';
UPDATE public.r_premise_codes SET description_rus = 'Поезд (не MTA)' WHERE description = 'TRAIN, OTHER THAN MTA (ALSO QUERY 809/810/811)';
UPDATE public.r_premise_codes SET description_rus = 'Железнодорожные пути' WHERE description = 'TRAIN TRACKS';
UPDATE public.r_premise_codes SET description_rus = 'Железнодорожное депо/терминал (не MTA)' WHERE description = 'TRAIN DEPOT/TERMINAL, OTHER THAN MTA';
UPDATE public.r_premise_codes SET description_rus = 'Трамвай/уличный вагон' WHERE description = 'TRAM/STREETCAR(BOXLIKE WAG ON RAILS)*';
UPDATE public.r_premise_codes SET description_rus = 'Самолет' WHERE description = 'AIRCRAFT';
UPDATE public.r_premise_codes SET description_rus = 'Транспортный объект (аэропорт)' WHERE description = 'TRANSPORTATION FACILITY (AIRPORT)';

-- Автомобильные услуги
UPDATE public.r_premise_codes SET description_rus = 'Автосалон' WHERE description = 'AUTO DEALERSHIP (CHEVY, FORD, BMW, MERCEDES, ETC.)';
UPDATE public.r_premise_codes SET description_rus = 'Автосервис' WHERE description = 'AUTO REPAIR SHOP';
UPDATE public.r_premise_codes SET description_rus = 'Стоянка подержанных автомобилей' WHERE description = 'AUTO SALES LOT';
UPDATE public.r_premise_codes SET description_rus = 'Автомойка' WHERE description = 'CAR WASH';
UPDATE public.r_premise_codes SET description_rus = 'Заправочная станция' WHERE description = 'GAS STATION';
UPDATE public.r_premise_codes SET description_rus = 'Эвакуаторная стоянка' WHERE description = 'TOW YARD*';

-- Финансовые учреждения
UPDATE public.r_premise_codes SET description_rus = 'Банк' WHERE description = 'BANK';
UPDATE public.r_premise_codes SET description_rus = 'Банкомат' WHERE description = 'AUTOMATED TELLER MACHINE (ATM)';
UPDATE public.r_premise_codes SET description_rus = 'Кредитный союз' WHERE description = 'CREDIT UNION';
UPDATE public.r_premise_codes SET description_rus = 'Сберегательная касса' WHERE description = 'SAVINGS & LOAN';
UPDATE public.r_premise_codes SET description_rus = 'Финансовая компания' WHERE description = 'FINANCE COMPANY';
UPDATE public.r_premise_codes SET description_rus = 'Обналичивание чеков' WHERE description = 'CHECK CASHING*';
UPDATE public.r_premise_codes SET description_rus = 'Банковский сейф/денежный ящик снаружи банка' WHERE description = 'BANK DROP BOX/MONEY DROP-OUTSIDE OF BANK*';
UPDATE public.r_premise_codes SET description_rus = 'Банкинг внутри магазина' WHERE description = 'BANKING INSIDE MARKET-STORE *';
UPDATE public.r_premise_codes SET description_rus = 'Банковское окно автообслуживания' WHERE description = 'DRIVE THRU BANKING (WINDOW)*';

-- Образование
UPDATE public.r_premise_codes SET description_rus = 'Начальная школа' WHERE description = 'ELEMENTARY SCHOOL';
UPDATE public.r_premise_codes SET description_rus = 'Средняя школа (5-8 классы)' WHERE description = 'JUNIOR HIGH SCHOOL';
UPDATE public.r_premise_codes SET description_rus = 'Старшая школа' WHERE description = 'HIGH SCHOOL';
UPDATE public.r_premise_codes SET description_rus = 'Частная школа/дошкольное учреждение' WHERE description = 'PRIVATE SCHOOL/PRESCHOOL';
UPDATE public.r_premise_codes SET description_rus = 'Колледж/университет' WHERE description = 'COLLEGE/JUNIOR COLLEGE/UNIVERSITY';
UPDATE public.r_premise_codes SET description_rus = 'Профессиональное училище' WHERE description = 'TRADE SCHOOL (MEDICAL-TECHNICAL-BUSINESS)*';
UPDATE public.r_premise_codes SET description_rus = 'Специализированная школа/другое' WHERE description = 'SPECIALTY SCHOOL/OTHER';
UPDATE public.r_premise_codes SET description_rus = 'Студенческое общежитие' WHERE description = 'FRAT HOUSE/SORORITY/DORMITORY';

-- Медицинские учреждения
UPDATE public.r_premise_codes SET description_rus = 'Больница' WHERE description = 'HOSPITAL';
UPDATE public.r_premise_codes SET description_rus = 'Медицинские/стоматологические кабинеты' WHERE description = 'MEDICAL/DENTAL OFFICES';
UPDATE public.r_premise_codes SET description_rus = 'Спортзал/фитнес-центр' WHERE description = 'HEALTH SPA/GYM';
UPDATE public.r_premise_codes SET description_rus = 'Массажный салон' WHERE description = 'MASSAGE PARLOR';
UPDATE public.r_premise_codes SET description_rus = 'Центр офтальмологии' WHERE description = 'VISION CARE FACILITY*';
UPDATE public.r_premise_codes SET description_rus = 'Ветеринарная клиника' WHERE description = 'VETERINARIAN/ANIMAL HOSPITAL';
UPDATE public.r_premise_codes SET description_rus = 'Хоспис' WHERE description = 'HOSPICE';
UPDATE public.r_premise_codes SET description_rus = 'Клиника метадона' WHERE description = 'METHADONE CLINIC';
UPDATE public.r_premise_codes SET description_rus = 'Медицинские учреждения марихуаны' WHERE description = 'MEDICAL MARIJUANA FACILITIES/BUSINESSES';
UPDATE public.r_premise_codes SET description_rus = 'Аптека внутри магазина или супермаркета' WHERE description = 'PHARMACY INSIDE STORE OR SUPERMARKET*';
UPDATE public.r_premise_codes SET description_rus = 'Оптика внутри магазина или супермаркета' WHERE description = 'OPTICAL OFFICE INSIDE STORE OR SUPERMARKET*';
UPDATE public.r_premise_codes SET description_rus = 'Клиника абортов' WHERE description = 'ABORTION CLINIC/ABORTION FACILITY*';

-- Религиозные объекты
UPDATE public.r_premise_codes SET description_rus = 'Церковь/часовня' WHERE description = 'CHURCH/CHAPEL (CHANGED 03-03 FROM CHURCH/TEMPLE)';
UPDATE public.r_premise_codes SET description_rus = 'Синагога/храм' WHERE description = 'SYNAGOGUE/TEMPLE';
UPDATE public.r_premise_codes SET description_rus = 'Мечеть' WHERE description = 'MOSQUE*';
UPDATE public.r_premise_codes SET description_rus = 'Другое место поклонения' WHERE description = 'OTHER PLACE OF WORSHIP';

-- Государственные учреждения
UPDATE public.r_premise_codes SET description_rus = 'Правительственное учреждение (федеральное, штат, округ, город)' WHERE description = 'GOVERNMENT FACILITY (FEDERAL,STATE, COUNTY & CITY)';
UPDATE public.r_premise_codes SET description_rus = 'Полицейский участок' WHERE description = 'POLICE FACILITY';
UPDATE public.r_premise_codes SET description_rus = 'Пожарная станция' WHERE description = 'FIRE STATION';
UPDATE public.r_premise_codes SET description_rus = 'Исправительное учреждение/тюрьма' WHERE description = 'DETENTION/JAIL FACILITY';
UPDATE public.r_premise_codes SET description_rus = 'Почтовое отделение' WHERE description = 'POST OFFICE';
UPDATE public.r_premise_codes SET description_rus = 'Почтовый ящик' WHERE description = 'MAIL BOX';
UPDATE public.r_premise_codes SET description_rus = 'Библиотека' WHERE description = 'LIBRARY';
UPDATE public.r_premise_codes SET description_rus = 'Объект Министерства обороны' WHERE description = 'DEPT OF DEFENSE FACILITY';

-- Промышленность и склады
UPDATE public.r_premise_codes SET description_rus = 'Склад' WHERE description = 'WAREHOUSE';
UPDATE public.r_premise_codes SET description_rus = 'Завод' WHERE description = 'FACTORY';
UPDATE public.r_premise_codes SET description_rus = 'Производственная компания' WHERE description = 'MANUFACTURING COMPANY';
UPDATE public.r_premise_codes SET description_rus = 'Швейная фабрика' WHERE description = 'GARMENT MANUFACTURER';
UPDATE public.r_premise_codes SET description_rus = 'Общественное хранилище' WHERE description = 'PUBLIC STORAGE';
UPDATE public.r_premise_codes SET description_rus = 'Нефтеперерабатывающий завод' WHERE description = 'OIL REFINERY';
UPDATE public.r_premise_codes SET description_rus = 'Химический склад/производство' WHERE description = 'CHEMICAL STORAGE/MANUFACTURING PLANT';
UPDATE public.r_premise_codes SET description_rus = 'Энергетический объект' WHERE description = 'ENERGY PLANT/FACILITY';
UPDATE public.r_premise_codes SET description_rus = 'Водный объект' WHERE description = 'WATER FACILITY';
UPDATE public.r_premise_codes SET description_rus = 'Канализационный объект/труба' WHERE description = 'SEWAGE FACILITY/PIPE';
UPDATE public.r_premise_codes SET description_rus = 'Дамба/водохранилище' WHERE description = 'DAM/RESERVOIR';

-- Офисы и услуги
UPDATE public.r_premise_codes SET description_rus = 'Офисное здание/офис' WHERE description = 'OFFICE BUILDING/OFFICE';
UPDATE public.r_premise_codes SET description_rus = 'Магазин мобильных телефонов' WHERE description = 'CELL PHONE STORE';
UPDATE public.r_premise_codes SET description_rus = 'Прачечная' WHERE description = 'LAUNDROMAT';
UPDATE public.r_premise_codes SET description_rus = 'Химчистка/прачечная' WHERE description = 'CLEANER/LAUNDROMAT';
UPDATE public.r_premise_codes SET description_rus = 'Салон красоты/парикмахерская' WHERE description = 'BEAUTY/BARBER SHOP';
UPDATE public.r_premise_codes SET description_rus = 'Маникюрный салон' WHERE description = 'NAIL SALON';
UPDATE public.r_premise_codes SET description_rus = 'Тату-салон' WHERE description = 'TATTOO PARLOR*';
UPDATE public.r_premise_codes SET description_rus = 'Компьютерные услуги/ремонт/продажи' WHERE description = 'COMPUTER SERVICES/REPAIRS/SALES';
UPDATE public.r_premise_codes SET description_rus = 'Прокат оборудования' WHERE description = 'EQUIPMENT RENTAL';
UPDATE public.r_premise_codes SET description_rus = 'Служба доставки (FedEx, UPS, курьеры)' WHERE description = 'DELIVERY SERVICE (FED EX, UPS, COURIERS,COURIER SERVICE)*';
UPDATE public.r_premise_codes SET description_rus = 'Телекоммуникационный объект' WHERE description = 'TELECOMMUNICATION FACILITY/LOCATION';

-- Развлечения и культура
UPDATE public.r_premise_codes SET description_rus = 'Стадион Доджерс' WHERE description = 'DODGER STADIUM';
UPDATE public.r_premise_codes SET description_rus = 'Центр Стейплс' WHERE description = 'STAPLES CENTER *';
UPDATE public.r_premise_codes SET description_rus = 'Колизей' WHERE description = 'COLISEUM';
UPDATE public.r_premise_codes SET description_rus = 'Спортивная арена' WHERE description = 'SPORTS ARENA';
UPDATE public.r_premise_codes SET description_rus = 'Другой спортивный объект' WHERE description = 'SPORTS VENUE, OTHER';
UPDATE public.r_premise_codes SET description_rus = 'Театр/кинотеатр' WHERE description = 'THEATRE/MOVIE';
UPDATE public.r_premise_codes SET description_rus = 'Развлекательный/комедийный клуб' WHERE description = 'ENTERTAINMENT/COMEDY CLUB (OTHER)';
UPDATE public.r_premise_codes SET description_rus = 'Стрип-клуб/джентльменский клуб' WHERE description = 'SEX ORIENTED/BOOK STORE/STRIP CLUB/GENTLEMAN''S CLUB';
UPDATE public.r_premise_codes SET description_rus = 'Музей' WHERE description = 'MUSEUM';
UPDATE public.r_premise_codes SET description_rus = 'Конференц-центр' WHERE description = 'CONVENTION CENTER';
UPDATE public.r_premise_codes SET description_rus = 'Место массовых собраний' WHERE description = 'MASS GATHERING LOCATION';
UPDATE public.r_premise_codes SET description_rus = 'Культурный памятник' WHERE description = 'CULTURAL SIGNIFICANCE/MONUMENT';
UPDATE public.r_premise_codes SET description_rus = 'Студия (кино/фото/музыка)' WHERE description = 'STUDIO (FILM/PHOTOGRAPHIC/MUSIC)';
UPDATE public.r_premise_codes SET description_rus = 'Аркада/игровая комната' WHERE description = 'ARCADE,GAME ROOM/VIDEO GAMES (EXAMPLE CHUCKIE CHEESE)*';
UPDATE public.r_premise_codes SET description_rus = 'Боулинг' WHERE description = 'BOWLING ALLEY*';
UPDATE public.r_premise_codes SET description_rus = 'Каток' WHERE description = 'SKATING RINK*';
UPDATE public.r_premise_codes SET description_rus = 'Скейт-парк' WHERE description = 'SKATEBOARD FACILITY/SKATEBOARD PARK*';
UPDATE public.r_premise_codes SET description_rus = 'Гольф-поле' WHERE description = 'GOLF COURSE*';
UPDATE public.r_premise_codes SET description_rus = 'Парк развлечений' WHERE description = 'AMUSEMENT PARK*';
UPDATE public.r_premise_codes SET description_rus = 'Хоккейный каток' WHERE description = 'HOCKEY RINK/ICE HOCKEY';
UPDATE public.r_premise_codes SET description_rus = 'Скачки/парк Санта-Анита' WHERE description = 'HORSE RACING/SANTA ANITA PARK*';
UPDATE public.r_premise_codes SET description_rus = 'Мускул Бич' WHERE description = 'MUSCLE BEACH';

-- Спортивные площадки
UPDATE public.r_premise_codes SET description_rus = 'Баскетбольные площадки' WHERE description = 'BASKETBALL COURTS';
UPDATE public.r_premise_codes SET description_rus = 'Площадки для гандбола' WHERE description = 'HANDBALL COURTS';
UPDATE public.r_premise_codes SET description_rus = 'Общественный бассейн' WHERE description = 'POOL-PUBLIC/OUTDOOR OR INDOOR*';

-- Торговые центры
UPDATE public.r_premise_codes SET description_rus = 'Гроув' WHERE description = 'THE GROVE';
UPDATE public.r_premise_codes SET description_rus = 'Беверли Центер' WHERE description = 'THE BEVERLY CENTER';
UPDATE public.r_premise_codes SET description_rus = 'Беверли Коннекшн' WHERE description = 'THE BEVERLY CONNECTION';
UPDATE public.r_premise_codes SET description_rus = 'Блошиный рынок' WHERE description = 'SWAP MEET';

-- Уход и социальные услуги
UPDATE public.r_premise_codes SET description_rus = 'Детский сад' WHERE description = 'DAY CARE/CHILDREN*';
UPDATE public.r_premise_codes SET description_rus = 'Дневной центр для взрослых' WHERE description = 'DAY CARE/ADULTS*';
UPDATE public.r_premise_codes SET description_rus = 'Приюты/ночлежки' WHERE description = 'MISSIONS/SHELTERS';
UPDATE public.r_premise_codes SET description_rus = 'Центр переработки' WHERE description = 'RECYCLING CENTER';
UPDATE public.r_premise_codes SET description_rus = 'Морг' WHERE description = 'MORTUARY';
UPDATE public.r_premise_codes SET description_rus = 'Кладбище' WHERE description = 'CEMETARY*';

-- Оружие и спорттовары
UPDATE public.r_premise_codes SET description_rus = 'Оружейный/спортивный магазин' WHERE description = 'GUN/SPORTING GOODS';

-- Общественные туалеты и лестницы
UPDATE public.r_premise_codes SET description_rus = 'Общественный туалет (внутри)' WHERE description = 'PUBLIC RESTROOM(INDOORS-INSIDE)';
UPDATE public.r_premise_codes SET description_rus = 'Общественный туалет (снаружи)' WHERE description = 'PUBLIC RESTROOM/OUTSIDE*';
UPDATE public.r_premise_codes SET description_rus = 'Лестничная клетка' WHERE description = 'STAIRWELL*';
UPDATE public.r_premise_codes SET description_rus = 'Эскалатор' WHERE description = 'ESCALATOR*';
UPDATE public.r_premise_codes SET description_rus = 'Лифт' WHERE description = 'ELEVATOR';

-- Жилые комнаты и зоны
UPDATE public.r_premise_codes SET description_rus = 'Общая прачечная в жилом комплексе' WHERE description = 'APARTMENT/CONDO COMMON LAUNDRY ROOM';

-- Интернет и киберпространство
UPDATE public.r_premise_codes SET description_rus = 'Киберпространство' WHERE description = 'CYBERSPACE';
UPDATE public.r_premise_codes SET description_rus = 'Веб-сайт' WHERE description = 'WEBSITE';

-- Мусор и отходы
UPDATE public.r_premise_codes SET description_rus = 'Мусорный бак/мусорный контейнер' WHERE description = 'TRASH CAN/TRASH DUMPSTER';

-- Заброшенные здания
UPDATE public.r_premise_codes SET description_rus = 'Заброшенное здание/дом' WHERE description = 'ABANDONED BUILDING ABANDONED HOUSE';

-- Высотные здания
UPDATE public.r_premise_codes SET description_rus = 'Высотное здание' WHERE description = 'HIGH-RISE BUILDING';

-- Водный транспорт
UPDATE public.r_premise_codes SET description_rus = 'Причал/док/марина/лодка' WHERE description = 'SLIPS/DOCK/MARINA/BOAT';

-- Телефоны
UPDATE public.r_premise_codes SET description_rus = 'Телефон-автомат' WHERE description = 'PAY PHONE';

-- Другие места
UPDATE public.r_premise_codes SET description_rus = 'Другое место' WHERE description = 'OTHER PREMISE';
UPDATE public.r_premise_codes SET description_rus = 'Другое/снаружи' WHERE description = 'OTHER/OUTSIDE';
UPDATE public.r_premise_codes SET description_rus = 'Место зачистки' WHERE description = 'ABATEMENT LOCATION';

-- MTA Линии и станции
-- Красная линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Северный Голливуд' WHERE description = 'MTA - RED LINE - NORTH HOLLYWOOD';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Уилшир/Вермонт' WHERE description = 'MTA - RED LINE - WILSHIRE/VERMONT';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - 7-я и Метро центр' WHERE description = 'MTA - RED LINE - 7TH AND METRO CENTER';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Юнион стейшн' WHERE description = 'MTA - RED LINE - UNION STATION';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Голливуд/Хайленд' WHERE description = 'MTA - RED LINE - HOLLYWOOD/HIGHLAND';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Юниверсал Сити' WHERE description = 'MTA - RED LINE - UNIVERSAL CITY/STUDIO CITY';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Голливуд/Вайн' WHERE description = 'MTA - RED LINE - HOLLYWOOD/VINE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Голливуд/Вестерн' WHERE description = 'MTA - RED LINE - HOLLYWOOD/WESTERN';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Вермонт/Беверли' WHERE description = 'MTA - RED LINE - VERMONT/BEVERLY';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Персинг Сквер' WHERE description = 'MTA - RED LINE - PERSHING SQUARE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Вестлейк/Макартур парк' WHERE description = 'MTA - RED LINE - WESTLAKE/MACARTHUR PARK';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Вермонт/Сансет' WHERE description = 'MTA - RED LINE - VERMONT/SUNSET';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Civic Center/Гранд парк' WHERE description = 'MTA - RED LINE - CIVIC CENTER/GRAND PARK';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Красная линия - Вермонт/Санта-Моника' WHERE description = 'MTA - RED LINE - VERMONT/SANTA MONICA';

-- Фиолетовая линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Уилшир/Нормандия' WHERE description = 'MTA - PURPLE LINE - WILSHIRE/NORMANDIE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Уилшир/Вестерн' WHERE description = 'MTA - PURPLE LINE - WILSHIRE/WESTERN';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Уилшир/Вермонт' WHERE description = 'MTA - PURPLE LINE - WILSHIRE/VERMONT';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Вестлейк/Макартур парк' WHERE description = 'MTA - PURPLE LINE - WESTLAKE/MACARTHUR PARK';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - 7-я и Метро центр' WHERE description = 'MTA - PURPLE LINE - 7TH AND METRO CENTER';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Юнион стейшн' WHERE description = 'MTA - PURPLE LINE - UNION STATION';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Civic Center/Гранд парк' WHERE description = 'MTA - PURPLE LINE - CIVIC CENTER/GRAND PARK';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Фиолетовая линия - Персинг Сквер' WHERE description = 'MTA - PURPLE LINE - PERSHING SQUARE';

-- Синяя линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - Пико' WHERE description = 'MTA - BLUE LINE - PICO';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - Вашингтон' WHERE description = 'MTA - BLUE LINE - WASHINGTON';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - Вернон' WHERE description = 'MTA - BLUE LINE - VERNON';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - 7-я и Метро центр' WHERE description = 'MTA - BLUE LINE - 7TH AND METRO CENTER';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - Гранд/LATTC' WHERE description = 'MTA - BLUE LINE - GRAND/LATTC';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - 103-я/Башни Уоттс' WHERE description = 'MTA - BLUE LINE - 103RD/WATTS TOWERS';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Синяя линия - Сан-Педро' WHERE description = 'MTA - BLUE LINE - SAN PEDRO';

-- Зеленая линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Зеленая линия - Харбор Фривей' WHERE description = 'MTA - GREEN LINE - HARBOR FWY';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Зеленая линия - Авалон' WHERE description = 'MTA - GREEN LINE - AVALON';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Зеленая линия - Авиация/LAX' WHERE description = 'MTA - GREEN LINE - AVIATION/LAX';

-- Оранжевая линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Северный Голливуд' WHERE description = 'MTA - ORANGE LINE - NORTH HOLLYWOOD';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Канога' WHERE description = 'MTA - ORANGE LINE - CANOGA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Чатсуорт' WHERE description = 'MTA - ORANGE LINE - CHATSWORTH';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Пирс Колледж' WHERE description = 'MTA - ORANGE LINE - PIERCE COLLEGE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Роско' WHERE description = 'MTA - ORANGE LINE - ROSCOE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Септульведа' WHERE description = 'MTA - ORANGE LINE - SEPULVEDA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Вудман' WHERE description = 'MTA - ORANGE LINE - WOODMAN';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Ван Найс' WHERE description = 'MTA - ORANGE LINE - VAN NUYS';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Резеда' WHERE description = 'MTA - ORANGE LINE - RESEDA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Нордхофф' WHERE description = 'MTA - ORANGE LINE - NORDHOFF';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Шерман Уэй' WHERE description = 'MTA - ORANGE LINE - SHERMAN WAY';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Колледж Вэлли' WHERE description = 'MTA - ORANGE LINE - VALLEY COLLEGE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Лорел Каньон' WHERE description = 'MTA - ORANGE LINE - LAUREL CANYON';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Тампа' WHERE description = 'MTA - ORANGE LINE - TAMPA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Де Сото' WHERE description = 'MTA - ORANGE LINE - DE SOTO';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Балбоа' WHERE description = 'MTA - ORANGE LINE - BALBOA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Оранжевая линия - Вудли' WHERE description = 'MTA - ORANGE LINE - WOODLEY';

-- Экспо линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - LATTC/Ортопедический институт' WHERE description = 'MTA - EXPO LINE - LATTC/ORTHO INSTITUTE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо/Вестерн' WHERE description = 'MTA - EXPO LINE - EXPO/WESTERN';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо/Вермонт' WHERE description = 'MTA - EXPO LINE - EXPO/VERMONT';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Фармдейл' WHERE description = 'MTA - EXPO LINE - FARMDALE';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Палмс' WHERE description = 'MTA - EXPO LINE - PALMS';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Ла Сиенега/Джефферсон' WHERE description = 'MTA - EXPO LINE - LA CIENEGA/JEFFERSON';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо/Банди' WHERE description = 'MTA - EXPO LINE - EXPO/BUNDY';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо/Кренсхоу' WHERE description = 'MTA - EXPO LINE - EXPO/CRENSHAW';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо/Септульведа' WHERE description = 'MTA - EXPO LINE - EXPO/SEPULVEDA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Джефферсон/USC' WHERE description = 'MTA - EXPO LINE - JEFFERSON/USC';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо/Ла Бреа' WHERE description = 'MTA - EXPO LINE - EXPO/LA BREA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - 7-я и Метро центр' WHERE description = 'MTA - EXPO LINE - 7TH AND METRO CENTER';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Экспо парк/USC' WHERE description = 'MTA - EXPO LINE - EXPO PARK/USC';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Пико' WHERE description = 'MTA - EXPO LINE - PICO';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Экспо линия - Вествуд/Ранчо парк' WHERE description = 'MTA - EXPO LINE - WESTWOOD/RANCHO PARK';

-- Золотая линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Хайленд парк' WHERE description = 'MTA - GOLD LINE - HIGHLAND PARK';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Херитадж Сквер' WHERE description = 'MTA - GOLD LINE - HERITAGE SQ';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Мариачи Плаза' WHERE description = 'MTA - GOLD LINE - MARIACHI PLAZA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Индиана' WHERE description = 'MTA - GOLD LINE - INDIANA';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Чайнатаун' WHERE description = 'MTA - GOLD LINE - CHINATOWN';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Линкольн/Сайпресс' WHERE description = 'MTA - GOLD LINE - LINCOLN/CYPRESS';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Сото' WHERE description = 'MTA - GOLD LINE - SOTO';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Юго-западный музей' WHERE description = 'MTA - GOLD LINE - SOUTHWEST MUSEUM';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Пико/Алисо' WHERE description = 'MTA - GOLD LINE - PICO/ALISO';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Золотая линия - Юнион стейшн' WHERE description = 'MTA - GOLD LINE - UNION STATION';

-- Серебряная линия
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - Харбор Фривей' WHERE description = 'MTA - SILVER LINE - HARBOR FWY';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - Downtown остановки' WHERE description = 'MTA - SILVER LINE - DOWNTOWN STREET STOPS';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - Харбор Гейтвей Транзит центр' WHERE description = 'MTA - SILVER LINE - HARBOR GATEWAY TRANSIT CTR';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - 37-я улица/USC' WHERE description = 'MTA - SILVER LINE - 37TH ST/USC';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - Роузкранс' WHERE description = 'MTA - SILVER LINE - ROSECRANS';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - LAC/USC Медицинский центр' WHERE description = 'MTA - SILVER LINE - LAC/USC MEDICAL CENTER';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - Юнион стейшн' WHERE description = 'MTA - SILVER LINE - UNION STATION';
UPDATE public.r_premise_codes SET description_rus = 'MTA - Серебряная линия - Слаузон' WHERE description = 'MTA - SILVER LINE - SLAUSON';

-- Общие станции
UPDATE public.r_premise_codes SET description_rus = 'LA Юнион стейшн (не привязан к линии)' WHERE description = 'LA UNION STATION (NOT LINE SPECIFIC)';
UPDATE public.r_premise_codes SET description_rus = '7-я и Метро центр (не привязан к линии)' WHERE description = '7TH AND METRO CENTER (NOT LINE SPECIFIC)';

-- Устаревшие коды
UPDATE public.r_premise_codes SET description_rus = 'СНЯТО С ИСПОЛЬЗОВАНИЯ (ДУБЛИКАТ)' WHERE description = 'RETIRED (DUPLICATE) DO NOT USE THIS CODE';