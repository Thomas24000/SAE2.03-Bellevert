<?php


define("HOST", "localhost");
define("DBNAME", "bellevert1"); // Ton nom de base de données
define("DBLOGIN", "bellevert1"); // Ton identifiant
define("DBPWD", "bellevert1"); // Ton mot de passe (à remplir !)

/**
 * Récupère la liste complète des films dans la base de données.
 * * @return array Un tableau d'objets contenant toutes les informations des films.
 */
function getAllMovies(){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME.";charset=utf8", DBLOGIN, DBPWD);
    
    // Requête SQL pour récupérer tous les films
    $sql = "SELECT id, name, year, length, description, director, id_category, image, trailer, min_age FROM Movie";
    
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    
    // Exécute la requête SQL
    $stmt->execute();
    
    // Récupère les résultats de la requête sous forme d'objets
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res; // Retourne les résultats
}


/**
 * Ajoute un nouveau film dans la base de données.
 *
 * @param string $n Le titre du film.
 * @param string $dir Le réalisateur du film.
 * @param int $y L'année de sortie du film.
 * @param int $len La durée du film en minutes.
 * @param string $desc Le synopsis du film.
 * @param int $cat L'ID de la catégorie du film.
 * @param int $age La restriction d'âge (0, 10, 12, 16, 18).
 * @param string $img Le nom du fichier image de l'affiche.
 * @param string $trl L'URL de la bande-annonce.
 * @return int Le nombre de lignes affectées par la requête de mise à jour.
 * * A SAVOIR: une requête SQL de type INSERT retourne le nombre de lignes insérées.
 * Si la requête a réussi, le nombre de lignes affectées sera 1.
 * Si la requête a échoué, le nombre de lignes affectées sera 0.
 */
function addMovie($n, $dir, $y, $len, $desc, $cat, $age, $img, $trl){
    // Connexion à la base de données
    $cnx = new PDO("mysql:host=".HOST.";dbname=".DBNAME.";charset=utf8", DBLOGIN, DBPWD); 
    
    // Requête SQL d'insertion avec des paramètres
    $sql = "INSERT INTO Movie (name, director, year, length, description, id_category, min_age, image, trailer) 
            VALUES (:name, :director, :year, :length, :description, :id_category, :min_age, :image, :trailer)";
            
    // Prépare la requête SQL
    $stmt = $cnx->prepare($sql);
    
    // Lie les paramètres aux valeurs
    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':director', $dir);
    $stmt->bindParam(':year', $y);
    $stmt->bindParam(':length', $len);
    $stmt->bindParam(':description', $desc);
    $stmt->bindParam(':id_category', $cat);
    $stmt->bindParam(':min_age', $age);
    $stmt->bindParam(':image', $img);
    $stmt->bindParam(':trailer', $trl);
    
    // Exécute la requête SQL
    $stmt->execute();
    
    // Récupère le nombre de lignes affectées par la requête
    $res = $stmt->rowCount(); 
    return $res; // Retourne le nombre de lignes affectées
}

?>