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
insert into flujo values(null, 'flujo mio',now(), 1);


CREATE TABLE registroDatosFlujo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idFlujo INT REFERENCES flujo(id),
    idtipo INT REFERENCES tipo(id),
    accion VARCHAR(30),
    idMes INT REFERENCES MES(id),
    dato VARCHAR(10)
);

delete from flujo;
delete from registroDatosFlujo;

select accion, dato, (select nombre from mes where id = idMes) 
from registroDatosFlujo where idFlujo = 1 group by accion;


-- SELECT * FROM registroDatosFlujo WHERE idFlujo = 1;
-- SELECT accion from registroDatosFlujo where idFlujo = 1 AND idtipo = 1 group by accion;
-- SELECT dato from registroDatosFlujo where idFlujo = 1 AND accion = 'sueldo';
-- SELECT idMes from registroDatosFlujo where idFlujo = 1 group by idMes; 
-- select * from registroDatosFlujo;

