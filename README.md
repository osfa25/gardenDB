# gardenDB

Consultas sobre una tabla

1.Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

mysql> 
 SELECT o.id AS codigo_oficina, c.nombre AS ciudad
    ->      FROM oficina o
    ->      JOIN direccion_oficina do ON o.id = do.oficina_id
    ->      JOIN ciudad c ON do.ciudad_id = c.id;
+----------------+----------------------+
| codigo_oficina | ciudad               |
+----------------+----------------------+
|              1 | Barcelona            |
|              2 | Boston               |
|              3 | Londres              |
|              4 | Madrid               |
|              5 | Paris                |
|              6 | San Francisco        |
|              7 | Sydney               |
|              8 | Talavera de la Reina |
|              9 | Tokyo                |
+----------------+----------------------+
9 rows in set (0.00 sec)

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

 SELECT
    ->     c.nombre AS ciudad,
    ->     t.numero AS telefono
    -> FROM
    ->     oficina o
    -> JOIN
    ->     direccion_oficina d ON o.id = d.oficina_id
    -> JOIN
    ->     ciudad c ON d.ciudad_id = c.id
    -> JOIN
    ->     pais p ON d.pais_id = p.id
    -> JOIN
    ->     telefono_oficina t ON o.id = t.oficina_id
    -> WHERE
    ->     p.nombre = 'España';
+----------------------+----------------+
| ciudad               | telefono       |
+----------------------+----------------+
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |
+----------------------+----------------+
3 rows in set (0.01 sec)

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.

 SELECT
    ->     e.nombre,
    ->     e.apellido1,
    ->     e.apellido2,
    ->     e.email
    -> FROM
    ->     empleado e
    -> JOIN
    ->     empleado j ON e.jefe_id = j.id
    -> WHERE
    ->     j.id = 7;
+---------+-----------+-----------+--------------------------+
| nombre  | apellido1 | apellido2 | email                    |
+---------+-----------+-----------+--------------------------+
| Mariano | López     | Murcia    | mlopez@jardineria.es     |
| Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
| Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |
+---------+-----------+-----------+--------------------------+
3 rows in set (0.00 sec)

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.

SELECT
    ->     p.puesto AS nombre_puesto,
    ->     e.nombre,
    ->     e.apellido1,
    ->     e.apellido2,
    ->     e.email
    -> FROM
    ->     empleado e
    -> JOIN
    ->     puesto p ON e.puesto_id = p.id
    -> WHERE
    ->     e.jefe_id IS NULL;
+------------------+--------+-----------+-----------+----------------------+
| nombre_puesto    | nombre | apellido1 | apellido2 | email                |
+------------------+--------+-----------+-----------+----------------------+
| Director General | Marcos | Magaña    | Perez     | marcos@jardineria.es |
+------------------+--------+-----------+-----------+----------------------+
1 row in set (0.00 sec)

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.

 SELECT
    ->     e.nombre,
    ->     e.apellido1,
    ->     e.apellido2,
    ->     p.puesto
    -> FROM
    ->     empleado e
    -> JOIN
    ->     puesto p ON e.puesto_id = p.id
    -> WHERE
    ->     p.puesto != 'Representante de ventas';
+-----------------+------------+-----------+-----------------------+
| nombre          | apellido1  | apellido2 | puesto                |
+-----------------+------------+-----------+-----------------------+
| Marcos          | Magaña     | Perez     | Director General      |
| Carlos          | Soria      | Jimenez   | Director General      |
| Emmanuel        | Magaña     | Perez     | Director General      |
| Francois        | Fignon     |           | Director General      |
| Michael         | Bolton     |           | Director General      |
| Hilary          | Washington |           | Director General      |
| Nei             | Nishikori  |           | Director General      |
| Amy             | Johnson    |           | Director General      |
| Kevin           | Fallmer    |           | Director General      |
| Ruben           | López      | Martinez  | Subdirector Marketing |
| Alberto         | Soria      | Carrasco  | Subdirector Ventas    |
| Maria           | Solís      | Jerez     | Secretaria            |
| Felipe          | Rosas      | Marquez   | Representante Ventas  |
| Juan Carlos     | Ortiz      | Serrano   | Representante Ventas  |
| Mariano         | López      | Murcia    | Representante Ventas  |
| Lucio           | Campoamor  | Martín    | Representante Ventas  |
| Hilario         | Rodriguez  | Huertas   | Representante Ventas  |
| José Manuel     | Martinez   | De la Osa | Representante Ventas  |
| David           | Palma      | Aceituno  | Representante Ventas  |
| Oscar           | Palma      | Aceituno  | Representante Ventas  |
| Lionel          | Narvaez    |           | Representante Ventas  |
| Laurent         | Serra      |           | Representante Ventas  |
| Walter Santiago | Sanchez    | Lopez     | Representante Ventas  |
| Marcus          | Paxton     |           | Representante Ventas  |
| Lorena          | Paxton     |           | Representante Ventas  |
| Narumi          | Riko       |           | Representante Ventas  |
| Takuma          | Nomura     |           | Representante Ventas  |
| Larry           | Westfalls  |           | Representante Ventas  |
| John            | Walton     |           | Representante Ventas  |
| Julian          | Bellinelli |           | Representante Ventas  |
| Mariko          | Kishi      |           | Representante Ventas  |
+-----------------+------------+-----------+-----------------------+
31 rows in set (0.00 sec)

6. Devuelve un listado con el nombre de los todos los clientes españoles.

 SELECT
    ->     c.nombre
    -> FROM
    ->     cliente c
    -> JOIN
    ->     direccion_cliente d ON c.id = d.cliente_id
    -> JOIN
    ->     pais p ON d.pais_id = p.id
    -> WHERE
    ->     p.nombre = 'España';
+--------------------------------+
| nombre                         |
+--------------------------------+
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Lasas S.A.                     |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| Americh Golf Management SL     |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Top Campo                      |
| Jardineria Sara                |
| Campohermoso                   |
| Flores S.L.                    |
+--------------------------------+
27 rows in set (0.00 sec)


7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

SELECT
    ->     estado
    -> FROM
    ->     estado_pedido;
+-----------+
| estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
+-----------+
3 rows in set (0.00 sec)

8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
• Utilizando la función YEAR de MySQL.
• Utilizando la función DATE_FORMAT de MySQL.
• Sin utilizar ninguna de las funciones anteriores.

 • Utilizando la función YEAR de MySQL.


SELECT DISTINCT cliente_id
FROM pago
WHERE YEAR(fecha_pago) = 2008;

 SELECT DISTINCT cliente_id
    -> FROM pago
    -> WHERE YEAR(fecha_pago) = 2008;
+------------+
| cliente_id |
+------------+
|          1 |
|         13 |
|         14 |
|         26 |
+------------+
4 rows in set (0.00 sec)

• Utilizando la función DATE_FORMAT de MySQL.

SELECT DISTINCT cliente_id
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

+------------+
| cliente_id |
+------------+
|          1 |
|         13 |
|         14 |
|         26 |
+------------+
4 rows in set (0.00 sec)

• Sin utilizar ninguna de las funciones anteriores.

SELECT DISTINCT cliente_id
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

+------------+
| cliente_id |
+------------+
|          1 |
|         13 |
|         14 |
|         26 |
+------------+
4 rows in set (0.01 sec)

9. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a
tiempo.

SELECT 
    p.id AS codigo_pedido,
    p.cliente_id AS codigo_cliente,
    p.fecha_esperada,
    p.fecha_entrega
FROM 
    pedido p
WHERE 
    p.fecha_entrega > p.fecha_esperada;


+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             9 |              1 | 2008-12-27     | 2008-12-28    |
|            13 |              7 | 2009-01-14     | 2009-01-15    |
|            16 |              7 | 2009-01-07     | 2009-01-15    |
|            17 |              7 | 2009-01-09     | 2009-01-11    |
|            18 |              9 | 2009-01-06     | 2009-01-07    |
|            22 |              1 | 2009-01-11     | 2009-01-13    |
|            28 |              4 | 2009-02-17     | 2009-02-20    |
|            31 |              5 | 2008-09-30     | 2008-10-04    |
|            32 |              3 | 2007-01-19     | 2007-01-27    |
|            38 |              5 | 2009-03-06     | 2009-03-07    |
|            39 |              5 | 2009-03-07     | 2009-03-09    |
|            40 |              5 | 2009-03-10     | 2009-03-13    |
|            42 |             19 | 2009-03-23     | 2009-03-27    |
|            43 |             23 | 2009-03-26     | 2009-03-28    |
|            44 |             23 | 2009-03-27     | 2009-03-30    |
|            45 |             23 | 2009-03-04     | 2009-03-07    |
|            46 |             23 | 2009-03-04     | 2009-03-05    |
|            49 |             26 | 2008-07-22     | 2008-07-30    |
|            55 |             14 | 2009-01-10     | 2009-01-11    |
|            60 |              1 | 2008-12-27     | 2008-12-28    |
|            68 |              3 | 2009-02-17     | 2009-02-20    |
|            92 |             27 | 2009-04-30     | 2009-05-03    |
|            96 |             35 | 2008-04-12     | 2008-04-13    |
|           103 |             30 | 2009-01-20     | 2009-01-24    |
|           106 |             30 | 2009-05-15     | 2009-05-20    |
|           112 |             36 | 2009-04-06     | 2009-05-07    |
|           113 |             36 | 2008-11-09     | 2009-01-09    |
|           114 |             36 | 2009-01-29     | 2009-01-31    |
|           115 |             36 | 2009-01-26     | 2009-02-27    |
|           123 |             30 | 2009-01-20     | 2009-01-24    |
|           126 |             30 | 2009-05-15     | 2009-05-20    |
|           128 |             38 | 2008-12-10     | 2008-12-29    |
+---------------+----------------+----------------+---------------+
32 rows in set (0.00 sec)

10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.
• Utilizando la función ADDDATE de MySQL.

SELECT 
    id AS codigo_pedido,
    cliente_id AS codigo_cliente,
    fecha_esperada,
    fecha_entrega
FROM 
    pedido
WHERE 
    fecha_entrega IS NOT NULL 
    AND fecha_entrega < ADDDATE(fecha_esperada, -2);

+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|            24 |              1 | 2008-07-31     | 2008-07-25    |
|            30 |              5 | 2008-09-03     | 2008-08-31    |
|            36 |              1 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+
6 rows in set (0.01 sec)


• Utilizando la función DATEDIFF de MySQL.

SELECT 
    id AS codigo_pedido,
    cliente_id AS codigo_cliente,
    fecha_esperada,
    fecha_entrega
FROM 
    pedido
WHERE 
    fecha_entrega IS NOT NULL 
    AND DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             2 |              5 | 2007-10-28     | 2007-10-26    |
|            24 |              1 | 2008-07-31     | 2008-07-25    |
|            30 |              5 | 2008-09-03     | 2008-08-31    |
|            36 |              1 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            91 |             27 | 2009-03-29     | 2009-03-27    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+


• ¿Sería posible resolver esta consulta utilizando el operador de suma + o
resta -?

No es posible resolver esta consulta utilizando el operador de suma + o resta -, ya que no podemos realizar operaciones directas sobre fechas de esa manera en MySQL. Las funciones mencionadas (ADDDATE() y DATEDIFF()) son las adecuadas para este tipo de comparaciones de fechas.


11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
mysql> select * from pedido p where p.estado_pedido_id = 2 and year(fecha_pedido) = 2009;
+-----+--------------+----------------+---------------+------------------+------------+--------------------------------------------------------------------------+
| id  | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido_id | cliente_id | comentarios
     |
+-----+--------------+----------------+---------------+------------------+------------+--------------------------------------------------------------------------+
|  14 | 2009-01-02   | 2009-01-02     | NULL          |                2 |          7 | mal pago
     |
|  21 | 2009-01-09   | 2009-01-09     | 2009-01-09    |                2 |          9 | Mal pago
     |
|  25 | 2009-02-02   | 2009-02-08     | NULL          |                2 |          3 | El cliente carece de saldo en la cuenta asociada
     |
|  26 | 2009-02-06   | 2009-02-12     | NULL          |                2 |          4 | El cliente anula la operación para adquirir más producto
     |
|  40 | 2009-03-09   | 2009-03-10     | 2009-03-13    |                2 |          5 | NULL
     |
|  46 | 2009-04-03   | 2009-03-04     | 2009-03-05    |                2 |         23 | NULL
     |
|  65 | 2009-02-02   | 2009-02-08     | NULL          |                2 |          1 | El cliente carece de saldo en la cuenta asociada
     |
|  66 | 2009-02-06   | 2009-02-12     | NULL          |                2 |          3 | El cliente anula la operacion para adquirir mas producto
     |
|  74 | 2009-01-14   | 2009-01-22     | NULL          |                2 |         15 | El pedido no llego el dia que queria el cliente por fallo del transporte |
|  81 | 2009-01-18   | 2009-01-24     | NULL          |                2 |         28 | Los producto estaban en mal estado
     |
| 101 | 2009-03-07   | 2009-03-27     | NULL          |                2 |         16 | El pedido fue rechazado por el cliente
     |
| 105 | 2009-02-14   | 2009-02-20     | NULL          |                2 |         30 | el producto ha sido rechazado por la pesima calidad
     |
| 120 | 2009-03-07   | 2009-03-27     | NULL          |                2 |         16 | El pedido fue rechazado por el cliente
     |
| 125 | 2009-02-14   | 2009-02-20     | NULL          |                2 |         30 | el producto ha sido rechazado por la pesima calidad
     |
+-----+--------------+----------------+---------------+------------------+------------+--------------------------------------------------------------------------+
14 rows in set (0.00 sec)

12) Devuelve un listado de todos los pedidos que han sido entregados en el
mes de enero de cualquier año.

select * from pedido where month(fecha_entrega) = 1;
+-----+--------------+----------------+---------------+------------------+------------+-----------------------------------------------------------+
| id  | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido_id | cliente_id | comentarios                                               |
+-----+--------------+----------------+---------------+------------------+------------+-----------------------------------------------------------+
|   1 | 2006-01-17   | 2006-01-19     | 2006-01-19    |                1 |          5 | Pagado a plazos                                           |
|  13 | 2009-01-12   | 2009-01-14     | 2009-01-15    |                1 |          7 | NULL                                                      |
|  15 | 2009-01-09   | 2009-01-12     | 2009-01-11    |                1 |          7 | NULL                                                      |
|  16 | 2009-01-06   | 2009-01-07     | 2009-01-15    |                1 |          7 | NULL                                                      |
|  17 | 2009-01-08   | 2009-01-09     | 2009-01-11    |                1 |          7 | mal estado                                                |
|  18 | 2009-01-05   | 2009-01-06     | 2009-01-07    |                1 |          9 | NULL                                                      |
|  21 | 2009-01-09   | 2009-01-09     | 2009-01-09    |                2 |          9 | Mal pago                                                  |
|  22 | 2009-01-11   | 2009-01-11     | 2009-01-13    |                1 |          1 | NULL                                                      |
|  32 | 2007-01-07   | 2007-01-19     | 2007-01-27    |                1 |          3 | Entrega tardía, el cliente puso reclamación               |
|  55 | 2008-12-10   | 2009-01-10     | 2009-01-11    |                1 |         14 | Retrasado 1 dia por problemas de transporte               |
|  58 | 2009-01-24   | 2009-01-31     | 2009-01-30    |                1 |          3 | Todo correcto                                             |
|  64 | 2009-01-24   | 2009-01-31     | 2009-01-30    |                1 |          1 | Todo correcto                                             |
|  75 | 2009-01-11   | 2009-01-13     | 2009-01-13    |                1 |         15 | El pedido llego perfectamente                             |
|  79 | 2009-01-12   | 2009-01-13     | 2009-01-13    |                1 |         28 | NULL                                                      |
|  82 | 2009-01-20   | 2009-01-29     | 2009-01-29    |                1 |         28 | El pedido llego un poco mas tarde de la hora fijada       |
|  95 | 2008-01-04   | 2008-01-19     | 2008-01-19    |                1 |         35 | NULL                                                      |
| 100 | 2009-01-10   | 2009-01-15     | 2009-01-15    |                1 |         16 | El pedido llego perfectamente                             |
| 102 | 2008-12-28   | 2009-01-08     | 2009-01-08    |                1 |         16 | Pago pendiente                                            |
| 103 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                      |
| 113 | 2008-10-28   | 2008-11-09     | 2009-01-09    |                2 |         36 | El producto ha sido rechazado por la tardanza de el envio |
| 114 | 2009-01-15   | 2009-01-29     | 2009-01-31    |                1 |         36 | El envio llego dos dias más tarde debido al mal tiempo    |
| 119 | 2009-01-10   | 2009-01-15     | 2009-01-15    |                1 |         16 | El pedido llego perfectamente                             |
| 121 | 2008-12-28   | 2009-01-08     | 2009-01-08    |                1 |         16 | Pago pendiente                                            |
| 123 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                      |
+-----+--------------+----------------+---------------+------------------+------------+-----------------------------------------------------------+
24 rows in set (0.00 sec)

