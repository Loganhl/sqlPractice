
CREATE VIEW SFEmployees AS
SELECT e.firstName, e.lastName, e.employeeNumber, e.email, e.jobTitle
FROM employees e
JOIN offices o ON o.officeCode = e.officeCode
WHERE o.city = "San Francisco";

SELECT COUNT(*)
FROM SFEmployees;

CREATE VIEW managers AS
SELECT e.firstName, e.lastName, e.employeeNumber, e.jobTitle, e.email, o.city
FROM employees e
JOIN offices o ON o.officeCode = e.officeCode
WHERE e.jobTitle LIKE "%Manager%";

SELECT city, COUNT(*)
FROM managers
GROUP BY city;

CREATE VIEW custByCity as
SELECT city, COUNT(*) AS NumberOfCustomers
FROM customers
GROUP BY city;

SELECT NumberOfCustomers
FROM custByCity
WHERE city = "Singapore";

CREATE VIEW paymentsByMonth AS
SELECT MONTH(paymentDate) AS paymentMonth, YEAR(paymentDate) AS paymentYear, SUM(amount) AS Payments
FROM payments
GROUP BY MONTH(paymentDate), YEAR(paymentDate);

SELECT Payments
FROM paymentsByMonth
WHERE paymentYear = 2004 AND paymentMonth = 11;

CREATE VIEW orderTotalsByMonth AS
SELECT MONTH(o.orderDate) AS orderMonth, YEAR(o.orderDate) AS orderYear, SUM(od.quantityOrdered * od.priceEach) AS orderTotal
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY YEAR(o.orderDate), MONTH(o.orderDate);

SELECT orderTotal
FROM orderTotalsByMonth
WHERE orderYear = 2004 AND orderMonth = 8;

CREATE VIEW salesPerLine AS
SELECT pl.productLine, SUM(od.quantityOrdered * od.priceEach) AS tSales
FROM products p
JOIN productlines pl ON p.productLine = pl.productLine
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY pl.productLine;

SELECT tSales
FROM salesPerLine
WHERE productLine = 'Classic Cars';

CREATE VIEW productSalesYear AS
SELECT p.productName, SUM(od.quantityOrdered * od.priceEach) AS salesTotal, YEAR(o.orderDate) AS orderYear
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY p.productCode, orderYear;

SELECT salesTotal
FROM productSalesYear
WHERE productName = '2001 Ferrari Enzo' AND orderYear = 2004;

CREATE VIEW orderTotals AS
SELECT o.orderNumber, c.customerName, SUM(od.quantityOrdered * od.priceEach) AS totals
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

SELECT * FROM orderTotals
ORDER BY totals DESC
LIMIT 15;

CREATE VIEW salesPerRep AS
SELECT e.firstName, e.lastName, SUM(od.quantityOrdered * od.priceEach) AS tSales
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber;

CREATE VIEW salesPerOffice AS
SELECT o.officeCode, SUM(od.quantityOrdered * od.priceEach) AS totalSales
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o2 ON c.customerNumber = o2.customerNumber
JOIN orderdetails od ON o2.orderNumber = od.orderNumber
GROUP BY o.officeCode;