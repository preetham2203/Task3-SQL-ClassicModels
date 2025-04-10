-- Q1: Customers from USA (SELECT, WHERE, ORDER BY)
SELECT customerName, country
FROM customers
WHERE country = 'USA'
ORDER BY customerName;

-- Q2: Count customers per country (GROUP BY + COUNT)
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;

-- Q3: Orders and customer names (INNER JOIN)
SELECT o.orderNumber, o.orderDate, c.customerName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber;

-- Q4: Employees with office cities (LEFT JOIN)
SELECT e.firstName, e.lastName, o.city
FROM employees e
LEFT JOIN offices o ON e.officeCode = o.officeCode;

-- Q5: Customers with credit above average (SUBQUERY)
SELECT customerName, creditLimit
FROM customers
WHERE creditLimit > (
    SELECT AVG(creditLimit) FROM customers
);

-- Q6: Create view for customer order summary (CREATE VIEW)
DROP VIEW IF EXISTS customer_order_summary;
CREATE VIEW customer_order_summary AS
SELECT c.customerName, COUNT(o.orderNumber) AS total_orders
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerName;
