
--Challenge 1 - TotalSales per year over the years - CTE
WITH SalesPerYear AS(
SELECT strftime('%Y', soldDate) as soldYear, 
        salesAmount
FROM sales
)
SELECT soldYear, FORMAT("$%.2f",SUM(salesAmount)) As AnnualSales
FROM SalesPerYear
GROUP BY soldYear;


--Challenge 2 - TotalSales per employee for each month of 2021
SELECT emp.employeeId, emp.firstName, emp.lastName, sum(salesAmount), strftime('%m', soldDate) AS Month
FROM sales
INNER JOIN employee emp ON sales.employeeId=emp.employeeId
WHERE soldDate BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY MONTH, emp.employeeId
Order BY emp.firstName, emp.lastName;

SELECT * FROM model;
SELECT * FROM inventory;
SELECT * FROM sales;

--Challenge 3 - Sales of cars that are electric
SELECT salesId, inv.modelId, inv.colour, inv.year, sum(salesAmount), soldDate
FROM sales sl
INNER JOIN inventory inv ON sl.inventoryId=inv.inventoryId
INNER JOIN model mdl ON inv.modelId = mdl.modelId
WHERE EngineType in ('Electric')
GROUP BY salesId;

--ANOTHER WAY SEEN ON SOLUTION TO COMPARE
SELECT sl.salesId, inv.modelId, inv.colour, inv.year, sl.salesAmount, sl.soldDate
FROM sales sl
INNER JOIN inventory inv ON sl.inventoryId=inv.inventoryId
WHERE inv.modelId IN (SELECT modelId FROM model WHERE EngineType = 'Electric');

SELECT modelId, EngineType
From model
WHERE EngineType in ('Electric');

WHERE sl.inventoryId = (SELECT inv.inventoryId FROM inventory inv
 INNER JOIN model ON inv.modelId = model.modelId
 WHERE EngineType = 'Electric')
 GROUP BY sl.salesId;