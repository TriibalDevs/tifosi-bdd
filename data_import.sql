USE tifosi;

INSERT INTO marque (nom) VALUES ('San Pellegrino'), ('Coca-Cola');

INSERT INTO boisson (nom, prix, id_marque) VALUES
('Limonata', 2.50, 1),
('Coca-Cola Classic', 2.20, 2);

INSERT INTO ingredient (nom) VALUES ('Fromage'), ('Tomate'), ('Ail'), ('Champignons');

INSERT INTO focaccia (nom, prix) VALUES ('Raclaccia', 8.50), ('Classica', 7.00);

INSERT INTO focaccia_ingredient (focaccia_id, ingredient_id) VALUES
(1, 1), (1, 3), (2, 1), (2, 2);
