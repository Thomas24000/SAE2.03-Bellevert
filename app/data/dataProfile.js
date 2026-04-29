let HOST_URL = "https://mmi.unilim.fr/~bellevert1/SAE2.03-Bellevert";

const DataProfile = {};

DataProfile.read = async function () {
    let answer = await fetch(HOST_URL + "/server/script.php?todo=readProfiles");
    let data = await answer.json();
    return data;
};

export { DataProfile };