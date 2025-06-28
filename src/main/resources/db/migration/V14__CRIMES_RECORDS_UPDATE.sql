
ALTER TABLE t_crime_records
DROP CONSTRAINT chk_t_crime_records_victim_age;

ALTER TABLE t_crime_records
ADD CONSTRAINT chk_t_crime_records_victim_age
CHECK ((victim_age IS NULL) OR (victim_age >= 0 AND victim_age <= 120));