-- Création de la table Projet
CREATE TABLE Projet (
    id_projet SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    dateDebut DATE,
    dateFin DATE,
    budget DOUBLE PRECISION
);

-- Création de la table Tache
CREATE TABLE Tache (
    id_tache SERIAL PRIMARY KEY,
    description TEXT,
    dateDebut DATE,
    dateFin DATE,
    statut VARCHAR(50),
    id_projet INT,
    FOREIGN KEY (id_projet) REFERENCES Projet(id_projet) ON DELETE CASCADE
);

-- Création de la table Ressource
CREATE TABLE Ressource (
    id_ressource SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    quantite INT,
    fournisseur VARCHAR(255),
    id_tache INT,
    FOREIGN KEY (id_tache) REFERENCES Tache(id_tache) ON DELETE CASCADE
);

-- Insertion d'un projet
INSERT INTO Projet (nom, description, dateDebut, dateFin, budget)
VALUES ('Projet Alpha', 'Description du Projet Alpha', '2024-05-01', '2024-12-31', 100000.00);

-- Insertion d'une tâche associée au projet
INSERT INTO Tache (description, dateDebut, dateFin, statut, id_projet)
VALUES ('Tâche 1 pour Projet Alpha', '2024-05-01', '2024-06-30', 'En cours', 1);

-- Insertion de ressources associées à la tâche
INSERT INTO Ressource (nom, type, quantite, fournisseur, id_tache)
VALUES ('Ressource 1', 'Matériel', 10, 'Fournisseur A', 1);

INSERT INTO Ressource (nom, type, quantite, fournisseur, id_tache)
VALUES ('Ressource 2', 'Main-d', 5, 'Fournisseur B', 1);













