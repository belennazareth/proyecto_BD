
create database zoologico;
create user 'zooemp'@'%' identified by 'asdasd';
grant all privileges on zoologico.* to 'zooemp'@'%';
flush privileges;

create table empleados
(
DNI VARCHAR (9),
Nombre VARCHAR (30),
Fechacontrato DATE,
CONSTRAINT PK_empleados PRIMARY KEY (DNI)
);

create table animales
(
ID VARCHAR (4),
Especie VARCHAR (20),
GrupoAnimal VARCHAR (20),
Cantidad DECIMAL (20),
CONSTRAINT PK_animales PRIMARY KEY (ID)
);

create table exhibicion
(
Codigo VARCHAR (5),
Nombre VARCHAR (80),
Duracion VARCHAR (15),
Precio DECIMAL (3),
AnimalID VARCHAR (4),
EmpleadoDNI VARCHAR (9),
CONSTRAINT PK_exhibicion PRIMARY KEY (Codigo),
CONSTRAINT FK_exhibicionan FOREIGN KEY (AnimalID) REFERENCES animales (ID),
CONSTRAINT FK_exhibicionemp FOREIGN KEY (EmpleadoDNI) REFERENCES empleados (DNI)
);

INSERT INTO empleados VALUES ('25175215D','Alejandro','2020/11/20');
INSERT INTO empleados VALUES ('74859384G','Stephanie','2019/05/19');
INSERT INTO empleados VALUES ('57485963L','Iván','2018/12/28');
INSERT INTO empleados VALUES ('49582671P','Christian','2021/04/20');

INSERT INTO animales VALUES ('0001','León','Mamífero','6');
INSERT INTO animales VALUES ('0002','Elefante','Mamífero','4');
INSERT INTO animales VALUES ('0003','Cocodrilo','Reptil','3');
INSERT INTO animales VALUES ('0004','Delfín','Mamífero','5');
INSERT INTO animales VALUES ('0005','Águila','Ave','10');
INSERT INTO animales VALUES ('0006','Tigre','Mamífero','7');
INSERT INTO animales VALUES ('0007','Foca','Mamífero','5');
INSERT INTO animales VALUES ('0008','Pingüino','Ave','34');
INSERT INTO animales VALUES ('0009','Panda Rojo','Mamífero','10');
INSERT INTO animales VALUES ('0010','Flamenco','Ave','26');
INSERT INTO animales VALUES ('0011','Capibara','Mamífero','25');
INSERT INTO animales VALUES ('0012','Tiburón','Pez','2');
INSERT INTO animales VALUES ('0013','Lobo','Mamífero','15');
INSERT INTO animales VALUES ('0014','Erizo','Mamífero','10');
INSERT INTO animales VALUES ('0015','Nutria','Mamífero','23');
INSERT INTO animales VALUES ('0016','Mapache','Mamífero','5');
INSERT INTO animales VALUES ('0017','Caballo','Mamífero','36');
INSERT INTO animales VALUES ('0018','Suricato','Mamífero','46');
INSERT INTO animales VALUES ('0019','Tapir','Mamífero','6');
INSERT INTO animales VALUES ('0020','Búho real','Ave','10');

INSERT INTO exhibicion VALUES ('45236','Todo sobre leones','1h','23','0001','25175215D');
INSERT INTO exhibicion VALUES ('68594','Acrobacias con delfines','50min','18','0004','49582671P');
INSERT INTO exhibicion VALUES ('59643','Entendiendo a las nutrias','60min','17','0015','74859384G');
INSERT INTO exhibicion VALUES ('26375','Los capibaras','1h 20min','23','0011','74859384G');
INSERT INTO exhibicion VALUES ('96513','Animales con esmoquin','1h 15min','14','0008','57485963L'); 
