-- Get list of salespeople with zero sales

SELECT 
  firstName,
  lastName,
  title,
  startDate
FROM employee
WHERE title = 'Sales Person'
AND employeeId NOT IN (
  SELECT DISTINCT
    employeeId
  FROM sales
)

-- their answer (same results)
SELECT
  e.firstName,
  e.lastName,
  e.title,
  e.startDate,
  s.salesId
FROM employee AS e
LEFT JOIN sales AS s ON e.employeeId = s.employeeId
WHERE e.title = 'Sales Person'
AND s.salesId IS NULL
