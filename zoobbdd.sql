create table empleados
(
DNI VARCHAR (9),
Nombre VARCHAR (30),
Fechacontrato DATE,
ExhibicionNombre VARCHAR (15),
CONSTRAINT PK_empleados PRIMARY KEY (DNI)
);

create table animales
(
ID VARCHAR (4),
Nombre VARCHAR (20),
Especie VARCHAR (20),
ExhibicionNombre VARCHAR (15),
CONSTRAINT PK_animales PRIMARY KEY (ID)
);

create table exhibicion
(
Codigo VARCHAR (5),
Nombre VARCHAR (15),
Duracion TIME,
AnimalID VARCHAR (4),
EmpleadoDNI VARCHAR (9),
CONSTRAINT PK_exhibicion PRIMARY KEY (Codigo),
CONSTRAINT FK_exhibicionan FOREIGN KEY (AnimalID) REFERENCES animales (ID),
CONSTRAINT FK_exhibicionemp FOREIGN KEY (EmpleadoDNI) REFERENCES empleados (DNI)
);