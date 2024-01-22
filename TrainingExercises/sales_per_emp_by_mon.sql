-- Create a report that shows the amount of sales per employee for each month in 2021
-- WITH sales_month AS (
-- SELECT 
--   employeeId,
--   strftime('%m', soldDate) AS soldMonth,
--   salesAmount
-- FROM sales
-- WHERE strftime('%Y', soldDate) = '2021'
-- )
-- SELECT
--   e.employeeId,
--   e.firstName,
--   e.lastName,
--   sm.soldMonth,
--   FORMAT("$%.2f", SUM(sm.salesAmount)) AS Total_Sales
-- FROM employee AS e
-- JOIN sales_month AS sm ON e.employeeId = sm.employeeId
-- GROUP BY e.employeeId, sm.soldMonth

-- Added requirement: each column is a month while each row is employee
-- using case statements
SELECT
  e.firstName,
  e.lastName,
  SUM(CASE WHEN strftime('%m', soldDate) = '01'
    THEN salesAmount END) AS JanSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '02'
    THEN salesAmount END) AS FebSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '03'
    THEN salesAmount END) AS MarSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '04'
    THEN salesAmount END) AS AprSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '05'
    THEN salesAmount END) AS MaySales,
  SUM(CASE WHEN strftime('%m', soldDate) = '06'
    THEN salesAmount END) AS JunSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '07'
    THEN salesAmount END) AS JulSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '08'
    THEN salesAmount END) AS AugSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '09'
    THEN salesAmount END) AS SepSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '10'
    THEN salesAmount END) AS OctSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '11'
    THEN salesAmount END) AS NovSales,
  SUM(CASE WHEN strftime('%m', soldDate) = '12'
    THEN salesAmount END) AS DecSales
FROM employee AS e
JOIN sales AS s ON e.employeeId = s.employeeId
WHERE strftime('%Y', soldDate) = '2021'
GROUP BY e.lastName, e.firstName
ORDER BY e.lastName, e.firstName