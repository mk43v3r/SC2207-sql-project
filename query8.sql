-- 8. Find publications that have never been purchased by any customer 
-- in July 2022, but are the top 3 most purchased publications in August 2022.

SELECT TOP 3 PUB.PubID
FROM Publication AS PUB
JOIN Stocks_In_Bookstore AS SIB ON PUB.PubID = SIB.PubID
JOIN Items_In_Order AS IIO ON SIB.StockID = IIO.StockID
JOIN Orders AS O ON IIO.OrderID = O.OrderID
WHERE MONTH(O.Order_Date_Time) = 8 AND YEAR(O.Order_Date_Time) = 2022
AND PUB.PubID NOT IN(
    ---- publications purchased in July 2022
	SELECT DISTINCT SIB2.PubID
	FROM Stocks_In_Bookstore AS SIB2 
	JOIN Items_In_Order AS IIO2 ON IIO2.StockID = SIB2.StockID
	JOIN Orders AS O2 ON IIO2.OrderID = O2.OrderID
	WHERE MONTH(O2.Order_Date_Time) = 7 AND YEAR(O2.Order_Date_Time) = 2022
)
GROUP BY PUB.PubID
ORDER BY COUNT(*) DESC 
