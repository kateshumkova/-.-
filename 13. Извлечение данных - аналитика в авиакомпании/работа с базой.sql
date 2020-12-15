#Найдите количество рейсов на каждой модели самолёта с вылетом в сентябре 2018 года. Назовите получившееся поле flights_amount и выведите его. 
#Также напечатайте на экране поле model. Столбцы в таблице должны быть выведены в следующем порядке:
#model
#flights_amount

Select 
aircrafts.model as model,
Count(flights.flight_id) AS flights_amount

FROM 
aircrafts
INNER JOIN flights ON flights.AIRCRAFT_CODE=aircrafts.AIRCRAFT_CODE
WHERE 
EXTRACT(MONTH FROM flights.departure_time::date) = '9'AND EXTRACT(YEAR FROM flights.departure_time::date)= '2018'

GROUP BY 
model;
