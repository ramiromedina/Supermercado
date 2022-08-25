-- Trigger after insert en products

SELECT * FROM products;

DROP TABLE IF EXISTS log_auditoria_products;
CREATE TABLE IF NOT EXISTS log_auditoria_products
(
id_log INT AUTO_INCREMENT,
action_name VARCHAR (50),
tablename VARCHAR (50),
id_product INT,
product_name VARCHAR (50),
cost_price DECIMAL,
old_cost_price DECIMAL,
sale_price DECIMAL,
product_stock INT,
product_brand VARCHAR (50),
username VARCHAR (50),
update_date TIMESTAMP,
PRIMARY KEY (id_log)
)
; 

DROP TRIGGER IF EXISTS TRG_after_products;
DELIMITER // 
CREATE TRIGGER TRG_after_products 
AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
INSERT INTO log_auditoria_products (action_name, tablename, id_product, product_name, cost_price, sale_price, product_stock, product_brand, username, update_date)
VALUES ('insert', 'products', new.id_product, new.product_name, new.cost_price, new.sale_price, new.product_stock, new.product_brand, CURRENT_USER(), CURRENT_TIMESTAMP());
END //

SELECT * FROM log_auditoria_products;

INSERT INTO `products` (`id_product`, `product_name`, `product_type`, `cost_price`, `sale_price`, `product_stock`, `product_brand`, `id_supplier`) VALUES
(11, 'Jugo de Naranja 1L', 'Bebidas', 200, 280, 2000, 'Citric', 1)


-- Trigger before insert en products

SELECT * FROM products;

DROP TRIGGER IF EXISTS TRG_before_products;
DELIMITER //
CREATE TRIGGER TRG_before_products
BEFORE UPDATE ON products
FOR EACH ROW 
BEGIN 
INSERT INTO log_auditoria_products (action_name, tablename, id_product, product_name, old_cost_price, cost_price, sale_price, product_stock, product_brand, username, update_date)
VALUES ('insert', 'products', new.id_product, new.product_name, old.cost_price, new.cost_price, new.sale_price, new.product_stock, new.product_brand, CURRENT_USER(), CURRENT_TIMESTAMP());
END //

UPDATE products SET cost_price = 80
WHERE id_product = 1;

SELECT * FROM log_auditoria_products;


-- Trigger after insert en suppliers

SELECT * FROM suppliers;

DROP TABLE IF EXISTS log_auditoria_suppliers;
CREATE TABLE IF NOT EXISTS log_auditoria_suppliers
(
id_log INT AUTO_INCREMENT,
action_name VARCHAR (50),
tablename VARCHAR (50),
id_supplier INT,
supplier_name VARCHAR (50),
supplier_cuit INT,
supplier_email VARCHAR(50),
supplier_phone VARCHAR(50),
supplier_address VARCHAR(50),
id_product INT,
old_id_product INT,
username VARCHAR (50),
update_date TIMESTAMP,
PRIMARY KEY (id_log)
)
; 

DROP TRIGGER IF EXISTS TRG_after_suppliers;
DELIMITER // 
CREATE TRIGGER TRG_after_suppliers 
AFTER INSERT ON suppliers
FOR EACH ROW 
BEGIN 
INSERT INTO log_auditoria_suppliers (action_name, tablename, id_supplier, supplier_name, supplier_cuit, supplier_email, supplier_phone, supplier_address, id_product, username, update_date)
VALUES ('insert', 'suppliers', new.id_supplier, new.supplier_name, new.supplier_cuit, new.supplier_email, new.supplier_phone, new.supplier_address, new.id_product, CURRENT_USER(), CURRENT_TIMESTAMP());
END //

SELECT * FROM log_auditoria_suppliers;

INSERT INTO `suppliers` (`id_supplier`, `supplier_name`, `supplier_cuit`, `supplier_email`, `supplier_phone`, `supplier_address`, `id_product`) VALUES
(11, 'El Basico', 578086789, 'elbasico@gmail.com', '722-465-8052', '1775 Stone Plaza', 11)


-- Trigger before insert en suppliers

SELECT * FROM suppliers;

DROP TRIGGER IF EXISTS TRG_before_suppliers;
DELIMITER //
CREATE TRIGGER TRG_before_suppliers
BEFORE UPDATE ON suppliers
FOR EACH ROW 
BEGIN 
INSERT INTO log_auditoria_suppliers (action_name, tablename, id_supplier, supplier_name, supplier_cuit, supplier_email, supplier_phone, supplier_address, id_product, old_id_product, username, update_date)
VALUES ('insert', 'suppliers', new.id_supplier, new.supplier_name, new.supplier_cuit, new.supplier_email, new.supplier_phone, new.supplier_address, new.id_product, old.id_product, CURRENT_USER(), CURRENT_TIMESTAMP());
END //

UPDATE suppliers SET id_product = 3
WHERE id_supplier = 11;

SELECT * FROM log_auditoria_suppliers;





