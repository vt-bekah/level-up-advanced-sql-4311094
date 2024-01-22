-- Get a list of all sales and all customers even if some of the data has been removed

-- if full outer join supported
SELECT
  s.salesId,
  s.salesAmount,
  s.soldDate,
  c.firstName,
  c.lastName
FROM sales AS s
FULL JOIN customer AS c
ON s.customerId = c.customerId

-- if full outer join not supported
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM customer cus
INNER JOIN sales sls
    ON cus.customerId = sls.customerId
UNION
-- UNION WITH CUSTOMERS WHO HAVE NO SALES
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM customer cus
LEFT JOIN sales sls
    ON cus.customerId = sls.customerId
WHERE sls.salesId IS NULL
UNION
-- UNION WITH SALES MISSING CUSTOMER DATA
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM sales sls
LEFT JOIN customer cus
    ON cus.customerId = sls.customerId