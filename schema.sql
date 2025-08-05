CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'MotDePasseSecurise123!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

USE tifosi;

CREATE TABLE marque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE boisson (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES marque(id)
);

CREATE TABLE ingredient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE focaccia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE focaccia_ingredient (
    focaccia_id INT,
    ingredient_id INT,
    PRIMARY KEY (focaccia_id, ingredient_id),
    FOREIGN KEY (focaccia_id) REFERENCES focaccia(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)
);
