-- Generate a sales report showing total sales per month and an annual running total
WITH monthly_sales AS (
  SELECT
    ROUND(SUM(salesAmount),2) AS MonthlySales,
    strftime('%m', soldDate) AS soldMonth,
    strftime('%Y', soldDate) AS soldYear
  from sales
  GROUP BY soldYear, soldMonth
)
SELECT
  soldYear, 
  soldMonth,
  FORMAT("$%.2f", MonthlySales) AS MonthlySales,
  FORMAT("$%.2f", SUM(MonthlySales) OVER (PARTITION BY soldYear 
                          ORDER BY soldYear, soldMonth)) AS AnnualSales_RunningTotal
FROM monthly_sales
ORDER BY soldYear, soldMonth