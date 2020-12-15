#Посчитайте среднее количество прибывающих рейсов в день для каждого города за август 2018 года. 
#Назовите получившееся поле average_flights, вместе с ним выведите столбец city.

SELECT
    flights_per_day.city as city,
    AVG(flights_per_day.cnt) as average_flights
From 
  (SELECT
   COUNT (flights.flight_id) AS cnt,
   airports.city AS city,
   DATE_TRUNC('day', flights.arrival_time) as date
   FROM airports
   INNER JOIN flights ON flights.arrival_airport=airports.AIRPORT_CODE
   WHERE 
      flights.arrival_time::date>= '2018-08-01' AND
      flights.arrival_time::date< '2018-09-01' 

   GROUP BY 
   city,
   date) AS flights_per_day

GROUP BY 
city;
