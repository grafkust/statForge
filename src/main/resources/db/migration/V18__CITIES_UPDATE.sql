ALTER TABLE r_cities ADD COLUMN alias varchar(5);

UPDATE r_cities SET alias = 'NY' WHERE name = 'New-York';
UPDATE r_cities SET alias = 'LA' WHERE name = 'Los Angeles';

ALTER TABLE r_cities ALTER COLUMN alias SET NOT NULL;