13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

mysql> select * from pago where forma_pago_id = 1 AND YEAR(fecha_pago) = 2008 ORDER BY total DESC;
+----+------------+---------------+--------------+------------+----------+
| id | cliente_id | forma_pago_id | tipo_pago_id | fecha_pago | total    |
+----+------------+---------------+--------------+------------+----------+
| 21 |         26 |             1 |            1 | 2008-03-18 | 18846.00 |
| 15 |         14 |             1 |            1 | 2008-07-15 |  4160.00 |
| 14 |         13 |             1 |            1 | 2008-08-04 |  2246.00 |
|  1 |          1 |             1 |            1 | 2008-11-10 |  2000.00 |
|  2 |          1 |             1 |            1 | 2008-12-10 |  2000.00 |
+----+------------+---------------+--------------+------------+----------+
5 rows in set (0.00 sec)

14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas.

mysql> select forma from forma_pago;
+---------------+
| forma         |
+---------------+
| PayPal        |
| Transferencia |
| Cheque        |
+---------------+
3 rows in set (0.00 sec)

15. Devuelve un listado con todos los productos que pertenecen a la
gama Ornamentales y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.

mysql> SELECT
    ->     p.nombre AS nombre_producto,
    ->     p.cantidad_en_stock AS stock_disponible,
    ->     p.dimensiones,
    ->     p.descripcion,
    ->     gp.nombre AS nombre_gama,
    ->     pe.precio_venta
    -> FROM
    ->     producto p
    -> JOIN
    ->     precio pe ON pe.producto_id = p.id
    -> JOIN
    ->     gama_producto gp ON p.gama_id = gp.id
    -> WHERE
    ->     gp.nombre = 'Ornamentales' AND p.cantidad_en_stock > 100
    -> ORDER BY
    ->     pe.precio_venta DESC;
+-----------------+------------------+-------------+------------------------------+--------------+--------------+
| nombre_producto | stock_disponible | dimensiones | descripcion                  | nombre_gama  | precio_venta |
+-----------------+------------------+-------------+------------------------------+--------------+--------------+
| Producto 185    |              163 | 35x49x37    | Descripción del producto 185 | Ornamentales |       145.37 |
| Producto 14     |              118 | 32x14x23    | Descripción del producto 14  | Ornamentales |       144.07 |
| Producto 90     |              134 | 12x19x7     | Descripción del producto 90  | Ornamentales |       140.76 |
| Producto 200    |              199 | 27x7x5      | Descripción del producto 200 | Ornamentales |       137.56 |
| Producto 225    |              135 | 30x49x5     | Descripción del producto 225 | Ornamentales |       135.19 |
| Producto 28     |              131 | 20x29x33    | Descripción del producto 28  | Ornamentales |       134.29 |
| Producto 173    |              185 | 24x21x32    | Descripción del producto 173 | Ornamentales |       133.10 |
| Producto 45     |              189 | 26x31x28    | Descripción del producto 45  | Ornamentales |       132.64 |
| Producto 162    |              156 | 21x14x6     | Descripción del producto 162 | Ornamentales |       130.09 |
| Producto 263    |              120 | 20x6x18     | Descripción del producto 263 | Ornamentales |       127.76 |
| Producto 47     |              148 | 15x25x32    | Descripción del producto 47  | Ornamentales |       126.42 |
| Producto 65     |              158 | 25x35x48    | Descripción del producto 65  | Ornamentales |       120.95 |
| Producto 184    |              174 | 5x1x39      | Descripción del producto 184 | Ornamentales |       116.41 |
| Producto 43     |              160 | 8x3x39      | Descripción del producto 43  | Ornamentales |       104.35 |
| Producto 123    |              105 | 23x35x5     | Descripción del producto 123 | Ornamentales |       104.17 |
| Producto 261    |              176 | 37x45x16    | Descripción del producto 261 | Ornamentales |       103.39 |
| Producto 10     |              118 | 6x3x47      | Descripción del producto 10  | Ornamentales |        94.09 |
| Producto 50     |              146 | 19x24x11    | Descripción del producto 50  | Ornamentales |        93.94 |
| Producto 270    |              131 | 33x37x38    | Descripción del producto 270 | Ornamentales |        89.53 |
| Producto 216    |              108 | 12x32x23    | Descripción del producto 216 | Ornamentales |        83.37 |
| Producto 135    |              121 | 5x25x10     | Descripción del producto 135 | Ornamentales |        77.29 |
| Producto 192    |              171 | 4x41x43     | Descripción del producto 192 | Ornamentales |        76.40 |
| Producto 113    |              199 | 44x46x48    | Descripción del producto 113 | Ornamentales |        74.48 |
| Producto 8      |              128 | 20x8x30     | Descripción del producto 8   | Ornamentales |        74.16 |
| Producto 177    |              182 | 41x3x41     | Descripción del producto 177 | Ornamentales |        71.49 |
| Producto 197    |              109 | 35x43x10    | Descripción del producto 197 | Ornamentales |        66.79 |
| Producto 268    |              178 | 29x18x49    | Descripción del producto 268 | Ornamentales |        65.25 |
| Producto 235    |              156 | 22x7x22     | Descripción del producto 235 | Ornamentales |        62.39 |
| Producto 13     |              159 | 45x46x45    | Descripción del producto 13  | Ornamentales |        60.55 |
| Producto 239    |              142 | 18x39x40    | Descripción del producto 239 | Ornamentales |        60.39 |
| Producto 81     |              178 | 2x10x45     | Descripción del producto 81  | Ornamentales |        58.47 |
| Producto 31     |              152 | 15x3x19     | Descripción del producto 31  | Ornamentales |        55.06 |
| Producto 258    |              116 | 36x35x15    | Descripción del producto 258 | Ornamentales |        50.85 |
| Producto 143    |              102 | 18x50x43    | Descripción del producto 143 | Ornamentales |        50.21 |
| Producto 211    |              116 | 36x48x34    | Descripción del producto 211 | Ornamentales |        50.09 |
| Producto 118    |              148 | 13x33x27    | Descripción del producto 118 | Ornamentales |        49.22 |
| Producto 46     |              130 | 6x33x45     | Descripción del producto 46  | Ornamentales |        46.43 |
| Producto 166    |              145 | 3x20x38     | Descripción del producto 166 | Ornamentales |        42.09 |
| Producto 112    |              157 | 40x27x13    | Descripción del producto 112 | Ornamentales |        38.01 |
| Producto 205    |              165 | 17x41x2     | Descripción del producto 205 | Ornamentales |        37.10 |
| Producto 155    |              187 | 5x49x29     | Descripción del producto 155 | Ornamentales |        31.90 |
| Producto 140    |              128 | 39x5x9      | Descripción del producto 140 | Ornamentales |        29.86 |
| Producto 209    |              102 | 49x18x45    | Descripción del producto 209 | Ornamentales |        26.86 |
| Producto 254    |              137 | 44x34x36    | Descripción del producto 254 | Ornamentales |        26.79 |
| Producto 49     |              131 | 45x50x16    | Descripción del producto 49  | Ornamentales |        23.45 |
| Producto 265    |              142 | 43x15x45    | Descripción del producto 265 | Ornamentales |        23.02 |
| Producto 249    |              121 | 36x28x32    | Descripción del producto 249 | Ornamentales |        18.11 |
| Producto 179    |              192 | 43x39x13    | Descripción del producto 179 | Ornamentales |        13.32 |
| Producto 147    |              179 | 37x39x32    | Descripción del producto 147 | Ornamentales |        13.24 |
| Producto 126    |              136 | 15x39x49    | Descripción del producto 126 | Ornamentales |        12.82 |
| Producto 136    |              106 | 31x31x13    | Descripción del producto 136 | Ornamentales |        12.10 |
| Producto 38     |              125 | 8x43x41     | Descripción del producto 38  | Ornamentales |         5.99 |
+-----------------+------------------+-------------+------------------------------+--------------+--------------+
52 rows in set (0.01 sec)

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
cuyo representante de ventas tenga el código de empleado 11 o 30.

mysql> SELECT
    ->     c.*,
    ->     e.id as codigo_empleado
    -> FROM
    ->     cliente c
    -> INNER JOIN
    ->     direccion_cliente dc ON dc.cliente_id = c.id
    -> INNER JOIN
    ->     empleado e ON e.id = c.empleado_id
    -> WHERE
    ->     dc.ciudad_id = 4
    ->     AND (e.id = 11 OR e.id = 30);
+----+-----------------------------+-------------+-------------+----------------+-----------------+
| id | nombre                      | contacto_id | empleado_id | limite_credito | codigo_empleado |
+----+-----------------------------+-------------+-------------+----------------+-----------------+
|  7 | Beragua                     |           6 |          11 |       20000.00 |              11 |
|  8 | Club Golf Puerta del hierro |           7 |          11 |       40000.00 |              11 |
|  9 | Naturagua                   |           8 |          11 |       32000.00 |              11 |
| 10 | DaraDistribuciones          |           9 |          11 |       50000.00 |              11 |
| 11 | Madrileña de riegos         |          10 |          11 |       20000.00 |              11 |
| 15 | Jardin de Flores            |          13 |          30 |       40000.00 |              30 |
| 18 | Naturajardin                |          16 |          30 |        5050.00 |              30 |
| 24 | Vivero Humanes              |          22 |          30 |        7430.00 |              30 |
| 28 | Agrojardin                  |          26 |          30 |        8040.00 |              30 |
| 31 | Campohermoso                |          29 |          30 |        3250.00 |              30 |
+----+-----------------------------+-------------+-------------+----------------+-----------------+
10 rows in set (0.00 sec)

Consultas multitabla (Composición interna)
Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
representante de ventas.


SELECT
	c.nombre AS nombre_cliente,
	e.nombre AS nombre_empleado,
	e.apellido1 AS apellido1_empleado,
	e.apellido2 AS apellido2_empleado
FROM
	cliente c
INNER JOIN
	empleado e ON c.empleado_id = e.id WHERE e.puesto_id = 5;
+--------------------------------+-----------------+--------------------+--------------------+
| nombre_cliente                 | nombre_empleado | apellido1_empleado | apellido2_empleado |
+--------------------------------+-----------------+--------------------+--------------------+
| Flores Marivi                  | Felipe          | Rosas              | Marquez            |
| Flowers, S.A                   | Felipe          | Rosas              | Marquez            |
| Fuenla City                    | Felipe          | Rosas              | Marquez            |
| Top Campo                      | Felipe          | Rosas              | Marquez            |
| Jardineria Sara                | Felipe          | Rosas              | Marquez            |
| Lasas S.A.                     | Mariano         | López              | Murcia             |
| Lasas S.A.                     | Mariano         | López              | Murcia             |
| Camunas Jardines S.L.          | Mariano         | López              | Murcia             |
| Dardena S.A.                   | Mariano         | López              | Murcia             |
| Jardines y Mansiones Cactus SL | Lucio           | Campoamor          | Martín             |
| Jardinerías Matías SL          | Lucio           | Campoamor          | Martín             |
| Golf S.A.                      | José Manuel     | Martinez           | De la Osa          |
| Americh Golf Management SL     | José Manuel     | Martinez           | De la Osa          |
| Aloha                          | José Manuel     | Martinez           | De la Osa          |
| El Prat                        | José Manuel     | Martinez           | De la Osa          |
| Sotogrande                     | José Manuel     | Martinez           | De la Osa          |
| france telecom                 | Lionel          | Narvaez            |                    |
| Musée du Louvre                | Lionel          | Narvaez            |                    |
| GoldFish Garden                | Walter Santiago | Sanchez            | Lopez              |
| Gardening Competitor           | Walter Santiago | Sanchez            | Lopez              |
| Gardening Associates           | Walter Santiago | Sanchez            | Lopez              |
| Gerudo Valley                  | Lorena          | Paxton             |                    |
| Tendo Garden                   | Lorena          | Paxton             |                    |
| Jardin de Flores               | Julian          | Bellinelli         |                    |
| Naturajardin                   | Julian          | Bellinelli         |                    |
| Vivero Humanes                 | Julian          | Bellinelli         |                    |
| Agrojardin                     | Julian          | Bellinelli         |                    |
| Campohermoso                   | Julian          | Bellinelli         |                    |
| Tutifruti S.A                  | Mariko          | Kishi              |                    |
| El Jardin Viviente S.L         | Mariko          | Kishi              |                    |
+--------------------------------+-----------------+--------------------+--------------------+

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
nombre de sus representantes de ventas.

SELECT cliente.nombre, empleado.nombre AS nombreEmpleado, empleado.apellido1 AS primerApellidoEmpleado, empleado.apellido2 AS segundoApellidoEmpleado 
FROM cliente 
INNER JOIN empleado ON cliente.empleado_id = empleado.id
INNER JOIN pago ON cliente.id = pago.cliente_id;
+--------------------------------+-----------------+------------------------+-------------------------+
| nombre                         | nombreEmpleado  | primerApellidoEmpleado | segundoApellidoEmpleado |
+--------------------------------+-----------------+------------------------+-------------------------+
| GoldFish Garden                | Walter Santiago | Sanchez                | Lopez                   |
| GoldFish Garden                | Walter Santiago | Sanchez                | Lopez                   |
| Gardening Associates           | Walter Santiago | Sanchez                | Lopez                   |
| Gardening Associates           | Walter Santiago | Sanchez                | Lopez                   |
| Gardening Associates           | Walter Santiago | Sanchez                | Lopez                   |
| Gerudo Valley                  | Lorena          | Paxton                 |                         |
| Gerudo Valley                  | Lorena          | Paxton                 |                         |
| Gerudo Valley                  | Lorena          | Paxton                 |                         |
| Gerudo Valley                  | Lorena          | Paxton                 |                         |
| Gerudo Valley                  | Lorena          | Paxton                 |                         |
| Tendo Garden                   | Lorena          | Paxton                 |                         |
| Beragua                        | Emmanuel        | Magaña                 | Perez                   |
| Naturagua                      | Emmanuel        | Magaña                 | Perez                   |
| Camunas Jardines S.L.          | Mariano         | López                  | Murcia                  |
| Dardena S.A.                   | Mariano         | López                  | Murcia                  |
| Jardin de Flores               | Julian          | Bellinelli             |                         |
| Jardin de Flores               | Julian          | Bellinelli             |                         |
| Flores Marivi                  | Felipe          | Rosas                  | Marquez                 |
| Golf S.A.                      | José Manuel     | Martinez               | De la Osa               |
| Sotogrande                     | José Manuel     | Martinez               | De la Osa               |
| Jardines y Mansiones Cactus SL | Lucio           | Campoamor              | Martín                  |
| Jardinerías Matías SL          | Lucio           | Campoamor              | Martín                  |
| Agrojardin                     | Julian          | Bellinelli             |                         |
| Jardineria Sara                | Felipe          | Rosas                  | Marquez                 |
| Tutifruti S.A                  | Mariko          | Kishi                  |                         |
| El Jardin Viviente S.L         | Mariko          | Kishi                  |                         |
+--------------------------------+-----------------+------------------------+-------------------------+

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
el nombre de sus representantes de ventas.



4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el
representante.


SELECT cl.nombre as nombre_cliente  , em.nombre as nombre_empleado, em.apellido1 as apellido1_empleado ,
em.apellido2 as apellido2_empleado, ci.nombre as ciudad_oficina, p.id as pago_id
  FROM pago p
INNER JOIN 
        cliente cl ON p.cliente_id = cl.id
INNER JOIN 
        empleado em ON cl.empleado_id  = em.id
INNER JOIN 
        oficina  o ON em.oficina_id = o.id
INNER JOIN
       direccion_oficina do ON do.oficina_id = o.id
INNER JOIN
       ciudad ci ON ci.id = do.ciudad_id ;
