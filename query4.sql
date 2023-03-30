-- 4. Let us define the “latency” of an employee by the average that he/she takes
-- to process a complaint. Find the employee with the smallest latency.
SELECT TOP 1 Employees.EmployeeID, AVG(DATEDIFF(day, Handled_date_time, Filed_date_time)) AS Latency
FROM Employees
JOIN Complaints ON Employees.EmployeeID = Complaints.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY Latency