
ALTER TABLE t_crime_records
DROP CONSTRAINT chk_t_crime_records_victim_sex;

ALTER TABLE t_crime_records
ADD CONSTRAINT chk_t_crime_records_victim_sex
CHECK (victim_sex IN ('M', 'F', 'U', 'X'));