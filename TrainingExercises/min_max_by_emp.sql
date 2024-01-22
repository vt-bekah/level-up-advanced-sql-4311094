-- Produce a report that lists the least and most expensive car sold by each employee this year

SELECT
  e.employeeId,
  e.firstName,
  e.LastName,
  MIN(salesAmount) AS MinSaleAmount,
  MAX(salesAmount) AS MaxSaleAmount
FROM employee AS e
JOIN sales AS s ON e.employeeId = s.employeeId
-- WHERE s.soldDate >= date('now', 'start of year') -- none in 2024
WHERE s.soldDate >= 01/01/2023
GROUP BY e.employeeId