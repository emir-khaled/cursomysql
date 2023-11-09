#Escenario 1: Crear un cliente nuevo
#Datos
#
#tabla cliente:
#cliente_id: 52
#nombre: Rafael
#apellidos: Lopez
#domicilio_id: 52
#datos_fiscales_id: NULL

#tabla domicilio:
#domicilio_id: 52
#calle: Uranio
#colonia: Quimica
#numero: 100
#telefono: 355236978

#tabla login:
#idlogin: 52
#email: rafaellopez@example.com
#password: password
#cliente_cliente_id: 52
#cliente_domicilio_domicilio_id: 52

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO cliente (cliente_id,nombre,apellidos,domicilio_id,datos_fiscales_id)
VALUES ('52','Rafael','Lopez','52','52');

INSERT INTO domicilio (domicilio_id,calle,colonia,numero,telefono)
VALUES ('52','Uranio','Quimica','100','355236978');

INSERT INTO login (idlogin,email,password,cliente_cliente_id,cliente_domicilio_domicilio_id)
VALUES ('52','rafaellopez@example.com','password','52','52');

INSERT INTO datos_fiscales (datos_fiscales_id,RFC,`situacion fiscal`,domicilio_fiscal_idFiscalDomicilio) 
VALUES ('52', 'LOGRaf12Q568', 'Persona Moral', '52');

INSERT INTO domicilio_fiscal (idFiscalDomicilio,calle,colonia,cp,estado,numero,ciudad) 
VALUES ('52','Calle 1', 'Numeros', '45153', 'Jalisco', '263', 'Guadalajara');

SELECT * FROM cliente WHERE cliente_id = 52;
#+--------+-----------+------------+--------------+-------------------+
#| nombre | apellidos | cliente_id | domicilio_id | datos_fiscales_id |
#+--------+-----------+------------+--------------+-------------------+
#| Rafael | Lopez     |         52 |           52 |                52 |
#+--------+-----------+------------+--------------+-------------------+

SELECT * FROM domicilio WHERE domicilio_id = 52;
#+--------------+--------+---------+--------+-----------+
#| domicilio_id | calle  | colonia | numero | telefono  |
#+--------------+--------+---------+--------+-----------+
#|           52 | Uranio | Quimica |    100 | 355236978 |
#+--------------+--------+---------+--------+-----------+

SELECT * FROM login WHERE idlogin = 52;
#+---------+-------------------------+----------+--------------------+--------------------------------+
#| idlogin | email                   | password | cliente_cliente_id | cliente_domicilio_domicilio_id |
#+---------+-------------------------+----------+--------------------+--------------------------------+
#|      52 | rafaellopez@example.com | password |                 52 |                             52 |
#+---------+-------------------------+----------+--------------------+--------------------------------+

SELECT * FROM datos_fiscales WHERE datos_fiscales_id = 52;
#+-------------------+--------------+------------------+------------------------------------+
#| datos_fiscales_id | RFC          | situacion fiscal | domicilio_fiscal_idFiscalDomicilio |
#+-------------------+--------------+------------------+------------------------------------+
#|                52 | LOGRaf12Q568 | Persona Moral    |                                 52 |
#+-------------------+--------------+------------------+------------------------------------+

SELECT * FROM domicilio_fiscal WHERE idFiscalDomicilio = 52;
#+-------------------+---------+---------+-------+---------+--------+-------------+
#| idFiscalDomicilio | calle   | colonia | cp    | estado  | numero | ciudad      |
#+-------------------+---------+---------+-------+---------+--------+-------------+
#|                52 | Calle 1 | Numeros | 45153 | Jalisco |    263 | Guadalajara |
#+-------------------+---------+---------+-------+---------+--------+-------------+


