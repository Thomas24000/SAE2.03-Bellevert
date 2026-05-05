let templateFile = await fetch("./component/MovieCard/template.html");
let template = await templateFile.text();

let MovieCard = {};

MovieCard.format = function (data, css = "") {
  let html = template;
  html = html.replaceAll("{{cssClass}}", css);
  let imgSrc = data.image.startsWith("http")
    ? data.image
    : "../server/images/" + data.image;
  html = html.replaceAll("{{image}}", imgSrc);
  html = html.replaceAll("{{title}}", data.name);
  html = html.replaceAll("{{id}}", data.id);
  return html;
};

export { MovieCard };
