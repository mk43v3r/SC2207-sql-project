-- 3. For all publications purchased in June 2022 that have been
-- delivered, find the average time from the ordering date to the
-- delivery date.
SELECT P.PubID, AVG(DATEDIFF(day, CAST(O.Order_Date_time AS DATE), I.Delivery_date)) AS Avg_Delivery_Time
FROM Orders AS O
JOIN Items_In_Order AS I ON O.OrderID = I.OrderID
JOIN Stocks_In_Bookstore AS S ON I.StockID = S.StockID
JOIN Publication as P ON S.PubID = P.PubID
WHERE MONTH(O.Order_Date_time) = 6 AND YEAR(O.Order_Date_time) = 2022 AND
		I.Delivery_date IS NOT NULL
GROUP BY P.PubID