-- 3. For all publications purchased in June 2022 that have been
-- delivered, find the average time from the ordering date to the
-- delivery date.
-- Average Time is in days.

SELECT AVG(DATEDIFF(day, O.Order_Date_time, IIO.Delivery_date)) as Average_Delivery_Time
FROM Orders O
JOIN Items_In_Order IIO ON O.OrderID = IIO.OrderID
WHERE IIO.Delivery_date IS NOT NULL
AND O.Order_Date_time >= '2022-06-01' AND O.Order_Date_time < '2022-07-01';