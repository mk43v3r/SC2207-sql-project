-- 1. Find the average price of “Harry Porter Finale”
-- on Ahamazon from 1 August 2022 to 31 August 2022.
SELECT AVG(P.Price)
FROM Books AS B
JOIN Stocks_In_Bookstore AS S ON B.PubID = S.PubID
JOIN Price_History AS P ON S.StockID = P.StockID
WHERE (B.Title = 'Harry Porter Finale' AND 
		((P.Start_date >= '2022/08/01' AND P.Start_date<= '2022/08/31')
		OR (P.Start_date <= '2022/08/31' AND P.End_date >= '2022/08/01')));

/*Already in DB

INSERT INTO Price_History
VALUES(1,15,'2022/08/16', '2022/09/15');

INSERT INTO Price_History
VALUES(1,10,'2022/08/01', '2022/08/15');

INSERT INTO Price_History
VALUES(2,8,'2022/08/09, '2022/08/31);

INSERT INTO Price_History
VALUES(2,12,'2022/08/02, '2022/08/08);

INSERT INTO Price_History
VALUES(2,15,'2022/07/16, '2022/08/01');

INSERT INTO Price_History
VALUES(3,11,'2022/07/09, '2022/09/15');
*/
