let templateFile = await fetch("./component/EnAvant/template.html");
let template = await templateFile.text();

let EnAvant = {};

EnAvant.format = function (movie) {
  if (!movie) return "";

  let html = template;

  html = html.replaceAll("{{name}}", movie.name || movie.title);
  html = html.replaceAll("{{description}}", movie.description || movie.synopsis);
  html = html.replaceAll("{{id}}", movie.id);

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

export { EnAvant };