CREATE DATABASE sales_reports_dbs;
USE sales_reports_dbs;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name) VALUES
(1, 'Laptop Pro 15'),
(2, 'Smartphone X'),
(3, 'Wireless Earbuds'),
(4, 'Smartwatch Z'),
(5, 'Tablet Air');

INSERT INTO sales (sale_id, sale_date, product_id, quantity, price) VALUES
(101, '2025-09-18', 1, 2, 60000),
(102, '2025-09-18', 2, 5, 19000),
(103, '2025-09-18', 3, 10, 2500),
(104, '2025-09-18', 4, 3, 7000),
(105, '2025-09-19', 1, 1, 60000),
(106, '2025-09-19', 2, 8, 19000),
(107, '2025-09-19', 3, 6, 2500),
(108, '2025-09-20', 5, 4, 12000),
(109, '2025-09-20', 3, 15, 2500),
(110, '2025-09-20', 4, 2, 7000);
Select * from products;
Select * from sales;

SELECT 
    sale_date,
    SUM(quantity * price) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

SELECT 
    sale_date,
    COUNT(sale_id) AS total_transactions,
    ROUND(AVG(quantity * price), 2) AS avg_transaction_value
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

SELECT 
    p.product_name,
    SUM(s.quantity * s.price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;
