-- 5. Produce a list that contains 
-- (i) all publications published by Nanyang Publisher Company, and 
-- (ii) for each of them, the number of bookstores on Ahamazon that sell them.
SELECT P.PubID, COUNT(S.StockID) AS Bookstores_Count
FROM Stocks_In_Bookstore AS S
JOIN Publication AS P ON P.PubID = S.PubID
WHERE P.Publisher = 'Nanyang Publisher Company'
GROUP BY P.PubID