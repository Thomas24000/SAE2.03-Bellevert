let templateFile = await fetch("./component/EditProfile/template.html");
let template = await templateFile.text();

let EditProfile = {};

EditProfile.format = function (hSELECT, hUPDATE, profiles) {
  let html = template;
  html = html.replace("{{hSELECT}}", hSELECT);
  html = html.replace("{{hUPDATE}}", hUPDATE);

  let optionsHtml = "";

  if (profiles) {
    optionsHtml = profiles
      .map((p) => `<option value="${p.id_profile}">${p.name}</option>`)
      .join("");
  }
  html = html.replace("{{options_profiles}}", optionsHtml);

  return html;
};

export { EditProfile };
