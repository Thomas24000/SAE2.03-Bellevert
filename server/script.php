<?php


// Activer le rapport d'erreurs PHP
error_reporting(E_ALL);

// Forcer l'affichage des erreurs à l'écran
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);


require("controller.php");


if (isset($_REQUEST['todo'])) {

  header('Content-Type: application/json');

  $todo = $_REQUEST['todo'];

  switch ($todo) {

    case 'addmovie':
      $data = addMovieController();
      break;

    case 'readmovies':
      $data = readMoviesController();
      break;

    case 'readmovie':
      $data = readIdController();
      break;

    case 'readcategories':
      $data = readCategoriesController();
      break;

    case 'addProfile':
      $data = addProfileController();
      break;

    case 'readProfiles':
      $data = readProfilesController();
      break;

    case 'updateProfile':
      $data = updateProfileController();
      break;

    case 'addFavorite':
      $data = addFavoriteController();
      break;

    case 'readFavorites':
      $data = readFavoritesController();
      break;

    case 'removeFavorite':
      $data = removeFavoriteController();
      break;

    case 'getFeaturedMovie':
      $data = getFeaturedMovieController();
      break;

    case 'getStats':
      $data = getStatsController();
      break;

    case 'searchMovies':
      if (isset($_GET['query'])) {
        $data = searchMoviesController($_GET['query']);
      } else {
        $data = [];
      }
      break;

    case 'searchMoviesAdmin':
      if (isset($_GET['query'])) {
        $data = searchMoviesAdminController($_GET['query']);
      } else {
        $data = [];
      }
      break;

    case 'setFeatured':
      if (isset($_POST['id']) && isset($_POST['status'])) {
        $data = setMovieFeaturedController($_POST['id'], $_POST['status']);
      } else {
        $data = ['success' => false];
      }
      break;


    default:
      echo json_encode(['success' => false, 'message' => '[error] Unknown todo value']);
      http_response_code(400); // 400 == "Bad request"
      exit();
  }


  if ($data === false) {
    echo json_encode(['success' => false, 'message' => '[error] Controller returns false']);
    http_response_code(500); // 500 == "Internal error"
    exit();
  }


  http_response_code(200); // 200 == "OK"
  echo json_encode($data);
  exit();

}


echo "Erreur : Paramètre 'todo' manquant.";
http_response_code(404); // 404 == "Not found"

?>