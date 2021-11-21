#1
SELECT 
tpep_pickup_datetime,
tpep_dropoff_datetime,
tpep_dropoff_datetime - tpep_pickup_datetime AS taxi_ride_length
FROM nyc_yellow_taxi_trips_2016_06_01
ORDER BY taxi_ride_length;

#2
SELECT '2100-01-01 00:00:00 BST'::timestamptz AT TIME ZONE 'EST';

SELECT '2100-01-01 00:00:00 SAST'::timestamptz AT TIME ZONE 'EST';

SELECT '2100-01-01 00:00:00 MSK'::timestamptz AT TIME ZONE 'EST';

SELECT '2100-01-01 00:00:00 AEDT'::timestamptz AT TIME ZONE 'EST';