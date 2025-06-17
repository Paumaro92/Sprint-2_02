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

INSERT INTO Client (nom, cognoms, adreca, codi_postal, localitat, provincia, telefon) VALUES
('Jordi', 'Pérez', 'Carrer Sol, 10', '08001', 'Barcelona', 'Barcelona', '600123456'),
('Anna', 'García', 'Carrer Mar, 5', '08002', 'Barcelona', 'Barcelona', '600654321'),
('Marc', 'López', 'Carrer Lluna, 8', '08003', 'Barcelona', 'Barcelona', '600987654'),
('Marta', 'Sánchez', 'Carrer Terra, 3', '08004', 'Barcelona', 'Barcelona', '600456789'),
('Laura', 'Ribas', 'Carrer Vent, 15', '08005', 'Barcelona', 'Barcelona', '600789123');

INSERT INTO Botiga (adreca, codi_postal, localitat, provincia) VALUES
('Avinguda Diagonal, 100', '08019', 'Barcelona', 'Barcelona'),
('Carrer Gran, 20', '08020', 'Barcelona', 'Barcelona'),
('Plaça Catalunya, 1', '08002', 'Barcelona', 'Barcelona'),
('Carrer Balmes, 77', '08006', 'Barcelona', 'Barcelona'),
('Rambla Catalunya, 23', '08007', 'Barcelona', 'Barcelona');

INSERT INTO Empleat (nom, cognoms, nif, telefon, rol, id_botiga) VALUES
('Pere', 'Martí', '12345678A', '934567001', 'cuiner', 1),
('Núria', 'Soler', '23456789B', '934567002', 'repartidor', 1),
('Joan', 'Ribas', '34567890C', '934567003', 'cuiner', 2),
('Albert', 'Puig', '45678901D', '934567004', 'repartidor', 2),
('Clara', 'Serra', '56789012E', '934567005', 'cuiner', 3);

INSERT INTO Categoria (nom) VALUES
('Clàssiques'),
('Especials'),
('Vegetarianes'),
('Picants'),
('Infantils');

INSERT INTO Producte (nom, descripcio, imatge, preu, tipus, id_categoria) VALUES
('Margarita', 'Pizza amb tomàquet i mozzarella', 'margarita.jpg', 8.50, 'pizza', 1),
('Barbacoa', 'Pizza amb carn i salsa barbacoa', 'barbacoa.jpg', 10.00, 'pizza', 2),
('Vegetal', 'Pizza amb verdures fresques', 'vegetal.jpg', 9.00, 'pizza', 3),
('Hamburguesa Clàssica', 'Hamburguesa amb formatge i enciam', 'hamburguesa_classica.jpg', 7.00, 'hamburguesa', NULL),
('Coca-Cola', 'Refresc de cola', 'cocacola.jpg', 2.00, 'beguda', NULL);

INSERT INTO Comanda (data_hora, tipus_servei, preu_total, id_client, id_botiga, id_repartidor, data_hora_lliurament) VALUES
('2024-06-15 13:00:00', 'domicili', 20.50, 1, 1, 2, '2024-06-15 13:45:00'),
('2024-06-16 20:30:00', 'recollida', 15.00, 2, 2, NULL, NULL),
('2024-06-17 12:15:00', 'domicili', 12.00, 3, 3, 4, '2024-06-17 12:50:00'),
('2024-06-18 19:00:00', 'domicili', 18.00, 4, 4, 2, '2024-06-18 19:40:00'),
('2024-06-19 21:10:00', 'recollida', 9.00, 5, 5, NULL, NULL);


INSERT INTO Comanda_Producte (id_comanda, id_producte, quantitat) VALUES
(1, 1, 2),
(1, 5, 2),
(2, 2, 1),
(3, 3, 1),
(3, 4, 1),
(4, 1, 1),
(4, 2, 1),
(5, 3, 1);
