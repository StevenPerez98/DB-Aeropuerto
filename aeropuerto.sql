create database Aeropuerto;
use Aeropuerto;

CREATE TABLE vuelo(
	id_vuelo INT,
    horario INT,
    destino INT,
    origen INT,
    pasajero INT,
    avion INT    
);

CREATE TABLE aeropuerto(
	id_origen_destino INT,
    nombre VARCHAR (50),
    pais VARCHAR (10),
    ciudad VARCHAR (20)
);

CREATE TABLE pasajero(
	id_pasajero INT,
    nombre VARCHAR (30),
    boleto INT
);

CREATE TABLE horario(
	id_horario INT,
    fecha VARCHAR (20),
    hora VARCHAR (10)
);

CREATE TABLE avion(
	id_avion INT,
    datos_avion INT,
    no_tripulacion INT
);

CREATE TABLE boleto(
	id_boleto INT,
    no_asiento INT,
    tipo_clase VARCHAR (20),
    precio VARCHAR (20),
    no_avion INT,
    forma_pago INT
);

CREATE TABLE tripulacion(
	id_tripulacion INT,
    datos_empleado INT
);

CREATE TABLE datos_avion(
	id_datos INT,
    matricula VARCHAR (10),
    no_modelo INT,
    capacidad VARCHAR (10),
    atonomia VARCHAR (10)
);

CREATE TABLE forma_pago(
	id_pago INT,
    nombre VARCHAR (10)
);

CREATE TABLE empleado(
	id_empleado INT,
    nombre VARCHAR (20),
    categoria INT
);

CREATE TABLE modelo_avion(
	id_modelo INT,
    fabricante INT,
    año VARCHAR (20)
);

CREATE TABLE datos_fabricante(
	id_fabricante INT,
    nombre VARCHAR (20)
);

CREATE TABLE categoria_empleado(
	id_categoria INT,
    puesto VARCHAR (10),
    descripcion VARCHAR (30)
);

/*DECLARACION DE PK & FK*/

/*------------- PRIMARY KEYS-----*/
ALTER TABLE vuelo 
ADD CONSTRAINT PK_vuelo PRIMARY KEY (id_vuelo);

ALTER TABLE aeropuerto
ADD CONSTRAINT PK_aeropuerto PRIMARY KEY (id_origen_destino); 

ALTER TABLE pasajero
ADD CONSTRAINT PK_pasajero PRIMARY KEY (id_pasajero);

ALTER TABLE horario
ADD CONSTRAINT PK_horario PRIMARY KEY (id_horario);

ALTER TABLE avion
ADD CONSTRAINT PK_avion PRIMARY KEY (id_avion);

ALTER TABLE boleto
ADD CONSTRAINT PK_boleto PRIMARY KEY (id_boleto);

ALTER TABLE tripulacion
ADD CONSTRAINT PK_tripulacion PRIMARY KEY (id_tripulacion);

ALTER TABLE datos_avion
ADD CONSTRAINT PK_datos_avion PRIMARY KEY (id_datos);

ALTER TABLE forma_pago
ADD CONSTRAINT PK_forma_pago PRIMARY KEY (id_pago);

ALTER TABLE empleado
ADD CONSTRAINT PK_empleado PRIMARY KEY (id_empleado);

ALTER TABLE datos_fabricante
ADD CONSTRAINT PK_datos_fabricante PRIMARY KEY (id_fabricante);

ALTER TABLE modelo_avion
ADD CONSTRAINT PK_modelo_avion PRIMARY KEY (id_modelo);

ALTER TABLE categoria_empleado
ADD CONSTRAINT PK_categoria_empleado PRIMARY KEY (id_categoria);

/*-------- FOREIGN KEY -----*/
ALTER TABLE vuelo
ADD CONSTRAINT FK_vuelo_horario FOREIGN KEY(horario) REFERENCES horario(id_horario),
ADD CONSTRAINT FK_vuelo_destino FOREIGN KEY(destino) REFERENCES aeropuerto(id_origen_destino),
ADD CONSTRAINT FK_vuelo_origen FOREIGN KEY(origen) REFERENCES aeropuerto(id_origen_destino),
ADD CONSTRAINT FK_vuelo_pasajero FOREIGN KEY(pasajero) REFERENCES pasajero(id_pasajero),
ADD CONSTRAINT FK_vuelo_avion FOREIGN KEY(avion) REFERENCES avion(id_avion);

ALTER TABLE pasajero
ADD CONSTRAINT FK_pasajero_boleto foreign key (boleto) REFERENCES boleto (id_boleto);

ALTER TABLE avion
ADD CONSTRAINT FK_avion_datos_avion FOREIGN KEY (datos_avion) REFERENCES datos_avion (id_datos),
ADD CONSTRAINT FK_avion_no_tripulacion FOREIGN KEY (no_tripulacion) REFERENCES tripulacion (id_tripulacion);

ALTER TABLE boleto
ADD CONSTRAINT FK_boleto_no_avion FOREIGN KEY (no_avion) REFERENCES avion (id_avion),
ADD CONSTRAINT FK_boleto_forma_pago FOREIGN KEY (forma_pago) REFERENCES forma_pago (id_pago);

ALTER TABLE tripulacion
ADD CONSTRAINT FK_tripulacion_datos_empleado FOREIGN KEY (datos_empleado) REFERENCES empleado (id_empleado);

ALTER TABLE datos_avion
ADD CONSTRAINT FK_datos_avion_no_modelo FOREIGN KEY (no_modelo) REFERENCES modelo_avion (id_modelo);

ALTER TABLE empleado
ADD CONSTRAINT FK_emppleado_categoria FOREIGN KEY (categoria) REFERENCES categoria_empleado (id_categoria);


ALTER TABLE modelo_avion
ADD CONSTRAINT FK_modelo_fabricante FOREIGN KEY (fabricante) REFERENCES datos_fabricante (id_fabricante);

/*----------- INSERT INTO -----*/
INSERT INTO aeropuerto (id_origen_destino,nombre,pais,ciudad) VALUES (502, 'LA Aurora', 'Guatemala', ' Ciudad Guatemala');
INSERT INTO aeropuerto (id_origen_destino,nombre,pais,ciudad) VALUES (503, 'Juan Santamaría ', 'Costa Rica', 'San Jose');
INSERT INTO aeropuerto (id_origen_destino,nombre,pais,ciudad) VALUES (504, 'Augusto C. Sandino ','Nicaragua','Managua');
INSERT INTO aeropuerto (id_origen_destino,nombre,pais,ciudad) VALUES (505, 'Tocumen','Panama','Ciudad de Panama');
INSERT INTO aeropuerto (id_origen_destino,nombre,pais,ciudad) VALUES (506, 'El Salvador','Salvador','San Salvador');

UPDATE aeropuerto SET nombre = 'La Aurora' Where id_origen_destino = 502;

INSERT INTO horario (id_horario,fecha,hora) value(1,'2019/12/26','5:30 am');
INSERT INTO horario (id_horario,fecha,hora) values(2,'2020/01/10','15:45 pm');
INSERT INTO horario (id_horario,fecha,hora) values(3,'2019/11/27','3:15 am');
INSERT INTO horario (id_horario,fecha,hora) values(4,'2019/12/30','17:45 pm');

SELECT * FROM horario;






