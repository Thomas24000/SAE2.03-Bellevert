// URL où se trouve le répertoire "server" sur mmi.unilim.fr
let HOST_URL = "..";//"http://mmi.unilim.fr/~????"; // CHANGE THIS TO MATCH YOUR CONFIG

let DataMovie = {};

DataMovie.requestMoviesDetails = async function (id) {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readmovie&id=" + id);
    let texteBrut = await answer.text();

    let data = JSON.parse(texteBrut);
    return data;
}

DataMovie.requestCategories = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readcategories");

    let data = await answer.json();
    
    return data;
};

DataMovie.requestMovies = async function (ageLimit = 0) {
  let config = {
    method: "GET",
  };

  let answer = await fetch(
    HOST_URL + "/server/script.php?todo=readmovies&age=" + ageLimit,
    config
  );
  
  let data = await answer.json();
  return data;
};

DataMovie.addFavorite = async function (id_profile, id_movie) {
  let answer = await fetch(`${HOST_URL}/server/script.php?todo=addFavorite&id_profile=${id_profile}&id_movie=${id_movie}`);
  return await answer.json();
};

DataMovie.getFavorites = async function (id_profile) {
  let answer = await fetch(`${HOST_URL}/server/script.php?todo=readFavorites&id_profile=${id_profile}`);
  return await answer.json();
};

DataMovie.removeFavorite = async function (id_profile, id_movie) {
  let answer = await fetch(`${HOST_URL}/server/script.php?todo=removeFavorite&id_profile=${id_profile}&id_movie=${id_movie}`);
  return await answer.json();
};

DataMovie.getFeatured = async function (age) {
  let answer = await fetch(`${HOST_URL}/server/script.php?todo=getFeatured&age=${age}`);
  return await answer.json();
};

export {DataMovie};
