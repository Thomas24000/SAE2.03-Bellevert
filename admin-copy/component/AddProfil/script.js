let templateFile = await fetch("./component/AddProfil/template.html");
let template = await templateFile.text();

let AddProfil = {};

AddProfil.format = function (handler) {
  let html = template;
  html = html.replace("{{handler}}", handler);
  return html;
};

export { AddProfil };