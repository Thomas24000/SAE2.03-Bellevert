let templateFile = await fetch("./component/NavBar/template.html");
let template = await templateFile.text();

let NavBar = {};

NavBar.format = function (hAbout, hHome, profiles) {
  let html = template;
  html = html.replace("{{hAbout}}", hAbout);
  html = html.replace("{{hHome}}", hHome);
  let optionsHtml = "";
  if (profiles) { 
      for (let profile of profiles) {
          optionsHtml += `<option value="${profile.id_profile}">${profile.name}</option>`;
      }
  }
  html = html.replace("{{profiles_options}}", optionsHtml);
  return html;
};

export { NavBar };
