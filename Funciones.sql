DELIMITER //
CREATE FUNCTION FN_stock_revenue (id INT)
RETURNS DECIMAL
READS SQL DATA
BEGIN
	DECLARE v_resultado DECIMAL;
    SELECT (sale_price * product_stock)
    INTO v_resultado
	FROM products
    WHERE id_product = id;
    RETURN v_resultado;
END
// DELIMITER ;

SELECT supermercado.FN_stock_revenue(1);

DELIMITER //
CREATE FUNCTION FN_employee_id_store_name (id int)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE v_store VARCHAR(100);
SET v_store = (SELECT store_name 
FROM employees AS e
JOIN stores AS s ON e.id_employee = s.id_employee  
WHERE e.id_employee = id);
RETURN concat('El empleado con id (',id,') trabaja en sucursal ',v_store);
END
// DELIMITER ;

SELECT supermercado.FN_employee_id_store_name(1);
