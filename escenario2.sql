#Escenario 2: Crear un pedido del nuevo cliente
#tabla cuenta:
#cuenta_id: 83
#fecha: 2023-11-08
#cliente_cliente_id: 52
#cliente_domicilio_domicilio_id: 52
#estado_cuenta: iniciada
#tipo_entrega: domicilio

#tabla producto:
#idproducto: 225
#menu_idmenu: 18
#cantidad: 1
#nota: Felicitaciones al chef
#cuenta_cuenta_id: 83

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO cuenta (cuenta_id,fecha,cliente_cliente_id,cliente_domicilio_domicilio_id,estado_cuenta,tipo_entrega) 
VALUES ('83', '2023-11-08', '52', '52', 'iniciada', 'domicilio');

INSERT INTO producto (idproducto,menu_idmenu,cantidad,nota,cuenta_cuenta_id) 
VALUES ('225','18','1','Felicidades al chef','83');

SELECT * FROM cuenta WHERE cuenta_id = '83';
#+-----------+------------+--------------------+--------------------------------+---------------+--------------+
#| cuenta_id | fecha      | cliente_cliente_id | cliente_domicilio_domicilio_id | estado_cuenta | tipo_entrega |
#+-----------+------------+--------------------+--------------------------------+---------------+--------------+
#|        83 | 2023-11-08 |                 52 |                             52 | iniciada      | domicilio    |
#+-----------+------------+--------------------+--------------------------------+---------------+--------------+

SELECT * FROM producto WHERE idproducto = '225';
#+------------+-------------+----------+---------------------+------------------+
#| idproducto | menu_idmenu | cantidad | nota                | cuenta_cuenta_id |
#+------------+-------------+----------+---------------------+------------------+
#|        225 |          18 |        1 | Felicidades al chef |               83 |
#+------------+-------------+----------+---------------------+------------------+

SELECT nombre,apellidos,descripcion,fecha,precio FROM cliente 
INNER JOIN cuenta ON cliente.cliente_id=cuenta.cliente_cliente_id 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu=producto.menu_idmenu 
WHERE cuenta_id = 83;
#+--------+-----------+--------------------------+------------+--------+
#| nombre | apellidos | descripcion              | fecha      | precio |
#+--------+-----------+--------------------------+------------+--------+
#| Rafael | Lopez     | Cordero asado con romero | 2023-11-08 |    210 |
#+--------+-----------+--------------------------+------------+--------+

