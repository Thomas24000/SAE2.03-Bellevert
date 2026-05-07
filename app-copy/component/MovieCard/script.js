let templateFile = await fetch("./component/MovieCard/template.html");
let template = await templateFile.text();

let MovieCard = {};

MovieCard.format = function (movie, categoryName = "") {
  if (!movie) return "";

  let html = template;

  html = html.replaceAll("{{id}}", movie.id);
  
  let title = movie.title || movie.name || "Titre inconnu";
  html = html.replaceAll("{{title}}", title);

  let category = categoryName || movie.category_name || movie.category || "À DÉCOUVRIR";
  html = html.replaceAll("{{category}}", category);

  if (movie.image) {
    let imgSrc = movie.image.startsWith("http")
      ? movie.image
      : "../server/images/" + movie.image;
    html = html.replaceAll("{{image}}", imgSrc);
  } else {
    html = html.replaceAll("{{image}}", "");
  }

  return html;
};

export { MovieCard };