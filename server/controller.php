<?php

require("model.php");



function addMovieController(){
  
    // PREMIERE VERIFICATION : LES PARAMETRES EXISTENT-ILS ET SONT-ILS VIDES ?
    // On fait une vérification de sécurité basique sur les champs principaux.
    if ( !isset($_REQUEST['name']) || empty($_REQUEST['name']) || 
         !isset($_REQUEST['director']) || empty($_REQUEST['director']) ) {
        // S'il manque le titre ou le réalisateur, on refuse le traitement
        return false;
    }

    // Lecture des données de formulaire
    $name = $_REQUEST['name'];
    $director = $_REQUEST['director'];
    $year = $_REQUEST['year'];
    $length = $_REQUEST['length'];
    $description = $_REQUEST['description'];
    $id_category = $_REQUEST['id_category'];
    $min_age = $_REQUEST['min_age'];
    $image = $_REQUEST['image'];
    $trailer = $_REQUEST['trailer'];

    // Ajout du film à l'aide de la fonction addMovie décrite dans model.php
    $ok = addMovie($name, $director, $year, $length, $description, $id_category, $min_age, $image, $trailer);
    
    // $ok est le nombre de lignes affectées par l'opération dans la BDD (voir model.php)
    if ($ok != 0){
        // On retourne un tableau formaté. 
        // Le fichier script.php se chargera de le transformer en JSON pour notre fichier JS !
        return ["success" => true, "message" => "Le film '$name' a bien été ajouté au catalogue !"];
    }
    else{
        return false;
    }
}


/** readMoviesController
 * * Cette fonction est en charge du traitement des requêtes HTTP pour lesquelles le paramètre 'todo' vaut 'readmovies'.
 * Contrairement à getMenu, on veut récupérer tout le catalogue d'un coup, donc il n'y a 
 * aucun paramètre à vérifier (pas de jour ou de semaine).
 * Elle appelle simplement la fonction getAllMovies et retourne les données.
 * * @return mixed Le tableau de films si tout va bien, sinon false.
 */
function readMoviesController(){
 
    // Appel de la fonction getAllMovies déclarée dans model.php pour extraire de la BDD tous les films
    $movies = getAllMovies();
    
    // Si la requête a planté, le modèle renverra false. On transmet ce false au routeur.
    if ($movies === false) {
        return false;
    }
    
    // Sinon, on retourne les films !
    return $movies;
}

?>