<?php


define("HOST", "localhost");
define("DBNAME", "bellevert1");
define("DBLOGIN", "bellevert1");
define("DBPWD", "bellevert1");

/**
 * Récupère la liste complète des films dans la base de données.
 * * @return array Un tableau d'objets contenant toutes les informations des films.
 */
function getAllMovies()
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "SELECT id, name, year, length, description, director, id_category, image, trailer, min_age FROM Movie";

    $stmt = $cnx->prepare($sql);

    $stmt->execute();

    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}


/**
 * Ajoute un nouveau film dans la base de données.
 *
 * @param string $n Le titre du film.
 * @param string $dir Le réalisateur du film.
 * @param int $y L'année de sortie du film.
 * @param int $len La durée du film en minutes.
 * @param string $desc Le synopsis du film.
 * @param int $cat L'ID de la catégorie du film.
 * @param int $age La restriction d'âge (0, 10, 12, 16, 18).
 * @param string $img Le nom du fichier image de l'affiche.
 * @param string $trl L'URL de la bande-annonce.
 * @return int Le nombre de lignes affectées par la requête de mise à jour.
 * * A SAVOIR: une requête SQL de type INSERT retourne le nombre de lignes insérées.
 * Si la requête a réussi, le nombre de lignes affectées sera 1.
 * Si la requête a échoué, le nombre de lignes affectées sera 0.
 */
function addMovie($n, $dir, $y, $len, $desc, $cat, $age, $img, $trl)
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "INSERT INTO Movie (name, director, year, length, description, id_category, min_age, image, trailer) 
            VALUES (:name, :director, :year, :length, :description, :id_category, :min_age, :image, :trailer)";

    $stmt = $cnx->prepare($sql);

    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':director', $dir);
    $stmt->bindParam(':year', $y);
    $stmt->bindParam(':length', $len);
    $stmt->bindParam(':description', $desc);
    $stmt->bindParam(':id_category', $cat);
    $stmt->bindParam(':min_age', $age);
    $stmt->bindParam(':image', $img);
    $stmt->bindParam(':trailer', $trl);

    $stmt->execute();

    $res = $stmt->rowCount();
    return $res;
}

function getMovieById($id)
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "SELECT * FROM Movie WHERE id = :id";

    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $res = $stmt->fetch(PDO::FETCH_OBJ);
    return $res;
}

function getAllCategories()
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "SELECT * FROM Category";

    $stmt = $cnx->prepare($sql);
    $stmt->execute();

    $res = $stmt->fetchAll(PDO::FETCH_OBJ);

    return $res;
}

function addProfile($n, $av, $age)
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "INSERT INTO Profile (name, avatar, age_restriction) 
            VALUES (:name, :avatar, :age_restriction)";

    $stmt = $cnx->prepare($sql);

    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':avatar', $av);
    $stmt->bindParam(':age_restriction', $age);

    $stmt->execute();

    $res = $stmt->rowCount();
    return $res;
}

function getAllProfiles()
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    $sql = "SELECT * FROM Profile";
    $stmt = $cnx->prepare($sql);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function readMoviesByAge($ageLimit)
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    if ($ageLimit == 0) {
        $sql = "SELECT * FROM Movie";
        $stmt = $cnx->prepare($sql);
    } else {
        $sql = "SELECT * FROM Movie WHERE min_age <= :age";
        $stmt = $cnx->prepare($sql);
        $stmt->bindParam(':age', $ageLimit, PDO::PARAM_INT);
    }
    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function updateProfile($id, $n, $av, $age)
{
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "UPDATE Profile 
            SET name = :name, avatar = :avatar, age_restriction = :age 
            WHERE id_profile = :id";
    $stmt = $cnx->prepare($sql);

    $stmt->bindParam(':name', $n);
    $stmt->bindParam(':avatar', $av);
    $stmt->bindParam(':age', $age);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);

    return $stmt->execute();
}

