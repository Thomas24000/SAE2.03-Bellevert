let templateFile = await fetch("./component/Alert/template.html");
let template = await templateFile.text();

let Alert = {};

Alert.format = function (messageText) {
  let html = template;
  html = html.replaceAll('{{texte}}', messageText);
  return html;
};

export { Alert };