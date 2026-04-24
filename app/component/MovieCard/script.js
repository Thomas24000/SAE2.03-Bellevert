let templateFile = await fetch("./component/MovieCard/template.html");
let template = await templateFile.text();

let MovieCard = {};

MovieCard.format = function (data, css = "") {
  
  
  let html = template;
    html = html.replaceAll("{{cssClass}}", css);
    html = html.replaceAll("{{image}}", "../server/images/" + data.image);
    html = html.replaceAll("{{title}}", data.name);
  return html;
};

export { MovieCard };
