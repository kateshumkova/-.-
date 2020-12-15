
#Для каждой недели с 23 июля по 30 сентября 2018 года посчитайте количество билетов, купленных на рейсы в Москву (номер недели week_number и количество билетов ticket_amount). 
#Получите таблицу, в которой будет информация о количестве купленных за неделю билетов; 
#отметка, проходил ли в эту неделю фестиваль; название фестиваля festival_name и номер недели week_number.
#Выводите столбцы в таком порядке: - week_number - ticket_amount - festival_week - festival_name


SELECT 
	T.week_number,
	T.ticket_amount,
	T.festival_week,
	T.festival_name
FROM 
  ((SELECT
   EXTRACT (week FROM flights.arrival_time) AS week_number,
   COUNT(ticket_flights.ticket_no) AS ticket_amount
   FROM
   ticket_flights
   INNER JOIN flights ON flights.flight_id=ticket_flights.flight_id
   WHERE
    arrival_airport IN
   (SELECT
    flights.arrival_airport
    From 
    airports
    INNER JOIN flights ON flights.arrival_airport=airports.airport_code
    WHERE
    airports.city = 'Москва')
    AND CAST(flights.arrival_time AS date) BETWEEN '2018-07-23' AND '2018-09-30'
   GROUP BY
   week_number) t

   
LEFT JOIN 
(SELECT 		
		festival_name,	
		EXTRACT (week FROM festivals.festival_date) AS festival_week
	FROM 
		festivals
	WHERE
		festival_city = 'Москва'
	  AND CAST(festivals.festival_date AS date) BETWEEN '2018-07-23' AND '2018-09-30'
) t2 
ON 
	t.week_number = t2.festival_week
) AS T;
