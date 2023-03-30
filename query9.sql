SELECT DISTINCT M1.PubID
FROM MonthlySales AS M1, MonthlySales AS M2, MonthlySales AS M3
WHERE M1.year = M2.year 
AND M2.year = M3.year 
AND M1.month = M2.month - 1 
AND M2.month = M3.month - 1
AND M1.numSales < M2.numSales 
AND M2.numSales < M3.numSales;
