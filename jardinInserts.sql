USE gardenDb;
-- Inserts para la tabla 'oficina'
INSERT INTO oficina (nombre) VALUES ('BCN-ES');
INSERT INTO oficina (nombre) VALUES ('BOS-USA');
INSERT INTO oficina (nombre) VALUES ('LON-UK');
INSERT INTO oficina (nombre) VALUES ('MAD-ES');
INSERT INTO oficina (nombre) VALUES ('PAR-FR');
INSERT INTO oficina (nombre) VALUES ('SFC-USA');
INSERT INTO oficina (nombre) VALUES ('SYD-AU');
INSERT INTO oficina (nombre) VALUES ('TAL-ES');
INSERT INTO oficina (nombre) VALUES ('TOK-JP');

-- Inserts para la tabla 'pais'
INSERT INTO pais (nombre) VALUES ('España');
INSERT INTO pais (nombre) VALUES ('EEUU');
INSERT INTO pais (nombre) VALUES ('Inglaterra');
INSERT INTO pais (nombre) VALUES ('Francia');
INSERT INTO pais (nombre) VALUES ('Australia');
INSERT INTO pais (nombre) VALUES ('Japón');

-- Inserts para la tabla 'region'
INSERT INTO region (nombre) VALUES ('Barcelona');
INSERT INTO region (nombre) VALUES ('MA');
INSERT INTO region (nombre) VALUES ('EMEA');
INSERT INTO region (nombre) VALUES ('Madrid');
INSERT INTO region (nombre) VALUES ('Castilla-LaMancha');
INSERT INTO region (nombre) VALUES ('Chiyoda-Ku');

-- Inserts para la tabla 'ciudad'
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Barcelona', '08019');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Boston', '02108');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Londres', 'EC2N 1HN');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Madrid', '28032');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Paris', '75017');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('San Francisco', '94080');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Sydney', 'NSW 2010');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Talavera de la Reina', '45632');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Tokyo', '102-8578');

-- Inserts para la tabla 'tipo_telefono'
INSERT INTO tipo_telefono (tipo) VALUES ('Fijo');
INSERT INTO tipo_telefono (tipo) VALUES ('Movil');
INSERT INTO tipo_telefono (tipo) VALUES ('Fax');


-- Inserts para la tabla 'telefono_oficina'
-- Estos inserts asumen que todos los teléfonos son del tipo principal
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (1, 1, '+34 93 3561182');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (2, 2, '+1 215 837 0825');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (3, 3, '+44 20 78772041');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (4, 1, '+34 91 7514487');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (5, 2, '+33 14 723 4404');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (6, 3, '+1 650 219 4782');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (7, 1, '+61 2 9264 2451');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (8, 2, '+34 925 867231');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (9, 3, '+81 33 224 5000');

-- Inserts para la tabla 'direccion_oficina'
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (1, 1, 1, 1, 'Avenida Diagonal, 38 - 3A escalera Derecha');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (2, 2, 2, 2, '1550 Court Place - Suite 102');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (3, 3, 3, 3, '52 Old Broad Street - Ground Floor');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (4, 1, 4, 4, 'Bulevar Indalecio Prieto, 32');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (5, 4, 3, 5, '29 Rue Jouffroy d''abbans');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (6, 2, 2, 6, '100 Market Street - Suite 300');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (7, 5, 6, 7, '5-11 Wentworth Avenue - Floor #2');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (8, 1, 4, 8, 'Francisco Aguirre, 32 - 5º piso (exterior)');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (9, 6, 6, 9, '4-1 Kioicho');


-- Inserts para los puestos
INSERT INTO puesto (puesto) VALUES ('Director General');
INSERT INTO puesto (puesto) VALUES ('Subdirector Marketing');
INSERT INTO puesto (puesto) VALUES ('Subdirector Ventas');
INSERT INTO puesto (puesto) VALUES ('Secretaria');
INSERT INTO puesto (puesto) VALUES ('Representante Ventas');