+--------------------------------+-----------------+--------------------+--------------------+----------------------+---------+
| nombre_cliente                 | nombre_empleado | apellido1_empleado | apellido2_empleado | ciudad_oficina       | pago_id |
+--------------------------------+-----------------+--------------------+--------------------+----------------------+---------+
| Beragua                        | Emmanuel        | Magaña             | Perez              | Barcelona            |      12 |
| Naturagua                      | Emmanuel        | Magaña             | Perez              | Barcelona            |      13 |
| Golf S.A.                      | José Manuel     | Martinez           | De la Osa          | Barcelona            |      19 |
| Sotogrande                     | José Manuel     | Martinez           | De la Osa          | Barcelona            |      20 |
| Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       6 |
| Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       7 |
| Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       8 |
| Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       9 |
| Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |      10 |
| Tendo Garden                   | Lorena          | Paxton             |                    | Boston               |      11 |
| Camunas Jardines S.L.          | Mariano         | López              | Murcia             | Madrid               |      14 |
| Dardena S.A.                   | Mariano         | López              | Murcia             | Madrid               |      15 |
| Jardines y Mansiones Cactus SL | Lucio           | Campoamor          | Martín             | Madrid               |      21 |
| Jardinerías Matías SL          | Lucio           | Campoamor          | Martín             | Madrid               |      22 |
| GoldFish Garden                | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       1 |
| GoldFish Garden                | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       2 |
| Gardening Associates           | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       3 |
| Gardening Associates           | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       4 |
| Gardening Associates           | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       5 |
| Jardin de Flores               | Julian          | Bellinelli         |                    | Sydney               |      16 |
| Jardin de Flores               | Julian          | Bellinelli         |                    | Sydney               |      17 |
| Agrojardin                     | Julian          | Bellinelli         |                    | Sydney               |      23 |
| Tutifruti S.A                  | Mariko          | Kishi              |                    | Sydney               |      25 |
| El Jardin Viviente S.L         | Mariko          | Kishi              |                    | Sydney               |      26 |
| Flores Marivi                  | Felipe          | Rosas              | Marquez            | Talavera de la Reina |      18 |
| Jardineria Sara                | Felipe          | Rosas              | Marquez            | Talavera de la Reina |      24 |
+--------------------------------+-----------------+--------------------+--------------------+----------------------+---------+
26 rows in set (0,00 sec)


5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
de sus representantes junto con la ciudad de la oficina a la que pertenece el
representante.

SELECT cl.nombre as nombre_cliente  , em.nombre as nombre_empleado, em.apellido1 as apellido1_empleado ,
em.apellido2 as apellido2_empleado, ci.nombre as ciudad_oficina, p.id as pago_id
  FROM pago p
RIGHT JOIN 
        cliente cl ON p.cliente_id = cl.id 
INNER JOIN 
        empleado em ON cl.empleado_id  = em.id
INNER JOIN 
        oficina o ON em.oficina_id = o.id
INNER JOIN
       direccion_oficina dof ON dof.oficina_id = o.id
INNER JOIN
       ciudad ci ON ci.id = dof.ciudad_id 
WHERE p.id IS NULL;
+-----------------------------+-----------------+--------------------+--------------------+----------------------+---------+
| nombre_cliente              | nombre_empleado | apellido1_empleado | apellido2_empleado | ciudad_oficina       | pago_id |
+-----------------------------+-----------------+--------------------+--------------------+----------------------+---------+
| Club Golf Puerta del hierro | Emmanuel        | Magaña             | Perez              | Barcelona            |    NULL |
| DaraDistribuciones          | Emmanuel        | Magaña             | Perez              | Barcelona            |    NULL |
| Madrileña de riegos         | Emmanuel        | Magaña             | Perez              | Barcelona            |    NULL |
| Americh Golf Management SL  | José Manuel     | Martinez           | De la Osa          | Barcelona            |    NULL |
| Aloha                       | José Manuel     | Martinez           | De la Osa          | Barcelona            |    NULL |
| El Prat                     | José Manuel     | Martinez           | De la Osa          | Barcelona            |    NULL |
| Lasas S.A.                  | Mariano         | López              | Murcia             | Madrid               |    NULL |
| Lasas S.A.                  | Mariano         | López              | Murcia             | Madrid               |    NULL |
| france telecom              | Lionel          | Narvaez            |                    | Paris                |    NULL |
| Musée du Louvre             | Lionel          | Narvaez            |                    | Paris                |    NULL |
| Flores S.L.                 | Michael         | Bolton             |                    | San Francisco        |    NULL |
| The Magic Garden            | Michael         | Bolton             |                    | San Francisco        |    NULL |
| Gardening Competitor        | Walter Santiago | Sanchez            | Lopez              | San Francisco        |    NULL |
| Naturajardin                | Julian          | Bellinelli         |                    | Sydney               |    NULL |
| Vivero Humanes              | Julian          | Bellinelli         |                    | Sydney               |    NULL |
| Campohermoso                | Julian          | Bellinelli         |                    | Sydney               |    NULL |
| Flowers, S.A                | Felipe          | Rosas              | Marquez            | Talavera de la Reina |    NULL |
| Fuenla City                 | Felipe          | Rosas              | Marquez            | Talavera de la Reina |    NULL |
| Top Campo                   | Felipe          | Rosas              | Marquez            | Talavera de la Reina |    NULL |
+-----------------------------+-----------------+--------------------+--------------------+----------------------+---------+
19 rows in set (0,00 sec)


6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT cl.nombre as nombre_cliente  , em.nombre as nombre_empleado, em.apellido1 as apellido1_empleado ,
em.apellido2 as apellido2_empleado, ci.nombre as ciudad_oficina, p.id as pago_id
  FROM pago p
INNER JOIN 
        cliente cl ON p.cliente_id = cl.id 
INNER JOIN 
        empleado em ON cl.empleado_id  = em.id
INNER JOIN 
        oficina o ON em.oficina_id = o.id
INNER JOIN
       direccion_oficina dof ON dof.oficina_id = o.id
INNER JOIN
       ciudad ci ON ci.id = dof.ciudad_id 
WHERE ci.nombre = "Fuenlabrada" AND p.id IS NULL;
Empty set (0,00 sec)

-- No retorna ningun dato porque la ciudad Fuenlabrada no esta en la base de datos


7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
con la ciudad de la oficina a la que pertenece el representante.

SELECT
	cl.nombre AS nombre_cliente,
	em.nombre AS nombre_empleado,
	ci.nombre AS ciudad_oficina
FROM
	cliente cl
INNER JOIN
	empleado em ON cl.empleado_id = em.id
INNER JOIN
	oficina o ON em.oficina_id = o.id
INNER JOIN
	direccion_oficina dof ON dof.oficina_id = o.id
INNER JOIN
	ciudad ci ON dof.ciudad_id = ci.id;

+--------------------------------+-----------------+----------------------+
| nombre_cliente                 | nombre_empleado | ciudad_oficina       |
+--------------------------------+-----------------+----------------------+
| Beragua                        | Emmanuel        | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel        | Barcelona            |
| Naturagua                      | Emmanuel        | Barcelona            |
| DaraDistribuciones             | Emmanuel        | Barcelona            |
| Madrileña de riegos            | Emmanuel        | Barcelona            |
| Golf S.A.                      | José Manuel     | Barcelona            |
| Americh Golf Management SL     | José Manuel     | Barcelona            |
| Aloha                          | José Manuel     | Barcelona            |
| El Prat                        | José Manuel     | Barcelona            |
| Sotogrande                     | José Manuel     | Barcelona            |
| Gerudo Valley                  | Lorena          | Boston               |
| Tendo Garden                   | Lorena          | Boston               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Camunas Jardines S.L.          | Mariano         | Madrid               |
| Dardena S.A.                   | Mariano         | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio           | Madrid               |
| Jardinerías Matías SL          | Lucio           | Madrid               |
| france telecom                 | Lionel          | Paris                |
| Musée du Louvre                | Lionel          | Paris                |
| Flores S.L.                    | Michael         | San Francisco        |
| The Magic Garden               | Michael         | San Francisco        |
| GoldFish Garden                | Walter Santiago | San Francisco        |
| Gardening Competitor           | Walter Santiago | San Francisco        |
| Gardening Associates           | Walter Santiago | San Francisco        |
| Jardin de Flores               | Julian          | Sydney               |
| Naturajardin                   | Julian          | Sydney               |
| Vivero Humanes                 | Julian          | Sydney               |
| Agrojardin                     | Julian          | Sydney               |
| Campohermoso                   | Julian          | Sydney               |
| Tutifruti S.A                  | Mariko          | Sydney               |
| El Jardin Viviente S.L         | Mariko          | Sydney               |
| Flores Marivi                  | Felipe          | Talavera de la Reina |
| Flowers, S.A                   | Felipe          | Talavera de la Reina |
| Fuenla City                    | Felipe          | Talavera de la Reina |
| Top Campo                      | Felipe          | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Talavera de la Reina |
+--------------------------------+-----------------+----------------------+
37 rows in set (0,00 sec)

8. Devuelve un listado con el nombre de los empleados junto con el nombre
de sus jefes.

SELECT
	em.nombre AS nombre_empleado,
	jf.nombre AS nombre_jefe
FROM
	empleado em
INNER JOIN
	empleado jf ON em.jefe_id = jf.id;
+-----------------+-------------+
| nombre_empleado | nombre_jefe |
+-----------------+-------------+
| Ruben           | Marcos      |
| Alberto         | Ruben       |
| Maria           | Ruben       |
| Felipe          | Alberto     |
| Juan Carlos     | Alberto     |
| Carlos          | Alberto     |
| Mariano         | Carlos      |
| Lucio           | Carlos      |
| Hilario         | Carlos      |
| Emmanuel        | Alberto     |
| José Manuel     | Emmanuel    |
| David           | Emmanuel    |
| Oscar           | Emmanuel    |
| Francois        | Alberto     |
| Lionel          | Francois    |
| Laurent         | Francois    |
| Michael         | Alberto     |
| Walter Santiago | Michael     |
| Hilary          | Alberto     |
| Marcus          | Hilary      |
| Lorena          | Hilary      |
| Nei             | Alberto     |
| Narumi          | Nei         |
| Takuma          | Nei         |
| Amy             | Alberto     |
| Larry           | Amy         |
| John            | Amy         |
| Kevin           | Alberto     |
| Julian          | Kevin       |
| Mariko          | Kevin       |
+-----------------+-------------+
30 rows in set (0.00 sec)


9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
de su jefe y el nombre del jefe de sus jefe.

SELECT
	em.nombre AS nombre_empleado,
	jf.nombre AS nombre_jefe,
	jfdeljf.nombre AS nombre_del_jefe_de_su_jefe
FROM
	empleado em
LEFT JOIN
	empleado jf ON em.jefe_id = jf.id
LEFT JOIN
	empleado jfdeljf ON  jf.jefe_id = jfdeljf.id;
+-----------------+-------------+----------------------------+
| nombre_empleado | nombre_jefe | nombre_del_jefe_de_su_jefe |
+-----------------+-------------+----------------------------+
| Marcos          | NULL        | NULL                       |
| Ruben           | Marcos      | NULL                       |
| Alberto         | Ruben       | Marcos                     |
| Maria           | Ruben       | Marcos                     |
| Felipe          | Alberto     | Ruben                      |
| Juan Carlos     | Alberto     | Ruben                      |
| Carlos          | Alberto     | Ruben                      |
| Mariano         | Carlos      | Alberto                    |
| Lucio           | Carlos      | Alberto                    |
| Hilario         | Carlos      | Alberto                    |
| Emmanuel        | Alberto     | Ruben                      |
| José Manuel     | Emmanuel    | Alberto                    |
| David           | Emmanuel    | Alberto                    |
| Oscar           | Emmanuel    | Alberto                    |
| Francois        | Alberto     | Ruben                      |
| Lionel          | Francois    | Alberto                    |
| Laurent         | Francois    | Alberto                    |
| Michael         | Alberto     | Ruben                      |
| Walter Santiago | Michael     | Alberto                    |
| Hilary          | Alberto     | Ruben                      |
| Marcus          | Hilary      | Alberto                    |
| Lorena          | Hilary      | Alberto                    |
| Nei             | Alberto     | Ruben                      |
| Narumi          | Nei         | Alberto                    |
| Takuma          | Nei         | Alberto                    |
| Amy             | Alberto     | Ruben                      |
| Larry           | Amy         | Alberto                    |
| John            | Amy         | Alberto                    |
| Kevin           | Alberto     | Ruben                      |
| Julian          | Kevin       | Alberto                    |
| Mariko          | Kevin       | Alberto                    |
+-----------------+-------------+----------------------------+
31 rows in set (0.00 sec)


10. Devuelve el nombre de los clientes a los que no se les ha entregado a
tiempo un pedido.


SELECT
	*
FROM
	pedido p
WHERE
	p.fecha_esperada < p.fecha_entrega;
+-----+--------------+----------------+---------------+------------------+------------+-------------------------------------------------------------------------------------------+
| id  | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido_id | cliente_id | comentarios                                                                               |
+-----+--------------+----------------+---------------+------------------+------------+-------------------------------------------------------------------------------------------+
|   9 | 2008-12-22   | 2008-12-27     | 2008-12-28    |                1 |          1 | El cliente comprueba la integridad del paquete, todo correcto                             |
|  13 | 2009-01-12   | 2009-01-14     | 2009-01-15    |                1 |          7 | NULL                                                                                      |
|  16 | 2009-01-06   | 2009-01-07     | 2009-01-15    |                1 |          7 | NULL                                                                                      |
|  17 | 2009-01-08   | 2009-01-09     | 2009-01-11    |                1 |          7 | mal estado                                                                                |
|  18 | 2009-01-05   | 2009-01-06     | 2009-01-07    |                1 |          9 | NULL                                                                                      |
|  22 | 2009-01-11   | 2009-01-11     | 2009-01-13    |                1 |          1 | NULL                                                                                      |
|  28 | 2009-02-10   | 2009-02-17     | 2009-02-20    |                1 |          4 | El cliente se queja bastante de la espera asociada al producto                            |
|  31 | 2008-09-04   | 2008-09-30     | 2008-10-04    |                2 |          5 | El cliente ha rechazado por llegar 5 días tarde                                           |
|  32 | 2007-01-07   | 2007-01-19     | 2007-01-27    |                1 |          3 | Entrega tardía, el cliente puso reclamación                                               |
|  38 | 2009-03-05   | 2009-03-06     | 2009-03-07    |                1 |          5 | NULL                                                                                      |
|  39 | 2009-03-06   | 2009-03-07     | 2009-03-09    |                3 |          5 | NULL                                                                                      |
|  40 | 2009-03-09   | 2009-03-10     | 2009-03-13    |                2 |          5 | NULL                                                                                      |
|  42 | 2009-03-22   | 2009-03-23     | 2009-03-27    |                1 |         19 | NULL                                                                                      |
|  43 | 2009-03-25   | 2009-03-26     | 2009-03-28    |                3 |         23 | NULL                                                                                      |
|  44 | 2009-03-26   | 2009-03-27     | 2009-03-30    |                3 |         23 | NULL                                                                                      |
|  45 | 2009-04-01   | 2009-03-04     | 2009-03-07    |                1 |         23 | NULL                                                                                      |
|  46 | 2009-04-03   | 2009-03-04     | 2009-03-05    |                2 |         23 | NULL                                                                                      |
|  49 | 2008-07-12   | 2008-07-22     | 2008-07-30    |                1 |         26 | El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora        |
|  55 | 2008-12-10   | 2009-01-10     | 2009-01-11    |                1 |         14 | Retrasado 1 dia por problemas de transporte                                               |
|  60 | 2008-12-22   | 2008-12-27     | 2008-12-28    |                1 |          1 | El cliente comprueba la integridad del paquete, todo correcto                             |
|  68 | 2009-02-10   | 2009-02-17     | 2009-02-20    |                1 |          3 | El cliente se queja bastante de la espera asociada al producto                            |
|  92 | 2009-04-19   | 2009-04-30     | 2009-05-03    |                1 |         27 | El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas |
|  96 | 2008-03-20   | 2008-04-12     | 2008-04-13    |                1 |         35 | La entrega se retraso un dia                                                              |
| 103 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                                                      |
| 106 | 2009-05-13   | 2009-05-15     | 2009-05-20    |                3 |         30 | NULL                                                                                      |
| 112 | 2009-03-05   | 2009-04-06     | 2009-05-07    |                3 |         36 | NULL                                                                                      |
| 113 | 2008-10-28   | 2008-11-09     | 2009-01-09    |                2 |         36 | El producto ha sido rechazado por la tardanza de el envio                                 |
| 114 | 2009-01-15   | 2009-01-29     | 2009-01-31    |                1 |         36 | El envio llego dos dias más tarde debido al mal tiempo                                    |
| 115 | 2008-11-29   | 2009-01-26     | 2009-02-27    |                3 |         36 | NULL                                                                                      |
| 123 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                                                      |
| 126 | 2009-05-13   | 2009-05-15     | 2009-05-20    |                3 |         30 | NULL                                                                                      |
| 128 | 2008-11-10   | 2008-12-10     | 2008-12-29    |                2 |         38 | El pedido ha sido rechazado por el cliente por el retraso en la entrega                   |
+-----+--------------+----------------+---------------+------------------+------------+-------------------------------------------------------------------------------------------+
32 rows in set (0.01 sec)


11. Devuelve un listado de las diferentes gamas de producto que ha comprado
cada cliente.

SELECT 
	c.id AS id_cliente,
    c.nombre AS nombre_cliente,
    gp.id
FROM 
    cliente AS c
INNER JOIN 
    pedido AS p ON c.id = p.cliente_id
INNER JOIN 
    detalle_pedido AS dp ON p.id = dp.pedido_id
INNER JOIN 
    producto AS pr ON dp.producto_id = pr.id
INNER JOIN 
    gama_producto AS gp ON pr.gama_id = gp.id
GROUP BY 
     c.id,c.nombre, gp.id;
