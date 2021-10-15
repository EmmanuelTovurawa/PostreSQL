
2
COPY(
	SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
	FROM us_counties_2010
	ORDER BY housing_unit_count_100_percent DESC
	LIMIT 20
    )
TO 'C:\Users\Public\PostgreSQL\us_counties_most_houses_export.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');


3
No, it will not work. This is because we can not have more a scale which is bigger than the precision.