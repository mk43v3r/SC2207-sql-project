-- 7. For customers that made the most number of complaints,
-- find the most expensive publication he/she has ever purchased.

-- This creates a view of customer ID and the number of
-- complaints they made sorted in descending order.
CREATE OR ALTER VIEW CustomerComplaints AS
SELECT CustomerID, COUNT(CustomerID) AS Complaints_Count
FROM Complaints
GROUP BY CustomerID
GO

-- This creates a view of Customers with the maximum amount of complaints
CREATE OR ALTER VIEW MaxCustomerComplaints AS
SELECT A.CustomerID AS CustomerID
FROM CustomerComplaints AS A
WHERE A.Complaints_Count = (SELECT MAX(B.Complaints_Count) FROM CustomerComplaints AS B)
GO

SELECT DISTINCT M.CustomerID, P.PubID
FROM MaxCustomerComplaints AS M
JOIN Orders AS O ON M.CustomerID = O.CustomerID
JOIN Items_In_Order AS I ON O.OrderID = I.OrderID
JOIN Stocks_In_Bookstore AS S ON I.StockID = S.StockID
JOIN Publication AS P ON S.PubID = P.PubID
WHERE I.Item_Price >= ALL (SELECT I2.Item_Price
							FROM Orders AS O2
							JOIN Items_In_Order AS I2 ON O2.OrderID = I2.OrderID
							WHERE M.CustomerID = O2.CustomerID)
ORDER BY M.CustomerID DESC , P.PubID DESC

-- Ensure views are cleaned up after queries
DROP VIEW MaxCustomerComplaints
DROP VIEW CustomerComplaints