function addFavorite($id_p, $id_m) {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    $sql = "INSERT IGNORE INTO Favorite (id_profile, id_movie) VALUES (:id_p, :id_m)";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_p', $id_p);
    $stmt->bindParam(':id_m', $id_m);
    
    $stmt->execute();
    
    return $stmt->rowCount(); 
}

function getFavorites($id_p) {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "SELECT m.* FROM Movie m 
            INNER JOIN Favorite f ON m.id = f.id_movie 
            WHERE f.id_profile = :id_p";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_p', $id_p);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function removeFavorite($id_p, $id_m) {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    $sql = "DELETE FROM Favorite WHERE id_profile = :id_p AND id_movie = :id_m";
    $stmt = $cnx->prepare($sql);
    $stmt->bindParam(':id_p', $id_p);
    $stmt->bindParam(':id_m', $id_m);
    $stmt->execute();

    return $stmt->rowCount(); 
}

function getFeaturedMovie() {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    
    $sql = "SELECT * FROM Movie WHERE is_featured = 1 ORDER BY RAND() LIMIT 1";
    $stmt = $cnx->query($sql);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$result) {
        $sql = "SELECT * FROM Movie LIMIT 1";
        $stmt = $cnx->query($sql);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
    }
    
    return $result;
}

function getStatistics() {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    $stats = [];

    $stmt = $cnx->query("SELECT COUNT(*) AS total FROM Profile");
    $stats['total_profiles'] = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

    $stmt = $cnx->query("SELECT COUNT(*) AS total FROM Movie");
    $stats['total_movies'] = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

    $stmt = $cnx->query("SELECT COUNT(*) AS total FROM Favorite");
    $total_favs = $stmt->fetch(PDO::FETCH_ASSOC)['total'];

    $stats['avg_favs'] = $stats['total_profiles'] > 0 ? round($total_favs / $stats['total_profiles'], 1) : 0;

    $sql_movie = "SELECT m.name, COUNT(f.id_movie) AS fav_count 
                  FROM Favorite f 
                  INNER JOIN Movie m ON f.id_movie = m.id 
                  GROUP BY f.id_movie 
                  ORDER BY fav_count DESC LIMIT 1";
    $stmt = $cnx->query($sql_movie);
    $top_movie = $stmt->fetch(PDO::FETCH_ASSOC);
    $stats['top_movie'] = $top_movie ? $top_movie['name'] : "Aucun";

    $sql_cat = "SELECT c.name, COUNT(f.id_movie) AS fav_count 
                FROM Favorite f 
                INNER JOIN Movie m ON f.id_movie = m.id 
                INNER JOIN Category c ON m.id_category = c.id 
                GROUP BY c.id 
                ORDER BY fav_count DESC LIMIT 1";
    $stmt = $cnx->query($sql_cat);
    $top_cat = $stmt->fetch(PDO::FETCH_ASSOC);
    $stats['top_category'] = $top_cat ? $top_cat['name'] : "Aucune";

    return $stats;
}

function searchMovies($keyword) {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);

    $sql = "SELECT * FROM Movie WHERE name LIKE :keyword ORDER BY name ASC";
    $stmt = $cnx->prepare($sql);

    $stmt->execute(['keyword' => '%' . $keyword . '%']);
    
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function searchMoviesAdmin($keyword) {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    $sql = "SELECT m.*, c.name as category_name 
            FROM Movie m 
            LEFT JOIN Category c ON m.id_category = c.id 
            WHERE m.name LIKE :keyword 
            ORDER BY m.name ASC";
    $stmt = $cnx->prepare($sql);
    $stmt->execute(['keyword' => '%' . $keyword . '%']);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function setMovieFeatured($id, $status) {
    $cnx = new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME . ";charset=utf8", DBLOGIN, DBPWD);
    
    $sql = "UPDATE Movie SET is_featured = :status WHERE id = :id";
    $stmt = $cnx->prepare($sql);
    
    $status_int = ($status == '1' || $status === true || $status === 1) ? 1 : 0;
    $reussite = $stmt->execute(['status' => $status_int, 'id' => $id]);
    
    return ['success' => $reussite];
}

?>