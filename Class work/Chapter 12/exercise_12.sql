#1
WITH temps_collapsed (station_name, max_temperature_group) AS
    (SELECT station_name,
           CASE WHEN max_temp >= 90 THEN 'Hot Category 1'
                WHEN max_temp BETWEEN 88 AND 89 THEN 'Hot Category 2'
                WHEN max_temp BETWEEN 86 AND 87 THEN 'Hot Category 3'
                WHEN max_temp BETWEEN 84 AND 85 THEN 'Hot Category 4'
                WHEN max_temp BETWEEN 80 AND 81 THEN 'Hot Category 5'
	            WHEN max_temp BETWEEN 80 AND 81 THEN 'Hot Category 6'
                ELSE 'Hot Category 7'
            END
    FROM temperature_readings)

SELECT station_name, max_temperature_group, count(*)
FROM temps_collapsed
GROUP BY station_name, max_temperature_group
ORDER BY station_name, count(*) DESC;