+------------+--------------------------------+----+
| id_cliente | nombre_cliente                 | id |
+------------+--------------------------------+----+
|          1 | GoldFish Garden                |  1 |
|          7 | Beragua                        |  1 |
|          4 | Gerudo Valley                  |  1 |
|          5 | Tendo Garden                   |  1 |
|         19 | Golf S.A.                      |  1 |
|         23 | Sotogrande                     |  1 |
|         26 | Jardines y Mansiones Cactus SL |  1 |
|          3 | Gardening Associates           |  1 |
|         15 | Jardin de Flores               |  1 |
|         28 | Agrojardin                     |  1 |
|         35 | Tutifruti S.A                  |  1 |
|         27 | Jardinerías Matías SL          |  1 |
|         38 | El Jardin Viviente S.L         |  1 |
|         36 | Flores S.L.                    |  1 |
|         16 | Flores Marivi                  |  1 |
|         30 | Jardineria Sara                |  1 |
|          1 | GoldFish Garden                |  2 |
|          7 | Beragua                        |  2 |
|          4 | Gerudo Valley                  |  2 |
|          3 | Gardening Associates           |  2 |
|         19 | Golf S.A.                      |  2 |
|         26 | Jardines y Mansiones Cactus SL |  2 |
|         14 | Dardena S.A.                   |  2 |
|         28 | Agrojardin                     |  2 |
|         35 | Tutifruti S.A                  |  2 |
|         30 | Jardineria Sara                |  2 |
|         16 | Flores Marivi                  |  2 |
|         38 | El Jardin Viviente S.L         |  2 |
|         36 | Flores S.L.                    |  2 |
|          5 | Tendo Garden                   |  2 |
|          1 | GoldFish Garden                |  3 |
|          7 | Beragua                        |  3 |
|          4 | Gerudo Valley                  |  3 |
|          5 | Tendo Garden                   |  3 |
|          3 | Gardening Associates           |  3 |
|         19 | Golf S.A.                      |  3 |
|         26 | Jardines y Mansiones Cactus SL |  3 |
|         14 | Dardena S.A.                   |  3 |
|         15 | Jardin de Flores               |  3 |
|         28 | Agrojardin                     |  3 |
|         35 | Tutifruti S.A                  |  3 |
|         27 | Jardinerías Matías SL          |  3 |
|         16 | Flores Marivi                  |  3 |
|         36 | Flores S.L.                    |  3 |
|         30 | Jardineria Sara                |  3 |
|          1 | GoldFish Garden                |  4 |
|          7 | Beragua                        |  4 |
|          9 | Naturagua                      |  4 |
|          4 | Gerudo Valley                  |  4 |
|          3 | Gardening Associates           |  4 |
|         19 | Golf S.A.                      |  4 |
|         23 | Sotogrande                     |  4 |
|         26 | Jardines y Mansiones Cactus SL |  4 |
|         13 | Camunas Jardines S.L.          |  4 |
|         15 | Jardin de Flores               |  4 |
|         27 | Jardinerías Matías SL          |  4 |
|         35 | Tutifruti S.A                  |  4 |
|         16 | Flores Marivi                  |  4 |
|         30 | Jardineria Sara                |  4 |
|         36 | Flores S.L.                    |  4 |
|         38 | El Jardin Viviente S.L         |  4 |
|          1 | GoldFish Garden                |  5 |
|          9 | Naturagua                      |  5 |
|          4 | Gerudo Valley                  |  5 |
|          5 | Tendo Garden                   |  5 |
|          3 | Gardening Associates           |  5 |
|         19 | Golf S.A.                      |  5 |
|         23 | Sotogrande                     |  5 |
|         26 | Jardines y Mansiones Cactus SL |  5 |
|         13 | Camunas Jardines S.L.          |  5 |
|         14 | Dardena S.A.                   |  5 |
|         15 | Jardin de Flores               |  5 |
|         28 | Agrojardin                     |  5 |
|         27 | Jardinerías Matías SL          |  5 |
|         35 | Tutifruti S.A                  |  5 |
|         16 | Flores Marivi                  |  5 |
|         30 | Jardineria Sara                |  5 |
|         38 | El Jardin Viviente S.L         |  5 |
+------------+--------------------------------+----+
78 rows in set (0.01 sec)

Consultas multitabla (Composición externa):

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.

1. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

SELECT
	c.id AS cliente_id,
	c.nombre,
	p.id AS pago_id
FROM
	cliente c
LEFT JOIN
	pago p ON p.cliente_id = c.id
WHERE
	p.id IS NULL; 
+------------+-----------------------------+---------+
| cliente_id | nombre                      | pago_id |
+------------+-----------------------------+---------+
|          2 | Gardening Competitor        |    NULL |
|          6 | Lasas S.A.                  |    NULL |
|          8 | Club Golf Puerta del hierro |    NULL |
|         10 | DaraDistribuciones          |    NULL |
|         11 | Madrileña de riegos         |    NULL |
|         12 | Lasas S.A.                  |    NULL |
|         17 | Flowers, S.A                |    NULL |
|         18 | Naturajardin                |    NULL |
|         20 | Americh Golf Management SL  |    NULL |
|         21 | Aloha                       |    NULL |
|         22 | El Prat                     |    NULL |
|         24 | Vivero Humanes              |    NULL |
|         25 | Fuenla City                 |    NULL |
|         29 | Top Campo                   |    NULL |
|         31 | Campohermoso                |    NULL |
|         32 | france telecom              |    NULL |
|         33 | Musée du Louvre             |    NULL |
|         36 | Flores S.L.                 |    NULL |
|         37 | The Magic Garden            |    NULL |
+------------+-----------------------------+---------+
19 rows in set (0.01 sec)

2. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pedido.

SELECT
	c.id AS  cliente_id,
	c.nombre AS nombre_cliente,
	p.id AS pedido_id
FROM
	cliente c
LEFT JOIN
	pedido p ON p.cliente_id = c.id
WHERE
	p.id IS NULL;
+------------+-----------------------------+-----------+
| cliente_id | nombre_cliente              | pedido_id |
+------------+-----------------------------+-----------+
|          8 | Club Golf Puerta del hierro |      NULL |
|         10 | DaraDistribuciones          |      NULL |
|         11 | Madrileña de riegos         |      NULL |
|         12 | Lasas S.A.                  |      NULL |
|         17 | Flowers, S.A                |      NULL |
|         18 | Naturajardin                |      NULL |
|         20 | Americh Golf Management SL  |      NULL |
|         21 | Aloha                       |      NULL |
|         22 | El Prat                     |      NULL |
|         24 | Vivero Humanes              |      NULL |
|         25 | Fuenla City                 |      NULL |
|         29 | Top Campo                   |      NULL |
|         31 | Campohermoso                |      NULL |
|         32 | france telecom              |      NULL |
|         33 | Musée du Louvre             |      NULL |
|         37 | The Magic Garden            |      NULL |
+------------+-----------------------------+-----------+
16 rows in set (0.00 sec)

3. Devuelve un listado que muestre los clientes que no han realizado ningún
pago y los que no han realizado ningún pedido.

SELECT
    c.id AS cliente_id,
    c.nombre AS nombre_cliente,
    p.id AS referencia_id,
    'sin_pedido' AS tipo_referencia
FROM
    cliente c
LEFT JOIN
    pedido p ON p.cliente_id = c.id
WHERE
    p.id IS NULL
UNION
SELECT
    c.id AS cliente_id,
    c.nombre AS nombre_cliente,
    p.id AS referencia_id,
    'sin_pago' AS tipo_referencia
FROM
    cliente c
LEFT JOIN
    pago p ON p.cliente_id = c.id
WHERE
    p.id IS NULL;
+------------+-----------------------------+---------------+-----------------+
| cliente_id | nombre_cliente              | referencia_id | tipo_referencia |
+------------+-----------------------------+---------------+-----------------+
|          8 | Club Golf Puerta del hierro |          NULL | sin_pedido      |
|         10 | DaraDistribuciones          |          NULL | sin_pedido      |
|         11 | Madrileña de riegos         |          NULL | sin_pedido      |
|         12 | Lasas S.A.                  |          NULL | sin_pedido      |
|         17 | Flowers, S.A                |          NULL | sin_pedido      |
|         18 | Naturajardin                |          NULL | sin_pedido      |
|         20 | Americh Golf Management SL  |          NULL | sin_pedido      |
|         21 | Aloha                       |          NULL | sin_pedido      |
|         22 | El Prat                     |          NULL | sin_pedido      |
|         24 | Vivero Humanes              |          NULL | sin_pedido      |
|         25 | Fuenla City                 |          NULL | sin_pedido      |
|         29 | Top Campo                   |          NULL | sin_pedido      |
|         31 | Campohermoso                |          NULL | sin_pedido      |
|         32 | france telecom              |          NULL | sin_pedido      |
|         33 | Musée du Louvre             |          NULL | sin_pedido      |
|         37 | The Magic Garden            |          NULL | sin_pedido      |
|          2 | Gardening Competitor        |          NULL | sin_pago        |
|          6 | Lasas S.A.                  |          NULL | sin_pago        |
|          8 | Club Golf Puerta del hierro |          NULL | sin_pago        |
|         10 | DaraDistribuciones          |          NULL | sin_pago        |
|         11 | Madrileña de riegos         |          NULL | sin_pago        |
|         12 | Lasas S.A.                  |          NULL | sin_pago        |
|         17 | Flowers, S.A                |          NULL | sin_pago        |
|         18 | Naturajardin                |          NULL | sin_pago        |
|         20 | Americh Golf Management SL  |          NULL | sin_pago        |
|         21 | Aloha                       |          NULL | sin_pago        |
|         22 | El Prat                     |          NULL | sin_pago        |
|         24 | Vivero Humanes              |          NULL | sin_pago        |
|         25 | Fuenla City                 |          NULL | sin_pago        |
|         29 | Top Campo                   |          NULL | sin_pago        |
|         31 | Campohermoso                |          NULL | sin_pago        |
|         32 | france telecom              |          NULL | sin_pago        |
|         33 | Musée du Louvre             |          NULL | sin_pago        |
|         36 | Flores S.L.                 |          NULL | sin_pago        |
|         37 | The Magic Garden            |          NULL | sin_pago        |
+------------+-----------------------------+---------------+-----------------+
35 rows in set (0.00 sec)


4. Devuelve un listado que muestre solamente los empleados que no tienen
una oficina asociada.


SELECT
	em.nombre
FROM
	empleado em
WHERE
	em.oficina_id IS NULL;
Empty set (0.01 sec)
-- No muestra nada porque en esta base de datos todo empleado debe tener oficina


5. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado.

SELECT
	em.id AS empleado_id,
	em.nombre AS nombre_empleado,
	cl.id AS cliente_id
FROM
	empleado em
LEFT JOIN
	cliente cl ON cl.empleado_id = em.id
WHERE
	cl.id IS NULL;
+-------------+-----------------+------------+
| empleado_id | nombre_empleado | cliente_id |
+-------------+-----------------+------------+
|           1 | Marcos          |       NULL |
|           2 | Ruben           |       NULL |
|           3 | Alberto         |       NULL |
|           4 | Maria           |       NULL |
|           6 | Juan Carlos     |       NULL |
|           7 | Carlos          |       NULL |
|          10 | Hilario         |       NULL |
|          13 | David           |       NULL |
|          14 | Oscar           |       NULL |
|          15 | Francois        |       NULL |
|          17 | Laurent         |       NULL |
|          20 | Hilary          |       NULL |
|          21 | Marcus          |       NULL |
|          23 | Nei             |       NULL |
|          24 | Narumi          |       NULL |
|          25 | Takuma          |       NULL |
|          26 | Amy             |       NULL |
|          27 | Larry           |       NULL |
|          28 | John            |       NULL |
|          29 | Kevin           |       NULL |
+-------------+-----------------+------------+
20 rows in set (0.00 sec)


6. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado junto con los datos de la oficina donde trabajan.


SELECT
	em.id AS empleado_id,
	em.nombre AS nombre_empleado,
	ofc.id AS oficina_id,
	ofc.nombre AS oficina_nombre,
	pa.nombre AS pais_oficina,
	re.nombre AS region_oficina,
	c.nombre AS ciudad_oficina,
	df.detalle AS direccion_oficina,
	cl.id AS cliente_id
FROM
	empleado em
LEFT JOIN
	cliente cl ON cl.empleado_id = em.id
LEFT JOIN
	oficina ofc ON ofc.id = em.oficina_id
LEFT JOIN
	direccion_oficina df ON df.oficina_id = ofc.id
LEFT JOIN
	pais pa ON df.pais_id = pa.id
LEFT JOIN
	region re ON df.region_id = re.id
LEFT JOIN
	ciudad c ON  df.ciudad_id = c.id
WHERE
	cl.id IS NULL;
+-------------+-----------------+------------+----------------+--------------+----------------+----------------------+--------------------------------------------+------------+
| empleado_id | nombre_empleado | oficina_id | oficina_nombre | pais_oficina | region_oficina | ciudad_oficina       | direccion_oficina                          | cliente_id |
+-------------+-----------------+------------+----------------+--------------+----------------+----------------------+--------------------------------------------+------------+
|           1 | Marcos          |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
|           2 | Ruben           |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
|           3 | Alberto         |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
|           4 | Maria           |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
|           6 | Juan Carlos     |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
|           7 | Carlos          |          4 | MAD-ES         | España       | Madrid         | Madrid               | Bulevar Indalecio Prieto, 32               |       NULL |
|          10 | Hilario         |          4 | MAD-ES         | España       | Madrid         | Madrid               | Bulevar Indalecio Prieto, 32               |       NULL |
|          13 | David           |          1 | BCN-ES         | España       | Barcelona      | Barcelona            | Avenida Diagonal, 38 - 3A escalera Derecha |       NULL |
|          14 | Oscar           |          1 | BCN-ES         | España       | Barcelona      | Barcelona            | Avenida Diagonal, 38 - 3A escalera Derecha |       NULL |
|          15 | Francois        |          5 | PAR-FR         | Francia      | EMEA           | Paris                | 29 Rue Jouffroy d'abbans                   |       NULL |
|          17 | Laurent         |          5 | PAR-FR         | Francia      | EMEA           | Paris                | 29 Rue Jouffroy d'abbans                   |       NULL |
|          20 | Hilary          |          2 | BOS-USA        | EEUU         | MA             | Boston               | 1550 Court Place - Suite 102               |       NULL |
|          21 | Marcus          |          2 | BOS-USA        | EEUU         | MA             | Boston               | 1550 Court Place - Suite 102               |       NULL |
|          23 | Nei             |          9 | TOK-JP         | Japón        | Chiyoda-Ku     | Tokyo                | 4-1 Kioicho                                |       NULL |
|          24 | Narumi          |          9 | TOK-JP         | Japón        | Chiyoda-Ku     | Tokyo                | 4-1 Kioicho                                |       NULL |
|          25 | Takuma          |          9 | TOK-JP         | Japón        | Chiyoda-Ku     | Tokyo                | 4-1 Kioicho                                |       NULL |
|          26 | Amy             |          3 | LON-UK         | Inglaterra   | EMEA           | Londres              | 52 Old Broad Street - Ground Floor         |       NULL |
|          27 | Larry           |          3 | LON-UK         | Inglaterra   | EMEA           | Londres              | 52 Old Broad Street - Ground Floor         |       NULL |
|          28 | John            |          3 | LON-UK         | Inglaterra   | EMEA           | Londres              | 52 Old Broad Street - Ground Floor         |       NULL |
|          29 | Kevin           |          7 | SYD-AU         | Australia    | Chiyoda-Ku     | Sydney               | 5-11 Wentworth Avenue - Floor #2           |       NULL |
+-------------+-----------------+------------+----------------+--------------+----------------+----------------------+--------------------------------------------+------------+
20 rows in set (0.01 sec)


7. Devuelve un listado que muestre los empleados que no tienen una oficina
asociada y los que no tienen un cliente asociado.


SELECT
	em.id AS empleado_id,
	em.nombre AS nombre_empleado,
	cl.id AS cliente_id,
	ofC.id AS oficina_id
FROM
	empleado em
LEFT JOIN
	cliente cl ON cl.empleado_id = em.id
LEFT JOIN
	oficina ofc ON ofc.id = em.oficina_id
WHERE
	cl.id IS NULL
	AND
	ofC.id IS NULL;
Empty set (0.00 sec)
-- No retorna ningun dato porque en el modelo de esta base de datos se determino que todos los empleados deben tener oficina



8. Devuelve un listado de los productos que nunca han aparecido en un
pedido.

SELECT
	pr.id AS producto_id,
	pr.nombre AS nombre_producto,
	dpd.pedido_id AS pedido_id
FROM
	producto pr
LEFT JOIN
	detalle_pedido dpd ON dpd.producto_id = pr.id
WHERE
	dpd.pedido_id IS NULL;
