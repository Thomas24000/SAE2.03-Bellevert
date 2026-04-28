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

  echo json_encode($data);
  http_response_code(200); // 200 == "OK"
  exit();

}


echo "Erreur : Paramètre 'todo' manquant.";
http_response_code(404); // 404 == "Not found"

?>