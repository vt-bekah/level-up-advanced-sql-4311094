-- PUll a report that totals the number of cars sold by each employee

SELECT
  s.employeeId,
  e.firstName,
  e.lastName,
  COUNT(s.salesId) AS Num_Cars_Sold
FROM sales AS s
JOIN employee AS e ON s.employeeId = e.employeeId
GROUP BY s.employeeId
ORDER BY Num_Cars_Sold DESC

-- Get a list of employees who have made more than 5 sales this year
SELECT
  s.employeeId,
  e.firstName,
  e.lastName,
  COUNT(s.salesId) AS Num_Cars_Sold,
  MIN(salesAmount) AS MinSaleAmount,
  MAX(salesAmount) AS MaxSaleAmount
FROM sales AS s
JOIN employee AS e ON s.employeeId = e.employeeId
-- WHERE s.soldDate >= date('now', 'start of year') -- none in 2024
WHERE s.soldDate >= 01/01/2023
GROUP BY s.employeeId
HAVING COUNT(s.salesId) > 5
ORDER BY Num_Cars_Sold DESC