import { MovieCard } from "../MovieCard/script.js";

let templateFile = await fetch("./component/Carrousel/template.html");
let template = await templateFile.text();

let Carrousel = {};

Carrousel.format = function (data, css = "") {
  if (!data || data.length === 0){
    let messageVide = `<li class="carroussel__empty">Aucun film n'est disponible pour le moment.</li>`;
    return html.replace("{{movie}}", messageVide);
  }
  let movieCard = "";
  for (let movie of data){
    movieCard += MovieCard.format(movie, "movie__card");
  }
  let html = template;
  html = html.replace("{{cssClass}}", css);
  html = html.replace("{{movie}}", movieCard);
  return html;
};

export { Carrousel };