+-------------+-----------------+-----------+
| producto_id | nombre_producto | pedido_id |
+-------------+-----------------+-----------+
|         241 | Producto 241    |      NULL |
|         242 | Producto 242    |      NULL |
|         243 | Producto 243    |      NULL |
|         244 | Producto 244    |      NULL |
|         245 | Producto 245    |      NULL |
|         246 | Producto 246    |      NULL |
|         247 | Producto 247    |      NULL |
|         248 | Producto 248    |      NULL |
|         249 | Producto 249    |      NULL |
|         250 | Producto 250    |      NULL |
|         251 | Producto 251    |      NULL |
|         252 | Producto 252    |      NULL |
|         253 | Producto 253    |      NULL |
|         254 | Producto 254    |      NULL |
|         255 | Producto 255    |      NULL |
|         256 | Producto 256    |      NULL |
|         257 | Producto 257    |      NULL |
|         258 | Producto 258    |      NULL |
|         259 | Producto 259    |      NULL |
|         260 | Producto 260    |      NULL |
|         261 | Producto 261    |      NULL |
|         262 | Producto 262    |      NULL |
|         263 | Producto 263    |      NULL |
|         264 | Producto 264    |      NULL |
|         265 | Producto 265    |      NULL |
|         266 | Producto 266    |      NULL |
|         267 | Producto 267    |      NULL |
|         268 | Producto 268    |      NULL |
|         269 | Producto 269    |      NULL |
|         270 | Producto 270    |      NULL |
|         271 | Producto 271    |      NULL |
|         272 | Producto 272    |      NULL |
|         273 | Producto 273    |      NULL |
|         274 | Producto 274    |      NULL |
|         275 | Producto 275    |      NULL |
+-------------+-----------------+-----------+
35 rows in set (0.01 sec)

9. Devuelve un listado de los productos que nunca han aparecido en un
pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
producto.


SELECT
	pr.id AS producto_id,
	pr.nombre AS nombre_producto,
	dpd.pedido_id AS pedido_id,
	gp.descripcion_texto,
	gp.descripcion_html
FROM
	producto pr
LEFT JOIN
	detalle_pedido dpd ON dpd.producto_id = pr.id
LEFT JOIN
	gama_producto gp ON gp.id =  pr.gama_id
WHERE
	dpd.pedido_id IS NULL;
+-------------+-----------------+-----------+------------------------------------------------+------------------+
| producto_id | nombre_producto | pedido_id | descripcion_texto                              | descripcion_html |
+-------------+-----------------+-----------+------------------------------------------------+------------------+
|         241 | Producto 241    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         242 | Producto 242    |      NULL | Herramientas para todo tipo de acción          | NULL             |
|         243 | Producto 243    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         244 | Producto 244    |      NULL | Herramientas para todo tipo de acción          | NULL             |
|         245 | Producto 245    |      NULL | Plantas para jardin decorativas                | NULL             |
|         246 | Producto 246    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         247 | Producto 247    |      NULL | Plantas aromáticas                             | NULL             |
|         248 | Producto 248    |      NULL | Plantas aromáticas                             | NULL             |
|         249 | Producto 249    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         250 | Producto 250    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         251 | Producto 251    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         252 | Producto 252    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         253 | Producto 253    |      NULL | Plantas aromáticas                             | NULL             |
|         254 | Producto 254    |      NULL | Plantas para jardin decorativas                | NULL             |
|         255 | Producto 255    |      NULL | Plantas para jardin decorativas                | NULL             |
|         256 | Producto 256    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         257 | Producto 257    |      NULL | Plantas para jardin decorativas                | NULL             |
|         258 | Producto 258    |      NULL | Plantas aromáticas                             | NULL             |
|         259 | Producto 259    |      NULL | Plantas para jardin decorativas                | NULL             |
|         260 | Producto 260    |      NULL | Plantas aromáticas                             | NULL             |
|         261 | Producto 261    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         262 | Producto 262    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         263 | Producto 263    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         264 | Producto 264    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         265 | Producto 265    |      NULL | Plantas aromáticas                             | NULL             |
|         266 | Producto 266    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
|         267 | Producto 267    |      NULL | Plantas para jardin decorativas                | NULL             |
|         268 | Producto 268    |      NULL | Plantas para jardin decorativas                | NULL             |
|         269 | Producto 269    |      NULL | Plantas aromáticas                             | NULL             |
|         270 | Producto 270    |      NULL | Herramientas para todo tipo de acción          | NULL             |
|         271 | Producto 271    |      NULL | Herramientas para todo tipo de acción          | NULL             |
|         272 | Producto 272    |      NULL | Herramientas para todo tipo de acción          | NULL             |
|         273 | Producto 273    |      NULL | Árboles pequeños de producción frutal          | NULL             |
|         274 | Producto 274    |      NULL | Plantas aromáticas                             | NULL             |
|         275 | Producto 275    |      NULL | Herramientas para todo tipo de acción          | NULL             |
+-------------+-----------------+-----------+------------------------------------------------+------------------+
35 rows in set (0.00 sec)


10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.

SELECT o.id, o.nombre 
FROM oficina o
WHERE o.id NOT IN (
    SELECT DISTINCT oficina_id 
    FROM empleado 
    WHERE id IN (
        SELECT DISTINCT empleado_id 
        FROM cliente 
        WHERE id IN (
            SELECT DISTINCT cliente_id 
            FROM pedido 
            WHERE id IN (
                SELECT DISTINCT pedido_id 
                FROM detalle_pedido 
                WHERE producto_id IN (
                    SELECT id 
                    FROM producto 
                    WHERE gama_id = (SELECT id FROM gama_producto WHERE nombre = 'Frutales')
                )
            )
        )
    )
);

+----+--------+
| id | nombre |
+----+--------+
|  3 | LON-UK |
|  5 | PAR-FR |
|  9 | TOK-JP |
+----+--------+
3 rows in set (0.02 sec)

11. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.


SELECT
	cl.id AS cliente_id,
	cl.nombre AS nombre_cliente,
	pd.id AS pedido_id,
	pa.id AS pago_id
FROM
	cliente cl
INNER JOIN
	pedido pd ON pd.cliente_id = cl.id
LEFT JOIN
	pago pa ON pa.cliente_id = cl.id
WHERE
	pa.id IS NULL;
+------------+----------------------+-----------+---------+
| cliente_id | nombre_cliente       | pedido_id | pago_id |
+------------+----------------------+-----------+---------+
|          2 | Gardening Competitor |        23 |    NULL |
|          2 | Gardening Competitor |        37 |    NULL |
|          6 | Lasas S.A.           |        29 |    NULL |
|         36 | Flores S.L.          |       111 |    NULL |
|         36 | Flores S.L.          |       112 |    NULL |
|         36 | Flores S.L.          |       113 |    NULL |
|         36 | Flores S.L.          |       114 |    NULL |
|         36 | Flores S.L.          |       115 |    NULL |
+------------+----------------------+-----------+---------+
8 rows in set (0.00 sec)

12. Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado.


SELECT
	em.id AS empleado_id,
	em.nombre AS nombre_empleado,
	cl.id AS cliente_id,
	jf.nombre AS nombre_jefe
FROM
	empleado em
INNER JOIN
	empleado  jf ON em.jefe_id = jf.id
LEFT JOIN
	cliente cl ON cl.empleado_id = em.id
WHERE
	cl.id IS NULL;
+-------------+-----------------+------------+-------------+
| empleado_id | nombre_empleado | cliente_id | nombre_jefe |
+-------------+-----------------+------------+-------------+
|           2 | Ruben           |       NULL | Marcos      |
|           3 | Alberto         |       NULL | Ruben       |
|           4 | Maria           |       NULL | Ruben       |
|           6 | Juan Carlos     |       NULL | Alberto     |
|           7 | Carlos          |       NULL | Alberto     |
|          10 | Hilario         |       NULL | Carlos      |
|          13 | David           |       NULL | Emmanuel    |
|          14 | Oscar           |       NULL | Emmanuel    |
|          15 | Francois        |       NULL | Alberto     |
|          17 | Laurent         |       NULL | Francois    |
|          20 | Hilary          |       NULL | Alberto     |
|          21 | Marcus          |       NULL | Hilary      |
|          23 | Nei             |       NULL | Alberto     |
|          24 | Narumi          |       NULL | Nei         |
|          25 | Takuma          |       NULL | Nei         |
|          26 | Amy             |       NULL | Alberto     |
|          27 | Larry           |       NULL | Amy         |
|          28 | John            |       NULL | Amy         |
|          29 | Kevin           |       NULL | Alberto     |
+-------------+-----------------+------------+-------------+
19 rows in set (0.00 sec)





CONSULTAS RESUMEN: 

1. ¿Cuántos empleados hay en la compañía?


mysql> SELECT COUNT(*) AS total_empleados
    -> FROM empleado;
+-----------------+
| total_empleados |
+-----------------+
|              31 |
+-----------------+
1 row in set (0.01 sec)


2. ¿Cuántos clientes tiene cada país?

mysql> SELECT
    ->     p.nombre AS pais,
    ->     COUNT(c.id) AS total_clientes
    -> FROM
    ->     cliente c
    -> INNER JOIN
    ->     direccion_cliente dc ON dc.cliente_id = c.id
    -> INNER JOIN
    ->     pais p ON p.id = dc.pais_id
    -> GROUP BY
    ->     p.nombre;
+------------+----------------+
| pais       | total_clientes |
+------------+----------------+
| España     |             27 |
| EEUU       |              5 |
| Inglaterra |              1 |
| Francia    |              2 |
| Australia  |              2 |
+------------+----------------+
5 rows in set (0.01 sec)

3. ¿Cuál fue el pago medio en 2009?

mysql> SELECT AVG(total) AS pago_medio_2009
    -> FROM pago
    -> WHERE YEAR(fecha_pago) = 2009;
+-----------------+
| pago_medio_2009 |
+-----------------+
|     4504.076923 |
+-----------------+
1 row in set (0.01 sec)

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
descendente por el número de pedidos.

 mysql> SELECT
    ->     ep.estado AS estado_pedido,
    ->     COUNT(p.id) AS numero_pedidos
    -> FROM
    ->     pedido p
    -> INNER JOIN
    ->     estado_pedido ep ON p.estado_pedido_id = ep.id
    -> GROUP BY
    ->     ep.estado
    -> ORDER BY
    ->     numero_pedidos DESC;
+---------------+----------------+
| estado_pedido | numero_pedidos |
+---------------+----------------+
| Entregado     |             61 |
| Pendiente     |             30 |
| Rechazado     |             24 |
+---------------+----------------+
3 rows in set (0.01 sec)


5. Calcula el precio de venta del producto más caro y más barato en una
misma consulta.

mysql> SELECT
    ->     MAX(precio_venta) AS precio_maximo,
    ->     MIN(precio_venta) AS precio_minimo
    -> FROM
    ->    precio;
+---------------+---------------+
| precio_maximo | precio_minimo |
+---------------+---------------+
|        149.16 |          1.60 |
+---------------+---------------+
1 row in set (0.01 sec)


6. Calcula el número de clientes que tiene la empresa.

mysql> SELECT COUNT(*) AS numero_clientes
    -> FROM cliente;
+-----------------+
| numero_clientes |
+-----------------+
|              37 |
+-----------------+
1 row in set (0.01 sec)

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

mysql> SELECT COUNT(*) AS numero_clientes_en_madrid
    -> FROM cliente c
    -> INNER JOIN direccion_cliente dc ON c.id = dc.cliente_id
    -> INNER JOIN ciudad ci ON dc.ciudad_id = ci.id
    -> WHERE ci.nombre = 'Madrid';
+---------------------------+
| numero_clientes_en_madrid |
+---------------------------+
|                        24 |
+---------------------------+
1 row in set (0.02 sec)

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
por M?

mysql> SELECT ci.nombre AS nombre_ciudad, COUNT(c.id) AS total_clientes
    -> FROM cliente c
    -> INNER JOIN direccion_cliente dc ON c.id = dc.cliente_id
    -> INNER JOIN ciudad ci ON dc.ciudad_id = ci.id
    -> WHERE ci.nombre LIKE 'M%'
    -> GROUP BY ci.nombre;
+---------------+----------------+
| nombre_ciudad | total_clientes |
+---------------+----------------+
| Madrid        |             24 |
+---------------+----------------+
1 row in set (0.01 sec)

9. Devuelve el nombre de los representantes de ventas y el número de clientes
al que atiende cada uno. (MIRAR)

mysql> SELECT
    ->     e.nombre AS nombre_representante,
    ->     COUNT(c.id) AS numero_clientes_atendidos
    -> FROM
    ->     empleado e
    -> LEFT JOIN
    ->     cliente c ON e.id = c.empleado_id
    -> WHERE
    ->     e.puesto_id = (SELECT id FROM puesto WHERE puesto = 'Representante de ventas')
    -> GROUP BY
    ->     e.nombre;
Empty set (0.02 sec)


10. Calcula el número de clientes que no tiene asignado representante de
ventas.

mysql> SELECT COUNT(*) AS clientes_sin_representante
    -> FROM cliente
    -> WHERE empleado_id IS NULL;
+----------------------------+
| clientes_sin_representante |
+----------------------------+
|                          0 |
+----------------------------+
1 row in set (0.01 sec)

11. Calcula la fecha del primer y último pago realizado por cada uno de los
clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

 SELECT
    ->     c.nombre,
    ->
    ->     MIN(p.fecha_pago) AS primera_fecha_pago,
    ->     MAX(p.fecha_pago) AS ultima_fecha_pago
    -> FROM
    ->     cliente c
    -> LEFT JOIN
    ->     pago p ON c.id = p.cliente_id
    -> GROUP BY
    ->     c.id, c.nombre;
+--------------------------------+--------------------+-------------------+
| nombre                         | primera_fecha_pago | ultima_fecha_pago |
+--------------------------------+--------------------+-------------------+
| GoldFish Garden                | 2008-11-10         | 2008-12-10        |
| Gardening Competitor           | NULL               | NULL              |
| Gardening Associates           | 2009-01-16         | 2009-02-19        |
| Gerudo Valley                  | 2007-01-08         | 2007-01-08        |
| Tendo Garden                   | 2006-01-18         | 2006-01-18        |
| Lasas S.A.                     | NULL               | NULL              |
| Beragua                        | 2009-01-13         | 2009-01-13        |
| Club Golf Puerta del hierro    | NULL               | NULL              |
| Naturagua                      | 2009-01-06         | 2009-01-06        |
| DaraDistribuciones             | NULL               | NULL              |
| Madrileña de riegos            | NULL               | NULL              |
| Lasas S.A.                     | NULL               | NULL              |
| Camunas Jardines S.L.          | 2008-08-04         | 2008-08-04        |
| Dardena S.A.                   | 2008-07-15         | 2008-07-15        |
| Jardin de Flores               | 2009-01-15         | 2009-02-15        |
| Flores Marivi                  | 2009-02-16         | 2009-02-16        |
| Flowers, S.A                   | NULL               | NULL              |
| Naturajardin                   | NULL               | NULL              |
| Golf S.A.                      | 2009-03-06         | 2009-03-06        |
| Americh Golf Management SL     | NULL               | NULL              |
| Aloha                          | NULL               | NULL              |
| El Prat                        | NULL               | NULL              |
| Sotogrande                     | 2009-03-26         | 2009-03-26        |
| Vivero Humanes                 | NULL               | NULL              |
| Fuenla City                    | NULL               | NULL              |
| Jardines y Mansiones Cactus SL | 2008-03-18         | 2008-03-18        |
| Jardinerías Matías SL          | 2009-02-08         | 2009-02-08        |
| Agrojardin                     | 2009-01-13         | 2009-01-13        |
| Top Campo                      | NULL               | NULL              |
| Jardineria Sara                | 2009-01-16         | 2009-01-16        |
| Campohermoso                   | NULL               | NULL              |
| france telecom                 | NULL               | NULL              |
| Musée du Louvre                | NULL               | NULL              |
| Tutifruti S.A                  | 2007-10-06         | 2007-10-06        |
| Flores S.L.                    | NULL               | NULL              |
| The Magic Garden               | NULL               | NULL              |
| El Jardin Viviente S.L         | 2006-05-26         | 2006-05-26        |
+--------------------------------+--------------------+-------------------+
37 rows in set (0.00 sec)

12. Calcula el número de productos diferentes que hay en cada uno de los
pedidos.

mysql> SELECT
    ->     pedido_id,
    ->     COUNT(DISTINCT producto_id) AS num_productos_diferentes
    -> FROM
    ->     detalle_pedido
    -> GROUP BY
    ->     pedido_id;
