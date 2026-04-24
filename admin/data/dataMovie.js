// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "https://mmi.unilim.fr/~bellevert1/SAE2.03-Bellevert"; 

let DataMovie = {};

/**
 * Fetches all movies from the server.
 *
 * @returns The response from the server (array of movies).
 * * DataMovie.requestMovies permet de récupérer la liste complète des films depuis le serveur.
 * Elle renvoie les données contenues dans la réponse du serveur (data) converties en objets JS.
 */
DataMovie.requestMovies = async function() {
    // fetch permet d'envoyer une requête HTTP GET à l'URL spécifiée. 
    // On demande au routeur PHP d'exécuter l'action "readmovies".
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readmovies");
    
    // answer est la réponse brute du serveur.
    // On utilise json() pour extraire les données et les convertir en objet/tableau JavaScript.
    let data = await answer.json();
    
    // On retourne ces données au Contrôleur (index.html).
    return data;
}

/** DataMovie.add
 * * Prend en paramètre un objet FormData (données de formulaire) à envoyer au serveur.
 * Ces données sont incluses dans une requête HTTP en méthode POST.
 * * @param {FormData} fdata un objet FormData contenant les données du formulaire de film.
 * @returns la réponse du serveur (succès ou erreur).
 */
DataMovie.add = async function (fdata) {
    // Configuration de la requête HTTP :
    //  - method : POST (indispensable pour envoyer de grosses données ou des fichiers discrètement)
    //  - body : on y place directement notre FormData, le navigateur gère le reste.
    let config = {
        method: "POST", 
        body: fdata 
    };
    
    // On indique au serveur l'action "addmovie" pour qu'il déclenche la bonne fonction PHP
    let answer = await fetch(HOST_URL + "/server/script.php?todo=addmovie", config);
    let data = await answer.json();
    
    return data;
}

// Optionnel : Si plus tard tu veux modifier un film existant, 
// tu pourras ajouter un DataMovie.update() sur le même modèle !

export { DataMovie };