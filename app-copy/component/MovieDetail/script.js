let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();

let MovieDetail = {};

MovieDetail.format = function (movie, isFavorite) {
  if (!movie) return "";

  let html = template;

  html = html.replaceAll("{{titre}}", movie.title || movie.name || "Titre inconnu");
  html = html.replaceAll("{{synopsis}}", movie.description || movie.synopsis || "Aucun synopsis disponible.");
  html = html.replaceAll("{{date}}", movie.date || movie.release_date || "2024");
  html = html.replaceAll("{{age}}", movie.age || movie.pegi || "Tous publics");
  html = html.replaceAll("{{trailer}}", movie.trailer || "");

  if (movie.image) {
    let imgSrc = movie.image.startsWith("http")
      ? movie.image
      : "../server/images/" + movie.image;
    html = html.replaceAll("{{image}}", imgSrc);
  } else {
    html = html.replaceAll("{{image}}", "");
  }

  let texteBouton = isFavorite ? "✓ Enregistré" : "Enregistrer";
  
  let activeClass = isFavorite ? "is-active" : "";
  
  let fonctionOnClick = isFavorite 
    ? `C.handlerRemoveFavorite('${movie.id}')` 
    : `C.handlerAddFavorite('${movie.id}')`;
  
  let boutonHtml = `<button class="detail__btn-fav ${activeClass}" onclick="${fonctionOnClick}">
                      ${texteBouton}
                    </button>`;
  
  html = html.replaceAll("{{bouton_favori}}", boutonHtml);

  return html;
};

export { MovieDetail };