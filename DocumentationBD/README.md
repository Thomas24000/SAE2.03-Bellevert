Ce document explique l'architecture de la base de données utilisée pour la plateforme de streaming T-STREAM, les justifications des choix techniques (types, clés, associations), ainsi que les requêtes SQL implémentées dans l'API PHP (`model.php`).

## 1. Organisation des Tables et Associations

Le modèle de données a été conçu pour être. Il repose sur 4 tables principales :

`Movie` (Film)** : Table centrale contenant les informations des œuvres.
`Category` (Catégorie)** : Table de référence stockant les genres. L'association avec `Movie` est de type `1:N` (Un film appartient à une seule catégorie, une catégorie possède plusieurs films). Cela justifie la présence de la clé étrangère `id_category` dans la table `Movie`.
`Profile` (Profil)** : Gère les différents profils utilisateurs et leurs restrictions d'âge.
`Favorite` (Favoris)** : **Table de liaison**. Un profil peut aimer plusieurs films, et un film peut être aimé par plusieurs profils (Relation `N:M`). Cette table permet de résoudre cette relation avec une clé primaire composée (`id_profile`, `id_movie`).

## 2. Types de Données, Longueurs et Clés


* **Clés Primaires** : Des entiers (`INT`) avec `AUTO_INCREMENT` ont été utilisés pour `Movie.id`, `Category.id` et `Profile.id_profile`. C'est le standard pour garantir une indexation rapide.
* **Textes courts (Titres, Réalisateurs, URLs)** : Le type `VARCHAR(255)` a été privilégié. C'est la taille standard idéale pour des chaînes de caractères ne dépassant pas une ligne (liens d'images, de trailers).
* **Noms de profil** : Limités à `VARCHAR(50)`, car un nom d'utilisateur ne nécessite pas 255 caractères.
* **Synopsis (Description)** : Le type `TEXT` a été choisi. Un `VARCHAR(255)` aurait été insuffisant pour stocker le résumé complet d'un film.
* **Nombres et Âges** : Le type `INT` a été utilisé pour l'année (`year`), la durée (`length`) et la restriction d'âge (`min_age`).

### Modifications ultérieures de la base
Durant le développement, une modification a été apportée à la structure initiale :
* **Ajout de la colonne `is_featured`** dans la table `Movie`.
* **Justification :** Le type `TINYINT(1)` (utilisé comme un booléen `0` ou `1`) a été choisi avec une valeur par défaut de `0`. Cela permet de mettre en avant facilement un film sur l'accueil du site via le panel administrateur, sans avoir à créer une table séparée.


## 3. Requêtes SQL Utilisées (`model.php`)

Toutes les requêtes de l'application utilisent l'objet **PDO** (PHP Data Objects) avec des **requêtes préparées** (`bindParam` ou exécution avec tableau) afin de protéger la base de données contre les injections SQL.

### A. Gestion des Films (`Movie`)
* **Récupérer tous les films :**
    ```sql
    SELECT id, name, year, length, description, director, id_category, image, trailer, min_age FROM Movie
    ```
* **Ajouter un film :**
    ```sql
    INSERT INTO Movie (name, director, year, length, description, id_category, min_age, image, trailer) 
    VALUES (:name, :director, :year, :length, :description, :id_category, :min_age, :image, :trailer)
    ```
* **Récupérer un film par son ID :**
    ```sql
    SELECT * FROM Movie WHERE id = :id
    ```
* **Filtrer les films selon l'âge du profil :**
    ```sql
    SELECT * FROM Movie WHERE min_age <= :age
    ```
    *(Si l'âge limite est de 0, un simple `SELECT * FROM Movie` est exécuté pour afficher tout le catalogue).*

### B. Gestion des Catégories (`Category`)
* **Lister les catégories :**
    ```sql
    SELECT * FROM Category
    ```

### C. Gestion des Profils (`Profile`)
* **Créer un profil :**
    ```sql
    INSERT INTO Profile (name, avatar, age_restriction) VALUES (:name, :avatar, :age_restriction)
    ```
* **Récupérer tous les profils :**
    ```sql
    SELECT * FROM Profile
    ```
* **Mettre à jour un profil existant :**
    ```sql
    UPDATE Profile SET name = :name, avatar = :avatar, age_restriction = :age WHERE id_profile = :id
    ```

### D. Gestion des Favoris (`Favorite`)
* **Ajouter un favori :**
    ```sql
    INSERT IGNORE INTO Favorite (id_profile, id_movie) VALUES (:id_p, :id_m)
    ```
    *(Le mot-clé `IGNORE` empêche l'apparition d'erreurs SQL si l'utilisateur tente d'ajouter un film déjà présent dans ses favoris).*
* **Récupérer les favoris d'un profil (Jointure Interne) :**
    ```sql
    SELECT m.* FROM Movie m 
    INNER JOIN Favorite f ON m.id = f.id_movie 
    WHERE f.id_profile = :id_p
    ```
* **Supprimer un favori :**
    ```sql
    DELETE FROM Favorite WHERE id_profile = :id_p AND id_movie = :id_m
    ```

### E. Fonctionnalités Avancées (Recherche, Statistiques & Mise en avant)
* **Récupérer un film mis en avant aléatoirement :**
    ```sql
    SELECT * FROM Movie WHERE is_featured = 1 ORDER BY RAND() LIMIT 1
    ```
* **Changer le statut "Mis en avant" d'un film :**
    ```sql
    UPDATE Movie SET is_featured = :status WHERE id = :id
    ```
* **Recherche de films par mot-clé :**
    ```sql
    SELECT * FROM Movie WHERE name LIKE :keyword ORDER BY name ASC
    ```
* **Recherche côté Admin (avec récupération du nom de la catégorie via Jointure) :**
    ```sql
    SELECT m.*, c.name as category_name 
    FROM Movie m 
    LEFT JOIN Category c ON m.id_category = c.id 
    WHERE m.name LIKE :keyword 
    ORDER BY m.name ASC
    ```

* **Génération de statistiques (Tableau de bord Admin) :**
    L'application utilise plusieurs requêtes d'agrégation pour le tableau de bord :
    * Comptage simple : `SELECT COUNT(*) AS total FROM Profile` (Idem pour `Movie` et `Favorite`).
    * Film le plus populaire (Jointure + Tri) :
        ```sql
        SELECT m.name, COUNT(f.id_movie) AS fav_count 
        FROM Favorite f 
        INNER JOIN Movie m ON f.id_movie = m.id 
        GROUP BY f.id_movie 
        ORDER BY fav_count DESC LIMIT 1
        ```
    * Catégorie la plus populaire :
        ```sql
        SELECT c.name, COUNT(f.id_movie) AS fav_count 
        FROM Favorite f 
        INNER JOIN Movie m ON f.id_movie = m.id 
        INNER JOIN Category c ON m.id_category = c.id 
        GROUP BY c.id 
        ORDER BY fav_count DESC LIMIT 1
        ```