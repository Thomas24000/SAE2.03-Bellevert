let templateFile = await fetch("./component/MovieCategory/template.html");
let template = await templateFile.text();

let MovieCategory = {};

MovieCategory.format = function (name, moviesHtml) {
  let html = template;
  html = html.replace('{{name}}', name);
  html = html.replace('{{carrousel}}', moviesHtml);
  
  return html;
};

export { MovieCategory };