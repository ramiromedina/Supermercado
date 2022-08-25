CREATE OR REPLACE VIEW vw_clients_orders AS
SELECT c.client_name, c.id_order, s.store_name, o.order_price
FROM clients AS c JOIN orders AS o ON c.id_order = o.id_order
JOIN stores AS s on s.id_store = o.id_store
GROUP BY c.client_name
ORDER BY c.client_name;

CREATE OR REPLACE VIEW vw_low_stock_supplier AS
SELECT p.product_name, p.product_brand, p.product_type, p.product_stock, s.supplier_name
FROM products as p JOIN suppliers AS s ON p.id_product = s.id_product
WHERE p.product_stock < 500
ORDER BY p.product_stock ASC;

CREATE OR REPLACE VIEW vw_best_clients AS
SELECT c.client_name, c.client_email, c.id_order, s.store_name, o.order_price
FROM clients AS c JOIN orders AS o ON c.id_order = o.id_order
JOIN stores AS s on s.id_store = o.id_store
WHERE o.order_price >= 15000
GROUP BY c.client_name
ORDER BY o.order_price DESC;

CREATE OR REPLACE VIEW vw_product_future_revenue AS
SELECT product_name, product_brand, product_type, (sale_price * product_stock) AS product_revenue
FROM products
ORDER BY product_revenue DESC;

CREATE OR REPLACE VIEW vw_most_expensive_stores AS
SELECT s.store_name, s.store_address, e.employee_name, e.employee_salary
FROM employees AS e JOIN stores AS s on s.id_store = e.id_store
GROUP BY s.store_name
ORDER BY e.employee_salary DESC;

