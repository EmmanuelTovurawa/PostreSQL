
1. The best data type would be real because it is suitable to store numbers 6 decimal digits precision

2. varchar(n) data type would be most suitable. This is because the first names and surnames are made up of a combination of characters. Also, if you insert fewer than the maximum names
   postgreSQL will not store extra spaces and this saves our storage disk. It is good to seperate them because these are two different attributes that can individually be used to 
   identify the driver.

3. A string of date can be casted into a date type. However, '4//2017' does not follow the format of date so it won't be casted into date. 