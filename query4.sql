-- 4. Let us define the “latency” of an employee by the average that he/she takes
-- to process a complaint. Find the employee with the smallest latency.
-- Latency is in days
SELECT TOP 1 Employees.EmployeeID, AVG(DATEDIFF(day, Filed_date_time, Handled_date_time)) AS Latency
FROM Employees
JOIN Complaints ON Employees.EmployeeID = Complaints.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY Latency;