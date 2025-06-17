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

INSERT INTO Proveidor (nom, carrer, numero, pis, porta, ciutat, codi_postal, pais, telefon, fax, nif) VALUES
('VisionPlus', 'Carrer Major', '12', '1', 'A', 'Barcelona', '08001', 'Espanya', '934567890', '934567891', 'B12345678'),
('LentsGlobal', 'Avinguda Diagonal', '45', '2', 'B', 'Barcelona', '08019', 'Espanya', '932345678', '932345679', 'B87654321'),
('OpticWorld', 'Passeig de Gracia', '100', NULL, NULL, 'Barcelona', '08008', 'Espanya', '931234567', NULL, 'B11223344'),
('VisioNova', 'Rambla Catalunya', '23', '3', 'C', 'Barcelona', '08007', 'Espanya', '930987654', '930987655', 'B22334455'),
('LentsExpress', 'Carrer Balmes', '77', NULL, NULL, 'Barcelona', '08006', 'Espanya', '938765432', NULL, 'B33445566');

INSERT INTO Ullera (marca, graduacio_dret, graduacio_esq, tipus_muntura, color_muntura, color_vidre_dret, color_vidre_esq, preu, id_proveidor) VALUES
('RayBan', '1.5', '1.0', 'pasta', 'negre', 'transparent', 'transparent', 120.50, 1),
('Oakley', '2.0', '1.75', 'metàl·lica', 'gris', 'blau', 'blau', 150.00, 2),
('Gucci', '1.25', '1.25', 'flotant', 'daurat', 'verd', 'verd', 200.00, 3),
('Prada', '0.75', '1.5', 'pasta', 'blau', 'gris', 'gris', 180.00, 4),
('Versace', '2.25', '2.0', 'metàl·lica', 'plata', 'marró', 'marró', 210.00, 5);

INSERT INTO Client (nom, adreca, telefon, email, data_registre, recomanat_per) VALUES
('Anna', 'Carrer Sol, 10', '600123456', 'anna@email.com', '2024-06-01', NULL),
('Marc', 'Carrer Lluna, 5', '600654321', 'marc@email.com', '2024-06-10', 1),
('Jordi', 'Carrer Mar, 8', '600987654', 'jordi@email.com', '2024-06-12', 2),
('Marta', 'Carrer Terra, 3', '600456789', 'marta@email.com', '2024-06-14', NULL),
('Laura', 'Carrer Vent, 15', '600789123', 'laura@email.com', '2024-06-15', 3);


INSERT INTO Empleat (nom, cognoms, telefon, email) VALUES
('Laura', 'García', '934567000', 'laura@optica.com'),
('Pere', 'Martí', '934567001', 'pere@optica.com'),
('Joan', 'Ribas', '934567002', 'joan@optica.com'),
('Núria', 'Soler', '934567003', 'nuria@optica.com'),
('Albert', 'Puig', '934567004', 'albert@optica.com');


INSERT INTO Venda (data_venda, id_client, id_ullera, id_empleat) VALUES
('2024-06-15', 1, 1, 1),
('2024-06-16', 2, 2, 2),
('2024-06-17', 3, 3, 3),
('2024-06-18', 4, 4, 4),
('2024-06-19', 5, 5, 5);
