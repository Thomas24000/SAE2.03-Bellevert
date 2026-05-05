let templateFile = await fetch("./component/AdminMovieRow/template.html");
let template = await templateFile.text();

let AdminMovieRow = {};

AdminMovieRow.format = function (film) {
  let html = template;
  html = html.replaceAll('{{id}}', film.id);
  html = html.replaceAll('{{name}}', film.name);
  
  let catName = film.category_name ? film.category_name : "Non classé";
  html = html.replaceAll('{{category_name}}', catName);
  
  let isFeatured = (film.is_featured == 1 || film.is_featured === "1" || film.is_featured === true);
  html = html.replaceAll('{{checked}}', isFeatured ? 'checked' : '');
  html = html.replaceAll('{{status_text}}', isFeatured ? '⭐ Mis en avant' : 'Standard');
  
  return html;
};

export { AdminMovieRow };