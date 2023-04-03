-- 2. Find publications that received at least 10 ratings of “5” in August 2022,
-- and rank them by their average ratings.
SELECT SIB.PubID, AVG(IIO.Feedback_Rating) AS Average_Rating
FROM Stocks_In_Bookstore as SIB
JOIN Items_In_Order as IIO ON SIB.StockID = IIO.StockID 
WHERE MONTH(IIO.Feedback_Date_Time) = 8 AND YEAR(IIO.Feedback_Date_Time) = 2022
GROUP BY SIB.PubID
HAVING EXISTS(
	SELECT *
	FROM Items_In_Order as IIO2
	JOIN Stocks_In_Bookstore as SIB2 ON IIO2.StockID = SIB2.StockID
	WHERE SIB2.PubID = SIB.PubID AND MONTH(IIO2.Feedback_Date_Time) = 8 AND 
			YEAR(IIO2.Feedback_Date_Time) = 2022 AND IIO2.Feedback_Rating = 5
	GROUP BY SIB2.PubID
	HAVING COUNT(*) >= 10
)
ORDER BY Average_Rating DESC;