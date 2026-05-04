let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();

let MovieDetail = {};

MovieDetail.format = function (data, isFavorite = false, css = "") {
  let html = template;
  html = html.replaceAll("{{cssClass}}", css);
  html = html.replaceAll("{{image}}", "../server/images/" + data.image);
  html = html.replaceAll("{{titre}}", data.name);
  html = html.replaceAll("{{date}}", data.year);
  html = html.replaceAll("{{synopsis}}", data.description);
  html = html.replaceAll("{{age}}", data.min_age);
  html = html.replaceAll("{{trailer}}", data.trailer);
  html = html.replaceAll("{{id}}", data.id);
  
  let boutonHtml = "";
  if (isFavorite) {
      boutonHtml = `<button onclick="C.handlerRemoveFavorite('${data.id}')" class="btn-fav"> Retirer des favoris ❌</button>`;
  } else {
      boutonHtml = `<button onclick="C.handlerAddFavorite('${data.id}')" class="btn-fav"> Ajouter aux favoris ❤️</button>`;
  }
  
  html = html.replaceAll("{{bouton_favori}}", boutonHtml);
  
  return html;
};

export { MovieDetail };