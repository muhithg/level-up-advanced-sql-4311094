--CHALLENGE 1
SELECT emp.employeeId, emp.firstName, emp.lastName, emp.title, 
        man.employeeId,man.firstName,man.lastName  
FROM Employee emp
INNER JOIN employee man ON emp.managerId=man.employeeId;

SELECT * FROM employee

--CHALLENGE 2 - salespeople with zero sales
SELECT * FROM sales WHERE salesId is null
SELECT * FROM customer
SELECT * FROM inventory;

SELECT emp.firstName,emp.lastName, emp.title, emp.startDate,sl.employeeId,sl.salesId
FROM employee emp
LEFT JOIN sales sl ON emp.employeeId = sl.employeeId
WHERE emp.title='Sales Person'AND sl.salesId is null;



--CHALLENGE 3
SELECT c.firstName,c.lastName,c.email,s.salesAmount,s.soldDate
FROM customer c
INNER JOIN sales s ON c.customerId=s.customerId
UNION
SELECT c.firstName,c.lastName,c.email,s.salesAmount,s.soldDate
FROM customer c
LEFT JOIN sales s ON c.customerId=s.customerId
WHERE s.salesId is NULL
UNION
SELECT c.firstName,c.lastName,c.email,s.salesAmount,s.soldDate
FROM sales s
LEFT JOIN customer c ON c.customerId = s.customerId
where c.customerId is null;



SELECT *, customer.customerId FROM sales OUTER JOIN customer on sales.customerId=customer.customerId 
where firstName='Savannah';