+-----------+--------------------------+
| pedido_id | num_productos_diferentes |
+-----------+--------------------------+
|         3 |                        4 |
|         8 |                        4 |
|         9 |                        4 |
|        13 |                        4 |
|        15 |                        4 |
|        16 |                        4 |
|        17 |                        4 |
|        18 |                        4 |
|        22 |                        4 |
|        24 |                        4 |
|        27 |                        4 |
|        28 |                        4 |
|        30 |                        4 |
|        32 |                        4 |
|        34 |                        4 |
|        36 |                        4 |
|        38 |                        4 |
|        41 |                        4 |
|        42 |                        4 |
|        45 |                        4 |
|        47 |                        4 |
|        48 |                        4 |
|        49 |                        4 |
|        51 |                        4 |
|        53 |                        4 |
|        55 |                        4 |
|        58 |                        4 |
|        59 |                        4 |
|        60 |                        4 |
|        64 |                        4 |
|        67 |                        4 |
|        68 |                        4 |
|        75 |                        4 |
|        76 |                        4 |
|        78 |                        4 |
|        79 |                        4 |
|        82 |                        4 |
|        83 |                        4 |
|        89 |                        4 |
|        91 |                        4 |
|        92 |                        4 |
|        93 |                        4 |
|        95 |                        4 |
|        96 |                        4 |
|        97 |                        4 |
|       100 |                        4 |
|       102 |                        4 |
|       104 |                        4 |
|       107 |                        4 |
|       108 |                        4 |
|       109 |                        4 |
|       110 |                        4 |
|       111 |                        4 |
|       114 |                        4 |
|       116 |                        4 |
|       119 |                        4 |
|       121 |                        4 |
|       122 |                        4 |
|       124 |                        4 |
|       127 |                        4 |
+-----------+--------------------------+
60 rows in set (0.02 sec)

13. Calcula la suma de la cantidad total de todos los productos que aparecen en
cada uno de los pedidos.

mysql> SELECT
    ->     pedido_id,
    ->     SUM(cantidad) AS cantidad_total
    -> FROM
    ->     detalle_pedido
    -> GROUP BY
    ->     pedido_id;
+-----------+----------------+
| pedido_id | cantidad_total |
+-----------+----------------+
|         3 |             34 |
|         8 |             31 |
|         9 |             30 |
|        13 |             28 |
|        15 |             30 |
|        16 |             20 |
|        17 |             34 |
|        18 |             21 |
|        22 |             27 |
|        24 |             16 |
|        27 |             36 |
|        28 |             17 |
|        30 |             21 |
|        32 |             28 |
|        34 |             23 |
|        36 |             27 |
|        38 |             36 |
|        41 |             22 |
|        42 |             17 |
|        45 |             21 |
|        47 |             20 |
|        48 |             33 |
|        49 |             27 |
|        51 |             19 |
|        53 |             21 |
|        55 |             26 |
|        58 |             21 |
|        59 |             24 |
|        60 |             26 |
|        64 |             19 |
|        67 |             24 |
|        68 |             18 |
|        75 |             25 |
|        76 |             25 |
|        78 |             18 |
|        79 |             24 |
|        82 |             13 |
|        83 |             25 |
|        89 |             22 |
|        91 |             18 |
|        92 |             22 |
|        93 |             22 |
|        95 |             17 |
|        96 |             26 |
|        97 |             30 |
|       100 |             28 |
|       102 |             21 |
|       104 |             22 |
|       107 |             19 |
|       108 |             26 |
|       109 |             25 |
|       110 |             27 |
|       111 |             24 |
|       114 |             19 |
|       116 |             24 |
|       119 |             35 |
|       121 |             19 |
|       122 |             24 |
|       124 |             21 |
|       127 |             23 |
+-----------+----------------+
60 rows in set (0.01 sec)


14. Devuelve un listado de los 20 productos más vendidos y el número total de
unidades que se han vendido de cada uno. El listado deberá estar ordenado
por el número total de unidades vendidas.

mysql> SELECT
    ->     p.id AS id_producto,
    ->     p.nombre AS nombre_producto,
    ->     SUM(dp.cantidad) AS total_unidades_vendidas
    -> FROM
    ->     detalle_pedido dp
    -> INNER JOIN
    ->     producto p ON dp.producto_id = p.id
    -> GROUP BY
    ->     p.id, p.nombre
    -> ORDER BY
    ->     total_unidades_vendidas DESC
    -> LIMIT
    ->     20;
+-------------+-----------------+-------------------------+
| id_producto | nombre_producto | total_unidades_vendidas |
+-------------+-----------------+-------------------------+
|         238 | Producto 238    |                      11 |
|           2 | Producto 2      |                      11 |
|         236 | Producto 236    |                      11 |
|           5 | Producto 5      |                      11 |
|         132 | Producto 132    |                      11 |
|         100 | Producto 100    |                      11 |
|         147 | Producto 147    |                      11 |
|          31 | Producto 31     |                      11 |
|         187 | Producto 187    |                      11 |
|          85 | Producto 85     |                      11 |
|         218 | Producto 218    |                      11 |
|          23 | Producto 23     |                      11 |
|          22 | Producto 22     |                      11 |
|          21 | Producto 21     |                      11 |
|          40 | Producto 40     |                      10 |
|          63 | Producto 63     |                      10 |
|          62 | Producto 62     |                      10 |
|         105 | Producto 105    |                      10 |
|         110 | Producto 110    |                      10 |
|          28 | Producto 28     |                      10 |
+-------------+-----------------+-------------------------+
20 rows in set (0.00 sec)

15. La facturación que ha tenido la empresa en toda la historia, indicando la
base imponible, el IVA y el total facturado. La base imponible se calcula
sumando el coste del producto por el número de unidades vendidas de la
tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
suma de los dos campos anteriores.

 SELECT
    ->     SUM(dp.cantidad * pr.precio_venta) AS base_imponible,
    ->     SUM(dp.cantidad * pr.precio_venta) * 0.21 AS iva,
    ->     SUM(dp.cantidad * pr.precio_venta) + (SUM(dp.cantidad * pr.precio_venta) * 0.21) AS total_facturado
    -> FROM
    ->     detalle_pedido dp
    -> INNER JOIN
    ->     producto p ON dp.producto_id = p.id
    -> INNER JOIN
    ->     precio pr ON p.id = pr.producto_id;
+----------------+------------+-----------------+
| base_imponible | iva        | total_facturado |
+----------------+------------+-----------------+
|      105110.78 | 22073.2638 |     127184.0438 |
+----------------+------------+-----------------+
1 row in set (0.01 sec)

16. La misma información que en la pregunta anterior, pero agrupada por
código de producto.

 SELECT
    ->     dp.producto_id,
    ->     SUM(dp.cantidad * pr.precio_venta) AS base_imponible,
    ->     SUM(dp.cantidad * pr.precio_venta) * 0.21 AS iva,
    ->     SUM(dp.cantidad * pr.precio_venta) + (SUM(dp.cantidad * pr.precio_venta) * 0.21) AS total_facturado
    -> FROM
    ->     detalle_pedido dp
    -> INNER JOIN
    ->     producto p ON dp.producto_id = p.id
    -> INNER JOIN
    ->     precio pr ON p.id = pr.producto_id
    -> GROUP BY
    ->     dp.producto_id;
+-------------+----------------+----------+-----------------+
| producto_id | base_imponible | iva      | total_facturado |
+-------------+----------------+----------+-----------------+
|           1 |         690.54 | 145.0134 |        835.5534 |
|           2 |         744.81 | 156.4101 |        901.2201 |
|           3 |         556.02 | 116.7642 |        672.7842 |
|           4 |         795.36 | 167.0256 |        962.3856 |
|           5 |          32.67 |   6.8607 |         39.5307 |
|           6 |         372.88 |  78.3048 |        451.1848 |
|           7 |         629.28 | 132.1488 |        761.4288 |
|           8 |         370.80 |  77.8680 |        448.6680 |
|           9 |          82.71 |  17.3691 |        100.0791 |
|          10 |         470.45 |  98.7945 |        569.2445 |
|          11 |         569.70 | 119.6370 |        689.3370 |
|          12 |         310.80 |  65.2680 |        376.0680 |
|          13 |         544.95 | 114.4395 |        659.3895 |
|          14 |         576.28 | 121.0188 |        697.2988 |
|          15 |         778.96 | 163.5816 |        942.5416 |
|          16 |         876.51 | 184.0671 |       1060.5771 |
|          17 |         710.90 | 149.2890 |        860.1890 |
|          18 |          54.69 |  11.4849 |         66.1749 |
|          19 |         433.41 |  91.0161 |        524.4261 |
|          20 |         155.80 |  32.7180 |        188.5180 |
|          21 |         294.47 |  61.8387 |        356.3087 |
|          22 |        1639.77 | 344.3517 |       1984.1217 |
|          23 |         543.07 | 114.0447 |        657.1147 |
|          24 |          34.43 |   7.2303 |         41.6603 |
|          25 |         103.58 |  21.7518 |        125.3318 |
|          26 |         276.92 |  58.1532 |        335.0732 |
|          27 |         476.15 |  99.9915 |        576.1415 |
|          28 |        1342.90 | 282.0090 |       1624.9090 |
|          29 |         232.15 |  48.7515 |        280.9015 |
|          30 |         669.78 | 140.6538 |        810.4338 |
|          31 |         605.66 | 127.1886 |        732.8486 |
|          32 |         162.75 |  34.1775 |        196.9275 |
|          33 |         341.76 |  71.7696 |        413.5296 |
|          34 |         596.16 | 125.1936 |        721.3536 |
|          35 |         167.36 |  35.1456 |        202.5056 |
|          36 |          48.63 |  10.2123 |         58.8423 |
|          37 |        1134.24 | 238.1904 |       1372.4304 |
|          38 |          53.91 |  11.3211 |         65.2311 |
|          39 |         186.84 |  39.2364 |        226.0764 |
|          40 |         336.00 |  70.5600 |        406.5600 |
|          41 |         144.54 |  30.3534 |        174.8934 |
|          42 |         254.55 |  53.4555 |        308.0055 |
|          43 |         104.35 |  21.9135 |        126.2635 |
|          44 |         255.20 |  53.5920 |        308.7920 |
|          45 |         663.20 | 139.2720 |        802.4720 |
|          46 |          92.86 |  19.5006 |        112.3606 |
|          47 |         632.10 | 132.7410 |        764.8410 |
|          48 |         342.54 |  71.9334 |        414.4734 |
|          49 |         164.15 |  34.4715 |        198.6215 |
|          50 |         751.52 | 157.8192 |        909.3392 |
|          51 |         448.86 |  94.2606 |        543.1206 |
|          52 |         839.09 | 176.2089 |       1015.2989 |
|          53 |         631.50 | 132.6150 |        764.1150 |
|          54 |         125.37 |  26.3277 |        151.6977 |
|          55 |         645.45 | 135.5445 |        780.9945 |
|          56 |         237.70 |  49.9170 |        287.6170 |
|          57 |         273.33 |  57.3993 |        330.7293 |
|          58 |         981.12 | 206.0352 |       1187.1552 |
|          59 |        1020.60 | 214.3260 |       1234.9260 |
|          60 |          38.64 |   8.1144 |         46.7544 |
|          61 |         326.10 |  68.4810 |        394.5810 |
|          62 |         427.30 |  89.7330 |        517.0330 |
|          63 |         156.90 |  32.9490 |        189.8490 |
|          64 |         534.80 | 112.3080 |        647.1080 |
|          65 |        1209.50 | 253.9950 |       1463.4950 |
|          66 |         138.46 |  29.0766 |        167.5366 |
|          67 |          69.87 |  14.6727 |         84.5427 |
|          68 |         212.86 |  44.7006 |        257.5606 |
|          69 |          31.12 |   6.5352 |         37.6552 |
|          70 |         221.37 |  46.4877 |        267.8577 |
|          71 |         548.10 | 115.1010 |        663.2010 |
|          72 |         111.12 |  23.3352 |        134.4552 |
|          73 |         880.38 | 184.8798 |       1065.2598 |
|          74 |          61.43 |  12.9003 |         74.3303 |
|          75 |        1084.80 | 227.8080 |       1312.6080 |
|          76 |         465.24 |  97.7004 |        562.9404 |
|          77 |         284.79 |  59.8059 |        344.5959 |
|          78 |         322.26 |  67.6746 |        389.9346 |
|          79 |          16.28 |   3.4188 |         19.6988 |
|          80 |         984.24 | 206.6904 |       1190.9304 |
|          81 |         584.70 | 122.7870 |        707.4870 |
|          82 |        1059.39 | 222.4719 |       1281.8619 |
|          83 |         435.68 |  91.4928 |        527.1728 |
|          84 |         798.70 | 167.7270 |        966.4270 |
|          85 |        1196.36 | 251.2356 |       1447.5956 |
|          86 |         545.92 | 114.6432 |        660.5632 |
|          87 |         461.12 |  96.8352 |        557.9552 |
|          88 |         472.24 |  99.1704 |        571.4104 |
|          89 |         375.25 |  78.8025 |        454.0525 |
|          90 |         422.28 |  88.6788 |        510.9588 |
|          91 |         476.64 | 100.0944 |        576.7344 |
|          92 |          56.78 |  11.9238 |         68.7038 |
|          93 |         269.15 |  56.5215 |        325.6715 |
|          94 |         105.36 |  22.1256 |        127.4856 |
|          95 |         109.76 |  23.0496 |        132.8096 |
|          96 |         126.60 |  26.5860 |        153.1860 |
|          97 |         187.72 |  39.4212 |        227.1412 |
|          98 |         871.11 | 182.9331 |       1054.0431 |
|          99 |         133.38 |  28.0098 |        161.3898 |
|         100 |         978.78 | 205.5438 |       1184.3238 |
|         101 |         306.56 |  64.3776 |        370.9376 |
|         102 |         403.92 |  84.8232 |        488.7432 |
|         103 |         125.00 |  26.2500 |        151.2500 |
|         104 |         383.28 |  80.4888 |        463.7688 |
|         105 |         511.40 | 107.3940 |        618.7940 |
|         106 |         221.66 |  46.5486 |        268.2086 |
|         107 |        1172.48 | 246.2208 |       1418.7008 |
|         108 |         556.60 | 116.8860 |        673.4860 |
|         109 |         619.30 | 130.0530 |        749.3530 |
|         110 |         489.40 | 102.7740 |        592.1740 |
|         111 |         728.56 | 152.9976 |        881.5576 |
|         112 |         152.04 |  31.9284 |        183.9684 |
|         113 |         372.40 |  78.2040 |        450.6040 |
|         114 |          84.28 |  17.6988 |        101.9788 |
|         115 |          76.16 |  15.9936 |         92.1536 |
|         116 |          84.78 |  17.8038 |        102.5838 |
|         117 |         705.44 | 148.1424 |        853.5824 |
|         118 |          98.44 |  20.6724 |        119.1124 |
|         119 |         663.15 | 139.2615 |        802.4115 |
|         120 |        1179.09 | 247.6089 |       1426.6989 |
|         121 |         567.06 | 119.0826 |        686.1426 |
|         122 |          57.55 |  12.0855 |         69.6355 |
|         123 |         416.68 |  87.5028 |        504.1828 |
|         124 |         236.01 |  49.5621 |        285.5721 |
|         125 |         404.60 |  84.9660 |        489.5660 |
|         126 |         102.56 |  21.5376 |        124.0976 |
|         127 |         553.36 | 116.2056 |        669.5656 |
|         128 |         734.10 | 154.1610 |        888.2610 |
|         129 |         721.70 | 151.5570 |        873.2570 |
|         130 |          81.58 |  17.1318 |         98.7118 |
|         131 |         233.10 |  48.9510 |        282.0510 |
|         132 |         554.29 | 116.4009 |        670.6909 |
|         133 |         339.43 |  71.2803 |        410.7103 |
|         134 |          47.32 |   9.9372 |         57.2572 |
|         135 |         386.45 |  81.1545 |        467.6045 |
|         136 |          24.20 |   5.0820 |         29.2820 |
|         137 |         485.44 | 101.9424 |        587.3824 |
|         138 |         509.40 | 106.9740 |        616.3740 |
|         139 |         895.20 | 187.9920 |       1083.1920 |
|         140 |         149.30 |  31.3530 |        180.6530 |
|         141 |         202.88 |  42.6048 |        245.4848 |
|         142 |         449.40 |  94.3740 |        543.7740 |
|         143 |         100.42 |  21.0882 |        121.5082 |
|         144 |         272.26 |  57.1746 |        329.4346 |
|         145 |         237.54 |  49.8834 |        287.4234 |
|         146 |         228.06 |  47.8926 |        275.9526 |
|         147 |         145.64 |  30.5844 |        176.2244 |
|         148 |         661.38 | 138.8898 |        800.2698 |
|         149 |         204.19 |  42.8799 |        247.0699 |
|         150 |        1044.12 | 219.2652 |       1263.3852 |
|         151 |          58.90 |  12.3690 |         71.2690 |
|         152 |         612.36 | 128.5956 |        740.9556 |
|         153 |         156.30 |  32.8230 |        189.1230 |
|         154 |          28.98 |   6.0858 |         35.0658 |
|         155 |         255.20 |  53.5920 |        308.7920 |
|         156 |          39.46 |   8.2866 |         47.7466 |
|         157 |         551.32 | 115.7772 |        667.0972 |
|         158 |         825.37 | 173.3277 |        998.6977 |
|         159 |         162.00 |  34.0200 |        196.0200 |
|         160 |         424.47 |  89.1387 |        513.6087 |
|         161 |          22.62 |   4.7502 |         27.3702 |
|         162 |         520.36 | 109.2756 |        629.6356 |
|         163 |         313.32 |  65.7972 |        379.1172 |
|         164 |         588.10 | 123.5010 |        711.6010 |
|         165 |         104.64 |  21.9744 |        126.6144 |
|         166 |         252.54 |  53.0334 |        305.5734 |
|         167 |          89.76 |  18.8496 |        108.6096 |
|         168 |         157.80 |  33.1380 |        190.9380 |
|         169 |         140.46 |  29.4966 |        169.9566 |
|         170 |          13.95 |   2.9295 |         16.8795 |
|         171 |         656.75 | 137.9175 |        794.6675 |
|         172 |         775.40 | 162.8340 |        938.2340 |
|         173 |         532.40 | 111.8040 |        644.2040 |
|         174 |         272.48 |  57.2208 |        329.7008 |
|         175 |         326.79 |  68.6259 |        395.4159 |
|         176 |         686.97 | 144.2637 |        831.2337 |
|         177 |         357.45 |  75.0645 |        432.5145 |
|         178 |         664.10 | 139.4610 |        803.5610 |
|         179 |          53.28 |  11.1888 |         64.4688 |
|         180 |         840.69 | 176.5449 |       1017.2349 |
|         181 |          13.68 |   2.8728 |         16.5528 |
|         182 |         253.30 |  53.1930 |        306.4930 |
|         183 |         563.50 | 118.3350 |        681.8350 |
|         184 |         465.64 |  97.7844 |        563.4244 |
|         185 |         436.11 |  91.5831 |        527.6931 |
|         186 |         132.90 |  27.9090 |        160.8090 |
|         187 |        1036.75 | 217.7175 |       1254.4675 |
|         188 |         843.48 | 177.1308 |       1020.6108 |
|         189 |         154.86 |  32.5206 |        187.3806 |
|         190 |         330.60 |  69.4260 |        400.0260 |
|         191 |         193.62 |  40.6602 |        234.2802 |
|         192 |         534.80 | 112.3080 |        647.1080 |
|         193 |         700.98 | 147.2058 |        848.1858 |
|         194 |         297.90 |  62.5590 |        360.4590 |
|         195 |          77.55 |  16.2855 |         93.8355 |
|         196 |         820.86 | 172.3806 |        993.2406 |
|         197 |         200.37 |  42.0777 |        242.4477 |
|         198 |         229.52 |  48.1992 |        277.7192 |
|         199 |         840.40 | 176.4840 |       1016.8840 |
|         200 |         550.24 | 115.5504 |        665.7904 |
|         201 |         542.43 | 113.9103 |        656.3403 |
|         202 |          94.02 |  19.7442 |        113.7642 |
|         203 |         437.70 |  91.9170 |        529.6170 |
|         204 |         609.48 | 127.9908 |        737.4708 |
|         205 |         296.80 |  62.3280 |        359.1280 |
|         206 |         238.80 |  50.1480 |        288.9480 |
|         207 |        1138.05 | 238.9905 |       1377.0405 |
|         208 |         153.04 |  32.1384 |        185.1784 |
|         209 |          53.72 |  11.2812 |         65.0012 |
|         210 |          63.92 |  13.4232 |         77.3432 |
|         211 |         100.18 |  21.0378 |        121.2178 |
|         212 |         880.67 | 184.9407 |       1065.6107 |
|         213 |         997.36 | 209.4456 |       1206.8056 |
|         214 |         151.78 |  31.8738 |        183.6538 |
|         215 |          11.20 |   2.3520 |         13.5520 |
|         216 |         666.96 | 140.0616 |        807.0216 |
|         217 |         635.58 | 133.4718 |        769.0518 |
|         218 |        1490.61 | 313.0281 |       1803.6381 |
|         219 |         710.50 | 149.2050 |        859.7050 |
|         220 |        1302.10 | 273.4410 |       1575.5410 |
|         221 |         858.84 | 180.3564 |       1039.1964 |
|         222 |         390.88 |  82.0848 |        472.9648 |
|         223 |         155.92 |  32.7432 |        188.6632 |
|         224 |         415.86 |  87.3306 |        503.1906 |
|         225 |        1216.71 | 255.5091 |       1472.2191 |
|         226 |         479.60 | 100.7160 |        580.3160 |
|         227 |          19.00 |   3.9900 |         22.9900 |
|         228 |        1218.06 | 255.7926 |       1473.8526 |
|         229 |         836.01 | 175.5621 |       1011.5721 |
|         230 |         454.80 |  95.5080 |        550.3080 |
|         231 |         690.65 | 145.0365 |        835.6865 |
|         232 |          17.68 |   3.7128 |         21.3928 |
|         233 |         323.52 |  67.9392 |        391.4592 |
|         234 |         187.76 |  39.4296 |        227.1896 |
|         235 |          62.39 |  13.1019 |         75.4919 |
|         236 |         781.77 | 164.1717 |        945.9417 |
|         237 |         313.02 |  65.7342 |        378.7542 |
|         238 |         135.19 |  28.3899 |        163.5799 |
|         239 |         362.34 |  76.0914 |        438.4314 |
|         240 |        1070.88 | 224.8848 |       1295.7648 |
+-------------+----------------+----------+-----------------+
240 rows in set (0.02 sec)]


