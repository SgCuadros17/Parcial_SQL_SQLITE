BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Clientes" (
	"id_cliente"	INTEGER,
	"nombre"	TEXT NOT NULL,
	"correo"	TEXT,
	"telefono"	TEXT,
	PRIMARY KEY("id_cliente" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Detalles_Pedido" (
	"id_detalle"	INTEGER,
	"id_pedido"	INTEGER,
	"id_producto"	INTEGER,
	"cantidad"	INTEGER,
	"subtotal"	REAL,
	PRIMARY KEY("id_detalle" AUTOINCREMENT),
	FOREIGN KEY("id_pedido") REFERENCES "Pedidos"("id_pedido"),
	FOREIGN KEY("id_producto") REFERENCES "Productos"("id_producto")
);
CREATE TABLE IF NOT EXISTS "Pedidos" (
	"id_pedido"	INTEGER,
	"id_cliente"	INTEGER,
	"fecha"	TEXT,
	"total"	REAL,
	PRIMARY KEY("id_pedido" AUTOINCREMENT),
	FOREIGN KEY("id_cliente") REFERENCES "Clientes"("id_cliente")
);
CREATE TABLE IF NOT EXISTS "Productos" (
	"id_producto"	INTEGER,
	"nombre"	TEXT NOT NULL,
	"precio"	REAL,
	"stock"	INTEGER,
	PRIMARY KEY("id_producto" AUTOINCREMENT)
);
INSERT INTO "Clientes" VALUES (1,'Juan Perez','juan@mail.com','123456');
INSERT INTO "Clientes" VALUES (2,'Maria Lopez','maria@mail.com','654321');
INSERT INTO "Detalles_Pedido" VALUES (1,1,1,1,1500.0);
INSERT INTO "Detalles_Pedido" VALUES (2,1,2,2,40.0);
INSERT INTO "Pedidos" VALUES (1,1,'2024-05-20',1540.0);
INSERT INTO "Productos" VALUES (1,'Laptop',1500.0,10);
INSERT INTO "Productos" VALUES (2,'Mouse',20.0,50);
INSERT INTO "Productos" VALUES (3,'Teclado',50.0,30);
COMMIT;

-- CONSULTAS DEL PARCIAL --
-- 1. Listar todos los clientes
SELECT * FROM Clientes;
 
-- 2. Listado de pedidos con nombre del cliente
SELECT Pedidos.id_pedido, Clientes.nombre, Pedidos.fecha, Pedidos.total
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente;
 
-- 3. Productos comprados en cada pedido
SELECT Productos.nombre, Detalles_Pedido.cantidad, Detalles_Pedido.subtotal
FROM Detalles_Pedido
JOIN Productos ON Detalles_Pedido.id_producto = Productos.id_producto;