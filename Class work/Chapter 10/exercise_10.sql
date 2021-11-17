#1

SELECT corr(median_hh_income, pct_masters_higher)
    AS masters_income_r
FROM acs_2011_2015_stats;

The correlation coefficient is 0.568. The correlation coefficient is lower than pct bachelors_higher and median_hh_income of .68. 
This illustrates a moderate relationship between median_hh_income and pct_masters_higher.

#2

SELECT
    city,
    st,
    population,
    motor_vehicle_theft,
    round(
        (motor_vehicle_theft::numeric / population) * 1000, 1
        ) AS mc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (motor_vehicle_theft::numeric / population) DESC;

Milwaukee has the highest rates of motor vehicle thefts

SELECT
    city,
    st,
    population,
    violent_crime,
    round(
        (violent_crime::numeric / population) * 1000, 1
        ) AS vc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (violent_crime::numeric / population) DESC;

Detroit has the highest violent crime rates.