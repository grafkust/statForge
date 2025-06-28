ALTER TABLE t_crime_records ADD COLUMN modus_operandi_3_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_3_id IS 'Третий код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_4_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_4_id IS 'Четвертый код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_5_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_5_id IS 'Пятый код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_6_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_6_id IS 'Шестой код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_7_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_7_id IS 'Седьмой код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_8_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_8_id IS 'Восьмой код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_9_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_9_id IS 'Девятый код метода совершения преступления';

ALTER TABLE t_crime_records ADD COLUMN modus_operandi_10_id bigint references r_modus_operandi(id);
COMMENT ON COLUMN t_crime_records.modus_operandi_10_id IS 'Десятый код метода совершения преступления';

