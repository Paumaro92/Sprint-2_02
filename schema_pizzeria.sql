DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;


CREATE TABLE Client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    adreca VARCHAR(200) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefon VARCHAR(20) NOT NULL
);

CREATE TABLE Botiga (
    id_botiga INT AUTO_INCREMENT PRIMARY KEY,
    adreca VARCHAR(200) NOT NULL,
    codi_postal VARCHAR(10) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);

CREATE TABLE Empleat (
    id_empleat INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    rol ENUM('cuiner', 'repartidor') NOT NULL,
    id_botiga INT NOT NULL,
    FOREIGN KEY (id_botiga) REFERENCES Botiga(id_botiga)
);

CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Producte (
    id_producte INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    descripcio TEXT NOT NULL,
    imatge VARCHAR(255) NOT NULL,
    preu DECIMAL(10,2) NOT NULL,
    tipus ENUM('pizza', 'hamburguesa', 'beguda') NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Comanda (
    id_comanda INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    tipus_servei ENUM('domicili', 'recollida') NOT NULL,
    preu_total DECIMAL(10,2) NOT NULL,
    id_client INT NOT NULL,
    id_botiga INT NOT NULL,
    id_repartidor INT,
    data_hora_lliurament DATETIME,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_botiga) REFERENCES Botiga(id_botiga),
    FOREIGN KEY (id_repartidor) REFERENCES Empleat(id_empleat)
);

CREATE TABLE Comanda_Producte (
    id_comanda INT NOT NULL,
    id_producte INT NOT NULL,
    quantitat INT NOT NULL,
    PRIMARY KEY (id_comanda, id_producte),
    FOREIGN KEY (id_comanda) REFERENCES Comanda(id_comanda),
    FOREIGN KEY (id_producte) REFERENCES Producte(id_producte)
);
