-- 2. Find publications that received at least 10 ratings of “5” in August 2022, and rank them by their average ratings.
INSERT INTO Items_In_Order(ItemID, StockID, OrderID, Item_Price, Item_Qty,
							Delivery_Date, Feedback_Date_Time, Feedback_Comment,
							Feedback_Rating)
VALUES
    -- add rating of 4 to StockID 9 to show the ordering
    (37, 9, 5, 28, 1, '2022-07-06', '2022-08-18 00:00:00.000', 'comment', 4)


SELECT SIB.PubID, AVG(IIO.Feedback_Rating) AS Average_Rating
FROM Stocks_In_Bookstore as SIB
JOIN Items_In_Order as IIO ON SIB.StockID = IIO.StockID 
WHERE MONTH(IIO.Feedback_Date_Time) = 8 AND YEAR(IIO.Feedback_Date_Time) = 2022
GROUP BY SIB.PubID
HAVING EXISTS(
	SELECT *
	FROM Items_In_Order as IIO2
	JOIN Stocks_In_Bookstore as SIB2 ON IIO2.StockID = SIB2.StockID
	WHERE SIB2.PubID = SIB.PubID AND MONTH(IIO2.Feedback_Date_Time) = 8 AND YEAR(IIO2.Feedback_Date_Time) = 2022 AND IIO2.Feedback_Rating = 5
	GROUP BY SIB2.PubID
	HAVING COUNT(*) >= 10
)
ORDER BY Average_Rating DESC;

-- Delete  added rows
DELETE FROM Items_In_Order
WHERE 
    (ItemID = 37 AND StockID = 9 AND OrderID = 5 AND Item_Price = 28 AND Item_Qty = 1 AND Delivery_Date = '2022-07-06' 
    AND Feedback_Date_Time = '2022-08-18 00:00:00.000' AND Feedback_Comment = 'comment' AND Feedback_Rating = 4)
