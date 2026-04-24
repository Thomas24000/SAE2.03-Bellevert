let templateFile = await fetch("./component/MovieDetail/template.html");
let template = await templateFile.text();

let MovieDetail = {};

MovieDetail.format = function (data, css = "") {
  let html = template;
  html = html.replaceAll("{{cssClass}}", css);
  html = html.replaceAll("{{image}}", "../server/images/" + data.image);
  html = html.replaceAll("{{titre}}", data.name);
  html = html.replaceAll("{{date}}", data.year);
  html = html.replaceAll("{{duree}}", data.length);
  html = html.replaceAll("{{synopsis}}", data.description);
  html = html.replaceAll("{{age}}", data.min_age);
  html = html.replaceAll("{{trailer}}", data.trailer);
  return html;
};

export { MovieDetail };