17. La misma información que en la pregunta anterior, pero agrupada por
código de producto filtrada por los códigos que empiecen por OR.

SELECT
    ->     dp.producto_id,
    ->     SUM(dp.cantidad * pr.precio_venta) AS base_imponible,
    ->     SUM(dp.cantidad * pr.precio_venta) * 0.21 AS iva,
    ->     SUM(dp.cantidad * pr.precio_venta) + (SUM(dp.cantidad * pr.precio_venta) * 0.21) AS total_facturado
    -> FROM
    ->     detalle_pedido dp
    -> INNER JOIN
    ->     producto p ON dp.producto_id = p.id
    -> INNER JOIN
    ->     precio pr ON p.id = pr.producto_id
    -> WHERE
    ->     p.id LIKE 'OR%'
    -> GROUP BY
    ->     dp.producto_id;
Empty set (0.01 sec)

18. Lista las ventas totales de los productos que hayan facturado más de 3000
euros. Se mostrará el nombre, unidades vendidas, total facturado y total
facturado con impuestos (21% IVA).

SELECT 
    p.nombre,
    SUM(dp.cantidad) AS unidades_vendidas,
    SUM(dp.cantidad * pr.precio_venta) AS total_facturado,
    SUM(dp.cantidad * pr.precio_venta) * 1.21 AS total_facturado_con_iva
FROM 
    detalle_pedido dp
INNER JOIN 
    producto p ON dp.producto_id = p.id
INNER JOIN 
    precio pr ON p.id = pr.producto_id
GROUP BY 
    p.nombre
HAVING 
    total_facturado > 3000;

19. Muestre la suma total de todos los pagos que se realizaron para cada uno
de los años que aparecen en la tabla pagos.

 SELECT
    ->     YEAR(fecha_pago) AS año,
    ->     SUM(total) AS total_pagado
    -> FROM
    ->     pago
    -> GROUP BY
    ->     YEAR(fecha_pago)
    -> ORDER BY
    ->     año;
+------+--------------+
| año  | total_pagado |
+------+--------------+
| 2006 |     24965.00 |
| 2007 |     85170.00 |
| 2008 |     29252.00 |
| 2009 |     58553.00 |
+------+--------------+
4 rows in set (0.00 sec)


Subconsultas:

Con operadores básicos de comparación

1. Devuelve el nombre del cliente con mayor límite de crédito.

 SELECT
    ->     nombre,
    ->     limite_credito
    -> FROM
    ->     cliente
    -> ORDER BY
    ->     limite_credito DESC
    -> LIMIT 1;
+--------------+----------------+
| nombre       | limite_credito |
+--------------+----------------+
| Tendo Garden |      600000.00 |
+--------------+----------------+
1 row in set (0.00 sec)

 2. Devuelve el nombre del producto que tenga el precio de venta más caro.


SELECT
    ->     p.nombre,
    ->     pr.precio_venta
    -> FROM
    ->     producto p
    -> JOIN
    ->     precio pr ON p.id = pr.producto_id
    -> ORDER BY
    ->     pr.precio_venta DESC
    -> LIMIT 1;
+--------------+--------------+
| nombre       | precio_venta |
+--------------+--------------+
| Producto 150 |       149.16 |
+--------------+--------------+
1 row in set (0.00 sec)

3. Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido)

SELECT
    ->     p.nombre,
    ->     SUM(dp.cantidad) AS total_vendido
    -> FROM
    ->     producto p
    -> JOIN
    ->     detalle_pedido dp ON p.id = dp.producto_id
    -> GROUP BY
    ->     p.id, p.nombre
    -> ORDER BY
    ->     total_vendido DESC
    -> LIMIT 1;
+------------+---------------+
| nombre     | total_vendido |
+------------+---------------+
| Producto 2 |            11 |
+------------+---------------+
1 row in set (0.00 sec)

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
realizado. (Sin utilizar INNER JOIN).

 SELECT
    ->     c.nombre
    -> FROM
    ->     cliente c
    -> WHERE
    ->     c.limite_credito > (
    ->         SELECT
    ->             IFNULL(SUM(p.total), 0)
    ->         FROM
    ->             pago p
    ->         WHERE
    ->             p.cliente_id = c.id
    ->     );
+--------------------------------+
| nombre                         |
+--------------------------------+
| Gardening Competitor           |
| Tendo Garden                   |
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Lasas S.A.                     |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| Americh Golf Management SL     |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Top Campo                      |
| Campohermoso                   |
| france telecom                 |
| Musée du Louvre                |
| Tutifruti S.A                  |
| Flores S.L.                    |
| The Magic Garden               |
| El Jardin Viviente S.L         |
+--------------------------------+
31 rows in set (0.01 sec)

5. Devuelve el producto que más unidades tiene en stock.

SELECT
    ->     nombre,
    ->     cantidad_en_stock
    -> FROM
    ->     producto
    -> ORDER BY
    ->     cantidad_en_stock DESC
    -> LIMIT 1;
+--------------+-------------------+
| nombre       | cantidad_en_stock |
+--------------+-------------------+
| Producto 113 |               199 |
+--------------+-------------------+
1 row in set (0.00 sec)

6. Devuelve el producto que menos unidades tiene en stock.

SELECT
    ->     nombre,
    ->     cantidad_en_stock
    -> FROM
    ->     producto
    -> ORDER BY
    ->     cantidad_en_stock ASC
    -> LIMIT 1;
+--------------+-------------------+
| nombre       | cantidad_en_stock |
+--------------+-------------------+
| Producto 115 |                50 |
+--------------+-------------------+
1 row in set (0.00 sec)

7. Devuelve el nombre, los apellidos y el email de los empleados que están a
cargo de Alberto Soria.

mysql> SELECT
    ->     e.nombre,
    ->     e.apellido1,
    ->     e.apellido2,
    ->     e.email
    -> FROM
    ->     empleado AS e
    -> JOIN
    ->     empleado AS jefe ON e.jefe_id = jefe.id
    -> WHERE
    ->     jefe.nombre = 'Alberto' AND jefe.apellido1 = 'Soria';
+-------------+------------+-----------+---------------------------+
| nombre      | apellido1  | apellido2 | email                     |
+-------------+------------+-----------+---------------------------+
| Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
| Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
| Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
| Emmanuel    | Magaña     | Perez     | manu@jardineria.es        |
| Francois    | Fignon     |           | ffignon@gardening.com     |
| Michael     | Bolton     |           | mbolton@gardening.com     |
| Hilary      | Washington |           | hwashington@gardening.com |
| Nei         | Nishikori  |           | nnishikori@gardening.com  |
| Amy         | Johnson    |           | ajohnson@gardening.com    |
| Kevin       | Fallmer    |           | kfalmer@gardening.com     |
+-------------+------------+-----------+---------------------------+
10 rows in set (0.01 sec)

Subconsultas con ALL y ANY


8. Devuelve el nombre del cliente con mayor límite de crédito.

SELECT
    ->     nombre
    -> FROM
    ->     cliente
    -> ORDER BY
    ->     limite_credito DESC
    -> LIMIT 1;
+--------------+
| nombre       |
+--------------+
| Tendo Garden |
+--------------+
1 row in set (0.00 sec)

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

 SELECT
    ->     p.nombre
    -> FROM
    ->     producto AS p
    -> JOIN
    ->     precio AS pr ON p.id = pr.producto_id
    -> ORDER BY
    ->     pr.precio_venta DESC
    -> LIMIT 1;
+--------------+
| nombre       |
+--------------+
| Producto 150 |
+--------------+
1 row in set (0.00 sec)

10. Devuelve el producto que menos unidades tiene en stock.

mysql> SELECT
    ->     nombre
    -> FROM
    ->     producto
    -> ORDER BY
    ->     cantidad_en_stock ASC
    -> LIMIT 1;
+--------------+
| nombre       |
+--------------+
| Producto 115 |
+--------------+
1 row in set (0.00 sec)

Subconsultas con IN y NOT IN:

11. Devuelve el nombre, apellido1 y cargo de los empleados que no
representen a ningún cliente.

SELECT
	em.nombre AS empleado_nombre,
	em.apellido1 AS empleado_apellido1,
	pu.puesto AS empleado_puesto
FROM
	empleado em
INNER JOIN
	puesto pu ON em.puesto_id = pu.id
WHERE
	em.id NOT IN(SELECT cl.empleado_id FROM cliente cl);
+-----------------+--------------------+-----------------------+
| empleado_nombre | empleado_apellido1 | empleado_puesto       |
+-----------------+--------------------+-----------------------+
| Marcos          | Magaña             | Director General      |
| Carlos          | Soria              | Director General      |
| Francois        | Fignon             | Director General      |
| Hilary          | Washington         | Director General      |
| Nei             | Nishikori          | Director General      |
| Amy             | Johnson            | Director General      |
| Kevin           | Fallmer            | Director General      |
| Ruben           | López              | Subdirector Marketing |
| Alberto         | Soria              | Subdirector Ventas    |
| Maria           | Solís              | Secretaria            |
| Juan Carlos     | Ortiz              | Representante Ventas  |
| Hilario         | Rodriguez          | Representante Ventas  |
| David           | Palma              | Representante Ventas  |
| Oscar           | Palma              | Representante Ventas  |
| Laurent         | Serra              | Representante Ventas  |
| Marcus          | Paxton             | Representante Ventas  |
| Narumi          | Riko               | Representante Ventas  |
| Takuma          | Nomura             | Representante Ventas  |
| Larry           | Westfalls          | Representante Ventas  |
| John            | Walton             | Representante Ventas  |
+-----------------+--------------------+-----------------------+
20 rows in set (0.01 sec)

12. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

SELECT
    cl.id AS cliente_id,
    cl.nombre AS nombre_cliente
FROM
    cliente cl
WHERE 
	cl.id NOT IN (
    SELECT
        pa.cliente_id
    FROM
        pago pa
);
+------------+-----------------------------+
| cliente_id | nombre_cliente              |
+------------+-----------------------------+
|          2 | Gardening Competitor        |
|          6 | Lasas S.A.                  |
|          8 | Club Golf Puerta del hierro |
|         10 | DaraDistribuciones          |
|         11 | Madrileña de riegos         |
|         12 | Lasas S.A.                  |
|         17 | Flowers, S.A                |
|         18 | Naturajardin                |
|         20 | Americh Golf Management SL  |
|         21 | Aloha                       |
|         22 | El Prat                     |
|         24 | Vivero Humanes              |
|         25 | Fuenla City                 |
|         29 | Top Campo                   |
|         31 | Campohermoso                |
|         32 | france telecom              |
|         33 | Musée du Louvre             |
|         36 | Flores S.L.                 |
|         37 | The Magic Garden            |
+------------+-----------------------------+
19 rows in set (0.00 sec)

13. Devuelve un listado que muestre solamente los clientes que sí han realizado
algún pago.

SELECT
    cl.id AS cliente_id,
    cl.nombre AS nombre_cliente
FROM
    cliente cl
WHERE 
	cl.id IN (
    SELECT
        pa.cliente_id
    FROM
        pago pa
);
+------------+--------------------------------+
| cliente_id | nombre_cliente                 |
+------------+--------------------------------+
|          1 | GoldFish Garden                |
|          3 | Gardening Associates           |
|          4 | Gerudo Valley                  |
|          5 | Tendo Garden                   |
|          7 | Beragua                        |
|          9 | Naturagua                      |
|         13 | Camunas Jardines S.L.          |
|         14 | Dardena S.A.                   |
|         15 | Jardin de Flores               |
|         16 | Flores Marivi                  |
|         19 | Golf S.A.                      |
|         23 | Sotogrande                     |
|         26 | Jardines y Mansiones Cactus SL |
|         27 | Jardinerías Matías SL          |
|         28 | Agrojardin                     |
|         30 | Jardineria Sara                |
|         35 | Tutifruti S.A                  |
|         38 | El Jardin Viviente S.L         |
+------------+--------------------------------+
18 rows in set (0.00 sec)

