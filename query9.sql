-- 9. Find publications that are increasingly being purchased over at least 3 months.

-- This creates a view of monthly sales of publications 
CREATE OR ALTER VIEW MonthlySales AS
SELECT s.PubID, MONTH(o.Order_Date_time) as month, YEAR(o.Order_Date_time) as year, SUM(item_qty) as numSales
FROM ( (Items_In_Order as i JOIN Stocks_In_Bookstore AS s ON i.StockID = s.StockID) JOIN Publication as p ON s.PubID = p.PubID) JOIN  Orders as o ON i.OrderID = o.OrderID 
GROUP BY s.PubID, MONTH(o.Order_Date_time), YEAR(o.Order_Date_time)
GO


-- Current dataset has no publication with increasing sales over at least 3 months
-- Thus, data is inserted to satisfy query
INSERT INTO Items_In_Order(ItemID, StockID, OrderID, Item_Price, Item_Qty,
							Delivery_Date, Feedback_Date_Time, Feedback_Comment,
							Feedback_Rating)
VALUES
    -- add 2 sales for PubID 1 on Jul
    (37, 3, 4, 13, 2, '2022-09-09', null, null, null),
    -- add 5 sales for PubID 2 on Aug
    (38, 3, 2, 13, 5, '2022-09-09', null, null, null),
    -- add 4 sales for PubID 5 on Aug
    (39, 8, 2, 23, 4, '2022-09-09', null, null, null);


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

-- Delete added rows
DELETE FROM Items_In_Order
WHERE 
    (ItemID = 37 AND StockID = 3 AND OrderID = 4 AND Item_Price = 13 AND Item_Qty = 2 AND Delivery_Date = '2022-09-09')
    OR
    (ItemID = 38 AND StockID = 3 AND OrderID = 2 AND Item_Price = 13 AND Item_Qty = 5 AND Delivery_Date = '2022-09-09')
    OR
    (ItemID = 39 AND StockID = 8 AND OrderID = 2 AND Item_Price = 23 AND Item_Qty = 4 AND Delivery_Date = '2022-09-09');
