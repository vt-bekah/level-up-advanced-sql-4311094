-- Retrieve list of employees (first + last) and their immediate managers names

SELECT
  e.firstName AS Employee_FirstName,
  e.LastName AS Employee_LastName,
  m.firstName AS Manager_FirstName,
  m.lastName AS Manager_LastName
FROM employee AS e
JOIN employee AS m ON e.managerId = m.employeeId