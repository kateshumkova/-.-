#Установите фестивали, которые проходили с 23 июля по 30 сентября 2018 года в Москве, и номер недели, в которую они проходили. 
#Выведите название фестиваля festival_name и номер недели festival_week.

Select 
FESTIVAL_NAME,
EXTRACT(week FROM FESTIVAL_DATE) as festival_week
from
festivals
WHERE
FESTIVAL_CITY='Москва' AND FESTIVAL_DATE BETWEEN '2018-07-23' AND '2018-09-30'
