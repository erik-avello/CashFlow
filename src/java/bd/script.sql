/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  rivaa
 * Created: 01-04-2021
 */


create database bd_practica;
use bd_practica;
--drop database bd_practica;
create table privilegio(
    id int auto_increment,
    descripcion varchar(50),
    primary key(id)
);
select * from privilegio;

create table usuario(
    id int auto_increment,
    rut varchar(12),
    nombre varchar(50),
    clave varchar(50),
    privilegio int,
    primary key(id),
    foreign key(privilegio) references privilegio(id)

);--Select * from usuario;

insert into privilegio values(null,"Administrador");
insert into privilegio values(null,"Usuario");

insert into usuario values(null,"11-1","Carolina","123","1");
insert into usuario values(null,"22-1","Victor","123","2");

CREATE TABLE mes(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    
    PRIMARY KEY(id)
);

-- INSERT DE MES
INSERT INTO MES VALUES(null, 'Enero');
INSERT INTO MES VALUES(null, 'Febrero');
INSERT INTO MES VALUES(null, 'Marzo');
INSERT INTO MES VALUES(null, 'Abril');
INSERT INTO MES VALUES(null, 'Mayo');
INSERT INTO MES VALUES(null, 'Junio');
INSERT INTO MES VALUES(null, 'Julio');
INSERT INTO MES VALUES(null, 'Agosto');
INSERT INTO MES VALUES(null, 'Septiembre');
INSERT INTO MES VALUES(null, 'Octubre');
INSERT INTO MES VALUES(null, 'Noviembre');
INSERT INTO MES VALUES(null, 'Diciembre');


CREATE TABLE tipo(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    
    PRIMARY KEY(id)
);

INSERT INTO tipo VALUES(null, 'Ingresos');
INSERT INTO tipo VALUES(null, 'Egresos');
-- crear tipos default
select * from tipo;


CREATE TABLE flujo(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha DATE,
    id_usuario_fk INT,

    FOREIGN KEY (id_usuario_fk) references usuario (id),
    PRIMARY KEY (id)
);

--Pruebas tabla Flujo
--INSERT INTO flujo VALUES(null, 'Flujo 1',NOW(),'1');
--SELECT * FROM FLUJO WHERE id_usuario_fk = (select id from usuario where id = 1);

CREATE TABLE accion(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(100),
    id_flujo_fk INT,
    id_tipo_fk INT,
    
    FOREIGN KEY (id_flujo_fk) references flujo (id),
    FOREIGN KEY (id_tipo_fk) references tipo (id),
    PRIMARY KEY (id)
);


--Tabla accion se refiere a lo que es una celda, lo cual es el insert
--Recordar que este insert corresponde tanto a un flujo como a un tipo 

CREATE TABLE total_accion(
    id INT AUTO_INCREMENT,
    total INT,
    id_flujo_fk INT,
    id_accion_fk INT,
    
    FOREIGN KEY (id_flujo_fk) references flujo (id),
    FOREIGN KEY (id_accion_fk) references accion (id),
    PRIMARY KEY (id)
);

CREATE TABLE accion_mes(
    id INT AUTO_INCREMENT,
    dato INT,
    id_mes_fk INT,
    id_accion_fk INT,
    id_flujo_fk INT,
    
    FOREIGN KEY (id_mes_fk) references mes (id),
    FOREIGN KEY (id_flujo_fk) references flujo (id),
    FOREIGN KEY (id_accion_fk) references accion (id),
    PRIMARY KEY (id)
);

CREATE TABLE total_mes(
    id INT AUTO_INCREMENT,
    total INT,
    id_mes_fk INT,
    id_flujo_fk INT,

    FOREIGN KEY (id_mes_fk) references mes (id),
    FOREIGN KEY (id_flujo_fk) references flujo (id),
    PRIMARY KEY (id)
);

select * from mes
select * from total_mes
select * from accion