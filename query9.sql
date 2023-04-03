-- 9. Find publications that are increasingly being purchased over at least 3 months.

-- This creates a view of monthly sales of publications 
CREATE OR ALTER VIEW MonthlySales AS
SELECT s.PubID, MONTH(o.Order_Date_time) as month, YEAR(o.Order_Date_time) as year, SUM(item_qty) as numSales
FROM ( (Items_In_Order as i JOIN Stocks_In_Bookstore AS s ON i.StockID = s.StockID) JOIN Publication as p ON s.PubID = p.PubID) JOIN  Orders as o ON i.OrderID = o.OrderID 
GROUP BY s.PubID, MONTH(o.Order_Date_time), YEAR(o.Order_Date_time)
GO

-- Show the view
SELECT *
FROM MonthlySales

SELECT DISTINCT M1.PubID
FROM MonthlySales AS M1, MonthlySales AS M2, MonthlySales AS M3
WHERE M1.PubID = M2.PubID
AND M2.PubID = M3.PubID
AND M1.year = M2.year 
AND M2.year = M3.year 
AND M1.month = M2.month - 1 
AND M2.month = M3.month - 1
AND M1.numSales < M2.numSales 
AND M2.numSales < M3.numSales;

-- Ensure views are cleaned up after queries
DROP VIEW MonthlySales