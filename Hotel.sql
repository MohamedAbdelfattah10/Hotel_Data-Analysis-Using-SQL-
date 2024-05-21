
select * from HOTEL 
--------------------------------------------------------------------------------
--1. What is the total number of reservations in the dataset?
SELECT COUNT(*) TOTAL_RESERVATION 
FROM hotel 
where booking_status='Not_Canceled'
---------------------------------------------------------------------------------
--2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan ,COUNT(Booking_ID) AS Number_Of_Gest 
from hotel 
group by type_of_meal_plan 
---------------------------------------------------------------------------------
--3. What is the average price per room for reservations involving children?
SELECT AVG(isnull(cast(avg_price_per_room as float),0))as avg_price_room
FROM hotel
WHERE no_of_children > 0 ;
---------------------------------------------------------------------------------
--4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS TOTAL_Reservations
FROM hotel
WHERE arrival_year ='2018'
---------------------------------------------------------------------------------
-- 5. What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(room_type_reserved) AS MOST_Room_Type_Reserved
FROM HOTEL 
GROUP BY room_type_reserved
ORDER BY MOST_room_type_reserved DESC
---------------------------------------------------------------------------------
--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*)  AS No_Of_Weekend_Nights
FROM HOTEL 
WHERE no_of_weekend_nights > 0
---------------------------------------------------------------------------------
--7. What is the highest and lowest lead time for reservations?
SELECT max(lead_time) AS MAX_Lead_Time,min(lead_time) as lowes_Lead_Time
FROM HOTEL 
--------------------------------------------------------------------------------
 --8. What is the most common market segment type for reservations?
 SELECT market_segment_type,COUNT(market_segment_type) AS Most_segment_type 
 FROM HOTEL 
 GROUP BY market_segment_type
 ORDER BY Most_segment_type DESC 
 --------------------------------------------------------------------------------
 --9. How many reservations have a booking status of "Confirmed"?
 SELECT COUNT(*) AS NO_Of_Confirmed_Reservations
 FROM HOTEL 
 WHERE booking_status='Not_Canceled'
 --------------------------------------------------------------------------------
 --10. What is the total number of adults and children across all reservations?
 SELECT sum(no_of_adults) AS Total_adults , sum (no_of_children) AS Total_Of_Children
 from hotel 
 --------------------------------------------------------------------------------
 --11.What is the average number of weekend nights for reservations involving children?
 SELECT AVG(no_of_weekend_nights) AS number_of_children_weekend_nights
 FROM HOTEL 
 WHERE no_of_children > 0
 --------------------------------------------------------------------------------
 --12. How many reservations were made in each month of the year?
 select arrival_month ,count (*) as Total_Reservation_EachMonth
 from hotel 
 group by arrival_month 
 order by arrival_month ASC
 ---------------------------------------------------------------------------------
 --13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
 SELECT room_type_reserved ,AVG(no_of_weekend_nights+no_of_week_nights) as AVG_OF_nights
 FROM HOTEL 
 GROUP by room_type_reserved 
 ORDER by room_type_reserved ASC
 ---------------------------------------------------------------------------------
 --14. For reservations involving children, what is the most common room type, and what is the average
--price for that room type?
SELECT room_type_reserved,COUNT(no_of_children) AS Total_Reservations_Involving_Children,avg(avg_price_per_room) as price 
FROM HOTEL 
where no_of_children>0
group by room_type_reserved
ORDER by room_type_reserved ASC
--SELECT room_type_reserved,
--from hotel 
--group by room_type_reserved
--ORDER by room_type_reserved ASC
----------------------------------------------------------------------------------

select market_segment_type,avg(avg_price_per_room) as Avg_Price_Per_Room
from hotel
group by market_segment_type 
order by market_segment_type desc