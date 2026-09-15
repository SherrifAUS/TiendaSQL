--PASO 1: Crear Base de Datos
create database retail_project;

--PASO 2: Crear Tablas - DDL Estructura de tablas
create table clientes 
	(
	idCliente serial primary key,
	nombreCliente varchar(50) not null,
	apellidoCliente varchar(50) not null,
	edad int not null check (edad > 0),
	email varchar(254) not null unique,
	direccion varchar(50) not null,
 	ciudad varchar(50) not null,
 	cp varchar(50) not null,
 	pais text not null
	);

create table productos 
	(
	idProducto serial primary key,
	descripcion varchar(50) not null,
	precio decimal(15,2) check (precio > 0.00),
	stock int check (stock >= 0)
	);

create table ventas 
	(
	idVenta serial primary key,
	fechaVenta timestamp not null,
	cantidad int not null check (cantidad > 0),
	total decimal(10,2) not null check (total > 0),
	--PASO 3: Determinar Claves Foranias (FK) con 'references'
	idCliente int not null references clientes(idCliente),
	idProducto int not null references productos(idProducto)
	);

--PASO 4:  Insertar 5 datos para las 3 tablas

begin;
	insert into clientes(nombreCliente,apellidoCliente, edad, email, direccion, ciudad, cp, pais)
	values 
	('Juan', 'Pérez', 30, 'juan.perez@mail.com', 'Av. Corrientes 1234', 'CABA', 'C1043', 'Argentina'),
	('Sofía', 'Gómez', 25, 'sofia.gomez@mail.com', 'Calle Ficticia 456', 'Pilar', 'B1629', 'Argentina'),
	('Liam', 'O''Connor', 28, 'liam.oconnor@mail.com', '124 Dublin St', 'Dublin', 'D02X285', 'Irlanda'),
	('Mateo', 'Silva', 31, 'mateo.silva@mail.com', 'Av. Paulista 1000', 'São Paulo', '01310-100', 'Brazil'),
	('Chloé', 'Moreau', 23, 'chloe.moreau@mail.com', '15 Rue de Rivoli', 'Paris', '75004', 'Francia');
	
	insert into productos(descripcion, precio, stock)
	values 
	('Mate de calabaza tradicional', 15000.50, 25),
	('Mechanical Keyboard RGB', 129.99, 50),
	('Wireless Noise-Canceling Headphones', 249.50, 30),
	('USB-C Docking Station 12-in-1', 89.00, 75),
	('Portable SSD 1TB NVMe', 110.00, 60),
	('Consola PS5', 666666, 696);
	
	insert into ventas(fechaVenta, cantidad, total, idCliente, idProducto)
	values 
	('2026-06-10 14:30:00', 1, 15000.50, 1, 1),
	('2026-06-11 10:15:00', 2, 499.00, 2, 2),
	('2026-06-12 18:45:00', 1, 89.00, 3, 3),
	('2026-06-13 09:00:00', 3, 179.97, 4, 4),
	('2026-06-14 20:10:00', 1, 110.00, 5, 5);
	
commit; 

--PASO 5: Implementacion de un UPDATE masivo de precios con WHERE
update productos set precio = precio * 1.15 where precio >= 240;

select * from productos p;
--PASO 6: Implementacion de un DELETE de un registro de prueba con WHERE
delete from productos where precio = (select max(precio) from productos p);

select * from productos p;
