-- SP 1 - Inserta datos a la tabla orders (ordenes de compra)

DROP PROCEDURE IF EXISTS SP_insert_order
DELIMITER //
CREATE PROCEDURE SP_insert_order (INOUT precio DECIMAL,
                      INOUT cliente INT,
                      INOUT producto INT,
                      INOUT sucursal INT)
BEGIN
INSERT INTO orders (order_price, id_client, id_product, id_store) values (precio, cliente, producto, sucursal);
END 
// DELIMITER ;

-- Inserto los siguientes datos en la tabla:

set @precio = 14500;
set @cliente = 4;
set @producto = 10;
set @sucursal = 1;
call supermercado.SP_insert_order(@precio, @cliente, @producto, @sucursal);
select @precio, @cliente, @producto, @sucursal;

-- SP 2 - Ordena el campo que le ingreses de forma ASC o DESC segun lo indicado

DROP PROCEDURE IF EXISTS SP_order_employees
DELIMITER //
CREATE PROCEDURE SP_order_employees (INOUT campo VARCHAR(100),
				                     INOUT orden VARCHAR(100))	
BEGIN
SET @var = CONCAT('SELECT * FROM employees ORDER BY',' ',campo,' ',orden);
  PREPARE ejecutar FROM @var;
  EXECUTE ejecutar;  
  DEALLOCATE PREPARE ejecutar;
END //
DELIMITER ;

-- Ordeno por nombre de empleado de manera descendiente

set @campo = 'employee_name';
set @orden = 'desc';
call supermercado.SP_order_employees(@campo, @orden);
