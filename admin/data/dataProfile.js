let HOST_URL = "https://mmi.unilim.fr/~bellevert1/SAE2.03-Bellevert";

let DataProfile = {};

DataProfile.add = async function (fdata) {
  let config = {
    method: "POST",
    body: fdata,
  };

  let answer = await fetch(
    HOST_URL + "/server/script.php?todo=addProfile",
    config,
  );
  let data = await answer.json();

  return data;
};

export { DataProfile };