-- Inserts para la tabla de empleados
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Marcos', 'Magaña', 'Perez', '3897', 'marcos@jardineria.es', 8, NULL, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Ruben', 'López', 'Martinez', '2899', 'rlopez@jardineria.es', 8, 1, 2);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Alberto', 'Soria', 'Carrasco', '2837', 'asoria@jardineria.es', 8, 2, 3);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Maria', 'Solís', 'Jerez', '2847', 'msolis@jardineria.es', 8, 2, 4);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Felipe', 'Rosas', 'Marquez', '2844', 'frosas@jardineria.es', 8, 3, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Juan Carlos', 'Ortiz', 'Serrano', '2845', 'cortiz@jardineria.es', 8, 3, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Carlos', 'Soria', 'Jimenez', '2444', 'csoria@jardineria.es', 4, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Mariano', 'López', 'Murcia', '2442', 'mlopez@jardineria.es', 4, 7, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Lucio', 'Campoamor', 'Martín', '2442', 'lcampoamor@jardineria.es', 4, 7, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Hilario', 'Rodriguez', 'Huertas', '2444', 'hrodriguez@jardineria.es', 4, 7, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Emmanuel', 'Magaña', 'Perez', '2518', 'manu@jardineria.es', 1, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'José Manuel', 'Martinez', 'De la Osa', '2519', 'jmmart@hotmail.es', 1, 11, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'David', 'Palma', 'Aceituno', '2519', 'dpalma@jardineria.es', 1, 11, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Oscar', 'Palma', 'Aceituno', '2519', 'opalma@jardineria.es', 1, 11, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Francois', 'Fignon', '', '9981', 'ffignon@gardening.com', 5, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Lionel', 'Narvaez', '', '9982', 'lnarvaez@gardening.com', 5, 15, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Laurent', 'Serra', '', '9982', 'lserra@gardening.com', 5, 15, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Michael', 'Bolton', '', '7454', 'mbolton@gardening.com', 6, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Walter Santiago', 'Sanchez', 'Lopez', '7454', 'wssanchez@gardening.com', 6, 18, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Hilary', 'Washington', '', '7565', 'hwashington@gardening.com', 2, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Marcus', 'Paxton', '', '7565', 'mpaxton@gardening.com', 2, 20, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Lorena', 'Paxton', '', '7665', 'lpaxton@gardening.com', 2, 20, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Nei', 'Nishikori', '', '8734', 'nnishikori@gardening.com', 9, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Narumi', 'Riko', '', '8734', 'nriko@gardening.com', 9, 23, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Takuma', 'Nomura', '', '8735', 'tnomura@gardening.com', 9, 23, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Amy', 'Johnson', '', '3321', 'ajohnson@gardening.com', 3, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Larry', 'Westfalls', '', '3322', 'lwestfalls@gardening.com', 3, 26, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'John', 'Walton', '', '3322', 'jwalton@gardening.com', 3, 26, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Kevin', 'Fallmer', '', '3210', 'kfalmer@gardening.com', 7, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Julian', 'Bellinelli', '', '3211', 'jbellinelli@gardening.com', 7, 29, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Mariko', 'Kishi', '', '3211', 'mkishi@gardening.com', 7, 29, 5);

