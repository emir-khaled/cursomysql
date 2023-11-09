#Escenario 6: Consulta del promedio de ventas en un rango de fechas

#Fecha inicial: 2023-10-01
#Fecha final: 2023-10-31

SELECT AVG(venta) FROM (
SELECT SUM(precio*cantidad) AS venta,fecha FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu
WHERE cuenta.fecha BETWEEN '2023-10-01' AND '2023-10-31' GROUP BY fecha) AS venta1_average;
#+--------------------+
#| AVG(venta)         |
#+--------------------+
#| 2798.3523118336993 |
#+--------------------+

SELECT SUM(precio*cantidad) AS venta,fecha FROM cuenta
INNER JOIN producto ON cuenta.cuenta_id=producto.cuenta_cuenta_id
INNER JOIN menu ON menu.idmenu = producto.menu_idmenu
WHERE cuenta.fecha BETWEEN '2023-10-01' AND '2023-10-31' GROUP BY fecha;

#+--------------------+------------+
#| venta              | fecha      |
#+--------------------+------------+
#| 1640.9999923706055 | 2023-10-01 |
#| 3505.4199752807617 | 2023-10-02 |
#|  5791.309921264648 | 2023-10-03 |
#|  4619.199951171875 | 2023-10-04 |
#| 1941.1000061035156 | 2023-10-05 |
#|  3795.749988555908 | 2023-10-06 |
#|  3226.479953765869 | 2023-10-07 |
#| 2565.1600036621094 | 2023-10-08 |
#| 2665.4199981689453 | 2023-10-09 |
#|  4767.339958190918 | 2023-10-10 |
#|  4171.399993896484 | 2023-10-11 |
#| 345.79998779296875 | 2023-10-12 |
#|               1280 | 2023-10-13 |
#|  6073.139892578125 | 2023-10-15 |
#| 3141.5899505615234 | 2023-10-16 |
#|  641.2099990844727 | 2023-10-17 |
#| 3044.2600021362305 | 2023-10-18 |
#| 2088.8999824523926 | 2023-10-19 |
#| 3562.2000122070312 | 2023-10-20 |
#|  1839.839973449707 | 2023-10-21 |
#| 2285.3199310302734 | 2023-10-22 |
#| 2492.4999771118164 | 2023-10-23 |
#|  4205.759971618652 | 2023-10-24 |
#|  5490.199939727783 | 2023-10-25 |
#|  671.8600006103516 | 2023-10-26 |
#|              615.5 | 2023-10-27 |
#| 2677.5800018310547 | 2023-10-28 |
#| 1201.4299850463867 | 2023-10-29 |
#| 1664.8300018310547 | 2023-10-30 |
#| 1939.0700035095215 | 2023-10-31 |
#+--------------------+------------+
#
#2798.3523118337 -> calculo con EXCEL del promedio de las ventas de cada día en base a la query anterior

