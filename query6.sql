-- 6. Find bookstores that made the most revenue in August 2022.

-- Create a temporary view with bookstore ID and its revenue in August 2022
CREATE OR ALTER VIEW BookstoreRevenue AS 
SELECT B.BookstoreID, SUM(I.Item_Price * I.Item_Qty) AS Revenue
-- SELECT B.BookstoreID, I.Item_Price, I.Item_Price
FROM Items_In_Order AS I
JOIN Orders AS O ON I.OrderID = O.OrderID
JOIN Stocks_In_Bookstore AS S ON I.StockID = S.StockID
JOIN Bookstore AS B ON S.BookstoreID = B.BookstoreID
WHERE O.Order_Date_time >= '2022-08-01' AND O.Order_Date_time < '2022-09-01'
GROUP BY B.BookstoreID
GO

-- There is a possibility that 2 bookstores have the same revenue
SELECT *
FROM BookstoreRevenue AS A
WHERE A.Revenue >= ALL (SELECT B.Revenue
						FROM BookstoreRevenue AS B)

DROP VIEW BookstoreRevenue