#Посчитайте количество рейсов по всем моделям самолётов Boeing, Airbus и другим ('other') в сентябре. 
#Типы моделей поместите в столбец type_aircraft, а количество рейсов — во flights_amount. Выведите их на экран.


Select 
sum(flights_amount) as flights_amount

from

    (SELECT 
      aircrafts.model as model,
      Count(*) AS flights_amount
      FROM 
      aircrafts
      INNER JOIN flights ON flights.AIRCRAFT_CODE=aircrafts.AIRCRAFT_CODE
      WHERE 
      flights.departure_time::date>= '2018-09-01' AND
      flights.departure_time::date< '2018-10-01' AND
      (aircrafts.model LIKE '%Airbus%' OR aircrafts.model LIKE '%Boeing%')

GROUP BY 
model) as h;
