#Escenario 3: Crear un pedido del nuevo cliente en el restaurante y cancelarlo
#tabla cuenta:
#cuenta_id: 84
#fecha: 2023-11-08
#cliente_cliente_id: 52
#cliente_domicilio_domicilio_id: 52
#estado_cuenta: iniciada
#tipo_entrega: domicilio

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO cuenta (cuenta_id,fecha,cliente_cliente_id,cliente_domicilio_domicilio_id,estado_cuenta,tipo_entrega) 
VALUES ('84', '2023-11-08', '52', '52', 'iniciada', 'domicilio');

UPDATE cuenta
SET estado_cuenta = 'cancelada'
WHERE cuenta_id = 84;

SELECT * FROM cuenta WHERE cuenta_id = 84;
#+-----------+------------+--------------------+--------------------------------+---------------+--------------+
#| cuenta_id | fecha      | cliente_cliente_id | cliente_domicilio_domicilio_id | estado_cuenta | tipo_entrega |
#+-----------+------------+--------------------+--------------------------------+---------------+--------------+
#|        84 | 2023-11-08 |                 52 |                             52 | cancelada     | domicilio    |
#+-----------+------------+--------------------+--------------------------------+---------------+--------------+

SELECT nombre,apellidos,fecha,estado_cuenta  FROM cliente 
INNER JOIN cuenta ON cliente.cliente_id=cuenta.cliente_cliente_id
WHERE cuenta_id = 84;
#+--------+-----------+------------+---------------+
#| nombre | apellidos | fecha      | estado_cuenta |
#+--------+-----------+------------+---------------+
#| Rafael | Lopez     | 2023-11-08 | cancelada     |
#+--------+-----------+------------+---------------+


