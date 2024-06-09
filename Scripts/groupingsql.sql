--Challenge 1: How many cars sold by per employee
SELECT e.employeeId,e.firstName, e.lastName, count(*) as SoldCars
FROM sales s
INNER JOIN employee e ON s.employeeId = e.employeeId
GROUP BY e.employeeId
ORDER BY SoldCars DESC



--Challenge 2: Least and Most expensive car sold by each employee 
SELECT e.employeeId,e.firstName, e.lastName, s.soldDate,
MIN(salesAmount) AS LeastAmount,
MAX(salesAmount) AS MostAmount 
FROM sales s
INNER JOIN employee e ON s.employeeId = e.employeeId
WHERE s.soldDate>=date('2019-01-01', '+2 year') --in the video =date('now', 'start of year')
GROUP BY e.employeeId;

--ORDER BY SoldCars DESC


SELECT * FROM employee;
SELECT * FROM sales;
SELECT * FROM model;


--Challenge 3: Top employee selling more than 5 cars
SELECT emp.employeeId,emp.firstName, emp.lastName, sls.soldDate, 
        count(*) AS TotalSold,MIN(salesAmount) AS LeastAmount,
MAX(salesAmount) AS MostAmount 
FROM employee emp
INNER JOIN sales sls ON emp.employeeId = sls.employeeId
WHERE sls.soldDate>=date('2020-01-01', '+2 year')
GROUP BY emp.employeeId
HAVING TotalSold>=5
Order by TotalSold DESC;


