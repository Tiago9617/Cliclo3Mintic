CREATE DATABASE glucometrics;

CREATE TABLE rol (
    Id_Rol INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    rol VARCHAR(50) NOT NULL,
    Id_Usuario INTEGER NOT NULL   
);

CREATE TABLE usuario (
    Id_Usuario INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    password1 VARCHAR(50) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    Id_Persona INTEGER NOT NULL
);

CREATE TABLE historial_cambios (
    Id_Control INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    fecha_cambio DATE NOT NULL,
    descripcion_cambio TEXT NOT NULL,
    Id_Usuario INTEGER NOT NULL
);

CREATE TABLE persona (
    Id_Persona INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    cedula VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    fecha_nacimiento VARCHAR(50) NOT NULL,
    edad VARCHAR(50) NOT NULL,
    Id_Usuario INTEGER NOT NULL
);

CREATE TABLE datos_usuario (
    Id_Datos INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nivel_glucosa DECIMAL NOT NULL,
    fecha_muestra DATE NOT NULL,
    altura DECIMAL NOT NULL,
    peso DECIMAL NOT NULL,
    imc DECIMAL NOT NULL,
    actividad_fisica VARCHAR(10) NOT NULL,
    toma_medicamentos VARCHAR(10) NOT NULL,
    Id_Persona INTEGER NOT NULL
);

ALTER TABLE rol
ADD FOREIGN KEY (Id_Usuario) REFERENCES usuario (Id_Usuario);
ALTER TABLE usuario
ADD FOREIGN KEY (Id_Persona) REFERENCES persona (Id_Persona);
ALTER TABLE historial_cambios
ADD FOREIGN KEY (Id_Usuario) REFERENCES usuario (Id_Usuario);
ALTER TABLE persona
ADD FOREIGN KEY (Id_Usuario) REFERENCES usuario (Id_Usuario);
ALTER TABLE datos_usuario
ADD FOREIGN KEY (Id_Persona) REFERENCES persona (Id_Persona);
