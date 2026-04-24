<?php

/**
 * DÉVELOPPEMENT UNIQUEMENT — À retirer avant la mise en production.
 * Force l'affichage des erreurs pour t'aider à déboguer pendant le projet.
 */
ini_set('display_errors', 1);
error_reporting(E_ALL);

/**
 * Inclusion du fichier controller.php.
 * Contient les fonctions qui vont traiter les requêtes et communiquer avec le modèle.
 */
require("controller.php");

/**
 * Vérifie si la variable 'todo' est définie dans la requête (GET ou POST).
 */
if ( isset($_REQUEST['todo']) ){

  // On indique au navigateur que la réponse sera du JSON
  header('Content-Type: application/json');

  // Récupère l'action demandée
  $todo = $_REQUEST['todo'];

  // En fonction de l'action, on appelle le bon contrôleur
  switch($todo){

    case 'addmovie':
      // Appelle la fonction d'ajout de film dans controller.php
      $data = addMovieController();
      break;

    case 'readmovies':
      // Appelle la fonction de lecture du catalogue dans controller.php
      $data = readMoviesController();
      break;

    default: 
      // L'action demandée n'existe pas
      echo json_encode(['success' => false, 'message' => '[error] Unknown todo value']);
      http_response_code(400); // 400 == "Bad request"
      exit();
  }

  /**
   * Gestion des erreurs des contrôleurs
   * Si le contrôleur a renvoyé "false" (ex: erreur SQL, paramètres manquants...)
   */
  if ($data === false){
    echo json_encode(['success' => false, 'message' => '[error] Controller returns false']);
    http_response_code(500); // 500 == "Internal error"
    exit();
  }

  /**
   * Cas de succès :
   * On encode les données reçues du contrôleur en JSON et on les envoie.
   */
  echo json_encode($data);
  http_response_code(200); // 200 == "OK"
  exit();

} // fin du if isset(todo)

/**
 * Cas d'erreur : Aucun 'todo' n'a été précisé dans l'URL.
 */
echo "Erreur : Paramètre 'todo' manquant."; // Petit message texte si on ouvre la page à la main
http_response_code(404); // 404 == "Not found"

?>