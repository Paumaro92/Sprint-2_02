DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

CREATE TABLE Proveidor (
    id_proveidor INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    carrer VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    pis VARCHAR(10) ,
    porta VARCHAR(10),
    ciutat VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    nif VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Ullera (
    id_ullera INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    graduacio_dret VARCHAR(20),
    graduacio_esq VARCHAR(20),
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica'),
    color_muntura VARCHAR(30),
    color_vidre_dret VARCHAR(30),
    color_vidre_esq VARCHAR(30),
    preu DECIMAL(10,2),
    id_proveidor INT,
    FOREIGN KEY (id_proveidor) REFERENCES Proveidor(id_proveidor)
);

CREATE TABLE Client (
    id_client INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adreca VARCHAR(200) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_registre DATE,
    recomanat_per INT,
    FOREIGN KEY (recomanat_per) REFERENCES Client(id_client)
);

CREATE TABLE Empleat (
    id_empleat INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    id_client INT,
    id_ullera INT,
    id_empleat INT,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_ullera) REFERENCES Ullera(id_ullera),
    FOREIGN KEY (id_empleat) REFERENCES Empleat(id_empleat)
);