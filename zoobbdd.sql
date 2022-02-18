create table empleados
(
DNI VARCHAR (9),
Nombre VARCHAR (30),
Fechacontrato DATE,
Exhibicioncodigo INT (5),
CONSTRAINT PK_empleados PRIMARY KEY (DNI),
CONSTRAINT FK_empleadosex FOREIGN KEY (Exhibicioncodigo) REFERENCES exhibicion (Codigo)
);

create table animales
(
ID INT (4),
Nombre VARCHAR (20),
Especie VARCHAR (20),
Exhibicioncodigo INT (5),
CONSTRAINT PK_animales PRIMARY KEY (ID),
CONSTRAINT FK_animalesex FOREIGN KEY (Exhibicioncodigo) REFERENCES exhibicion (Codigo)
);

create table exhibicion
(
Codigo INT (5),
Nombre VARCHAR (15),
Duracion TIME,
AnimalID INT (4),
EmpleadoDNI VARCHAR (9),
CONSTRAINT PK_exhibicion PRIMARY KEY,
CONSTRAINT FK_exhibicionan FOREIGN KEY (AnimalID) REFERENCES animales (ID),
CONSTRAINT FK_exhibicionemp FOREIGN KEY (EmpleadoDNI) FOREIGN KEY empleados (DNI)
);