-- Create a report showing the total sales per year

WITH sales_year AS (
SELECT 
  strftime('%Y', soldDate) AS soldYear,
  salesAmount
FROM sales
)
SELECT 
  soldYear,
  -- ROUND(SUM(salesAmount),2) AS Total_Sales
  FORMAT("$%.2f", SUM(salesAmount)) AS Total_Sales
FROM sales_year
GROUP BY soldYear
ORDER BY soldYear