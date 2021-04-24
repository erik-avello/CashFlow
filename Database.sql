CREATE DATABASE modoCreativoFinanzas;
Use modoCreativoFinanzas;
--drop database modocreativofinanzas;
--describe total_mes;
CREATE TABLE usuario(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(100),
    pass VARCHAR(100),
    
    PRIMARY KEY(id)
);

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

CREATE TABLE accion(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(100),
    id_flujo_fk INT,
    id_tipo_fk INT,
    
    FOREIGN KEY (id_flujo_fk) references flujo (id),
    FOREIGN KEY (id_tipo_fk) references tipo (id),
    PRIMARY KEY (id)
);

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
