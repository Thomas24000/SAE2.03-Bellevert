<?php

require("model.php");



function addMovieController()
{
    $name = $_REQUEST['name'];
    $director = $_REQUEST['director'];
    $year = $_REQUEST['year'];
    $length = $_REQUEST['length'];
    $description = $_REQUEST['description'];
    $id_category = $_REQUEST['id_category'];
    $min_age = $_REQUEST['min_age'];
    $image = $_REQUEST['image'];
    $trailer = $_REQUEST['trailer'];

    $ok = addMovie($name, $director, $year, $length, $description, $id_category, $min_age, $image, $trailer);

    if ($ok != 0) {
        return [
            "success" => true,
            "message" => "Le film '$name' a bien été ajouté au catalogue !"
        ];
    } else {
        return [
            "success" => false,
            "message" => "Erreur lors de l'ajout du film."
        ];
    }
}


/** readMoviesController
 * * Cette fonction est en charge du traitement des requêtes HTTP pour lesquelles le paramètre 'todo' vaut 'readmovies'.
 * Contrairement à getMenu, on veut récupérer tout le catalogue d'un coup, donc il n'y a 
 * aucun paramètre à vérifier (pas de jour ou de semaine).
 * Elle appelle simplement la fonction getAllMovies et retourne les données.
 * * @return mixed Le tableau de films si tout va bien, sinon false.
 */
function readMoviesController()
{
    $age = isset($_REQUEST['age']) ? intval($_REQUEST['age']) : 0;

    $categories = getAllCategories();

    $movies = readMoviesByAge($age);

    return [
        "categories" => $categories,
        "movies" => $movies
    ];
}

function readIdController()
{
    if (!isset($_REQUEST['id']) || empty($_REQUEST['id'])) {
        return false;
    }

    $id = $_REQUEST['id'];

    $movie = getMovieById($id);

    if ($movie === false) {
        return false;
    }

    return $movie;
}

function readCategoriesController()
{
    $categories = getAllCategories();

    if ($categories === false) {
        return false;
    }
    return $categories;
}

function addProfileController()
{
    $name = $_REQUEST['name'];
    $avatar = $_REQUEST['avatar'];
    $age_restriction = $_REQUEST['age_restriction'];

    $ok = addProfile($name, $avatar, $age_restriction);

    if ($ok != 0) {
        return [
            "success" => true,
            "message" => "Le profile de '$name' a bien été ajouté J!"
        ];
    } else {
        return [
            "success" => false,
            "message" => "Erreur lors de l'ajout du profile."
        ];
    }
}

function readProfilesController()
{
    $profiles = getAllProfiles();
    if ($profiles === false) {
        return [];
    }
    return $profiles;
}

function updateProfileController()
{
    $id = $_REQUEST['id_profile'];
    $name = $_REQUEST['name'];
    $avatar = $_REQUEST['avatar'];
    $age_restriction = $_REQUEST['age_restriction'];

    $ok = updateProfile($id, $name, $avatar, $age_restriction);

    if ($ok) {
        return [
            "success" => true,
            "message" => "Le profil '$name' a bien été modifié !"
        ];
    } else {
        return [
            "success" => false,
            "message" => "Erreur lors de la modification dans la base."
        ];
    }
}

function addFavoriteController()
{
    $id_p = $_REQUEST['id_profile'];
    $id_m = $_REQUEST['id_movie'];

    $lignesAjoutees = addFavorite($id_p, $id_m);

    if ($lignesAjoutees > 0) {
        return [
            "success" => true,
            "message" => "Le film a bien été ajouté à vos favoris ! ❤️"
        ];
    } else {
        return [
            "success" => false,
            "message" => "Ce film est déjà dans vos favoris ! ⭐"
        ];
    }
}

function readFavoritesController()
{
    $id_p = $_REQUEST['id_profile'];
    return getFavorites($id_p);
}



?>