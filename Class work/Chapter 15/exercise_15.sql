#1

CREATE OR REPLACE VIEW taxi_trip_per_hour AS
    SELECT 
	    tpep_pickup_datetime,
        tpep_dropoff_datetime,
		COUNT(tpep_pickup_datetime)
    FROM nyc_yellow_taxi_trips_2016_06_01
	GROUP BY tpep_pickup_datetime, tpep_dropoff_datetime
	ORDER BY tpep_pickup_datetime ASC;
	
	
#2
CREATE OR REPLACE FUNCTION
rates_per_thousand(property_crime integer,
               population integer,
               decimal_places integer DEFAULT 1)
RETURNS numeric AS
'SELECT round(
        (property_crime::numeric / population) * 1000, 1
        ) AS pc_per_1000
;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;