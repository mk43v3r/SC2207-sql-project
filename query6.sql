-- 6. Find bookstores that made the most revenue in August 2022.
SELECT TOP 1 B.BookstoreID, SUM(I.Item_Price * I.Item_Qty) AS Revenue
FROM Items_In_Order AS I
JOIN Orders AS O ON I.OrderID = O.OrderID
JOIN Stocks_In_Bookstore AS S ON I.StockID = S.StockID
JOIN Bookstore AS B ON S.BookstoreID = B.BookstoreID
WHERE O.Order_Date_time >= '2022-08-01' AND O.Order_Date_time < '2022-09-01'
GROUP BY B.BookstoreID
ORDER BY Revenue DESC