// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "..";

let DataMovie = {};

/**
 * Fetches all movies from the server.
 *
 * @returns The response from the server (array of movies).
 * * DataMovie.requestMovies permet de récupérer la liste complète des films depuis le serveur.
 * Elle renvoie les données contenues dans la réponse du serveur (data) converties en objets JS.
 */
DataMovie.requestMovies = async function () {
  let answer = await fetch(HOST_URL + "/server/script.php?todo=readmovies");

  let data = await answer.json();

  return data;
};

/** DataMovie.add
 * * Prend en paramètre un objet FormData (données de formulaire) à envoyer au serveur.
 * Ces données sont incluses dans une requête HTTP en méthode POST.
 * * @param {FormData} fdata un objet FormData contenant les données du formulaire de film.
 * @returns la réponse du serveur (succès ou erreur).
 */
DataMovie.add = async function (fdata) {
  let config = {
    method: "POST",
    body: fdata,
  };

  let answer = await fetch(
    HOST_URL + "/server/script.php?todo=addmovie",
    config,
  );
  let data = await answer.json();

  return data;
};


DataMovie.requestCategories = async function() {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readcategories");
    let data = await answer.json();
    return data;
};

DataMovie.searchMovies = async function (keyword) {
  let answer = await fetch(`${HOST_URL}/server/script.php?todo=searchMoviesAdmin&query=${encodeURIComponent(keyword)}`);
  return await answer.json();
};

DataMovie.setFeatured = async function (id, status) {
  let fd = new FormData();
  fd.append('id', id);

  fd.append('status', status ? 1 : 0);

  let answer = await fetch(`${HOST_URL}/server/script.php?todo=setFeatured`, {
    method: 'POST',
    body: fd
  });
  return await answer.json();
};


export { DataMovie };
