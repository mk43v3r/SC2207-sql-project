-- 1. Find the average price of “Harry Porter Finale”
-- on Ahamazon from 1 August 2022 to 31 August 2022.

SELECT AVG(P.Price) AS Average_Price
FROM Books AS B
JOIN Stocks_In_Bookstore AS S ON B.PubID = S.PubID
JOIN Price_History AS P ON S.StockID = P.StockID
WHERE (B.Title = 'Harry Porter Finale' AND 
		((P.Start_date >= '2022/08/01' AND P.Start_date<= '2022/08/31')
		OR (P.Start_date <= '2022/08/31' AND P.End_date >= '2022/08/01')))