14. Devuelve un listado de los productos que nunca han aparecido en un
pedido.

SELECT
    pr.id AS producto_id,
    pr.nombre AS nombre_producto
FROM
    producto pr
WHERE pr.id NOT IN (
    SELECT
        dpd.producto_id
    FROM
        detalle_pedido dpd
);
+-------------+-----------------+
| producto_id | nombre_producto |
+-------------+-----------------+
|         241 | Producto 241    |
|         242 | Producto 242    |
|         243 | Producto 243    |
|         244 | Producto 244    |
|         245 | Producto 245    |
|         246 | Producto 246    |
|         247 | Producto 247    |
|         248 | Producto 248    |
|         249 | Producto 249    |
|         250 | Producto 250    |
|         251 | Producto 251    |
|         252 | Producto 252    |
|         253 | Producto 253    |
|         254 | Producto 254    |
|         255 | Producto 255    |
|         256 | Producto 256    |
|         257 | Producto 257    |
|         258 | Producto 258    |
|         259 | Producto 259    |
|         260 | Producto 260    |
|         261 | Producto 261    |
|         262 | Producto 262    |
|         263 | Producto 263    |
|         264 | Producto 264    |
|         265 | Producto 265    |
|         266 | Producto 266    |
|         267 | Producto 267    |
|         268 | Producto 268    |
|         269 | Producto 269    |
|         270 | Producto 270    |
|         271 | Producto 271    |
|         272 | Producto 272    |
|         273 | Producto 273    |
|         274 | Producto 274    |
|         275 | Producto 275    |
+-------------+-----------------+
35 rows in set (0.00 sec)

15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.

17. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.



Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

19. Devuelve un listado que muestre solamente los clientes que sí han realizado
algún pago.

20. Devuelve un listado de los productos que nunca han aparecido en un
pedido.

21. Devuelve un listado de los productos que han aparecido en un pedido
alguna vez.





Consultas variadas:


1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
han realizado ningún pedido.

mysql> SELECT
    ->     c.nombre AS nombre_cliente,
    ->     COUNT(p.id) AS cantidad_pedidos
    -> FROM
    ->     cliente c
    -> LEFT JOIN
    ->     pedido p ON c.id = p.cliente_id
    -> GROUP BY
    ->     c.id, c.nombre;
+--------------------------------+------------------+
| nombre_cliente                 | cantidad_pedidos |
+--------------------------------+------------------+
| GoldFish Garden                |               13 |
| Gardening Competitor           |                2 |
| Gardening Associates           |               11 |
| Gerudo Valley                  |                3 |
| Tendo Garden                   |                9 |
| Lasas S.A.                     |                1 |
| Beragua                        |                5 |
| Club Golf Puerta del hierro    |                0 |
| Naturagua                      |                4 |
| DaraDistribuciones             |                0 |
| Madrileña de riegos            |                0 |
| Lasas S.A.                     |                0 |
| Camunas Jardines S.L.          |                3 |
| Dardena S.A.                   |                2 |
| Jardin de Flores               |                5 |
| Flores Marivi                  |               10 |
| Flowers, S.A                   |                0 |
| Naturajardin                   |                0 |
| Golf S.A.                      |                2 |
| Americh Golf Management SL     |                0 |
| Aloha                          |                0 |
| El Prat                        |                0 |
| Sotogrande                     |                5 |
| Vivero Humanes                 |                0 |
| Fuenla City                    |                0 |
| Jardines y Mansiones Cactus SL |                5 |
| Jardinerías Matías SL          |                5 |
| Agrojardin                     |                5 |
| Top Campo                      |                0 |
| Jardineria Sara                |               10 |
| Campohermoso                   |                0 |
| france telecom                 |                0 |
| Musée du Louvre                |                0 |
| Tutifruti S.A                  |                5 |
| Flores S.L.                    |                5 |
| The Magic Garden               |                0 |
| El Jardin Viviente S.L         |                5 |
+--------------------------------+------------------+
37 rows in set (0.01 sec)


2. Devuelve un listado con los nombres de los clientes y el total pagado por
cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
realizado ningún pago.

mysql> SELECT
    ->     c.nombre AS nombre_cliente,
    ->     COALESCE(SUM(pa.total), 0) AS total_pagado
    -> FROM
    ->     cliente c
    -> LEFT JOIN
    ->     pago pa ON c.id = pa.cliente_id
    -> GROUP BY
    ->     c.id, c.nombre;
+--------------------------------+--------------+
| nombre_cliente                 | total_pagado |
+--------------------------------+--------------+
| GoldFish Garden                |      4000.00 |
| Gardening Competitor           |         0.00 |
| Gardening Associates           |     10926.00 |
| Gerudo Valley                  |     81849.00 |
| Tendo Garden                   |     23794.00 |
| Lasas S.A.                     |         0.00 |
| Beragua                        |      2390.00 |
| Club Golf Puerta del hierro    |         0.00 |
| Naturagua                      |       929.00 |
| DaraDistribuciones             |         0.00 |
| Madrileña de riegos            |         0.00 |
| Lasas S.A.                     |         0.00 |
| Camunas Jardines S.L.          |      2246.00 |
| Dardena S.A.                   |      4160.00 |
| Jardin de Flores               |     12081.00 |
| Flores Marivi                  |      4399.00 |
| Flowers, S.A                   |         0.00 |
| Naturajardin                   |         0.00 |
| Golf S.A.                      |       232.00 |
| Americh Golf Management SL     |         0.00 |
| Aloha                          |         0.00 |
| El Prat                        |         0.00 |
| Sotogrande                     |       272.00 |
| Vivero Humanes                 |         0.00 |
| Fuenla City                    |         0.00 |
| Jardines y Mansiones Cactus SL |     18846.00 |
| Jardinerías Matías SL          |     10972.00 |
| Agrojardin                     |      8489.00 |
| Top Campo                      |         0.00 |
| Jardineria Sara                |      7863.00 |
| Campohermoso                   |         0.00 |
| france telecom                 |         0.00 |
| Musée du Louvre                |         0.00 |
| Tutifruti S.A                  |      3321.00 |
| Flores S.L.                    |         0.00 |
| The Magic Garden               |         0.00 |
| El Jardin Viviente S.L         |      1171.00 |
+--------------------------------+--------------+
37 rows in set (0.00 sec)

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
ordenados alfabéticamente de menor a mayor.

mysql> SELECT
    ->     DISTINCT c.nombre AS nombre_cliente
    -> FROM
    ->     cliente c
    -> JOIN
    ->     pedido p ON c.id = p.cliente_id
    -> WHERE
    ->     YEAR(p.fecha_pedido) = 2008
    -> ORDER BY
    ->     nombre_cliente ASC;
+--------------------------------+
| nombre_cliente                 |
+--------------------------------+
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| El Jardin Viviente S.L         |
| Flores Marivi                  |
| Flores S.L.                    |
| Gardening Associates           |
| Gardening Competitor           |
| GoldFish Garden                |
| Jardin de Flores               |
| Jardines y Mansiones Cactus SL |
| Lasas S.A.                     |
| Tendo Garden                   |
| Tutifruti S.A                  |
+--------------------------------+
13 rows in set (0.00 sec)


4. Devuelve el nombre del cliente, el nombre y primer apellido de su
representante de ventas y el número de teléfono de la oficina del
representante de ventas, de aquellos clientes que no hayan realizado ningún
pago.

mysql> SELECT
    ->     c.nombre AS nombre_cliente,
    ->     CONCAT(e.nombre, ' ', e.apellido1) AS nombre_representante,
    ->     tof.numero AS telefono_oficina_representante
    -> FROM
    ->     cliente c
    -> LEFT JOIN
    ->     empleado e ON c.empleado_id = e.id
    -> LEFT JOIN
    ->     telefono_oficina tof ON e.oficina_id = tof.oficina_id
    -> WHERE
    ->     c.id NOT IN (SELECT DISTINCT cliente_id FROM pago)
    -> ;
+-----------------------------+-------------------------+--------------------------------+
| nombre_cliente              | nombre_representante    | telefono_oficina_representante |
+-----------------------------+-------------------------+--------------------------------+
| Gardening Competitor        | Walter Santiago Sanchez | +1 650 219 4782                |
| Lasas S.A.                  | Mariano López           | +34 91 7514487                 |
| Club Golf Puerta del hierro | Emmanuel Magaña         | +34 93 3561182                 |
| DaraDistribuciones          | Emmanuel Magaña         | +34 93 3561182                 |
| Madrileña de riegos         | Emmanuel Magaña         | +34 93 3561182                 |
| Lasas S.A.                  | Mariano López           | +34 91 7514487                 |
| Flowers, S.A                | Felipe Rosas            | +34 925 867231                 |
| Naturajardin                | Julian Bellinelli       | +61 2 9264 2451                |
| Americh Golf Management SL  | José Manuel Martinez    | +34 93 3561182                 |
| Aloha                       | José Manuel Martinez    | +34 93 3561182                 |
| El Prat                     | José Manuel Martinez    | +34 93 3561182                 |
| Vivero Humanes              | Julian Bellinelli       | +61 2 9264 2451                |
| Fuenla City                 | Felipe Rosas            | +34 925 867231                 |
| Top Campo                   | Felipe Rosas            | +34 925 867231                 |
| Campohermoso                | Julian Bellinelli       | +61 2 9264 2451                |
| france telecom              | Lionel Narvaez          | +33 14 723 4404                |
| Musée du Louvre             | Lionel Narvaez          | +33 14 723 4404                |
| Flores S.L.                 | Michael Bolton          | +1 650 219 4782                |
| The Magic Garden            | Michael Bolton          | +1 650 219 4782                |
+-----------------------------+-------------------------+--------------------------------+
19 rows in set (0.02 sec)

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
nombre y primer apellido de su representante de ventas y la ciudad donde
está su oficina.


mysql> SELECT
    ->     c.nombre AS nombre_cliente,
    ->     CONCAT(e.nombre, ' ', e.apellido1) AS nombre_representante,
    ->     ci.nombre AS ciudad_oficina
    -> FROM
    ->     cliente c
    -> JOIN
    ->     empleado e ON c.empleado_id = e.id
    -> JOIN
    ->     direccion_oficina do ON e.oficina_id = do.oficina_id
    -> JOIN
    ->     ciudad ci ON do.ciudad_id = ci.id;
+--------------------------------+-------------------------+----------------------+
| nombre_cliente                 | nombre_representante    | ciudad_oficina       |
+--------------------------------+-------------------------+----------------------+
| GoldFish Garden                | Walter Santiago Sanchez | San Francisco        |
| Gardening Competitor           | Walter Santiago Sanchez | San Francisco        |
| Gardening Associates           | Walter Santiago Sanchez | San Francisco        |
| Gerudo Valley                  | Lorena Paxton           | Boston               |
| Tendo Garden                   | Lorena Paxton           | Boston               |
| Lasas S.A.                     | Mariano López           | Madrid               |
| Beragua                        | Emmanuel Magaña         | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel Magaña         | Barcelona            |
| Naturagua                      | Emmanuel Magaña         | Barcelona            |
| DaraDistribuciones             | Emmanuel Magaña         | Barcelona            |
| Madrileña de riegos            | Emmanuel Magaña         | Barcelona            |
| Lasas S.A.                     | Mariano López           | Madrid               |
| Camunas Jardines S.L.          | Mariano López           | Madrid               |
| Dardena S.A.                   | Mariano López           | Madrid               |
| Jardin de Flores               | Julian Bellinelli       | Sydney               |
| Flores Marivi                  | Felipe Rosas            | Talavera de la Reina |
| Flowers, S.A                   | Felipe Rosas            | Talavera de la Reina |
| Naturajardin                   | Julian Bellinelli       | Sydney               |
| Golf S.A.                      | José Manuel Martinez    | Barcelona            |
| Americh Golf Management SL     | José Manuel Martinez    | Barcelona            |
| Aloha                          | José Manuel Martinez    | Barcelona            |
| El Prat                        | José Manuel Martinez    | Barcelona            |
| Sotogrande                     | José Manuel Martinez    | Barcelona            |
| Vivero Humanes                 | Julian Bellinelli       | Sydney               |
| Fuenla City                    | Felipe Rosas            | Talavera de la Reina |
| Jardines y Mansiones Cactus SL | Lucio Campoamor         | Madrid               |
| Jardinerías Matías SL          | Lucio Campoamor         | Madrid               |
| Agrojardin                     | Julian Bellinelli       | Sydney               |
| Top Campo                      | Felipe Rosas            | Talavera de la Reina |
| Jardineria Sara                | Felipe Rosas            | Talavera de la Reina |
| Campohermoso                   | Julian Bellinelli       | Sydney               |
| france telecom                 | Lionel Narvaez          | Paris                |
| Musée du Louvre                | Lionel Narvaez          | Paris                |
| Tutifruti S.A                  | Mariko Kishi            | Sydney               |
| Flores S.L.                    | Michael Bolton          | San Francisco        |
| The Magic Garden               | Michael Bolton          | San Francisco        |
| El Jardin Viviente S.L         | Mariko Kishi            | Sydney               |
+--------------------------------+-------------------------+----------------------+
37 rows in set (0.18 sec)

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

mysql> SELECT
    ->     e.nombre,
    ->     e.apellido1,
    ->     e.apellido2,
    ->     p.puesto,
    ->     tof.numero AS telefono_oficina
    -> FROM
    ->     empleado e
    -> JOIN
    ->     puesto p ON e.puesto_id = p.id
    -> JOIN
    ->     telefono_oficina tof ON e.oficina_id = tof.oficina_id
    -> WHERE
    ->     e.id NOT IN (SELECT DISTINCT empleado_id FROM cliente WHERE empleado_id IS NOT NULL);
+-------------+------------+-----------+-----------------------+------------------+
| nombre      | apellido1  | apellido2 | puesto                | telefono_oficina |
+-------------+------------+-----------+-----------------------+------------------+
| Marcos      | Magaña     | Perez     | Director General      | +34 925 867231   |
| Carlos      | Soria      | Jimenez   | Director General      | +34 91 7514487   |
| Francois    | Fignon     |           | Director General      | +33 14 723 4404  |
| Hilary      | Washington |           | Director General      | +1 215 837 0825  |
| Nei         | Nishikori  |           | Director General      | +81 33 224 5000  |
| Amy         | Johnson    |           | Director General      | +44 20 78772041  |
| Kevin       | Fallmer    |           | Director General      | +61 2 9264 2451  |
| Ruben       | López      | Martinez  | Subdirector Marketing | +34 925 867231   |
| Alberto     | Soria      | Carrasco  | Subdirector Ventas    | +34 925 867231   |
| Maria       | Solís      | Jerez     | Secretaria            | +34 925 867231   |
| Juan Carlos | Ortiz      | Serrano   | Representante Ventas  | +34 925 867231   |
| Hilario     | Rodriguez  | Huertas   | Representante Ventas  | +34 91 7514487   |
| David       | Palma      | Aceituno  | Representante Ventas  | +34 93 3561182   |
| Oscar       | Palma      | Aceituno  | Representante Ventas  | +34 93 3561182   |
| Laurent     | Serra      |           | Representante Ventas  | +33 14 723 4404  |
| Marcus      | Paxton     |           | Representante Ventas  | +1 215 837 0825  |
| Narumi      | Riko       |           | Representante Ventas  | +81 33 224 5000  |
| Takuma      | Nomura     |           | Representante Ventas  | +81 33 224 5000  |
| Larry       | Westfalls  |           | Representante Ventas  | +44 20 78772041  |
| John        | Walton     |           | Representante Ventas  | +44 20 78772041  |
+-------------+------------+-----------+-----------------------+------------------+
20 rows in set (0.00 sec)

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
número de empleados que tiene.

mysql> SELECT
    ->     c.nombre AS ciudad,
    ->     COUNT(e.id) AS numero_empleados
    -> FROM
    ->     ciudad c
    -> JOIN
    ->     direccion_oficina do ON c.id = do.ciudad_id
    -> JOIN
    ->     empleado e ON do.oficina_id = e.oficina_id
    -> GROUP BY
    ->     c.id;
+----------------------+------------------+
| ciudad               | numero_empleados |
+----------------------+------------------+
| Barcelona            |                4 |
| Boston               |                3 |
| Londres              |                3 |
| Madrid               |                4 |
| Paris                |                3 |
| San Francisco        |                2 |
| Sydney               |                3 |
| Talavera de la Reina |                6 |
| Tokyo                |                3 |
+----------------------+------------------+
9 rows in set (0.00 sec)



