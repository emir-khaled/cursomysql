#Escenario 5: 

#Fecha: 2023-10-10

SELECT MAX(precio) FROM cuenta 
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id 
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu 
WHERE cuenta.fecha='2023-10-01';
#+-------------+
#| MAX(precio) |
#+-------------+
#|         124 |
#+-------------+

SELECT precio,fecha FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu  
WHERE cuenta.fecha='2023-10-01';
#+--------+------------+
#| precio | fecha      |
#+--------+------------+
#|   65.1 | 2023-10-01 |
#|   71.5 | 2023-10-01 |
#| 120.25 | 2023-10-01 |
#|    124 | 2023-10-01 |
#+--------+------------+

