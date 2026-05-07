-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 07 mai 2026 à 11:15
-- Version du serveur : 10.11.14-MariaDB-0+deb12u2
-- Version de PHP : 8.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bellevert1`
--

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comédie'),
(3, 'Drame'),
(4, 'Science-fiction'),
(5, 'Animation'),
(6, 'Thriller'),
(7, 'Horreur'),
(8, 'Aventure'),
(9, 'Fantaisie'),
(10, 'Documentaire');

-- --------------------------------------------------------

--
-- Structure de la table `Favorite`
--

CREATE TABLE `Favorite` (
  `id_profile` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Favorite`
--

INSERT INTO `Favorite` (`id_profile`, `id_movie`) VALUES
(3, 12),
(3, 105),
(7, 12),
(7, 124);

-- --------------------------------------------------------

--
-- Structure de la table `Movie`
--

CREATE TABLE `Movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `min_age` int(11) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Movie`
--

INSERT INTO `Movie` (`id`, `name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`, `is_featured`) VALUES
(7, 'Interstellar', 2014, 169, 'Un groupe d\'explorateurs voyage à travers un trou de ver pour sauver l\'humanité.', 'Christopher Nolan', 4, 'interstellar.jpg', 'https://www.youtube.com/embed/VaOijhK3CRU?si=76Ke4uw4LYjuLuQ6', 12, 0),
(12, 'La Liste de Schindler', 1993, 195, 'Un industriel allemand sauve des milliers de Juifs pendant l\'Holocauste.', 'Steven Spielberg', 3, 'schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE?si=xC3ASGGPy5Ib-aPn', 16, 0),
(17, 'Your Name', 2016, 107, 'Deux adolescents échangent leurs corps de manière mystérieuse.', 'Makoto Shinkai', 5, 'your_name.jpg', 'https://www.youtube.com/embed/AROOK45LXXg?si=aUQyGk2VMCb_ToUL', 10, 0),
(27, 'Le Bon, la Brute et le Truand', 1966, 161, 'Trois hommes se lancent à la recherche d\'un trésor caché.', 'Sergio Leone', 8, 'bon_brute_truand.jpg', 'https://www.youtube.com/embed/WA1hCZFOPqs?si=TwNZAoM4oj4KpGja', 12, 0),
(31, 'La reine des neige', 2013, 102, 'Anna, une jeune fille aussi audacieuse qu\'optimiste, se lance dans un incroyable voyage en compagnie de Kristoff, un montagnard expérimenté, et de son fidèle renne Sven, à la recherche de sa soeur, Elsa, la reine des neiges qui a plongé le royaume d\'Arendelle dans un hiver éternel. En chemin, ils vont rencontrer de mystérieux trolls et un drôle de bonhomme de neige nommé Olaf, braver les conditions extrêmes des sommets escarpés et glacés, et affronter la magie qui les guette à chaque pas.', 'Jennifer Lee', 3, 'neige.jpg', 'https://www.youtube.com/watch?v=uyP70r9PS6A', 0, 0),
(32, 'Arthur et les Minimoys', 2006, 94, 'Un garçon découvre un monde miniature et part à l’aventure pour sauver sa maison.', 'Luc Besson', 5, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/35/85/13/18684533.jpg', 'https://www.youtube.com/watch?v=4l0lHkF7Y6M', 0, 0),
(93, 'Apex', 2026, 135, 'Sasha pratique l\'escalade de haut niveau. Frappée par un deuil, elle tente de se changer les idées en grimpant sur des falaises en forêt. Elle est alors prise en chasse par un braconnier inconnu.', 'Baltasar Kormákur', 1, 'https://tse1.mm.bing.net/th/id/OIP.Q53T2u5e20hYnwroVjRNTQAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 'https://www.youtube.com/embed/ELJ_orzMy1M', 16, 0),
(94, 'Arthur et les Minimoys', 2006, 94, 'Un garçon découvre un monde miniature et part à l’aventure pour sauver sa maison.', 'Luc Besson', 5, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/35/85/13/18684533.jpg', 'https://www.youtube.com/embed/nwYpQF4ESks', 0, 0),
(95, 'Astérix et Obélix : Mission Cléopâtre', 2002, 107, 'Cléopâtre, piquée au vif par Jules César qui dénigre la grandeur de son peuple, lui lance un défi : construire en trois mois un palais somptueux qui prouvera la supériorité de la civilisation égyptienne.', 'Alain Chabat', 2, 'https://fr.web.img5.acsta.net/pictures/23/06/21/12/06/4953335.jpg', 'https://www.youtube.com/embed/7Nd1ZCwB5PI', 0, 0),
(96, 'Bee Movie', 2007, 91, 'Une abeille intente un procès contre les humains pour exploitation du miel.', 'Simon J. Smith, Steve Hickner', 5, 'https://fr.web.img4.acsta.net/c_310_420/medias/nmedia/18/36/06/79/18807204.jpg', 'https://www.youtube.com/embed/VONRQMx78YI', 0, 0),
(97, 'Blade Runner 2049', 2017, 163, 'En 2049, la société est fragilisée par les nombreuses tensions entre les humains et leurs esclaves créés par bio-ingénierie. L\'officier K est un Blade Runner chargé d\'éliminer les réplicants rebelles.', 'Denis Villeneuve', 4, 'https://fr.web.img2.acsta.net/c_310_420/pictures/17/08/24/15/18/597734.jpg', 'https://www.youtube.com/embed/O4C5cwSbXZ8', 0, 0),
(98, 'Citizenfour', 2014, 114, 'En 2013, Laura Poitras reçoit des e-mails cryptés d\'un mystérieux CITIZENFOUR qui prétend détenir des preuves de programmes de surveillance illégaux menés par la NSA. Cet informateur s\'avère être Edward Snowden.', 'Laura Poitras', 10, 'citizenfour.jpg', 'https://www.youtube.com/embed/rHaWhUjV96M', 0, 0),
(99, 'Coraline', 2009, 100, 'Coraline Jones est une fillette intrépide qui découvre une porte secrète dans sa nouvelle maison. Elle débouche sur un monde parallèle qui ressemble étrangement au sien, mais en mieux.', 'Henry Selick', 9, 'https://cdng.europosters.eu/pod_public/1300/263026.jpg', 'https://www.youtube.com/embed/MZBDf37W3rM', 0, 0),
(100, 'Django Unchained', 2012, 165, 'Dans le sud des États-Unis, deux ans avant la guerre de Sécession, le chasseur de primes d\'origine allemande, le Dr King Schultz, fait l\'acquisition de Django, un esclave qui peut l\'aider à traquer les frères Brittle.', 'Quentin Tarantino', 1, 'django.jpg', 'https://www.youtube.com/embed/0fUCuvNlOCg', 16, 0),
(101, 'Dragons', 2010, 98, 'Un jeune Viking se lie d’amitié avec un dragon, changeant la vision de son peuple.', 'Chris Sanders, Dean DeBlois', 5, 'https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/18/73/01/74/19343191.jpg', 'https://www.youtube.com/embed/8rR_zgI-cmk', 0, 0),
(102, 'Fantastic Mr. Fox', 2009, 87, 'Un renard rusé vole les fermiers voisins, mettant sa famille en danger.', 'Wes Anderson', 5, 'https://fr.web.img4.acsta.net/c_310_420/medias/nmedia/18/71/80/31/19225583.jpg', 'https://www.youtube.com/embed/XtAnXfDIBqY', 0, 0),
(103, 'I Robot', 2004, 115, 'Un policier enquête sur un robot impliqué dans un meurtre malgré les lois de la robotique.', 'Alex Proyas', 4, 'https://fr.web.img4.acsta.net/c_310_420/medias/nmedia/18/35/23/49/18381860.jpg', 'https://www.youtube.com/embed/PjECS38ZGWE', 10, 0),
(104, 'Independence Day', 1996, 145, 'L’humanité affronte une invasion extraterrestre destructrice.', 'Roland Emmerich', 4, 'https://fr.web.img3.acsta.net/c_310_420/medias/nmedia/18/73/27/10/19196653.jpg', 'https://www.youtube.com/embed/lYaVIrVB9x8', 10, 0),
(105, 'Inglourious Basterds', 2009, 153, 'Dans la France occupée, Shosanna Dreyfus assiste à l\'exécution de sa famille par le colonel nazi Hans Landa. Ailleurs, le lieutenant Aldo Raine forme un groupe de soldats pour mener des opérations punitives.', 'Quentin Tarantino', 1, 'https://www.reforme.net/wp-content/uploads/2020/11/7736093674_2e8414a35_OK_WEB.jpg', 'https://www.youtube.com/embed/KnrRy6kSFF0', 16, 0),
(106, 'James Bond Skyfall', 2012, 143, 'Lorsqu’une mission tourne mal à Istanbul, James Bond est porté disparu et présumé mort. Peu après, le MI6 subit une attaque informatique qui vise directement M.', 'Sam Mendes', 1, 'skyfall.jpg', 'https://www.youtube.com/embed/6kw1UVovByw', 12, 0),
(107, 'John Wick : Chapitre 3', 2019, 130, 'John Wick est en fuite après avoir enfreint la règle suprême du Continental : tuer un homme dans l’enceinte de l’hôtel.', 'Chad Stahelski', 1, 'https://image.tmdb.org/t/p/original/ejODG5DtqCVJm85XVt2BOxMrHxF.jpg', 'https://www.youtube.com/embed/M7XM597XO94', 12, 0),
(108, 'John Wick : Chapitre 4', 2023, 169, 'John Wick poursuit sa lutte contre la Grande Table, l’organisation toute‑puissante qui régit le monde criminel.', 'Chad Stahelski', 1, 'https://th.bing.com/th/id/OIP.z4ODeP4zFI4k6jahRWm2gwHaJ4?w=147&h=196&c=7&r=0&o=7&pid=1.7&rm=3', 'https://www.youtube.com/embed/6itn_8L6-Z8', 12, 0),
(109, 'Joker', 2019, 122, 'L’histoire sombre d’un homme marginal qui devient le célèbre criminel Joker.', 'Todd Phillips', 3, 'https://fr.web.img4.acsta.net/c_310_420/pictures/19/09/03/12/02/4765874.jpg', 'https://www.youtube.com/embed/HL3EuCbcOAo', 16, 0),
(110, 'Kung fu panda', 2008, 132, 'Un panda maladroit devient un maître du kung-fu pour sauver la vallée de la paix.', 'Mark Osborne', 5, 'https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/18/36/20/29/18944269.jpg', 'https://www.youtube.com/embed/PXi3Mv6KMzY', 0, 0),
(111, 'Le Labyrinthe', 2014, 113, 'Un groupe d’adolescents tente de s’échapper d’un labyrinthe géant.', 'Wes Ball', 4, 'https://fr.web.img6.acsta.net/c_310_420/pictures/14/09/18/14/58/418353.jpg', 'https://www.youtube.com/embed/LyPiCH_4Al4', 12, 0),
(112, 'Le Monde de Nemo', 2003, 100, 'Un poisson clown traverse l’océan pour retrouver son fils capturé.', 'Andrew Stanton', 5, 'https://fr.web.img3.acsta.net/c_310_420/medias/nmedia/18/35/15/45/20258956.jpg', 'https://www.youtube.com/embed/XtAnXfDIBqY', 0, 0),
(113, 'Men in Black', 1997, 98, 'Deux agents secrets surveillent les extraterrestres vivant sur Terre.', 'Barry Sonnenfeld', 4, 'https://fr.web.img3.acsta.net/c_310_420/pictures/14/05/26/16/57/120603.jpg', 'https://www.youtube.com/embed/UxUTTrU6PA4', 10, 0),
(114, 'Men in Black II', 2002, 88, 'L’agent J doit retrouver K pour sauver la Terre d’une menace extraterrestre.', 'Barry Sonnenfeld', 4, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/00/02/33/46/af.jpg', 'https://www.youtube.com/embed/DMHlNR6x2Sw', 10, 0),
(115, 'Men in Black III', 2012, 106, 'L’agent J voyage dans le passé pour sauver son partenaire et l’humanité.', 'Barry Sonnenfeld', 4, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/89/36/03/20072335.jpg', 'https://www.youtube.com/embed/IyaFEBI_L24', 10, 0),
(116, 'Oppenheimer', 2023, 180, 'Le film retrace la vie de J. Robert Oppenheimer, physicien brillant mais tourmenté, depuis ses années de formation en Europe jusqu’à la direction du Projet Manhattan.', 'Christopher Nolan', 6, 'https://fontmeme.com/images/oppenheimer-font.jpg', 'https://www.youtube.com/embed/uYPbbksJxIg', 16, 0),
(117, 'Pirates des Caraïbes', 2003, 143, 'Un pirate excentrique s’allie à un forgeron pour sauver une jeune femme.', 'Gore Verbinski', 8, 'https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/18/35/07/46/affiche2.jpg', 'https://www.youtube.com/embed/WiZC7l0ovvk', 10, 0),
(118, 'Prince of Persia', 2010, 116, 'Un prince protège une dague magique capable de manipuler le temps.', 'Mike Newell', 8, 'prince_persia.jpg', 'https://www.youtube.com/embed/mRDE5l-PJYY', 10, 0),
(120, 'Robots', 2005, 91, 'Un robot inventeur tente de changer le monde dans une société mécanique.', 'Chris Wedge', 5, 'https://fr.web.img4.acsta.net/c_310_420/medias/nmedia/18/35/46/07/18408708.jpg', 'https://www.youtube.com/embed/zyLI71Z0RF4', 0, 0),
(121, 'Rush Hour', 1998, 98, 'Un policier américain et un inspecteur chinois doivent collaborer pour sauver une enfant kidnappée.', 'Brett Ratner', 1, 'https://fr.web.img6.acsta.net/c_310_420/medias/03/77/86/037786_af.jpg', 'https://www.youtube.com/embed/JMiFsFQcFLE', 12, 0),
(122, 'Rush Hour II', 2001, 90, 'Le duo enquête sur un réseau de fausse monnaie à Hong Kong.', 'Brett Ratner', 1, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/00/02/26/64/69214847_af.jpg', 'https://www.youtube.com/embed/SCTzYY95Aw4', 12, 0),
(123, 'Sausage Party', 2016, 89, 'Une saucisse nommée Frank s\'embarque dans une aventure périlleuse pour découvrir la vérité sur son existence.', 'Conrad Vernon', 5, 'sausage_party.jpg', 'https://www.youtube.com/embed/h_1d3q3mZ0o', 12, 0),
(124, 'Scary Movie 1', 2000, 88, 'Un soir, Drew Becker reçoit un appel anonyme d\'un maniaque. Sa mort plonge ses camarades de lycée en plein cauchemar.', 'Shawn Wayans', 2, 'scary_movie_1.jpg', 'https://www.youtube.com/embed/SzpGYrrcJZw', 16, 0),
(125, 'Scary Movie 2', 2001, 83, 'Un jour, un professeur fou oblige Cindy et sa bande de copains déjantés à aller visiter une maison hantée pour une expérience scientifique.', 'Shawn Wayans', 2, 'scary_movie_2.jpg', 'https://www.youtube.com/embed/zCFZUZxBVuI', 16, 0),
(126, 'Scary Movie 3', 2003, 85, 'Parce qu\'elle a visionné la cassette au pouvoir démoniaque, Cindy sait qu\'il ne lui reste plus que sept jours à vivre.', 'Pat Proft', 2, 'scary_movie_3.jpg', 'https://www.youtube.com/embed/O21wD8Tzr2k', 16, 0),
(127, 'Scary Movie 4', 2006, 83, 'Cindy Campbell est toujours terriblement blonde. Mais bourrée de bonnes intentions.', 'Craig Mazin', 2, 'scary_movie_4.jpg', 'https://www.youtube.com/embed/-Bwr6LB5Dqw', 16, 0),
(128, 'Scary Movie 5', 2013, 89, 'Jody et Dan, qui forment un jeune couple, emménagent avec leur bébé dans une maison où semblent se manifester d\'étranges phénomènes.', 'John Aboud', 2, 'scary_movie_5.jpg', 'https://www.youtube.com/embed/RMDZ8M47j0I', 16, 0),
(129, 'Sonic 1, le film', 2020, 99, 'L\'histoire du hérisson bleu le plus rapide du monde qui arrive sur Terre.', 'Jeff Fowler', 8, 'https://fr.web.img6.acsta.net/c_310_420/pictures/20/02/10/17/16/0746079.jpg', 'https://www.youtube.com/embed/szby7ZHLnkA', 0, 0),
(130, 'Sonic 2, le film', 2022, 122, 'Bien installé dans la petite ville de Green Hills, Sonic veut maintenant prouver qu’il a l’étoffe d\'un véritable héros.', 'Jeff Fowler', 8, 'https://fr.web.img3.acsta.net/c_310_420/pictures/22/03/14/15/39/4137538.jpg', 'https://www.youtube.com/embed/G5kzUpWAusI', 0, 0),
(131, 'Sonic 3, le film', 2024, 109, 'Sonic, Knuckles et Tails se retrouvent face à un nouvel adversaire, Shadow.', 'Jeff Fowler', 8, 'https://fr.web.img2.acsta.net/c_310_420/img/85/e7/85e77c51c172da4aec13679210295a11.jpg', 'https://www.youtube.com/embed/qSu6i2iFMO0', 0, 0),
(132, 'Spider-Man: Across the Spider-Verse', 2023, 141, 'Après avoir retrouvé Gwen Stacy, Spider-Man est catapulté à travers le Multivers.', 'Phil Lord', 5, 'https://fr.web.img2.acsta.net/pictures/23/05/11/10/00/1986933.jpg', 'https://www.youtube.com/embed/cqGjhVJWtEg', 0, 0),
(133, 'Spider-Man: Into the Spider-Verse', 2018, 117, 'Les aventures de Miles Morales, un adolescent qui vit à Brooklyn et s’efforce de s’intégrer dans son nouveau collège.', 'Phil Lord', 5, 'https://upload.wikimedia.org/wikipedia/en/f/fa/Spider-Man_Into_the_Spider-Verse_poster.png', 'https://www.youtube.com/embed/cqGjhVJWtEg', 0, 0),
(134, 'Star Wars I : La Menace fantôme', 1999, 136, 'Avant de devenir un célèbre chevalier Jedi, Anakin Skywalker est un jeune esclave sur la planète Tatooine.', 'George Lucas', 4, 'star_wars_1.jpg', 'https://www.youtube.com/embed/bD7bpG-zDJQ', 0, 0),
(135, 'Super Mario Bros', 2023, 92, 'Alors qu’ils tentent de réparer une canalisation souterraine, Mario et son frère Luigi se retrouvent plongés dans un nouvel univers.', 'Matthew Fogel', 5, 'mario_bros.jpg', 'https://www.youtube.com/embed/iwst-UZn3wM', 0, 0),
(136, 'Super Mario Galaxy', 2026, 99, 'À peine installés au Royaume Champignon, un mystérieux appel à l\'aide va pousser Mario et Luigi à reprendre du service.', 'Matthew Fogel', 5, 'mario_galaxy.jpg', 'https://www.youtube.com/embed/BHRN7Oufjw4', 0, 1),
(137, 'The Grand Budapest Hotel', 2014, 100, 'Bien que décrépit et quasi désert, le Grand Budapest Hotel porte encore l\'empreinte de sa gloire d\'antan.', 'Wes Anderson', 2, 'https://m.media-amazon.com/images/I/61d94a9ot6L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/G1jG8HUY4zI', 0, 0),
(138, 'The Mask', 1994, 101, 'Un homme trouve un masque magique qui lui donne des pouvoirs délirants.', 'Chuck Russell', 2, 'https://fr.web.img6.acsta.net/medias/nmedia/18/64/88/83/19255620.jpg', 'https://www.youtube.com/embed/LZl69yk5lEY', 10, 0),
(139, 'The Matrix', 1999, 136, 'Un hacker découvre que la réalité est une simulation contrôlée par des machines.', 'Lana Wachowski', 4, 'https://fr.web.img4.acsta.net/c_310_420/medias/04/34/49/043449_af.jpg', 'https://www.youtube.com/embed/m8e-FF8MsqU', 12, 0),
(140, 'The Truman Show', 1998, 103, 'Un homme découvre que sa vie est filmée en permanence pour une émission télévisée.', 'Peter Weir', 4, 'https://fr.web.img6.acsta.net/c_310_420/pictures/22/05/16/16/32/4176595.jpg', 'https://www.youtube.com/embed/dlnmQbPGuls', 10, 0),
(141, 'Titanic', 1997, 194, 'Le paquebot le plus grand et le plus moderne du monde appareille pour son premier voyage.', 'James Cameron', 3, 'https://m.media-amazon.com/images/I/811lT7khIrL.jpg', 'https://www.youtube.com/embed/CHekzSiZjrY', 12, 0),
(142, 'Top Gun', 1986, 110, 'Jeune as du pilotage et tête brûlée, Pete Mitchell tombe sous le charme d\'une instructrice.', 'Tony Scott', 1, 'https://cdng.europosters.eu/pod_public/750/262811.jpg', 'https://www.youtube.com/embed/xa_z57UatDY', 12, 0),
(143, 'Top Gun: Maverick', 2022, 131, 'Après avoir été l’un des meilleurs pilotes de chasse pendant plus de trente ans, Pete Mitchell continue à repousser ses limites.', 'Joseph Kosinski', 1, 'https://fr.web.img3.acsta.net/pictures/22/03/29/15/12/0827894.jpg', 'https://www.youtube.com/embed/qSqVVswa420', 0, 0),
(144, 'WALL-E', 2008, 98, 'Wall-E, un petit robot, est le dernier être sur Terre ! Il y a 700 ans, l\'humanité a déserté notre planète.', 'Andrew Stanton', 4, 'https://cdng.europosters.eu/pod_public/750/266362.jpg', 'https://www.youtube.com/embed/CZ1CATNbXg0', 0, 0),
(145, 'Indiana Jones et l\'arche perdue', 1981, 115, 'Le célèbre archéologue Indiana Jones est engagé pour retrouver l\'Arche d\'Alliance avant que les nazis ne s\'en emparent.', 'Steven Spielberg', 8, 'indiana_jones.jpg', 'https://www.youtube.com/embed/0xQSIdSRlAk', 10, 0),
(146, 'Le Seigneur des Anneaux 1', 2001, 178, 'Un jeune Hobbit, Frodon Sacquet, hérite d\'un anneau magique et doit entreprendre un périlleux voyage.', 'Peter Jackson', 8, 'lotr_1.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4', 10, 0),
(147, 'Le Voyage de Chihiro', 2001, 125, 'Une fillette de dix ans se retrouve piégée dans un monde peuplé d\'esprits.', 'Hayao Miyazaki', 5, 'https://m.media-amazon.com/images/I/71k9S3fenYL.jpg', 'https://www.youtube.com/embed/ByXuk9QqQkk', 0, 0),
(148, 'Le Comte de Monte-Cristo', 2024, 178, 'Victime d’un complot, le jeune Edmond Dantès est arrêté le jour de son mariage pour un crime qu’il n’a pas commis.', 'A. de La Patellière', 8, 'monte_cristo.jpg', 'https://www.youtube.com/embed/u0YnbsyvGS0', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `Profile`
--

CREATE TABLE `Profile` (
  `id_profile` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `age_restriction` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Profile`
--

INSERT INTO `Profile` (`id_profile`, `name`, `avatar`, `age_restriction`) VALUES
(3, 'Adulte', '', 0),
(7, 'Ado', '', 16),
(8, 'Enfant', '', 12);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Favorite`
--
ALTER TABLE `Favorite`
  ADD PRIMARY KEY (`id_profile`,`id_movie`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `Profile`
--
ALTER TABLE `Profile`
  ADD PRIMARY KEY (`id_profile`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Movie`
--
ALTER TABLE `Movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT pour la table `Profile`
--
ALTER TABLE `Profile`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Favorite`
--
ALTER TABLE `Favorite`
  ADD CONSTRAINT `Favorite_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `Profile` (`id_profile`) ON DELETE CASCADE,
  ADD CONSTRAINT `Favorite_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `Movie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `Category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
