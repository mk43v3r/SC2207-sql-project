-- creates a view of monthly sales of publications 
CREATE VIEW MonthlySales AS
SELECT s.PubID, MONTH(o.Order_Date_time) as month, YEAR(o.Order_Date_time) as year, SUM(item_qty) as numSales
FROM ( (Items_In_Order as i JOIN Stocks_In_Bookstore AS s ON i.StockID = s.StockID) JOIN Publication as p ON s.PubID = p.PubID) JOIN  Orders as o ON i.OrderID = o.OrderID 
GROUP BY s.PubID, MONTH(o.Order_Date_time), YEAR(o.Order_Date_time);
