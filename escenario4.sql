#Escenario 4: Consultar que cantidad de dinero se obtuvo en un día especificado

#Fecha: 2023-10-08

SELECT SUM(precio*cantidad) AS VENTA_TOTAL FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu
WHERE cuenta.fecha='2023-10-08';
#+--------------------+
#| VENTA_TOTAL        |
#+--------------------+
#| 2565.1600036621094 |
#+--------------------+

SELECT precio,cantidad,fecha AS VENTA_TOTAL FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu
WHERE cuenta.fecha='2023-10-08';
#+--------+----------+-------------+
#| precio | cantidad | VENTA_TOTAL |
#+--------+----------+-------------+
#|  163.4 |        1 | 2023-10-08  |
#|    320 |        4 | 2023-10-08  |
#|  76.15 |        3 | 2023-10-08  |
#|  82.43 |        4 | 2023-10-08  |
#| 110.61 |        2 | 2023-10-08  |
#|  83.12 |        1 | 2023-10-08  |
#| 120.25 |        1 | 2023-10-08  |
#|    139 |        1 | 2023-10-08  |
#+--------+----------+-------------+
#2565.16 -> calculo con calculadora
#