-- insert gama_producto 
INSERT INTO gama_producto(nombre,descripcion_texto, descripcion_html, imagen) VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto(nombre,descripcion_texto, descripcion_html, imagen) VALUES ('Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO gama_producto(nombre,descripcion_texto, descripcion_html, imagen) VALUES ('Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO gama_producto(nombre,descripcion_texto, descripcion_html, imagen) VALUES ('Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO gama_producto(nombre,descripcion_texto, descripcion_html, imagen) VALUES ('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);
-- insert contacto
INSERT INTO contacto (nombre, apellido, email) VALUES ('Daniel G', 'GoldFish', 'danielg.goldfish@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Anne', 'Wright', 'anne.wright@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Link', 'Flaute', 'link.flaute@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Akane', 'Tendo', 'akane.tendo@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Antonio', 'Lasas', 'antonio.lasas@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Jose', 'Bermejo', 'jose.bermejo@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Paco', 'Lopez', 'paco.lopez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Guillermo', 'Rengifo', 'guillermo.rengifo@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('David', 'Serrano', 'david.serrano@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Jose', 'Tacaño', 'jose.tacano@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Pedro', 'Camunas', 'pedro.camunas@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Juan', 'Rodriguez', 'juan.rodriguez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Javier', 'Villar', 'javier.villar@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Maria', 'Rodriguez', 'maria.rodriguez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Beatriz', 'Fernandez', 'beatriz.fernandez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Victoria', 'Cruz', 'victoria.cruz@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Luis', 'Martinez', 'luis.martinez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Mario', 'Suarez', 'mario.suarez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Cristian', 'Rodrigez', 'cristian.rodriguez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Francisco', 'Camacho', 'francisco.camacho@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Maria', 'Santillana', 'maria.santillana@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Federico', 'Gomez', 'federico.gomez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Tony', 'Muñoz Mena', 'tony.munoz@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Eva María', 'Sánchez', 'eva.sanchez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Matías', 'San Martín', 'matias.sanmartin@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Benito', 'Lopez', 'benito.lopez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Joseluis', 'Sanchez', 'joseluis.sanchez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Sara', 'Marquez', 'sara.marquez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Luis', 'Jimenez', 'luis.jimenez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('FraÃ§ois', 'Toulou', 'francois.toulou@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Pierre', 'Delacroux', 'pierre.delacroux@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Jacob', 'Jones', 'jacob.jones@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Antonio', 'Romero', 'antonio.romero@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Richard', 'Mcain', 'richard.mcain@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Justin', 'Smith', 'justin.smith@example.com');


-- insert cliente
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (1, 'GoldFish Garden', 1, 19, 3000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (2, 'Gardening Competitor', 2, 19, 6000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (3, 'Gardening Associates', 2, 19, 6000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (4, 'Gerudo Valley', 3, 22, 12000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (5, 'Tendo Garden', 4, 22, 600000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (6, 'Lasas S.A.', 5, 8, 154310.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (7, 'Beragua', 6, 11, 20000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (8, 'Club Golf Puerta del hierro', 7, 11, 40000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (9, 'Naturagua', 8, 11, 32000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (10, 'DaraDistribuciones', 9, 11, 50000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (11, 'Madrileña de riegos', 10, 11, 20000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (12, 'Lasas S.A.', 5, 8, 154310.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (13, 'Camunas Jardines S.L.', 11, 8, 16481.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (14, 'Dardena S.A.', 12, 8, 321000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (15, 'Jardin de Flores', 13, 30, 40000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (16, 'Flores Marivi', 14, 5, 1500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (17, 'Flowers, S.A', 15, 5, 3500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (18, 'Naturajardin', 16, 30, 5050.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (19, 'Golf S.A.', 17, 12, 30000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (20, 'Americh Golf Management SL', 18, 12, 20000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (21, 'Aloha', 19, 12, 50000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (22, 'El Prat', 20, 12, 30000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (23, 'Sotogrande', 21, 12, 60000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (24, 'Vivero Humanes', 22, 30, 7430.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (25, 'Fuenla City', 23, 5, 4500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (26, 'Jardines y Mansiones Cactus SL', 24, 9, 76000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (27, 'Jardinerías Matías SL', 25, 9, 100500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (28, 'Agrojardin', 26, 30, 8040.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (29, 'Top Campo', 27, 5, 5500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (30, 'Jardineria Sara', 28, 5, 7500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (31, 'Campohermoso', 29, 30, 3250.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (32, 'france telecom', 30, 16, 10000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (33, 'Musée du Louvre', 31, 16, 30000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (35, 'Tutifruti S.A', 32, 31, 10000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (36, 'Flores S.L.', 33, 18, 6000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (37, 'The Magic Garden', 34, 18, 10000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (38, 'El Jardin Viviente S.L', 35, 31, 8000.00);

-- insert telefono_cliente

-- Fijo
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (1, 1, '5556901745');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (2, 1, '5557410359');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (3, 1, '5557410345');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (4, 1, '5552323129');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (5, 1, '55591233210');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (6, 1, '34916540145');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (7, 1, '654987321');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (8, 1, '62456810');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (9, 1, '689234750');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (10, 1, '675598001');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (11, 1, '655983045');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (12, 1, '34916540146');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (13, 1, '34914873241');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (14, 1, '34912453217');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (15, 1, '654865643');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (16, 1, '666555444');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (17, 1, '698754159');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (18, 1, '612343529');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (19, 1, '916458762');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (20, 1, '964493072');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (21, 1, '916485852');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (22, 1, '916882323');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (23, 1, '915576622');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (24, 1, '654987690');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (25, 1, '675842139');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (26, 1, '916877445');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (27, 1, '916544147');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (28, 1, '675432926');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (29, 1, '685746512');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (30, 1, '675124537');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (31, 1, '645925376');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (32, 1, '(33)5120578961');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (33, 1, '(33)0140205050');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (35, 1, '2 9261-2433');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (36, 1, '654352981');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (37, 1, '926523468');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (38, 1, '2 8005-7161');

-- Fax
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (1, 3, '5556901746');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (2, 3, '5557410357');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (3, 3, '5557410346');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (4, 3, '5552323128');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (5, 3, '55591233211');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (6, 3, '34914851312');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (7, 3, '916549872');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (8, 3, '919535678');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (9, 3, '916428956');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (10, 3, '916421756');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (11, 3, '916689215');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (12, 3, '34914851313');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (13, 3, '34914871541');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (14, 3, '34912484764');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (15, 3, '914538776');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (16, 3, '912458657');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (17, 3, '978453216');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (18, 3, '916548735');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (19, 3, '912354475');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (20, 3, '964493063');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (21, 3, '914489898');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (22, 3, '916493211');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (23, 3, '914825645');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (24, 3, '916040875');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (25, 3, '915483754');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (26, 3, '914477777');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (27, 3, '917897474');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (28, 3, '916549264');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (29, 3, '974315924');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (30, 3, '912475843');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (31, 3, '916159116');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (32, 3, '(33)5120578962');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (33, 3, '(33)0140205442');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (35, 3, '2 9283-1695');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (36, 3, '685249700');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (37, 3, '9364875882');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (38, 3, '2 8005-7162');

-- insert direccion cliente

INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (1, 2, 4, 6, 'False Street 52 2 A');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (2, 2, 4, 6, 'Wall-e Avenue');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (3, 2, 4, 6, 'Wall-e Avenue');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (4, 2, 4, 6, 'Oaks Avenue nº22');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (5, 2, 4, 6, 'Null Street nº69');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (6, 1, 4, 4, 'C/Leganes 15');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (7, 1, 4, 4, 'C/pintor segundo');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (8, 1, 4, 4, 'C/sinesio delgado');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (9, 1, 4, 4, 'C/majadahonda');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (10, 1, 4, 4, 'C/azores');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (11, 1, 4, 4, 'C/Lagañas');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (12, 1, 4, 4, 'C/Leganes 15');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (13, 1, 4, 4, 'C/Virgenes 45');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (14, 1, 4, 4, 'C/Nueva York 74');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (15, 1, 4, 4, 'C/ Oña 34');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (16, 1, 4, 4, 'C/Leganes24');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (17, 1, 4, 4, 'C/Luis Salquillo4');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (18, 1, 4, 4, 'Plaza Magallón 15');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (19, 1, 4, 4, 'C/Estancado');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (20, 1, 1, 1, 'C/Letardo');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (21, 1, 1, 1, 'C/Roman 3');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (22, 1, 1, 1, 'Avenida Tibidabo');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (23, 1, 4, 4, 'C/Paseo del Parque');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (24, 1, 4, 4, 'C/Miguel Echegaray 54');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (25, 1, 4, 4, 'C/Callo 52');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (26, 1, 4, 4, 'Polígono Industrial Maspalomas, Nº52');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (27, 1, 4, 4, 'C/Francisco Arce, Nº44');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (28, 1, 4, 4, 'C/Mar Caspio 43');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (29, 1, 4, 4, 'C/Ibiza 32');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (30, 1, 4, 4, 'C/Lima 1');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (31, 1, 4, 4, 'C/Peru 78');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (32, 4, 4, 5, '6 place d Alleray 15Ã¨me');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (33, 4, 4, 5, 'Quai du Louvre');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (35, 5, 5, 7, 'level 24, St. Martins Tower.-31 Market St.');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (36, 1, 4, 4, 'Avenida España');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (37, 3, 3, 3, 'Lihgting Park');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (38, 5, 5, 7, '176 Cumberland Street The rocks');
-- insert estado_pedido 

INSERT INTO estado_pedido (estado) VALUES ('Entregado');
INSERT INTO estado_pedido (estado) VALUES ('Rechazado');
INSERT INTO estado_pedido (estado) VALUES ('Pendiente');
-- insert forma_pago
INSERT INTO forma_pago (forma)
VALUES
('PayPal'),
('Transferencia'),
('Cheque');

-- insert tipo_pago
INSERT INTO tipo_pago (tipo)
VALUES
('Pago en línea'),
('Transferencia bancaria'),
('Pago con cheque');

-- insert pago
-- Para relacionar los inserts de la tabla pago con las otras tablas
INSERT INTO pago (cliente_id, forma_pago_id, tipo_pago_id, fecha_pago, total)
VALUES
(1, 1, 1, '2008-11-10', 2000),
(1, 1, 1, '2008-12-10', 2000),
(3, 1, 1, '2009-01-16', 5000),
(3, 1, 1, '2009-02-16', 5000),
(3, 1, 1, '2009-02-19', 926),
(4, 1, 1, '2007-01-08', 20000),
(4, 1, 1, '2007-01-08', 20000),
(4, 1, 1, '2007-01-08', 20000),
(4, 1, 1, '2007-01-08', 20000),
(4, 1, 1, '2007-01-08', 1849),
(5, 2, 2, '2006-01-18', 23794),
(7, 3, 3, '2009-01-13', 2390),
(9, 1, 1, '2009-01-06', 929),
(13, 1, 1, '2008-08-04', 2246),
(14, 1, 1, '2008-07-15', 4160),
(15, 1, 1, '2009-01-15', 2081),
(15, 1, 1, '2009-02-15', 10000),
(16, 1, 1, '2009-02-16', 4399),
(19, 1, 1, '2009-03-06', 232),
(23, 1, 1, '2009-03-26', 272),
(26, 1, 1, '2008-03-18', 18846),
(27, 1, 1, '2009-02-08', 10972),
(28, 1, 1, '2009-01-13', 8489),
(30, 1, 1, '2009-01-16', 7863),
(35, 1, 1, '2007-10-06', 3321),
(38, 1, 1, '2006-05-26', 1171);



-- Insertar los registros en la tabla pedido
INSERT INTO pedido (id, fecha_pedido, fecha_esperada, fecha_entrega, estado_pedido_id, cliente_id, comentarios)
VALUES
(1, '2006-01-17', '2006-01-19', '2006-01-19', 1, 5, 'Pagado a plazos'),
(2, '2007-10-23', '2007-10-28', '2007-10-26', 1, 5, 'La entrega llego antes de lo esperado'),
(3, '2008-06-20', '2008-06-25', NULL, 2, 5, 'Limite de credito superado'),
(4, '2009-01-20', '2009-01-26', NULL, 3, 5, NULL),
(8, '2008-11-09', '2008-11-14', '2008-11-14', 1, 1, 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas'),
(9, '2008-12-22', '2008-12-27', '2008-12-28', 1, 1, 'El cliente comprueba la integridad del paquete, todo correcto'),
(10, '2009-01-15', '2009-01-20', NULL, 3, 3, 'El cliente llama para confirmar la fecha - Esperando al proveedor'),
(11, '2009-01-20', '2009-01-27', NULL, 3, 1, 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h'),
(12, '2009-01-22', '2009-01-27', NULL, 3, 1, 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h'),
(13, '2009-01-12', '2009-01-14', '2009-01-15', 1, 7, NULL),
(14, '2009-01-02', '2009-01-02', NULL, 2, 7, 'mal pago'),
(15, '2009-01-09', '2009-01-12', '2009-01-11', 1, 7, NULL),
(16, '2009-01-06', '2009-01-07', '2009-01-15', 1, 7, NULL),
(17, '2009-01-08', '2009-01-09', '2009-01-11', 1, 7, 'mal estado'),
(18, '2009-01-05', '2009-01-06', '2009-01-07', 1, 9, NULL),
(19, '2009-01-18', '2009-02-12', NULL, 3, 9, 'entregar en murcia'),
(20, '2009-01-20', '2009-02-15', NULL, 3, 9, NULL),
(21, '2009-01-09', '2009-01-09', '2009-01-09', 2, 9, 'Mal pago'),
(22, '2009-01-11', '2009-01-11', '2009-01-13', 1, 1, NULL),
(23, '2008-12-30', '2009-01-10', NULL, 2, 2, 'El pedido fue anulado por el cliente'),
(24, '2008-07-14', '2008-07-31', '2008-07-25', 1, 1, NULL),
(25, '2009-02-02', '2009-02-08', NULL, 2, 3, 'El cliente carece de saldo en la cuenta asociada'),
(26, '2009-02-06', '2009-02-12', NULL, 2, 4, 'El cliente anula la operación para adquirir más producto'),
(27, '2009-02-07', '2009-02-13', NULL, 1, 4, 'El pedido aparece como entregado pero no sabemos en qué fecha'),
(28, '2009-02-10', '2009-02-17', '2009-02-20', 1, 4, 'El cliente se queja bastante de la espera asociada al producto'),
(29, '2008-08-01', '2008-09-01', '2008-09-01', 2, 6, 'El cliente no está conforme con el pedido'),
(30, '2008-08-03', '2008-09-03', '2008-08-31', 1, 5, NULL),
(31, '2008-09-04', '2008-09-30', '2008-10-04', 2, 5, 'El cliente ha rechazado por llegar 5 días tarde'),
(32, '2007-01-07', '2007-01-19', '2007-01-27', 1, 3, 'Entrega tardía, el cliente puso reclamación'),
(33, '2007-05-20', '2007-05-28', NULL, 2, 3, 'El pedido fue anulado por el cliente'),
(34, '2007-06-20', '2008-06-28', '2008-06-28', 1, 3, 'Pagado a plazos'),
(35, '2008-03-10', '2009-03-20', NULL, 2, 3, 'Límite de crédito superado'),
(36, '2008-10-15', '2008-12-15', '2008-12-10', 1, 1, NULL),
(37, '2008-11-03', '2009-11-13', NULL, 3, 2, 'El pedido nunca llegó a su destino'),
(38, '2009-03-05', '2009-03-06', '2009-03-07', 1, 5, NULL),
(39, '2009-03-06', '2009-03-07', '2009-03-09', 3, 5, NULL),
(40, '2009-03-09', '2009-03-10', '2009-03-13', 2, 5, NULL),
(41, '2009-03-12', '2009-03-13', '2009-03-13', 1, 19, NULL),
(42, '2009-03-22', '2009-03-23', '2009-03-27', 1, 19, NULL),
(43, '2009-03-25', '2009-03-26', '2009-03-28', 3, 23, NULL),
(44, '2009-03-26', '2009-03-27', '2009-03-30', 3, 23, NULL),
(45, '2009-04-01', '2009-03-04', '2009-03-07', 1, 23, NULL),
(46, '2009-04-03', '2009-03-04', '2009-03-05', 2, 23, NULL),
(47, '2009-04-15', '2009-03-17', '2009-03-17', 1, 23, NULL),
(48, '2008-03-17', '2008-03-30', '2008-03-29', 1, 26, 'Según el Cliente, el pedido llegó defectuoso'),
(49, '2008-07-12', '2008-07-22', '2008-07-30', 1, 26, 'El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora'),
(50, '2008-03-17', '2008-08-09', NULL, 3, 26, 'Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)'),
(51, '2008-10-01', '2008-10-14', '2008-10-14', 1, 26, 'Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de las carreteras.'),
(52, '2008-12-07', '2008-12-21', NULL, 3, 26, 'El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado.'),
(53, '2008-10-15', '2008-11-15', '2008-11-09', 1, 13, 'El pedido llega 6 dias antes'),
(54, '2009-01-11', '2009-02-11', NULL, 3, 14, NULL),
(55, '2008-12-10', '2009-01-10', '2009-01-11', 1, 14, 'Retrasado 1 dia por problemas de transporte'),
(56, '2008-12-19', '2009-01-20', NULL, 2, 13, 'El cliente a anulado el pedido el dia 2009-01-10'),
(57, '2009-01-05', '2009-02-05', NULL, 3, 13, NULL),
(58, '2009-01-24', '2009-01-31', '2009-01-30', 1, 3, 'Todo correcto'),
(59, '2008-11-09', '2008-11-14', '2008-11-14', 1, 1, 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas'),
(60, '2008-12-22', '2008-12-27', '2008-12-28', 1, 1, 'El cliente comprueba la integridad del paquete, todo correcto'),
(61, '2009-01-15', '2009-01-20', NULL, 3, 3, 'El cliente llama para confirmar la fecha - Esperando al proveedor'),
(62, '2009-01-20', '2009-01-27', NULL, 3, 1, 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h'),
(63, '2009-01-22', '2009-01-27', NULL, 3, 1, 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h'),
(64, '2009-01-24', '2009-01-31', '2009-01-30', 1, 1, 'Todo correcto'),
(65, '2009-02-02', '2009-02-08', NULL, 2, 1, 'El cliente carece de saldo en la cuenta asociada'),
(66, '2009-02-06', '2009-02-12', NULL, 2, 3, 'El cliente anula la operacion para adquirir mas producto'),
(67, '2009-02-07', '2009-02-13', NULL, 1, 3, 'El pedido aparece como entregado pero no sabemos en que fecha'),
(68, '2009-02-10', '2009-02-17', '2009-02-20', 1, 3, 'El cliente se queja bastante de la espera asociada al producto'),
(74, '2009-01-14', '2009-01-22', NULL, 2, 15, 'El pedido no llego el dia que queria el cliente por fallo del transporte'),
(75, '2009-01-11', '2009-01-13', '2009-01-13', 1, 15, 'El pedido llego perfectamente'),
(76, '2008-11-15', '2008-11-23', '2008-11-23', 1, 15, NULL),
(77, '2009-01-03', '2009-01-08', NULL, 3, 15, 'El pedido no pudo ser entregado por problemas meteorologicos'),
(78, '2008-12-15', '2008-12-17', '2008-12-17', 1, 15, 'Fue entregado, pero faltaba mercancia que sera entregada otro dia'),
(79, '2009-01-12', '2009-01-13', '2009-01-13', 1, 28, NULL),
(80, '2009-01-25', '2009-01-26', NULL, 3, 28, 'No terminó el pago'),
(81, '2009-01-18', '2009-01-24', NULL, 2, 28, 'Los producto estaban en mal estado'),
(82, '2009-01-20', '2009-01-29', '2009-01-29', 1, 28, 'El pedido llego un poco mas tarde de la hora fijada'),
(83, '2009-01-24', '2009-01-28', NULL, 1, 28, NULL),
(89, '2007-10-05', '2007-12-13', '2007-12-10', 1, 35, 'La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho'),
(90, '2009-02-07', '2008-02-17', NULL, 3, 27, 'Debido a la nevada caída en la sierra, el pedido no podrá llegar hasta el día'),
(91, '2009-03-18', '2009-03-29', '2009-03-27', 1, 27, 'Todo se entregó a su debido tiempo, incluso con un día de antelación'),
(92, '2009-04-19', '2009-04-30', '2009-05-03', 1, 27, 'El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas'),
(93, '2009-05-03', '2009-05-30', '2009-05-17', 1, 27, 'El pedido se entregó antes de lo esperado.'),
(94, '2009-10-18', '2009-11-01', NULL, 3, 27, 'El pedido está en camino.'),
(95, '2008-01-04', '2008-01-19', '2008-01-19', 1, 35, NULL),
(96, '2008-03-20', '2008-04-12', '2008-04-13', 1, 35, 'La entrega se retraso un dia'),
(97, '2008-10-08', '2008-11-25', '2008-11-25', 1, 35, NULL),
(98, '2009-01-08', '2009-02-13', NULL, 3, 35, NULL),
(99, '2009-02-15', '2009-02-27', NULL, 3, 16, NULL),
(100, '2009-01-10', '2009-01-15', '2009-01-15', 1, 16, 'El pedido llego perfectamente'),
(101, '2009-03-07', '2009-03-27', NULL, 2, 16, 'El pedido fue rechazado por el cliente'),
(102, '2008-12-28', '2009-01-08', '2009-01-08', 1, 16, 'Pago pendiente'),
(103, '2009-01-15', '2009-01-20', '2009-01-24', 3, 30, NULL),
(104, '2009-03-02', '2009-03-06', '2009-03-06', 1, 30, NULL),
(105, '2009-02-14', '2009-02-20', NULL, 2, 30, 'el producto ha sido rechazado por la pesima calidad'),
(106, '2009-05-13', '2009-05-15', '2009-05-20', 3, 30, NULL),
(107, '2009-04-06', '2009-04-10', '2009-04-10', 1, 30, NULL),
(108, '2009-04-09', '2009-04-15', '2009-04-15', 1, 16, NULL),
(109, '2006-05-25', '2006-07-28', '2006-07-28', 1, 38, NULL),
(110, '2007-03-19', '2007-04-24', '2007-04-24', 1, 38, NULL),
(111, '2008-03-05', '2008-03-30', '2008-03-30', 1, 36, NULL),
(112, '2009-03-05', '2009-04-06', '2009-05-07', 3, 36, NULL),
(113, '2008-10-28', '2008-11-09', '2009-01-09', 2, 36, 'El producto ha sido rechazado por la tardanza de el envio'),
(114, '2009-01-15', '2009-01-29', '2009-01-31', 1, 36, 'El envio llego dos dias más tarde debido al mal tiempo'),
(115, '2008-11-29', '2009-01-26', '2009-02-27', 3, 36, NULL),
(116, '2008-06-28', '2008-08-01', '2008-08-01', 1, 38, NULL),
(117, '2008-08-25', '2008-10-01', NULL, 2, 38, 'El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente'),
(118, '2009-02-15', '2009-02-27', NULL, 3, 16, NULL),
(119, '2009-01-10', '2009-01-15', '2009-01-15', 1, 16, 'El pedido llego perfectamente'),
(120, '2009-03-07', '2009-03-27', NULL, 2, 16, 'El pedido fue rechazado por el cliente'),
(121, '2008-12-28', '2009-01-08', '2009-01-08', 1, 16, 'Pago pendiente'),
(122, '2009-04-09', '2009-04-15', '2009-04-15', 1, 16, NULL),
(123, '2009-01-15', '2009-01-20', '2009-01-24', 3, 30, NULL),
(124, '2009-03-02', '2009-03-06', '2009-03-06', 1, 30, NULL),
(125, '2009-02-14', '2009-02-20', NULL, 2, 30, 'el producto ha sido rechazado por la pesima calidad'),
(126, '2009-05-13', '2009-05-15', '2009-05-20', 3, 30, NULL),
(127, '2009-04-06', '2009-04-10', '2009-04-10', 1, 30, NULL),
(128, '2008-11-10', '2008-12-10', '2008-12-29', 2, 38, 'El pedido ha sido rechazado por el cliente por el retraso en la entrega');

-- Asegúrate de seguir insertando los demás registros de pedido, ajustando los valores según corresponda


-- insert para productos por medio de un procedure
DELIMITER //

CREATE PROCEDURE generarProductos()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE nombre VARCHAR(50);
    DECLARE gama_id INT;
    DECLARE dimensiones VARCHAR(25);
    DECLARE descripcion TEXT;
    DECLARE cantidad_en_stock SMALLINT;

    WHILE i <= 275 DO
        -- Asignar valores aleatorios o basados en alguna lógica
        SET nombre = CONCAT('Producto ', i);
        SET gama_id = FLOOR(RAND() * 5) + 1;
        SET dimensiones = CONCAT(FLOOR(RAND() * 50) + 1, 'x', FLOOR(RAND() * 50) + 1, 'x', FLOOR(RAND() * 50) + 1);
        SET descripcion = CONCAT('Descripción del producto ', i);
        SET cantidad_en_stock = FLOOR(RAND() * 150) + 50;

        -- Insertar el nuevo producto
        INSERT INTO producto (id, nombre, gama_id, dimensiones, descripcion, cantidad_en_stock)
        VALUES (i, nombre, gama_id, dimensiones, descripcion, cantidad_en_stock);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
-- insert proveedor por medio de un procedureDELIMITER //
DELIMITER //

CREATE PROCEDURE generarProveedor()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE nombre_proveedor VARCHAR(70);

    WHILE i <= 275 DO
        -- Construir el nombre del proveedor
        SET nombre_proveedor = CONCAT('Proveedor', i);

        -- Insertar el nuevo proveedor
        INSERT INTO proveedor (nombre) VALUES (nombre_proveedor);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;


-- insert en precio por medio de procedures
DELIMITER //

CREATE PROCEDURE generarPrecio()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE precio_venta DECIMAL(15, 2);
    DECLARE precio_proveedor DECIMAL(15, 2);

    WHILE i <= 275 DO
        SET precio_venta = ROUND(RAND() * (150 - 1) + 1, 2);
        SET precio_proveedor = ROUND(RAND() * (150 - 1) + 1, 2);

        INSERT INTO precio (producto_id, precio_venta, proveedor_id, precio_proveedor)
        VALUES (i, precio_venta, i, precio_proveedor);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;


-- insercion direccion proveedor por medio de procedures
DELIMITER //

CREATE PROCEDURE generarDireccionProveedor()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE proveedor_id INT;
    DECLARE pais_id INT;
    DECLARE region_id INT;
    DECLARE ciudad_id INT;
    DECLARE detalle_texto VARCHAR(255);

    WHILE i <= 275 DO
        -- Asignar valores a las variables
        SET proveedor_id = i;
        SET pais_id = 1 + (i % 6);
        SET region_id = 1 + (i % 6);
        SET ciudad_id = 1 + (i % 9);
        SET detalle_texto = CONCAT('Detalle', i);

        -- Insertar nuevo registro en la tabla direccion_proveedor
        INSERT INTO direccion_proveedor (proveedor_id, pais_id, region_id, ciudad_id, detalle)
        VALUES (proveedor_id, pais_id, region_id, ciudad_id, detalle_texto);

        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- insert telefono_provedor por medio de proceduresDELIMITER //

DELIMITER //

CREATE PROCEDURE generarTelefonosProveedor()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE tipo_telefono INT;
    DECLARE telefono VARCHAR(50);

    WHILE contador <= 275 DO
        SET tipo_telefono = FLOOR(RAND() * 3) + 1;
        SET telefono = LPAD(FLOOR(RAND() * 999999999999999), 15, '0');

        INSERT INTO telefono_proveedor (proveedor_id, tipo_id, numero)
        VALUES (contador, tipo_telefono, telefono);

        SET contador = contador + 1;
    END WHILE;
END //

DELIMITER ;


-- insert detalle_pedido por medio de procedures

DELIMITER //

CREATE PROCEDURE generarDetallePedido()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE producto_id INT DEFAULT 1; -- Start with 1
    DECLARE pedido_id INT; -- must exist
    DECLARE cantidad INT; -- 1 to 10
    DECLARE numero_linea INT; -- not to repeat
    DECLARE contador2 INT;
    -- Variable to store the total quantity of orders
    DECLARE total_pedidos INT;
    DECLARE pedidoCursor INT; -- Correctly declared

    -- Count the total quantity of orders
    SELECT COUNT(*) INTO total_pedidos FROM pedido;

    WHILE contador <= 60 DO
        -- Select an existing order randomly
        SET pedidoCursor = (contador % total_pedidos) + 1;
        SELECT id INTO pedido_id FROM pedido LIMIT pedidoCursor, 1;
        
        SET contador2 = 0;
        SET numero_linea = (contador % 5) + 1;        
        WHILE contador2 < 4 DO
            SET cantidad = ROUND(RAND() * 10) + 1;
            -- Insert order detail with current producto_id and increment producto_id
            INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad, numero_linea)
            VALUES (pedido_id, producto_id, cantidad, numero_linea);
            SET producto_id = producto_id + 1; -- Increment for the next product
            SET contador2 = contador2 + 1;
        END WHILE;

        SET contador = contador + 1;
    END WHILE;
END //

DELIMITER ;

CALL generarProductos();
CALL generarProveedor();
CALL generarPrecio();
CALL generarDireccionProveedor();
CALL generarTelefonosProveedor();
CALL generarDetallePedido();
