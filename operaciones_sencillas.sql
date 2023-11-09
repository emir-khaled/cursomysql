#posicionarse en el esquema restaurante
USE restaurante;

#Crear la tabla promocion si no existe
CREATE TABLE IF NOT EXISTS promocion (
  `idpromocion` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `descuento` FLOAT NOT NULL,
  PRIMARY KEY (`idpromocion`))
ENGINE = InnoDB;

#Eliminar una tabla
DROP TABLE promocion;

#Obtener la descripcion de la tabla cliente
DESCRIBE cliente;

#Obtener la descripcion de la tabla login
DESCRIBE login;

#Obtener la descripcion de la tabla domicilio
DESCRIBE domicilio;

#Obtener la descripcion de la tabla menu
DESCRIBE menu;

#Obtener la descripcion de la tabla producto
DESCRIBE producto;

#Workaround para evitar el error "ERROR 1452: 1452: Cannot add or update a child row: a foreign key constraint fails"
SET FOREIGN_KEY_CHECKS=0;

#Crear registros en la tabla cuenta
INSERT INTO cuenta (cuenta_id, fecha, cliente_cliente_id, cliente_domicilio_domicilio_id, estado_cuenta, tipo_entrega) 
VALUES ('80', '2023-11-01', '2', '2', 'entregada', 'sucursal'),
('81', '2023-11-02', '4', '4', 'entregada', 'sucursal'),
('82', '2023-11-02', '5', '5', 'entregada', 'domicilio');

#Crear registros en la tabla producto
INSERT INTO producto (`idproducto`, `menu_idmenu`, `cantidad`, `nota`, `cuenta_cuenta_id`) 
VALUES ('216', '10', '2', 'Felicitaciones al chef', '80'),
('217', '10', '2', 'Felicitaciones al chef', '80'),
('218', '11', '2', 'Felicitaciones al chef', '80'),
('219', '18', '1', '', '81'),
('220', '18', '1', '', '81'),
('221', '18', '1', '', '81'),
('222', '19', '1', 'Felicitaciones al chef', '82'),
('223', '19', '1', 'Felicitaciones al chef', '82'),
('224', '19', '1', 'Felicitaciones al chef', '82');

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta.cuenta_id = 6;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 14;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 21;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 25;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 27;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 28;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 29;

#Actualizar pedidos que han pasado de procesado a entregada
UPDATE cuenta
SET cuenta.estado_cuenta = 'entregada'
WHERE cuenta_id = 30;

#El total de lo vendido el 2023-10-01
SELECT SUM(precio*cantidad) AS VENTA_TOTAL FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu
WHERE cuenta.fecha='2023-10-01';

#Cantidad de productos vendidos el 2023-10-01
SELECT COUNT(precio) FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu
WHERE cuenta.fecha='2023-10-01';

#El producto de mayor valor vendido el 2023-10-01
SELECT MAX(precio) FROM cuenta 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu 
WHERE cuenta.fecha='2023-10-01';

#Nombre y apellido de los clientes que compraron un producto el 2023-10-01
SELECT nombre,apellidos FROM cliente 
INNER JOIN cuenta ON cliente.cliente_id=cuenta.cliente_cliente_id 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu=producto.menu_idmenu 
WHERE cuenta.fecha='2023-10-01';

#El nombre y apellido del cliente que compró el producto mas caro el 2023-10-01
SELECT nombre,apellidos FROM cliente 
INNER JOIN cuenta ON cliente.cliente_id=cuenta.cliente_cliente_id 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu=producto.menu_idmenu 
WHERE cuenta.fecha='2023-10-01' AND menu.precio=(
SELECT MAX(precio) FROM cuenta 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu 
WHERE cuenta.fecha='2023-10-01');

#Nombre y apellido de los clientes que compraron un producto en Octubre de 2023
SELECT nombre,apellidos FROM cliente 
INNER JOIN cuenta ON cliente.cliente_id=cuenta.cliente_cliente_id 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu=producto.menu_idmenu 
WHERE cuenta.fecha BETWEEN '2023-10-01' AND '2023-10-31';

#Precio del producto mas caro comprado en el mes de Octubre de 2023
SELECT MAX(precio) FROM cliente 
INNER JOIN cuenta ON cliente.cliente_id=cuenta.cliente_cliente_id 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu=producto.menu_idmenu 
WHERE cuenta.fecha BETWEEN '2023-10-01' AND '2023-10-31';
