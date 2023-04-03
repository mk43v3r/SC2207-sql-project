-- 1. Find the average price of “Harry Porter Finale”
-- on Ahamazon from 1 August 2022 to 31 August 2022.

-- insert data to Price_History for "Harry Porter Finale" to different bookstores
INSERT INTO Price_History
VALUES(1,15,'2022/08/16', '2022/09/15');
INSERT INTO Price_History
VALUES(1,10,'2022/08/01', '2022/08/15');
INSERT INTO Price_History
VALUES(2,8,'2022/08/09', '2022/08/31');
INSERT INTO Price_History
VALUES(2,12,'2022/08/02', '2022/08/08');
INSERT INTO Price_History
VALUES(2,15,'2022/07/16', '2022/08/01');
INSERT INTO Price_History
VALUES(3,11,'2022/07/09', '2022/09/15');
-- insert other price data for non "Harry Porter Finale" publications
INSERT INTO Price_History
VALUES(4,11,'2022/07/09', '2022/09/15');
-- average price for "Harry Porter Finale" should be 11.8333333333


SELECT AVG(P.Price) AS Average_Price
FROM Books AS B
JOIN Stocks_In_Bookstore AS S ON B.PubID = S.PubID
JOIN Price_History AS P ON S.StockID = P.StockID
WHERE (B.Title = 'Harry Porter Finale' AND 
		((P.Start_date >= '2022/08/01' AND P.Start_date<= '2022/08/31')
		OR (P.Start_date <= '2022/08/31' AND P.End_date >= '2022/08/01')));


-- Delete the added rows
DELETE FROM Price_History
WHERE 
    (StockID = 1 AND Price = 15 AND Start_date = '2022/08/16' AND End_date = '2022/09/15')
    OR
    (StockID = 1 AND Price = 10 AND Start_date = '2022/08/01' AND End_date = '2022/08/15')
    OR
    (StockID = 2 AND Price = 8 AND Start_date = '2022/08/09' AND End_date = '2022/08/31')
    OR 
    (StockID = 2 AND Price = 12 AND Start_date = '2022/08/02' AND End_date = '2022/08/08')
    OR
    (StockID = 2 AND Price = 15 AND Start_date = '2022/07/16' AND End_date = '2022/08/01')
    OR 
    (StockID = 3 AND Price = 11 AND Start_date = '2022/07/09' AND End_date = '2022/09/15')
    OR
    (StockID = 4 AND Price = 11 AND Start_date = '2022/07/09' AND End_date = '2022/09/15')








