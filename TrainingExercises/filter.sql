-- Find all sales where car purchased was electric
SELECT
  s.salesId,
  s.salesAmount,
  s.soldDate
FROM sales AS s
JOIN inventory AS inv ON s.inventoryId = inv.inventoryId
WHERE inv.inventoryId IN (
SELECT
  modelId
FROM model
WHERE EngineType = 'Electric'
)


