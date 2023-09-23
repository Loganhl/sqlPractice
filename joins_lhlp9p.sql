/*=============================================================*/

/* 1A */
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

/* 1B */
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName
FROM customers c
LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

/* 1C */
SELECT c.customerName, c.customerNumber, e.employeeNumber, e.firstName, e.lastName
FROM customers c
RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

/* 2A */
SELECT  e.firstName, e.lastName, o.officeCode, o.phone, o.city
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;

/* 2B */
SELECT  e.firstName, e.lastName, o.officeCode, o.phone, o.city
FROM employees e
LEFT JOIN offices o ON e.officeCode = o.officeCode;

/* 2C */
SELECT  e.firstName, e.lastName, o.officeCode, o.phone, o.city
FROM employees e
RIGHT JOIN offices o ON e.officeCode = o.officeCode;

/* 3A */
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;

/* 3B */
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
LEFT JOIN products p ON od.productCode = p.productCode;

/* 3C */
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, p.productName, od.quantityOrdered, od.priceEach
FROM customers c
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
RIGHT JOIN orderdetails od ON o.orderNumber = od.orderNumber
RIGHT JOIN products p ON od.productCode = p.productCode;

/* 4A */
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber;

/* 4B */
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber;

/* 4C */
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
RIGHT JOIN payments p ON c.customerNumber = p.customerNumber;

/* 5A */
SELECT pl.productLine, p.productName, p.productDescription
FROM products p
JOIN productlines pl ON p.productLine = pl.productLine;

/* 5B */
SELECT pl.productLine, p.productName, p.productDescription
FROM products p
LEFT JOIN productlines pl ON p.productLine = pl.productLine;

/* 5C */
SELECT pl.productLine, p.productName, p.productDescription
FROM products p
RIGHT JOIN productlines pl ON p.productLine = pl.productLine;

/*=============================================================*/

/* 2b - 1 */
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber;

/* 2b - 2 */
SELECT o.orderNumber, SUM(od.quantityOrdered * od.priceEach) AS orderTotal
FROM orders o
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

/* 2b - 3 */
SELECT e.lastName, e.firstName, o.addressLine1. o.country, o.state
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode;

/* 2b - 4 */
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber;

/* 2b - 5 */
SELECT e.firstName, e.lastName, c.customerName, SUM(od.quantityOrdered * od.priceEach) AS 'Total Sales'
FROM employees e
RIGHT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN orders o ON c.customerNumber = o.customerNumber
RIGHT JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber, c.customerNumber;

/*=============================================================*/