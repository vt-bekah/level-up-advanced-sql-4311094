-- Get a list of sales people and rank the car models they've sold the most of.

SELECT 
  emp.firstName, 
  emp.lastName, 
  mdl.model, 
  count(s.salesId) AS NumberSold,
  rank() OVER (PARTITION BY s.employeeId 
              ORDER BY count(s.salesId) DESC) AS Rank
FROM sales AS s
INNER JOIN employee AS emp
  ON s.employeeId = emp.employeeId
INNER JOIN inventory AS inv
  ON inv.inventoryId = s.inventoryId
INNER JOIN model AS mdl
  ON mdl.modelId = inv.modelId
GROUP BY emp.firstName, emp.lastName, mdl.model