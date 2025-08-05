-- Requête 1
-- Afficher la liste des noms des focaccias par ordre alphabétique croissant
SELECT nom FROM focaccia ORDER BY nom ASC;

-- Requête 2
-- Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients FROM ingredient;

-- Requête 3
-- Afficher le prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM focaccia;

-- Requête 4
-- Afficher la liste des boissons avec leur marque, triée par nom de boisson
SELECT boisson.nom, marque.nom AS marque
FROM boisson
JOIN marque ON boisson.id_marque = marque.id
ORDER BY boisson.nom;

-- Requête 5
-- Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id = fi.focaccia_id
JOIN ingredient i ON i.id = fi.ingredient_id
WHERE f.nom = 'Raclaccia';

-- Requête 6
-- Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT f.nom, COUNT(fi.ingredient_id) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id = fi.focaccia_id
GROUP BY f.id;

-- Requête 7
-- Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id = fi.focaccia_id
GROUP BY f.id
ORDER BY COUNT(fi.ingredient_id) DESC
LIMIT 1;

-- Requête 8
-- Afficher la liste des focaccia qui contiennent de l'ail
SELECT DISTINCT f.nom
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id = fi.focaccia_id
JOIN ingredient i ON i.id = fi.ingredient_id
WHERE i.nom = 'Ail';

-- Requête 9
-- Afficher la liste des ingrédients inutilisés
SELECT i.nom
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id = fi.ingredient_id
WHERE fi.ingredient_id IS NULL;

-- Requête 10
-- Afficher la liste des focaccia qui n'ont pas de champignons
SELECT f.nom
FROM focaccia f
WHERE f.id NOT IN (
    SELECT focaccia_id
    FROM focaccia_ingredient fi
    JOIN ingredient i ON fi.ingredient_id = i.id
    WHERE i.nom = 'Champignons'
);
