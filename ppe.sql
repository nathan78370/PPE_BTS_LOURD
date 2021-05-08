
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS ppe;
CREATE DATABASE ppe;
USE ppe;


--
-- Base de données : `ppe`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `pass` varchar(128) NOT NULL,
  `Role` int(11) NOT NULL COMMENT '1 = Admin / 0 = Employée',
  `locked` tinyint(1) DEFAULT 0 COMMENT '1 = compte verrouillé'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `pass`, `Role`, `locked`) VALUES
(1, 'Admin', 'admin@gmail.com', '107d348bff437c999a9ff192adcb78cb03b8ddc6', 1, 0),
(5, 'employe', 'employe@gmail.com', '107d348bff437c999a9ff192adcb78cb03b8ddc6', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
(1, 'Voiture'),
(2, 'Accessoires'),
(3, 'Bus'),
(4, 'Camion');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `nom_image` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id_image`, `nom_image`) VALUES
(1, 'moteurAudi.jpg'),
(2, 'retro.jpg'),
(3, 'VolantVoiture.jpg'),
(4, 'downpipe.jpg'),
(5, 'jante.jpg'),
(6, 'pessi.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

CREATE TABLE `journal` (
  `id` int(11) NOT NULL,
  `dateconnect` datetime DEFAULT NULL,
  `etat` tinyint(1) NOT NULL,
  `PersonID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `journal`
--

INSERT INTO `journal` (`id`, `dateconnect`, `etat`, `PersonID`) VALUES
(35, '2021-04-24 20:59:46', 1, 4);


-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `titre_produit` varchar(128) NOT NULL,
  `description_courte` varchar(280) NOT NULL,
  `description_longue` varchar(255) NOT NULL,
  `qteProduit` int(6) NOT NULL,
  `prix` float NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `titre_produit`, `description_courte`, `description_longue`, `qteProduit`, `prix`, `id_categorie`, `id_image`) VALUES
(1, 'Moteur de Voiture Audi A3', 'Moteur;Voiture;Audi;A3;', 'Ceci est un moteur blablabla ', 1, 799, 1, 1),
(2, 'Rétroviseur Renault ', '', 'Rétroviseur de la marque Renault avec une tes grande flexibilité ', 100, 39, 2, 2),
(4, 'Volant GT sport +', 'volant, voiture, sport', 'Un volant en carbone de wish qui pèse environ 361 kg ce qui va te donner l\'impression de conduire un camtar', 200, 29, 1, 3),
(6, 'downpipe Scania V8', 'scania, camion, downpipe, V8', 'Downpipe pour Scania V8 5ème génération, idéal pour une reprogrammation moteur', 0, 299.99, 4, 4),
(7, 'jante pour bus ', 'jante, bus,', 'jante en aluminium', 5, 45.5, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(70) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `adresse` varchar(128) DEFAULT NULL,
  `email` varchar(70) NOT NULL,
  `pass` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `tel`, `adresse`, `email`, `pass`) VALUES
(18, 'LeCLient', '0674661495', '8 Rue Ernest Lefevre', 'user@gmail.com', '107d348bff437c999a9ff192adcb78cb03b8ddc6'),
(20, 'Steve', '0688367843', '8 Rue Ernest Lefevre', 'stevizou@g.com', '9ce5770b3bb4b2a1d59be2d97e34379cd192299f');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`);

--
-- Index pour la table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PersonID` (`PersonID`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_categorie` (`id_categorie`),
  ADD KEY `id_image` (`id_image`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

-- Contraintes pour la table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `panier`

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_image`) REFERENCES `image` (`id_image`) ON DELETE CASCADE;
COMMIT;

