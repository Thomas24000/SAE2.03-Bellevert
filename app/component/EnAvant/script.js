let templateFile = await fetch("./component/EnAvant/template.html");
let template = await templateFile.text();

let EnAvant = {};

// Vérifie bien le mot que tu utilises ici (ex: "movie" ou "film")
EnAvant.format = function (movie) {
  let html = template;

  // ATTENTION : c'est movie.name, pas movie.title !
  html = html.replaceAll("{{name}}", movie.name);

  // ATTENTION : c'est movie.description
  html = html.replaceAll("{{description}}", movie.description);

  // Et on n'oublie pas notre astuce pour les images !
  if (movie.image) {
    let imgSrc = movie.image.startsWith("http")
      ? movie.image
      : "../server/images/" + movie.image;
    html = html.replaceAll("{{image}}", imgSrc);
  } else {
    html = html.replaceAll("{{image}}", ""); // Sécurité si pas d'image
  }

  return html;
};

export { EnAvant };
