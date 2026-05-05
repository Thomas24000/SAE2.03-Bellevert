let templateFile = await fetch("./component/StatsBoard/template.html");
let template = await templateFile.text();

let StatsBoard = {};

StatsBoard.format = function (statsData) {
  let html = template;
  html = html.replaceAll('{{total_profiles}}', statsData.total_profiles);
  html = html.replaceAll('{{total_movies}}', statsData.total_movies);
  html = html.replaceAll('{{avg_favs}}', statsData.avg_favs);
  html = html.replaceAll('{{top_movie}}', statsData.top_movie);
  html = html.replaceAll('{{top_category}}', statsData.top_category);
  return html;
};

export { StatsBoard };