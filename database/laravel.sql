-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2022 at 06:04 PM
-- Server version: 10.6.11-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `lunch_id` varchar(195) DEFAULT NULL,
  `vacation_id` varchar(195) DEFAULT NULL,
  `extra_id` varchar(199) DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `amount` varchar(255) DEFAULT NULL,
  `cost` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `user_id`, `lunch_id`, `vacation_id`, `extra_id`, `paid`, `amount`, `cost`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(21, 70, '1', NULL, NULL, 0, '70.00', 35, 2, 1, NULL, NULL),
(22, 70, NULL, '1', NULL, 1, NULL, 0, 0, 0, NULL, NULL),
(23, 70, NULL, '1', NULL, 1, NULL, 0, 0, 0, NULL, NULL),
(24, 70, NULL, '2', NULL, 0, '25.00', 5, 5, 1, NULL, NULL),
(25, 70, NULL, '2', NULL, 0, NULL, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `arrival_picture` varchar(191) DEFAULT NULL,
  `gps_in` mediumtext DEFAULT NULL,
  `arrival_date` varchar(50) DEFAULT NULL,
  `arrival_hour` time DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `break_duration` time DEFAULT NULL,
  `break_hour` time DEFAULT NULL,
  `late` time DEFAULT NULL,
  `late_time` varchar(199) DEFAULT NULL,
  `departure_date` varchar(50) DEFAULT NULL,
  `departure_hour` time DEFAULT NULL,
  `departure_picture` varchar(191) DEFAULT NULL,
  `gps_out` mediumtext DEFAULT NULL,
  `hours_worked` varchar(50) DEFAULT NULL,
  `over_time` varchar(199) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT 'attendance_status',
  `is_end` int(11) NOT NULL,
  `is_csv` int(11) DEFAULT NULL,
  `week_number` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `transport` varchar(32) DEFAULT NULL,
  `extra` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `staff_status` int(11) DEFAULT 2 COMMENT 'staff_attendance_status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `arrival_picture`, `gps_in`, `arrival_date`, `arrival_hour`, `start_hour`, `break_duration`, `break_hour`, `late`, `late_time`, `departure_date`, `departure_hour`, `departure_picture`, `gps_out`, `hours_worked`, `over_time`, `status`, `is_end`, `is_csv`, `week_number`, `comment`, `transport`, `extra`, `location`, `staff_status`, `created_at`, `updated_at`) VALUES
(19, 71, 'https://time.memohi.fr/uploads/picture/1663951308.png', '7 Rue du Plassa, 31270 Cugnaux, France', '2022-09-23', '18:41:00', '18:41:00', NULL, NULL, NULL, '06:46:00', '2022-09-25', '02:15:00', 'https://time.memohi.fr/uploads/picture/1664064956.png', '2B Chem. de Maurens, 31270 Cugnaux, France', '00:00:45', '16:06:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-09-23 14:41:43', '2022-09-24 22:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `bonus` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `bonus`
--

INSERT INTO `bonus` (`id`, `user_id`, `location_id`, `bonus`, `created_at`, `updated_at`) VALUES
(16, 70, 10, '$10', NULL, NULL),
(17, 70, 10, '$10', NULL, NULL),
(18, 70, 26, '$60', NULL, NULL),
(19, 70, 26, '$60', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `start` varchar(191) NOT NULL,
  `end` varchar(191) NOT NULL,
  `startStr` varchar(191) NOT NULL,
  `endStr` varchar(191) NOT NULL,
  `display` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `guests` varchar(191) DEFAULT NULL,
  `calendar` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `allDay` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `todos` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` text DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `industry` enum('Restauration traditionnelle','Restauration rapide','Hôtellerie','Boulangerie / pâtisserie','Alimentaire','Santé & Pharmacie','Retail & boutiques','Loisirs & Sports','Services','Autres') NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('Pending','Active','Inactive') NOT NULL DEFAULT 'Pending',
  `current_plan` enum('Basic','Company','Entreprise','Team') NOT NULL DEFAULT 'Basic',
  `role` enum('Admin','Author','Editor','Maintainer','Subscriber') NOT NULL DEFAULT 'Subscriber',
  `theme` int(11) NOT NULL DEFAULT 0 COMMENT '0-Light,1-Dark'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `complain_by` varchar(191) NOT NULL,
  `complain_against` varchar(191) NOT NULL,
  `complain_date` varchar(191) NOT NULL,
  `tag` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contract_type`
--

INSERT INTO `contract_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Apprenti', '2022-03-10 01:45:36', NULL),
(2, 'CDD', '2022-03-10 01:45:36', NULL),
(3, 'CDD Saisonnier', '2022-03-10 01:45:36', NULL),
(4, 'CDI', '2022-03-10 01:45:36', NULL),
(5, 'CTT', '2022-09-22 04:05:07', NULL),
(6, 'CUI', '2022-03-10 01:45:36', NULL),
(7, 'Extra', '2022-03-10 01:45:36', NULL),
(8, 'Mise à disposition', '2022-03-10 01:45:36', NULL),
(9, 'Professionnalisation', '2022-03-10 01:45:36', NULL),
(10, 'Stage', '2022-09-22 04:05:07', NULL),
(11, 'Temporaire', '2022-09-22 04:05:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `convention_code_ape`
--

CREATE TABLE `convention_code_ape` (
  `id` int(11) NOT NULL,
  `convention_collective_id` int(11) NOT NULL,
  `code_ape_id` varchar(50) NOT NULL,
  `code_ape_text` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `convention_code_ape`
--

INSERT INTO `convention_code_ape` (`id`, `convention_collective_id`, `code_ape_id`, `code_ape_text`) VALUES
(1, 5, '4520A', 'Entretien et réparation de véhicules automobiles légers'),
(2, 6, '11.05Z', 'Fabrication de bières (ce qui comprend la fabrication de bière, par fermentation à partir d\'eau, de '),
(3, 6, '11.07A', 'Industrie des eaux de table (ce qui comprend la production d\'eaux minérales naturelles et autres eau'),
(4, 6, '11.07B', 'Production de boissons rafraîchissantes (ce qui comprend la production de boissons rafraîchissantes non alcoolisées, édulcorées et/ou aromatisées telles que citronnade, orangeade, cola, boissons au thé, boissons énergétiques, boissons à base de fruits, tonic, etc. ; la production de sirops de fruits ; la production de boissons sans alcool diverses ; la production d\'« apéritifs sans alcool » ; la production de laits aromatisés)'),
(6, 7, '1071A', 'Fabrication industrielle de pain et de pâtisserie fraîche'),
(7, 7, '1071B', 'Cuisson de produits de boulangerie'),
(8, 7, '1085Z', 'Fabrication de plats préparés'),
(9, 7, '1089Z', 'Fabrication d\'autres produits alimentaires n.c.a'),
(10, 7, '5610C', 'Restauration de type rapide'),
(11, 7, '1071C', 'Boulangerie et boulangerie-pâtisserie'),
(12, 8, '7729Z', 'Location de linge'),
(13, 8, '9601B', 'Blanchisserie. - Teinturerie de détail'),
(14, 8, '9601A', 'Blanchisserie. - Teinturerie de gros'),
(15, 9, '5621Z', 'Service des traiteurs'),
(16, 9, '4722Z', 'Commerce de détail de viandes et de produits à base de viande en magasin spécialisé'),
(17, 10, '4724Z', 'Commerce de détail de pain, pâtisserie et confiserie en magasin spécialisé'),
(18, 10, '10.71C', 'Boulangerie et boulangerie-pâtisserie'),
(19, 10, '10.71D', 'Pâtisserie'),
(20, 10, '10.71B', 'Boulangerie'),
(21, 11, '10.71C', 'Boulangerie et boulangerie-pâtisserie'),
(22, 11, '10.71D', 'Pâtisserie'),
(23, 11, '10.71B', 'Boulangerie'),
(24, 12, '52.4/ P', 'entreprises ayant une surface minimale de 400 mètres carrés dont l\'activité se caractérise par la vente au détail en libre-service assisté d\'articles de bricolage'),
(25, 12, '4752B', 'Commerce de détail de quincaillerie, peintures et verres en grandes surfaces (400 m² et plus)'),
(26, 13, '1813Z', ' Activités de pré-presse'),
(27, 13, '2599B', 'Fabrication d autres articles métalliques'),
(28, 13, '2612Z', 'Fabrication de cartes électroniques assemblées'),
(29, 13, '2620Z', 'Fabrication d ordinateurs et d équipements périphériques'),
(30, 13, '2899B', 'Fabrication d autres machines spécialisées'),
(31, 13, '3900Z', 'Dépollution et autres services de gestion des déchets'),
(32, 13, '4110C', 'Promotion immobilière d autres bâtiments'),
(33, 13, '4110D', 'Supports juridiques de programmes'),
(34, 13, '4299Z', 'Construction d autres ouvrages de génie civil n.c.a.'),
(35, 13, '4321B', 'Travaux d installation électrique sur la voie publique'),
(36, 13, '4332C', 'Agencement de lieux de vente'),
(37, 13, '4617A', 'Centrales d achat alimentaires'),
(38, 13, '4618Z', 'Intermédiaires spécialisés dans le commerce d autres produits spécifiques'),
(39, 13, '4619B', 'Autres intermédiaires du commerce en produits divers'),
(40, 13, '4651Z', 'Commerce de gros (commerce interentreprises) d ordinateurs, d équipements informatiques périphériques et de logiciels'),
(41, 13, '4652Z', 'Commerce de gros (commerce interentreprises) de composants et d équipements électroniques et de télécommunication'),
(42, 13, '4741Z', 'Commerce de détail d ordinateurs, d unités périphériques et de logiciels en magasin spécialisé'),
(43, 13, '4791A', 'Vente à distance sur catalogue général'),
(44, 13, '4791B', ' Vente à distance sur catalogue spécialisé'),
(45, 13, '5819Z', 'Autres activités d édition'),
(46, 13, '5821Z', 'Édition de jeux électroniques'),
(47, 13, '5829A', 'Édition de logiciels système et de réseau'),
(48, 13, '5829B', 'Edition de logiciels outils de développement et de langages'),
(49, 13, '5829C', 'Edition de logiciels applicatifs'),
(50, 13, '5911B', 'Production de films institutionnels et publicitaires'),
(51, 13, '5911C', 'Production de films pour le cinéma'),
(52, 13, '5912Z', 'Post-production de films cinématographiques, de vidéo et de programmes de télévision'),
(53, 13, '5920Z', 'Enregistrement sonore et édition musicale'),
(54, 13, '6190Z', 'Autres activités de télécommunication'),
(55, 13, '6201Z', 'Programmation informatique'),
(56, 13, '6202A', 'Conseil en systèmes et logiciels informatiques'),
(57, 13, '6202B', 'Tierce maintenance de systèmes et d applications informatiques'),
(58, 13, '6203Z', 'Gestion d installations informatiques'),
(59, 13, '6209Z', 'Autres activités informatiques'),
(60, 13, '6311Z', 'Traitement de données, hébergement et activités connexes'),
(61, 13, '6312Z', 'Portails internet'),
(62, 13, '6391Z', 'Activités des agences de presse'),
(63, 13, '6420Z', 'Activités des sociétés holding'),
(64, 13, '6430Z', 'Fonds de placement et entités financières similaires'),
(65, 13, '6499Z', 'Autres activités des services financiers, hors assurance et caisses de retraite, n.c.a.'),
(66, 13, '6612Z', 'Courtage de valeurs mobilières et de marchandises'),
(67, 13, '6619B', 'Autres activités auxiliaires de services financiers, hors assurance et caisses de retraite, n.c.a.'),
(68, 13, '6621Z', 'évaluation des risques et dommages'),
(69, 13, '6630Z', 'Gestion de fonds'),
(70, 13, '6810Z', 'Activités des marchands de biens immobiliers'),
(71, 13, '6820B', 'Location de terrains et d autres biens immobiliers'),
(72, 13, '7010Z', 'Activités des sièges sociaux'),
(73, 13, '7021Z', 'Conseil en relations publiques et communication'),
(74, 13, '7022Z', 'Conseil pour les affaires et autres conseils de gestion'),
(75, 13, '7111Z', 'Activités d architecture'),
(76, 13, '7112A', 'Activité des géomètres'),
(77, 13, '7112B', 'Ingénierie, études techniques'),
(78, 13, '7120B', 'Analyses, essais et inspections techniques'),
(79, 13, '7211Z', 'Recherche-développement en biotechnologie'),
(80, 13, '7311Z', 'Activités des agences de publicité'),
(81, 13, '7312Z', 'Régie publicitaire de médias'),
(82, 13, '7320Z', 'études de marché et sondages'),
(83, 13, '7410Z', 'Activités spécialisées de design'),
(84, 13, '7430Z', 'Traduction et interprétation'),
(85, 13, '7490A', 'Activité des économistes de la construction'),
(86, 13, '7490B', 'Activités spécialisées, scientifiques et techniques diverses'),
(87, 13, '7733Z', 'Location et location-bail de machines de bureau et de matériel informatique'),
(88, 13, '7740Z', 'Location-bail de propriété intellectuelle et de produits similaires, à l exception des œuvres soumises à copyright'),
(89, 13, '7990Z', 'Autres services de réservation et activités connexes'),
(90, 13, '8211Z', 'Services administratifs combinés de bureau'),
(91, 13, '8219Z', 'Photocopie, préparation de documents et autres activités spécialisées de soutien de bureau'),
(92, 13, '8220Z', 'Activités de centres d appels'),
(93, 13, '8230Z', 'Organisation de foires, salons professionnels et congrès'),
(94, 13, '8291Z', 'Activités des agences de recouvrement de factures et des sociétés d information financière sur la clientèle'),
(95, 13, '8299Z', 'Autres activités de soutien aux entreprises n.c.a.'),
(96, 13, '8559A', 'Formation continue d adultes'),
(97, 13, '8560Z', 'Activités de soutien à l enseignement'),
(98, 13, '8690F', 'Activités de santé humaine non classées ailleurs'),
(99, 13, '9004Z', 'Gestion de salles de spectacles'),
(100, 13, '9511Z', 'Réparation d ordinateurs et d équipements périphériques'),
(101, 14, '8623Z', 'PRATIQUE DENTAIRE'),
(102, 15, '21.06', 'Construction métallique'),
(103, 15, '24.03', 'Fabrication et installation de matériel aéraulique, thermique et frigorifique'),
(104, 15, '55.10', 'Travaux d\'aménagement des terres et des eaux, voirie, parcs et jardins'),
(105, 15, '55.12', 'Travaux d\'infrastructure générale'),
(106, 15, '55.20', 'Entreprises de forages, sondages, fondations spéciales'),
(107, 15, '55.30', 'Installations industrielles, montage-levage'),
(108, 15, '55.40', 'Installation électrique'),
(109, 15, '55.50', 'Construction industrialisée'),
(110, 15, '55.60', 'Maçonnerie et travaux courants de béton armé'),
(111, 15, '55.70', 'Génie climatique'),
(112, 15, '55.71', 'Menuiserie-serrurerie'),
(113, 15, '55.72', 'Couverture-plomberie, installations sanitaires'),
(114, 15, '4399D', 'Autres travaux spécialisés de construction'),
(115, 15, '55.73', 'Aménagements-finitions'),
(116, 15, '87.08', 'Services de nettoyage'),
(117, 16, '9200Z', 'Organisation de jeux de hasard et d\'argent'),
(118, 17, '9499Z', 'autres organisations fonctionnant par adhésion volontaire'),
(119, 17, '7010Z', 'Activité des sièges sociaux'),
(120, 17, '7022Z', 'Conseil pour les affaires et autres conseils de gestion'),
(121, 17, '4762Z', 'Commerce de détail de journaux et papeterie en magasin spécialisé'),
(122, 17, '4775Z', 'Commerce de détail sauf des automobiles et des motocycles'),
(123, 17, '1052Z', 'Fabrication de glaces et sorbets'),
(124, 18, '9602A', 'Coiffure'),
(125, 19, '4771Z', 'Commerce de détail d\'habillement en magasin spécialisé'),
(126, 19, '6420Z', 'Activités des sociétés holding'),
(127, 20, '4729Z', 'Autres commerces de détail alimentaires en magasin spécialisé'),
(128, 20, '4711B', 'Commerce d\'alimentation générale'),
(129, 20, '4711C', 'Supérettes'),
(130, 20, '4711D', 'Supermarchés'),
(131, 20, '4721Z', 'Commerce de détail de fruits et légumes en magasin spécialisé'),
(132, 20, '4781Z', 'Commerce de détail alimentaire sur éventaires et marchés'),
(133, 20, '4725Z', 'Commerce de détail de boissons en magasin spécialisé'),
(134, 20, '4719B', 'Autres commerces de détail en magasin non spécialisé'),
(135, 21, '47.29Z', 'Autres commerces de détail alimentaires en magasin spécialisé'),
(136, 21, '47.11B', 'Commerce d\'alimentation générale'),
(137, 21, '47.11C', 'Supérettes'),
(138, 21, '47.11D', 'Supermarchés'),
(139, 21, '47.21Z ', 'Commerce de détail de fruits et légumes en magasin spécialisé'),
(140, 21, '47.81Z', 'Commerce de détail alimentaire sur éventaires et marchés'),
(141, 21, '47.25Z', 'Commerce de détail de boissons en magasin spécialisé'),
(142, 21, '4719B', 'Autres commerces de détail en magasin non spécialisé'),
(143, 22, '4633Z', 'Commerce de gros (commerce interentreprises) de produits laitiers, oeufs, huiles et matières grasses comestibles'),
(144, 22, '4617A ', 'Centrales d\'achats de produits de grande consommation appartenant aux entreprises du commerce de détail à prédominance alimentaire (alimentations générales, supérettes, supermarchés, hypermarchés)'),
(145, 22, '47.11F', 'Hypermarchés (commerce de détail non spécialisé à prédominance alimentaire en magasin d\'une surface de vente supérieure à 2 500 m2)'),
(146, 22, '4711D', 'Commerce de détail non spécialisé à prédominance alimentaire'),
(147, 22, '46-17B', 'Autres intermédiaires du commerce en denrées, boissons et tabac'),
(148, 22, '46-38B', 'Commerce de gros (commerce interentreprise) alimentaire spécialisé divers'),
(149, 22, '47-25Z ', 'Commerce de détail de boissons en magasin spécialisé'),
(150, 23, '47.11B', 'Commerce d\'alimentation générale (commerce de détail non spécialisé à prédominance alimentaire en magasin d\'une surface inférieure à 120 m2)'),
(151, 23, '47.11C', 'Supérettes (commerce de détail non spécialisé à prédominance alimentaire en magasin d\'une surface de vente comprise entre 120 et 400 m2)'),
(152, 23, '47.11F', 'Hypermarchés (commerce de détail non spécialisé à prédominance alimentaire en magasin d\'une surface de vente supérieure à 2 500 m2)'),
(153, 23, '47.25Z partiel', 'Commerce de détail de boissons exercé par les seules entreprises à succursales multiples dont les magasins sont gérés par des gérants mandataires non salariés, dont le statut est fixé aux articles L. 7322-1 et suivants du code du travail'),
(154, 23, '46.38B partiel', 'Activité unique ou principale du commerce de gros de farines et produits pour boulangeries'),
(155, 23, '46.39B', 'entreprises de commerce de gros à prédominance alimentaire qui vendent des produits de grande consommation en libre-service à des commerçants détaillants ou artisans censés payer comptant et emporter la marchandise, ainsi que celles non spécialisées également qui, à titre exclusif, fournissent aux collectivités privées et publiques et à la restauration, plusieurs catégories de produits alimentaires'),
(156, 23, '46.17A  ', 'Centrales d\'achats de produits de grande consommation appartenant aux entreprises du commerce de détail à prédominance alimentaire (alimentations générales, supérettes, supermarchés, hypermarchés)'),
(157, 23, '46-17B', 'Autres intermédiaires du commerce en denrées, boissons et tabac'),
(158, 23, '46-38B', 'Commerce de gros (commerce interentreprise) alimentaire spécialisé divers'),
(159, 23, '47-25Z', 'Commerce de détail de boissons en magasin spécialisé'),
(160, 23, '4711D', 'Commerce de détail non spécialisé à prédominance alimentaire'),
(161, 24, '57', 'Commerce de gros alimentaire'),
(162, 24, '58', 'Commerce de gros non alimentaire'),
(163, 24, '59', 'Commerce de gros inter-industriel'),
(164, 24, '61', 'Commerce de détail d\'alimentation générale de grande surface.'),
(165, 24, '60', 'Intermédiaire du commerce.'),
(166, 24, '62', 'Commerce de détail alimentaire de proximité ou spécialisé.'),
(167, 24, '63', 'Commerce de détail non alimentaire non spécialisé.'),
(168, 24, '64', 'Commerce de détail non alimentaire spécialisé.'),
(169, 24, '65-01', 'Commerce de détail d\'accessoires et d\'équipements automobiles'),
(170, 24, '65-02', 'Commerce de détail de carburants et lubrifiants'),
(171, 24, '66', 'Réparations diverses'),
(172, 25, '4764Z', 'Commerce de détail d\'articles de sport en magasin spécialisé'),
(173, 26, '4651Z', 'Commerce de gros (commerce interentreprises) d\'ordinateurs, d\'équipements informatiques périphériques et de logiciels'),
(174, 26, '4665Z', 'Commerce de gros (commerce interentreprises) de mobilier de bureau'),
(175, 26, '4666Z', 'Commerce de gros (commerce interentreprises) d\'autres machines et équipements de bureau'),
(176, 26, '4741Z', 'Commerce de détail d\'ordinateurs, d\'unités périphériques et de logiciels en magasin spécialisé'),
(177, 26, '4759A', 'Commerce de détail de meubles'),
(178, 26, '4762Z', 'Commerce de détail de journaux et papeterie en magasin spécialisé'),
(179, 26, '4778C', 'Autres commerces de détail spécialisés divers'),
(180, 26, '518G', 'Commerce de gros d\'ordinateurs, d\'équipements informatiques périphériques et de progiciels'),
(181, 26, '518H', 'Commerce de gros d\'autres machines et équipements de bureau'),
(182, 26, '524R', 'Commerce de détail de livres, journaux et papeterie'),
(183, 26, '524Z', 'Commerces de détail divers en magasin spécialisé'),
(184, 27, '47.19B', 'Autre commerce de détail en magasin non spécialisé (surface inférieure à 2 500 m²)'),
(185, 27, '47.52A', 'Commerce de détail de quincaillerie, peintures et verres en petites surface (400 m² et plus)'),
(186, 27, '47.65Z', 'Commerce de détail de jeux et jouets en magasin spécialisé'),
(187, 27, '47.72B', 'Commerce de détail de maroquinerie et d\'articles de voyage'),
(188, 27, '47.78C', 'Autres commerces de détail spécialisés divers'),
(189, 27, '47.79Z', 'Commerce de détail de biens d\'occasion en magasin'),
(190, 27, '47.89Z', 'Autres commerces de détail sur éventaires et marchés'),
(191, 27, '47.42Z', 'Commerce de détail de matériels de télécommunication en magasin spécialisé'),
(192, 27, '47.78C', 'Autres commerces de détail spécialisés divers'),
(193, 27, '47.59B', 'Commerce de détail d\'autres équipements du foyer'),
(194, 27, '4775Z', 'Commerce de détail de parfumerie et de produits de beauté en magasin spécialisé'),
(195, 28, '47.78C', 'Autres commerces de détail spécialisés divers'),
(196, 28, '4669C', 'Commerce de gros (commerce interentreprises) de fournitures et équipements divers pour le commerce et les services'),
(197, 28, '4631Z', 'Commerce de gros (commerce interentreprises) de fruits et légumes'),
(198, 29, '47.78C', 'Autres commerces de détail spécialisés divers'),
(199, 29, '6120Z', 'Télécommunications sans fil'),
(200, 30, '47.78C', 'Autres commerces de détail spécialisés divers'),
(201, 30, '3320D', 'Installation d équipements électriques, de matériels électroniques et optiques ou d autres matériels'),
(202, 30, '3812Z', 'Collecte des déchets dangereux'),
(203, 30, '4532Z', 'Commerce de détail d équipements automobiles'),
(204, 30, '4619A', 'Centrales d achat non alimentaires'),
(205, 30, '4643Z', 'Commerce de gros (commerce interentreprises) d appareils électroménagers'),
(206, 30, '4652Z', 'Commerce de gros (commerce interentreprises) de composants et d équipements électroniques et de télécommunication'),
(207, 30, '4726Z', 'Commerce de détail de produits à base de tabac en magasin spécialisé'),
(208, 30, '4741Z', 'Commerce de détail d ordinateurs, d unités périphériques et de logiciels en magasin spécialisé'),
(209, 30, '4742Z', ' Commerce de détail de matériels de télécommunication en magasin spécialisé'),
(210, 30, '4743Z', 'Commerce de détail de matériels audio et vidéo en magasin spécialisé'),
(211, 30, '4754Z', 'Commerce de détail d appareils électroménagers en magasin spécialisé'),
(212, 30, '4759B', 'Commerce de détail d autres équipements du foyer'),
(213, 30, '5210B', 'Entreposage et stockage non frigorifique'),
(214, 30, '5912Z', 'Post-production de films cinématographiques, de vidéo et de programmes de télévision'),
(215, 30, '5913A', 'Distribution de films cinématographiques'),
(216, 30, '6120Z', 'Télécommunications sans fil'),
(217, 30, '6190Z', 'Autres activités de télécommunication'),
(218, 30, '6209Z', 'Autres activités informatiques'),
(219, 30, '7729Z', 'Location et location-bail d autres biens personnels et domestiques'),
(220, 30, '7739Z', 'Location et location-bail d autres machines, équipements et biens matériels n.c.a.'),
(221, 30, '9511Z', 'Réparation d ordinateurs et d équipements périphériques'),
(222, 30, '9512Z', 'Réparation d équipements de communication'),
(223, 30, '9521Z', 'Réparation de produits électroniques grand public'),
(224, 30, '9522Z', 'Réparation d appareils électroménagers et d équipements pour la maison et le jardin'),
(225, 30, '9529Z', 'Réparation d autres biens personnels et domestiques'),
(226, 31, '47.78C', 'Autres commerces de détail spécialisés divers'),
(227, 31, '46.38A', 'commerce de gros, commerce interentreprises, de poissons, crustacés et mollusques'),
(228, 31, '03.21Z', ' aquaculture en mer'),
(229, 32, '47.78C', 'Autres commerces de détail spécialisés divers'),
(230, 32, '4772A', 'Commerce de détail de la chaussure'),
(231, 33, '47.78C', 'Autres commerces de détail spécialisés divers'),
(232, 33, '10.82Z', 'Fabrication de cacao, chocolat et de produits de confiserie'),
(233, 33, '47.24Z', 'Commerce de détail de pain, pâtisserie et confiserie en magasin spécialisé'),
(234, 33, '10.61B', 'Autres activités du travail des grains'),
(235, 33, '10.72Z', 'Fabrication de biscuits, biscottes et pâtisseries de conservation'),
(239, 35, '8559B', 'Autres enseignements'),
(240, 35, '8552Z', 'Enseignement culturel'),
(241, 35, '8542Z', 'Enseignement culturel'),
(242, 35, '8541Z', 'Enseignement post-secondaire non supérieur'),
(243, 35, '8532Z', 'Enseignement secondaire technique ou professionnel'),
(244, 35, '8531Z', 'Enseignement secondaire général'),
(245, 35, '8520Z', 'Enseignement primaire'),
(246, 35, '8510Z', 'Enseignement pré-primaire'),
(247, 36, '80.10z', 'Activités de sécurité privée'),
(248, 37, '81.2', 'activité de nettoyage de locaux y compris les activités de nettoyage à l\'occasion de remises en état'),
(249, 37, '96.01 A', 'activité de nettoyage à domicile de moquettes, tapis, tentures et rideaux'),
(250, 38, '8891A', ' Accueil de jeunes enfants'),
(251, 39, '47.91A', 'Vente à distance sur catalogue général'),
(252, 39, '47.91B', 'Vente à distance sur catalogue spécialisé'),
(253, 39, '46.69C', 'Commerce de gros (commerce interentreprises) de fournitures et équipements divers pour le commerce et les services'),
(254, 39, '46.18Z', 'Intermédiaires spécialisés dans le commerce d autres produits spécifiques'),
(255, 39, '46.44Z', 'Commerce de gros (commerce interentreprises) de vaisselle, verrerie et produits d entretien'),
(256, 40, '9001Z', 'Arts du spectacle vivant'),
(257, 41, '93.21Z', 'Activités des parcs d\'attractions et parcs à thèmes)'),
(258, 41, '91.02Z ', 'Gestion des musées'),
(259, 41, '91.03Z', 'Gestion des sites et monuments historiques et des attractions touristiques similaires'),
(260, 41, '91.04Z', 'Gestion du patrimoine naturel'),
(261, 41, '93.29Z', 'Autres activités récréatives et de loisirs NCA'),
(262, 42, '9602B', '9602B - Cosmétiques'),
(263, 42, '7010Z', '7010Z - Activités des sièges sociaux'),
(264, 42, '8532Z', '8532Z - Enseignement secondaire technique ou professionnel'),
(265, 42, '8541Z', '8541Z - Enseignement post-secondaire non supérieur'),
(266, 42, '8542Z', '8542Z - Enseignement supérieur'),
(267, 42, '8559A', '8559A - Formation continue d\'adultes'),
(268, 42, '8559B', '8559B - Autres enseignements'),
(269, 42, '4645Z', '4645Z - Commerce de gros (commerce interentreprises) de parfumerie et de produits de beauté'),
(270, 42, '4775Z', '4775Z - Commerce de détail de parfumerie et de produits de beauté en magasin spécialisé'),
(271, 42, '8690F', '8690F - Activités de santé humaine non classées ailleurs'),
(272, 42, '9313Z', '9313Z - Activités des centres de culture physique'),
(273, 42, '9604Z', '9604Z - Entretien corporel'),
(274, 43, '5914Z', 'Projection de films cinématographiques'),
(275, 44, '0145Z', 'Élevage d\'ovins et de caprins'),
(276, 46, '4776Z', 'Commerce de détail de fleurs, plantes, graines, engrais, animaux de compagnie et aliments pour ces animaux en magasin spécialisé'),
(277, 46, '0162Z', 'Activités de soutien à la production animale'),
(278, 46, '9609Z', 'Autres services personnels n.c.a.'),
(279, 46, '4789Z', 'Autres commerces de détail sur éventaires et marchés'),
(280, 46, '4622Z', 'Commerce de gros (commerce interentreprises) de fleurs et plantes'),
(281, 46, '4782Z', 'Commerce de détail de textiles, d habillement et de chaussures sur éventaires et marchés'),
(282, 46, '4791B', 'Vente à distance sur catalogue spécialisé'),
(283, 46, '7722Z', 'Location de vidéocassettes et disques vidéo'),
(284, 46, '8130Z', 'Services d\'aménagement paysager'),
(285, 47, '4776Z', '4776Z - Commerce de détails de fleurs, plantes, graines, engrais, animaux de compagnie et aliments pour ces animaux en magasin spécialisé'),
(286, 47, '9609Z', '9609Z - Autres services personnels n.c.a'),
(287, 47, '4789Z', '4789Z - Autres commerces de détails sur éventaires et marchés'),
(288, 47, '4622Z', '4622Z - Commerce de gros (commerce interentreprises) de fleurs et plantes'),
(289, 47, '4782Z', '4782Z - Commerce de détail de textiles, d\'habillement et de chaussures sur éventaires et marchés'),
(290, 47, '4791B', '4791B - Vente à distance sur catalogue spécialisé'),
(291, 47, '7722Z', '7722Z - Location de vidéocassettes et disques vidéos'),
(292, 47, '8130Z', '8130Z - Services d\'aménagement paysager'),
(293, 47, '47.00.77', '47.00.77 - commerce de détails de fleurs, plantes et graines'),
(294, 47, '47.00.79', '47.00.79 - commerce de détails d\'animaux de compagnie et d\'aliments pour animaux de compagnie'),
(295, 47, '0162Z', '0162Z - Activités de soutien à la production animale'),
(296, 47, '96. 09Z. P', '96. 09Z. P - entreprises artisanales de toilettage de chiens et chats'),
(297, 47, '96. 09Z', '96. 09Z - services aux animaux familiers'),
(298, 48, '4776Z', '4776Z - Commerce de détails de fleurs, plantes, graines, engrais, animaux de compagnie et aliments pour ces animaux en magasin spécialisé'),
(299, 48, '9609Z', '9609Z - Autres services personnels n.c.a'),
(300, 48, '4789Z', '4789Z - Autres commerces de détails sur éventaires et marchés'),
(301, 48, '4622Z', '4622Z - Commerce de gros (commerce interentreprises) de fleurs et plantes'),
(302, 48, '4782Z', '4782Z - Commerce de détail de textiles, d\'habillement et de chaussures sur éventaires et marchés'),
(303, 48, '4791B', '4791B - Vente à distance sur catalogue spécialisé'),
(304, 48, '7722Z', '7722Z - Location de vidéocassettes et disques vidéos'),
(305, 48, '8130Z', '8130Z - Services d\'aménagement paysager'),
(306, 48, '47.00.77', '47.00.77 - commerce de détails de fleurs, plantes et graines'),
(307, 48, '47.00.79', '47.00.79 - commerce de détails d\'animaux de compagnie et d\'aliments pour animaux de compagnie'),
(308, 48, '0162Z', '0162Z - Activités de soutien à la production animale'),
(309, 48, '96. 09Z. P', '96. 09Z. P - entreprises artisanales de toilettage de chiens et chats'),
(310, 48, '96. 09Z', '96. 09Z - services aux animaux familiers'),
(311, 51, '9311Z', 'Gestion d\'installations sportives'),
(312, 52, '521H', 'Grands magasins'),
(313, 52, '521E', 'Magasins populaires'),
(314, 52, '511P', 'centrales d\'achat des sociétés de grands magasins'),
(315, 52, '511U', 'Centrales d\'achat de magasins populaires'),
(316, 53, '5520Z', 'Hébergements tourisitiques et autre hébergement de courte durée'),
(317, 53, '5530Z', 'Terrains de camping et parcs pour caravanes ou véhicules de loisirs'),
(318, 54, '55.30Z', 'Terrains de camping et parcs pour caravanes ou véhicules de loisirs'),
(319, 54, '55.20Z', 'Hébergement touristique et autre hébergement de courte durée'),
(320, 57, '56.30Zp', '56.30Zp - Débits de boissons'),
(321, 57, '56.21Z', '56.21Z - Service des traiteurs'),
(322, 57, '93.11Z', '93.11Z - Gestion d\'installations sportives'),
(323, 57, '5520Z', '5520Z - Hébergement touristique et autre hébergement de courte durée'),
(324, 57, '5510Z', '5510Z - Hôtels et hébergement similaire'),
(325, 57, '4726Z', '4726Z - Commerce de détail de produits à base de tabac en magasin spécialisé'),
(326, 57, '55.10Zp', '55.10Zp - Hôtels et hébergements similaires'),
(327, 57, '56.10A', '56.10A - Restauration traditionnelle'),
(328, 57, '56.10B', '56.10B - Cafétérias et autres libres-services'),
(329, 58, '56.30Zp', 'Débits de boissons'),
(330, 58, '56.21Z', 'Service des traiteurs'),
(331, 58, '93.11Z', 'Gestion d\'installations sportives'),
(332, 58, '5520Z', 'Hébergement touristique et autre hébergement de courte durée'),
(333, 58, '4726Z', 'Commerce de détail de produits à base de tabac en magasin spécialisé'),
(334, 58, '55.10Zp', 'Hôtels et hébergements similaires'),
(335, 58, '56.10A', 'Restauration traditionnelle'),
(336, 58, '56.10B', 'Cafétérias et autres libres-services'),
(337, 59, '1629Z', 'Fabrication d\'objets divers en bois ; fabrication d\'objets en liège, vannerie et sparterie'),
(338, 60, '8899B', 'Action sociale sans hébergement n.c.a.'),
(339, 61, '81.10Z', 'Activités combinées de soutien lié aux bâtiments'),
(340, 61, '55.20Z', 'Hébergement touristique et autre hébergement de courte durée'),
(341, 61, '64.20Z et 70.10Z', 'holdings dont l\'activité principale s\'exerce à travers des filiales relevant de la présente convention, des groupements d\'intérêt économique, associations ou syndicats, créés par un groupe d\'entreprises relevant en majorité de la présente convention'),
(342, 61, '6831Z', 'Agences immobilières'),
(343, 62, '1073Z', '1073Z - Fabrication de pâtes alimentaires'),
(344, 62, '1039B', '1039B - Transformation et conservation de fruits'),
(345, 62, '1031Z', '1031Z - Transformation et conservation de pommes de terre'),
(346, 62, '1020Z', '1020Z - Transformation et conservation de poisson, de crustacés et de mollusques'),
(347, 62, '1085Z', '1085Z - Fabrication de plats préparés'),
(348, 62, '1013A', '1013A - Préparation industrielle de produits à base de viande'),
(349, 62, '1039A', '1039A - Autre transformation et conservation de légumes'),
(350, 62, '1089Z', '1089Z - Fabrication d\'autres produits alimentaires n.c.a.'),
(351, 64, '10.31Z', 'Transformation et conservation de pommes de terre'),
(352, 64, '10.89Z', 'Fabrication d\'autres produits alimentaires n.c.a'),
(353, 64, '10.73Z', 'Fabrication de pâtes alimentaires'),
(354, 64, '10.85Z', 'Fabrication de plats préparés'),
(355, 64, '10.20Z', 'Transformation et conservation de poisson, de crustacés et de mollusques'),
(356, 64, '10.39A', 'Autre transformationn et conservation de légumes'),
(357, 64, '10.13A', 'Préparation industrielle de produits à base de viande'),
(358, 64, '10.39B', 'Transformation et conservation de fruits'),
(359, 65, '3831Z', 'Démantèlement d\'épaves'),
(360, 65, '3832Z', 'Récupération de déchets triés'),
(361, 65, '4677Z', 'Commerce de gros (commerce interentreprises) de déchets et débris'),
(362, 66, '47.61Z', 'Commerce de détail de livres en magasin spécialisé'),
(363, 67, '2511Z', 'Fabrication de structures métalliques et de parties de structures'),
(364, 67, '2512Z', 'Fabrication de portes et fenêtres en métal'),
(365, 67, '2521Z', 'Fabrication de radiateurs et de chaudières pour le chauffage central'),
(366, 67, '2529Z', 'Fabrication d’autres réservoirs, citernes et conteneurs métalliques'),
(367, 67, '2530Z', 'Fabrication de générateurs de vapeur, à l’exception des chaudières pour le chauffage central'),
(368, 67, '2540Z', 'Fabrication d’armes et de munitions'),
(369, 67, '2550A', 'Forge, estampage, matriçage ; métallurgie des poudres'),
(370, 67, '2550B', 'Découpage, emboutissage'),
(371, 67, '2561Z', 'Traitement et revêtement des métaux'),
(372, 67, '2562A', 'Décolletage'),
(373, 67, '2562B', 'Mécanique industrielle'),
(374, 68, '9499Z', 'Autres organisations fonctionnant par adhésion volontaire'),
(375, 68, '8899B', 'Action sociale sans hébergement n.c.a'),
(376, 70, '4778A', 'Commerces de détail d\'optique'),
(377, 71, '7010 Z', 'Ape'),
(378, 72, '15-8B', 'Boulangerie-fabrique de pain'),
(379, 72, '15-8 C', 'Boulangerie-pâtisserie'),
(380, 72, '15-8 A', 'Boulangerie industrielle'),
(381, 72, '52-2 G', 'Boulangerie de détail'),
(382, 72, '52-2 G', 'Dépôt de pain'),
(383, 73, '52-2 G', '52-2 G - Boulangerie de détail'),
(384, 73, '4120A', '4120A - Construction de maisons individuelles'),
(385, 73, '2106', '2106 - Construction métallique'),
(386, 73, '2403', '2403 - Fabrication et installation de matériel aéraulique, thermique et frigorifique'),
(387, 73, '5510', '5510 - Travaux d\'aménagements des terres et des eaux, voirie, parcs et jardins'),
(388, 73, '5512', '5512 - Travaux d\'infrastructure générale'),
(389, 73, '5520', '5520 - Entreprises de forage, sondages, fondations spéciales'),
(390, 73, '5530', '5530 - Construction d\'ossatures autres que métalliques'),
(391, 73, '5531', '5531 - Installations industrielles, montage-levage'),
(392, 73, '5540', '5540 - Installation électrique'),
(393, 73, '5550', '5550 - Construction industrialisée'),
(394, 73, '5560', '5560 - Maçonnerie et travaux courants de béton armé'),
(395, 73, '5570', '5570 - Génie climatique'),
(396, 73, '5571', '5571 - Menuiserie-Serrurerie'),
(397, 73, '5572', '5572 - Couverture-plomberie-Installation sanitaire'),
(398, 73, '5573', '5573 - Aménagements-Finitions'),
(399, 73, '8708', '8708 - Services de nettoyage'),
(400, 73, '2107', '2107 - Menuiserie métallique de bâtiment'),
(401, 74, '52-2 G', 'Boulangerie de détail'),
(402, 74, '1071D', 'Pâtisserie'),
(403, 74, '1071C', 'Boulangerie et boulangerie-pâtisserie'),
(404, 74, '1052Z', 'Fabrication de glaces et de sorbets'),
(409, 75, '1071D', 'pâtisserie'),
(410, 75, '1071C', 'Boulangerie et boulangerie-pâtisserie'),
(411, 75, '1052Z', 'Fabrication de glaces et de sorbets'),
(412, 76, '55.10Z', 'Hôtels et hébergements similaires'),
(413, 76, '56.10A', 'Restauration traditionnelle'),
(414, 76, '56.10B', 'Cafétérias et autres libres-services'),
(415, 76, '56.30Z', 'Débits de boissons'),
(416, 77, '85-1C', 'Pratique médicale'),
(417, 79, '5629A', 'Restauration collective sous contrat'),
(418, 80, '91.04Z', 'Gestion des jardins botaniques et zoologiques et des réserves naturelles'),
(419, 81, '4619B', 'Autres intermédiaires du commerce en produits divers'),
(420, 81, '5221Z', 'Services auxiliaires des transports terrestres'),
(421, 81, '5911B', 'Production de films institutionnels et publicitaires'),
(422, 81, '5911C', 'Production de films pour le cinéma'),
(423, 81, '5920Z', 'Enregistrement sonore et édition musicale'),
(424, 81, '6190Z', 'Autres activités de télécommunication'),
(425, 81, '6201Z', 'Programmation informatique'),
(426, 81, '6311Z', 'Traitement de données, hébergement et activités connexes'),
(427, 81, '6312Z', 'Portails Internet'),
(428, 81, '6420Z', 'Activités des sociétés holding'),
(429, 81, '6430Z', 'Fonds de placement et entités financières similaires'),
(430, 81, '6499Z', 'Autres activités des services financiers, hors assurance et caisses de retraite, n.c.a.'),
(431, 81, '6820B', 'Location de terrains et d\'autres biens immobiliers'),
(432, 81, '7010Z', 'Activités des sièges sociaux'),
(433, 81, '7021Z', 'Conseil en relations publiques et communication'),
(434, 81, '7022Z', 'Conseil pour les affaires et autres conseils de gestion'),
(435, 81, '7311Z', 'Activités des agences de publicité'),
(436, 81, '7320Z', 'Études de marché et sondages'),
(437, 81, '7410Z', 'Activités spécialisées de design'),
(438, 81, '7430Z', 'Traduction et interprétation'),
(439, 81, '7490B', 'Activités spécialisées, scientifiques et techniques diverses'),
(440, 81, '7729Z', 'Location et location-bail d\'autres biens personnels et domestiques'),
(441, 81, '7740Z', 'Location-bail de propriété intellectuelle et de produits similaires, à l\'exception des oeuvres soumises à copyright'),
(442, 81, '8211Z', 'Services administratifs combinés de bureau'),
(443, 81, '8219Z', 'Photocopie, préparation de documents et autres activités spécialisées de soutien de bureau'),
(444, 81, '8220Z', 'Activités de centres d\'appels'),
(445, 81, '8230Z', 'Organisation de foires, salons professionnels et congrès'),
(446, 81, '8291Z', 'Activités des agences de recouvrement de factures et des sociétés d\'information financière sur la clientèle'),
(447, 81, '8299Z', 'Autres activités de soutien aux entreprises n.c.a'),
(448, 81, '9002Z', 'Activités de soutien au spectacle vivant'),
(449, 81, '9003B', 'Autre création artistique'),
(450, 82, '8211Z', 'Services administratifs combinés de bureau'),
(451, 83, '47.73Z', 'Commerce de détail de produits pharmaceutiques en magasin spécialisé'),
(452, 84, '522E', 'COMMERCE DE DETAIL DE POISSONS CRUSTACES ET MOLLUSQUES'),
(453, 86, '5911A', 'production de films et de programmes pour la télévision'),
(454, 86, '5911B', 'production de films institutionnels et publicitaires'),
(455, 87, '74.20Z', 'Activités photographiques'),
(456, 87, '59.12Z', 'Traitements des films relevant de l’industrie du cinéma et de la télévision'),
(457, 87, '71.12B', 'Information cartographique et spatiale'),
(458, 87, '96.09Z', 'Exploitation de cabines fonctionnant en libre-service avec des pièces'),
(459, 87, '47.78C', 'Autres commerces de détails spécialisés divers'),
(460, 88, '70-01 C', 'entreprises assurant une activité d\'aménageurs et de lotisseurs'),
(461, 88, '70-1 A, ou 70-1 B, ou 70-1 C, ou 70-1 D', 'entreprises prenant l\'initiative de réalisations immobilières et coordonnant les opérations nécessaires à l\'étude, l\'exécution et la mise à la disposition des usagers de programmes de construction'),
(462, 88, '70-1 A, 45-2 A, 45-2 B', 'entreprises dont l\'activité principale est la conception, la commercialisation, auprès de maîtres d\'ouvrage particuliers, de maisons individuelles en application des dispositions des articles L. 231-1 et suivants et L. 232-1 et suivants du code de la construction et de l\'habitation'),
(463, 89, '602 C', 'Téléphériques, remontées mécaniques'),
(464, 89, '9311Z', 'Gestion d installations sportives'),
(465, 90, '56.10C', 'Restauration rapide'),
(466, 91, '56.10C', 'Restauration rapide'),
(467, 93, '4511Z', 'APE'),
(468, 93, '5221Z', 'Ape'),
(469, 94, '78.30Z', 'Autre mise à disposition de ressources humaines'),
(470, 94, '93.11Z', 'Gestion d’installations sportives'),
(471, 94, '93.12Z', 'Activités de clubs de sports'),
(472, 94, '93.13Z', 'Activités des centres de culture physique'),
(473, 94, '93.19Z', 'Autres activités liées au sport'),
(474, 94, '93.29Z', 'Autres activités récréatives et de loisirs nca'),
(475, 94, '85.51Z', 'Enseignement de disciplines sportives et d’activités de loisirs'),
(476, 95, 'CHE-324.202.317', 'CHE-324.202.317'),
(477, 96, '5520Z', '5520Z'),
(478, 97, '86.90A', 'Ambulances'),
(479, 97, '851J', 'Ambulances'),
(480, 99, '86.90 A', 'Ambulances'),
(481, 99, '851 J', 'Ambulances'),
(482, 99, '88.99 B', 'Action sociale sans hébergement'),
(483, 100, '1812Z', 'Autre imprimerie (labeur)'),
(484, 101, '1629Z', 'Fabrication d\'objets divers en bois ; fabrication d\'objets en liège, vannerie et sparterie'),
(485, 102, '7500Z', '7500Z'),
(486, 103, '7500Z', '7500Z'),
(487, 104, '1011Z', 'Transformation et conservation de la viande de boucherie'),
(488, 105, '11.02B', 'vinification (négociants vinificateurs, activité principale non agricole)'),
(489, 105, '11.04Z', 'production d\'autres boissons fermentées non distillées (production de vins aromatisés, de vins doux naturels)'),
(490, 105, '11.01Z', 'production de boissons alcooliques distillées'),
(491, 105, '20.14Z', 'fabrication d\'autres produits chimiques organiques de base'),
(492, 105, '11.02A', 'fabrication de vins effervescents'),
(493, 105, '11.03Z', 'fabrication de cidre et de vins de fruits'),
(494, 105, '10.32Z', 'préparation de jus de fruits et de légumes'),
(495, 105, '11.07B', 'production de boissons rafraîchissantes (en ce qui concerne les sirops, les boissons aux fruits et aux jus de fruits)'),
(496, 105, '46.34Z', 'commerce en gros de boissons alcoolisées autres que les bières (établissements dont le code de risque « accidents du travail » attribué par la caisse d\'assurance maladie est 51.3JA)');

-- --------------------------------------------------------

--
-- Table structure for table `convention_collective`
--

CREATE TABLE `convention_collective` (
  `id` int(11) NOT NULL,
  `convention_collective` varchar(500) NOT NULL,
  `rule1` int(11) NOT NULL,
  `rule2` int(11) NOT NULL,
  `rule3` int(11) NOT NULL,
  `rule4` int(11) NOT NULL,
  `rule5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `convention_collective`
--

INSERT INTO `convention_collective` (`id`, `convention_collective`, `rule1`, `rule2`, `rule3`, `rule4`, `rule5`) VALUES
(5, ' Entretien et réparation de véhicules automobiles légers', 12, 6, 11, 5, 42),
(6, 'Activités de production des eaux embouteillées et boissons rafraîchissantes sans alcool et de bière (IDCC 1513)', 10, 6, 11, 6, 48),
(7, 'Activités industrielles de boulangerie et pâtisserie (IDCC 1747)', 10, 6, 11, 6, 48),
(8, 'Blanchisserie – teinturerie et nettoyage - blanchisserie, laverie, location de linge, nettoyage à sec, pressing et teinturerie (IDCC 2002)', 10, 6, 11, 6, 44),
(9, 'Boucherie, boucherie-charcuterie, boucherie hippophagique, triperie, commerces de volailles et gibiers (IDCC 992)', 10, 6, 11, 6, 48),
(10, 'Boulangerie- pâtisserie (IDCC 843) - Heures de nuit 21h - 6h', 10, 6, 11, 6, 48),
(11, 'Boulangerie-pâtisserie (IDCC 843) - Heures de nuit 20h - 6h', 10, 6, 11, 6, 48),
(12, 'Bricolage - vente au détail en libre-service - (IDCC 1606)', 10, 6, 11, 10, 48),
(13, 'Bureaux d\'études techniques, des cabinets d\'ingénieurs-conseils et des sociétés de conseils - Syntec (IDCC 1486)', 10, 6, 11, 6, 48),
(14, 'Cabinets dentaires (IDCC 1619)', 10, 6, 12, 6, 46),
(15, 'Cadres du bâtiments (IDCC 2420)', 10, 6, 11, 5, 48),
(16, 'Casinos (IDCC 2257)', 10, 6, 11, 5, 48),
(17, 'Code du travail', 10, 6, 11, 6, 48),
(18, 'Coiffure et professions connexes (IDCC 2596)', 10, 6, 11, 5, 44),
(19, 'Commerce de détail de l\'habillement et des articles textiles (IDCC 1483)', 12, 6, 11, 5, 48),
(20, 'Commerce de détail des fruits et légumes, épicerie et produits laitiers (IDCC 1505)', 10, 6, 11, 6, 48),
(21, 'Commerce de détail des fruits et légumes, épicerie et produits laitiers (IDCC 1505)', 10, 6, 11, 6, 48),
(22, 'Commerce de détail et de gros à prédominance alimentaire (IDCC 2216)  (surface de vente supérieure à 400m2)', 10, 6, 12, 5, 44),
(23, 'Commerce de détail et de gros à prédominance alimentaire (IDCC 2216) - surface de vente inférieure ou égale à 400m2', 10, 6, 12, 5, 44),
(24, 'Commerce de la réunion', 10, 6, 11, 6, 48),
(25, 'Commerce des articles de sports et d\'équipements de loisirs (IDCC 1557)', 10, 6, 11, 5, 35),
(26, 'Commerces de détail de papeterie, fournitures de bureau, de bureautique et informatique et de librairie (IDCC 1539)', 10, 6, 11, 6, 48),
(27, 'Commerces de détail non alimentaires (IDCC 1517)', 10, 6, 11, 6, 48),
(28, 'Commerces de gros (IDCC 573)', 10, 6, 11, 6, 48),
(29, 'Commerces et services de l\'audiovisuel, de l\'électronique et de l\'équipement ménager (IDCC 1686)', 11, 6, 11, 6, 46),
(30, 'Commerces et services de l\'audiovisuel, de l\'électronique et de l\'équipement ménager (IDCC 1686)', 10, 6, 11, 6, 48),
(31, 'Conchyliculture (IDCC 7019)', 10, 6, 11, 6, 48),
(32, 'Détaillants en chaussures (IDCC 733)', 10, 6, 11, 6, 48),
(33, 'Détaillants et détaillants-fabricants de la confiserie, chocolaterie, biscuiterie (IDCC 1286)', 10, 6, 11, 6, 48),
(34, 'Électricité et Électronique (Tunisie)', 10, 6, 10, 0, 48),
(35, 'Enseignement privé indépendant (IDCC 2691)', 10, 6, 11, 6, 48),
(36, 'Entreprises de prévention et de sécurité (IDCC 1351)', 12, 6, 12, 6, 48),
(37, 'Entreprises de propreté et services associés (IDCC 3043)', 10, 6, 11, 6, 44),
(38, 'Entreprises de services à la personne (IDCC 3127)', 10, 6, 11, 6, 48),
(39, 'Entreprises du commerce à distance (IDCC 2198)', 10, 6, 11, 6, 48),
(40, 'Entreprises du secteur privé du spectacle vivant (IDCC 3090)', 10, 6, 11, 6, 48),
(41, 'Espaces de loisirs, d\'attractions et culturels (IDCC 1790)', 10, 6, 11, 6, 48),
(42, 'Esthétique-cosmétique et de l\'enseignement technique et professionnel lié aux métiers de l\'esthétique et de la parfumerie (IDCC 3032)', 10, 6, 11, 6, 44),
(43, 'Exploitation cinématographique (IDCC 1307)', 10, 6, 11, 6, 48),
(44, 'Exploitations agricoles de la Drôme (IDCC 9261)', 10, 6, 11, 6, 48),
(45, 'Exploitations de polyculture, de viticulture et d\'élevage de Maine-et-Loire (IDCC 9491)  ', 10, 6, 11, 6, 35),
(46, 'Fleuristes, vente et services des animaux familiers - Plus de 20 salariés (IDCC 1978) ', 10, 6, 11, 6, 48),
(47, 'Fleuristes, vente et services des animaux familiers (IDCC 1978) - ent. de plus de 20 salariés', 10, 6, 11, 6, 48),
(48, 'Fleuristes, vente et services des animaux familiers (IDCC 1978) (ent. de moins de 20)', 10, 6, 11, 6, 48),
(49, 'Gardiens, concierges et employés d\'immeubles (IDCC 1043)', 6, 6, 11, 10, 48),
(50, 'GE - Centre médical ', 12, 6, 11, 7, 50),
(51, 'Golf (IDCC 2021)', 10, 6, 11, 6, 42),
(52, 'Grands magasins et magasins populaires (IDCC 2156) ', 10, 4, 11, 6, 42),
(53, 'Hôtellerie de plein air (IDCC 1631)', 10, 6, 11, 0, 48),
(54, 'Hôtellerie de plein air (IDCC 1631) à compter du 1er janvier 2005', 10, 6, 11, 0, 48),
(55, 'Hôtels, cafés et restaurants (Belgium)', 11, 6, 11, 6, 50),
(56, 'Hôtels, cafés et restaurants (Suisse)', 11, 5, 11, 5, 42),
(57, 'Hôtels, cafés restaurants - HCR (IDCC 1979)', 11, 6, 11, 6, 48),
(58, 'Hôtels, cafés, restaurants (HCR) (IDCC 1979) - Usage dimanche', 11, 6, 11, 6, 48),
(59, 'IDCC 158 BIS (ÉQUIPE SUPPLÉANCE) : Convention collective nationale du travail mécanique du bois, des scieries, du négoce et de l\'importation des bois', 12, 6, 11, 2, 24),
(60, 'IDCC 3016 - INSERTION (ateliers et chantiers)', 10, 6, 12, 6, 48),
(61, 'Immobilier, administrateurs de biens, sociétés immobilières, agents immobiliers, etc. (IDCC 1527)', 10, 6, 11, 6, 48),
(62, 'Industrie de produits alimentaires élaborés (IDCC 1396)', 10, 5, 11, 0, 48),
(63, 'Industrie Hôtelière (Polynésie)', 10, 6, 11, 9, 48),
(64, 'Industries de produits alimentaires élaborés (IDCC 1396)', 10, 6, 11, 9, 48),
(65, 'industries et du commerce de la récupération (IDCC 637)', 10, 6, 11, 6, 48),
(66, 'Librairie (IDCC 3013)', 10, 6, 13, 5, 43),
(67, 'Métallurgie', 10, 6, 11, 6, 48),
(68, 'Métiers de l\'éducation, de la culture, des loisirs, et de l\'animation agissant pour l\'utilité sociale et environnementale, au service des territoires (IDCC 1518)', 10, 6, 11, 5, 48),
(69, 'Nettoyage', 12, 6, 11, 4, 46),
(70, 'Optique-lunetterie de détail (IDCC 1431)', 10, 6, 11, 5, 48),
(71, 'Organismes de tourisme (IDCC 1909)', 10, 6, 11, 10, 48),
(72, 'Ouvriers de la boulangerie de la Martinique (IDCC 901)', 10, 6, 11, 6, 48),
(73, 'Ouvriers employés par les entreprises du bâtiment (IDCC 1597)', 10, 6, 11, 5, 48),
(74, 'Pâtisserie (IDCC 1267)', 10, 6, 11, 6, 48),
(75, 'Pâtisserie (IDCC 1267) - maj. dimanche', 10, 6, 11, 6, 48),
(76, 'PDS', 11, 6, 11, 6, 48),
(77, 'Personnel des cabinets médicaux (IDCC 1147)', 10, 6, 11, 6, 48),
(78, 'Personnel des centres équestres (IDCC 7012)', 10, 6, 11, 6, 46),
(79, 'Personnel des entreprises de restauration de collectivité (IDCC 1266)', 13, 6, 11, 6, 48),
(80, 'Personnel des parcs et jardins zoologiques privés ouverts au public (IDCC 7017)', 10, 6, 11, 6, 48),
(81, 'Personnel des prestataires de services dans le domaine du secteur tertiaire (IDCC 2098)', 10, 6, 11, 6, 48),
(82, 'Personnel des prestataires de services dans le domaine du secteur tertiaire (IDCC 2098)', 13, 6, 11, 5, 48),
(83, 'Pharmacie d\'officine (IDCC 1996)', 10, 6, 11, 5, 48),
(84, 'Poissonnerie (IDCC : 1504)', 10, 6, 11, 6, 48),
(85, 'Pompes funèbres (IDCC 759)', 10, 6, 11, 6, 48),
(86, 'Production audiovisuelle (IDCC 2642)', 12, 6, 11, 6, 48),
(87, 'Professions de la photographie (IDCC 3168)', 10, 6, 11, 6, 44),
(88, 'Promotion immobilière (IDCC 1512)', 10, 6, 11, 6, 48),
(89, 'Remontées mécaniques et domaines skiables (IDCC 454)', 10, 6, 11, 6, 48),
(90, 'Restauration rapide (IDCC 1501)', 10, 6, 11, 8, 48),
(91, 'Restauration Rapide (IDCC 1501) (Paris et province après 22h et 00h)', 10, 6, 12, 8, 48),
(92, 'Sécurité', 12, 6, 11, 4, 46),
(93, 'Services de l\'automobile IDCC: 1090 APE: 5221Z', 10, 6, 11, 6, 48),
(94, 'Sport (IDCC 2511)', 10, 6, 11, 6, 44),
(95, 'Suisse - Utrans 2016', 14, 5, 11, 5, 45),
(96, 'Tourisme social et familial (IDCC 1316)', 12, 6, 11, 6, 48),
(97, 'Transports routiers et activités auxiliaires du transport (IDCC 16) - Activités du transport sanitaire', 12, 6, 11, 6, 48),
(98, 'Transports routiers et activités auxiliaires du transport (IDCC 16) - Transports de marchandises', 13, 6, 11, 6, 48),
(99, 'Transports routiers et activités auxiliaires du transport (IDCC 16) - Transports de voyageurs', 12, 6, 11, 6, 48),
(100, 'Travail du personnel des imprimeries de labeur et des industries graphiques (IDCC 184) ', 12, 5, 12, 5, 45),
(101, 'Travail mécanique du bois, des scieries, du négoce et de l\'importation des bois (158)', 10, 6, 11, 6, 46),
(102, 'VETERINAIRE PERSONNEL SALARIE (IDCC 1875) ', 12, 6, 11, 6, 48),
(103, 'VETERINAIRE PRATICIEN SALARIE (IDCC 2564)', 12, 6, 11, 6, 48),
(104, 'Viandes (Industrie et commerce en gros des viandes) (IDCC 1534)', 10, 5, 11, 0, 48),
(105, 'Vins, cidres, jus de fruits, sirops, spiritueux et liqueurs de France (IDCC 493)', 10, 6, 11, 0, 42),
(106, 'Worker\'s rights act of 2019 (Législation du travail Ile Maurice)', 8, 11, 11, 7, 45);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `gateway_id` varchar(255) NOT NULL,
  `percent_off` double(8,2) NOT NULL,
  `duration` enum('forever','once','repeating') NOT NULL,
  `duration_in_months` int(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `gateway_id`, `percent_off`, `duration`, `duration_in_months`, `currency`, `created_at`, `updated_at`) VALUES
(11, 'new years', '10OFF', 10.00, 'once', NULL, NULL, '2022-01-15 09:29:48', '2022-01-15 09:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name_file` varchar(250) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `name_file`, `date`) VALUES
(1, 2, 'dvs.png', '2021-10-04'),
(2, 10, 'logo22.png', '2021-10-05'),
(3, 13, 'previewfile_1223505810.jpg', '2021-10-06');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `user_id`, `date`, `type`, `salary`, `attachment`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(23, 3, '01/16/2022', 'Carburant', '22', '1642362391.pdf', 'ordo', 2, '2022-01-16 17:46:31', '2022-01-16 18:20:09'),
(24, 71, '10-03-2022', 'Carburant', '120', '1646916828.png', 'comment', 2, '2022-03-10 10:53:48', '2022-03-10 10:53:48'),
(25, 71, '16-06-2022', 'Parking', '120', '1654361710.html', 'Testt', 1, '2022-06-04 14:55:10', '2022-06-04 14:55:10'),
(26, 71, '03-12-2022', 'Taxi', '100', '1670084028.png', 'blablabla', 3, '2022-12-03 16:13:48', '2022-12-03 16:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra`
--

INSERT INTO `extra` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Transport', '2022-03-10 03:45:36', NULL),
(2, 'Nuitées', '2022-03-10 03:45:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) NOT NULL DEFAULT '0',
  `extension` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `form` varchar(191) NOT NULL,
  `to` varchar(191) NOT NULL,
  `overpay` varchar(191) NOT NULL DEFAULT '0',
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allDay` tinyint(1) NOT NULL DEFAULT 0,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

CREATE TABLE `leave_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_paid` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `leave_category`
--

INSERT INTO `leave_category` (`id`, `name`, `is_paid`, `created_at`, `updated_at`) VALUES
(1, 'Absences indemnisées par l’employeur', 1, NULL, NULL),
(2, 'Absences indemnisées par un tiers', 0, NULL, NULL),
(3, 'Absences non indemnisées', 0, NULL, NULL),
(4, 'Absences neutres', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_reasons`
--

CREATE TABLE `leave_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `leave_category` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_reasons`
--

INSERT INTO `leave_reasons` (`id`, `name`, `time_limit`, `leave_category`, `created_at`, `updated_at`) VALUES
(1, 'Absence autorisée rémunérée', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(2, 'Absence pour examens médicaux', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(3, 'Chômage Technique', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(4, 'Congé d’ancienneté', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(5, 'Congé Evènementiel', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(6, 'Congé Individuel Formation', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(7, 'Congé Payé', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(8, 'Congé temps d’habillage', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(9, 'Délégation du personnel', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(10, 'École - CFA', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(11, 'Formation', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(12, 'Heures d’activité partielle', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(13, 'Indemnité Compensatrice de Préavis', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(14, 'Jour Férié', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(15, 'Récupération JF', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(16, 'Repos Compensateur', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(17, 'Repos Compensateur de Nuit', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(18, 'Repos Forfait', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(19, 'Réunion', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(20, 'RTT', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(21, 'Solde de Tout Compte', NULL, 1, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(22, 'Accident de trajet', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(23, 'Accident du Travail', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(24, 'Arrêt maladie', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(25, 'Congé adoption', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(26, 'Congé Maternité', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(27, 'Congé Paternité', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(28, 'Invalidité permanente', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(29, 'Maladie Professionnelle', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(30, 'Temps partiel thérapeutique', NULL, 2, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(31, 'Absence Autorisée', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(32, 'Absence entrée sortie', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(33, 'Absence injustifiée', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(34, 'Congé Parental', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(35, 'Congé pour enfant malade', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(36, 'Congé pour garde d’enfant', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(37, 'Congé Sans Solde', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(38, 'Départ Anticipé', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(39, 'Grève', NULL, 3, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(40, 'Mise à Pied Conservatoire', NULL, 4, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(41, 'Mise à Pied Disciplinaire', NULL, 4, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(42, 'Récupération', NULL, 4, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(43, 'Astreinte', NULL, 4, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(44, 'Pause', NULL, 4, '2022-09-29 03:37:00', '2022-09-29 03:37:00'),
(45, 'Repos Hebdomadaire', NULL, 4, '2022-09-29 03:37:00', '2022-09-29 03:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `immatriculation` varchar(50) NOT NULL,
  `medicine` enum('MEDECINE INTERNE ETABLISSEMENT','001 - 1 AST ALSACE SANTE AU TRAVAIL','002 - AIMT DU PORT DU RHIN','003 - ACST ASSOCIATION DE CONSEIL EN SANTE AU TRAVAIL','004 - SPST CENTRE ALSACE COLMAR','005 - AMT DE LA REGION DE CERNAY','006 - AMT DE THANN ET ENVIRONS','007 - AMT DE LA REGION FRONTALIERE SAINT- LOUIS','008 - AMT DE MASEVAUX ET ENVIRONS','009 - AIMT DU SUNDGAU A ALTKIRCH','010 - AIEMT DE COLMAR ET DE SA REGION','011 - AIEMT DE GUEBWILLER','012 - STSA REGION MULHOUSE','013 - MSA D ALSACE','014 - SRSTT - MIDI PYR. /CH.VIOLETTE(L UNION)','015 - CENTRE DE GESTION DE LA HAUTE-SOANE','022 - SISTB BERGERAC','023 - SIMT PERIGUEUX','024 - AHI 33 SERVICE DE SANTE AU TRAVAIL','025 - ASS. INDUSTR. BALLASTIERE','026 - SERVICE INTERENTREPRISES SANTE TRAVAIL LIBOURNE','027 - SERVICE SANTE TRAVAIL INTERENTREPRISES','028 - SSTL MONT-DE-MARSAN','029 - SSTL DAX','030 - CIST VILLENEUVE SUR LOT','031 - MT ARRONDISSEMENT AGEN','032 - ASS. HYGIENE INDUST. OLORON','033 - PRISSM - PAU (PREVENTION RISQUE SURVEILLANCE MEDICALE)','034 - ASS. MEDECINE TRAVAIL ORTHEZ','035 - ASTPB','036 - SIMETRA','037 - CENTRE DE GESTION 64','041 - CMT VICHY','042 - SERVICES INTERENTREPRISES DE SANTE AU TRAVAIL DE MOULINS','043 - CMT MONTLUCON','044 - ACISMT','045 - AIST LE PUY - YSSINGEAUX','046 - AIST BRIOUDE LANGEAC SAUGUES','047 - AIST DU PUY DE DOME','060 - MEDECINE COLLECTIVITES LOCALE','061 - SST - BTP ET INDUSTRIES CONNEXES DE COTE D OR','062 - AIST 21','063 - COMITE DE MEDECINE DU TRAVAIL DU CHATILLONNAIS','064 - MT DE LA NIEVRE','066 - SST BTP 71','067 - SIMT CHALON','068 - SMTI DE LA REGION DE SENS','069 - AIST 89','070 - SMTI DU JOVINIEN','071 - SMTI DU TONNERROIS','081 - AIDAMT','082 - SIST','083 - M.T.I. BREST INTERPROFESSIONNEL','084 - SANTE AU TRAVAIL EN IROISE','085 - SANTE PREVENTION BTP 29','086 - SANTE AU TRAVAIL EN CORNOUAILLE','087 - S.M.I.R. MORLAIX / MORLAIX BTP','088 - AST 35','089 - STPF SANTE AU TRAVAIL DU PAYS DE FOUGERES','090 - STSM SANTE AU TRAVAIL DU PAYS DE ST MALO','091 - S.M.E.B.T.P.C.','092 - AMIEM','093 - CDG FONCTION PUBLIQUE TERRITORIALE DU MORBIHAN','101 - MEDECINE DU TRAVAIL','102 - SISTEL','103 - ASS. INTERPROFESSIONNELLE SERVICE MEDICAL DU TRAVAIL','104 - ASS. POUR LES ENTREPRISES B.T.P POUR LA MEDECINE DU TRAVAIL','105 - A.I.M.T. (ASSOC. INTERPRO. POUR LA MEDECINE DU TRAVAIL)','106 - SAN.T.BTP.','108 - SANTE INTERENTREPRISES DE PREVENTION ET DE SANTE AU TRAVAIL','109 - APSMT-BLOIS','110 - CIHL SARAN','111 - CENTRE DE GESTION FTP INDRE ET LOIRE','121 - ARDENNES SANTE TRAVAIL','123 - AMITR','124 - GIST DU BARROIS','125 - GISMA','126 - AMTER','127 - CIEMT','128 - GASBTP','129 - GIMTA','130 - SMIRC','131 - SMIRR','132 - ASS. INTERENTREPRISES DES SERVICES MEDICAUX DE LA HAUTE-MARNE','141 - MT CORSE DU SUD','142 - MT HAUTE CORSE','151 - MEDECINE DU TRAVAIL','153 - AIMS DU HAUT DOUBS','154 - MEDECINE DU TRAVAIL DU BTP DE FRANCHE-COMTE','155 - ASSOCIATION MEDICALE DU TRAVAIL','158 - CENTRE DEPARTEMENTAL DE GESTION DE LA FONCTION PUBLIQUE','159 - SERVICE SANTE TRAVAIL NORD FRANCHE COMTE – SSTNFC','161 - ASP','163 - ACMS','167 - AMI','168 - AMPI','169 - APST BTP RP','171 - SIMT SERVICE INTERPROFESSIONNEL DE MEDECINE DU TRAVAIL','175 - CIAMT','176 - SIST CENTRE MEDICAL DE LA BOURSE','177 - CENTRE MEDICAL PUBLICITE ET COMMUNICATION','178 - SANTE AU TRAVAIL EN ILE DE FRANCE','179 - EFFICIENCE - ANCIENNT CMTIE','181 - CMIE','182 - SISTBP','183 - CMSM','189 - SEMSI CODE','190 - SIFSAT','191 - SMST CODE','192 - SERSIMT CODE','195 - AMETIF CODE','197 - AISP METRA','199 - SIST','201 - AIRST','203 - OBJECTIF SANTE TRAVAIL','204 - SMIROP','207 - AMEDICLEN','208 - HORIZON SANTE TRAVAIL','209 - IPAL','211 - SMIE BOIS COLOMBES','212 - SEST','215 - AMET','216 - AICAC','218 - SIMT','220 - A.C.I.S.T','221 - GIM','222 - GIMAC','224 - ASTE','230 - SIST BTP 77','261 - S.I.S.T SERVICE INTERENTREPRISE DE SANTE AU TRAVAIL DE NARBONNE','262 - SCE INTERPROFESSIONNEL DE SANTE AU TRAVAIL','263 - A.C.M.T. (CANTON DE GANGES)','264 - A.I.S.M.T. BEAUCAIRE','265 - A.I.S.M.T. NIMES','266 - A.M.T. CENTRE MARCOULE','267 - CMI ALES MENDE','268 - AMETRA','269 - MT BATIMENT ET TP','270 - A.I.S.T.','271 - A.I.P.A.L.S.','274 - THAU SALAGOU SANTE TRAVAIL (T2ST)','275 - A.S.T.I.M MARVEJOLS','276 - PST 66','277 - MEDECINE BANCAIRE','302 - AIST 19 - ASSOCIATION INTERENTREPRISES','303 - ACIMT','304 - AMCO','305 - SERVICE MEDICAL INTER-ENTR. DES ORG. DE SECURITE SOCIALE DU R.G.','306 - AIST 87','311 - SIST DES B.T.P. ET DES ACTIVITES CONNEXES DE LORRAINE','312 - SERVICE MEDICAL INTERPROFESSIONNEL MEUSIEN','313 - MEDECINE DU TRAVAIL METZ','316 - MEDECINE DU TRAVAIL THIONVILLE','317 -SERV. INTERENTREPRISES DE SANTE AU TRAVAIL REGION ROSSELLE-NIED','319 - SERVICE DE SANTE AU TRAVAIL SAINT DIE','320 - SERVICE DE SANTE AU TRAVAIL EPINAL','321 - SERVICE DE SANTE AU TRAVAIL NEUFCHATEAU','322 - SERVICE DE SANTE AU TRAVAIL REMIREMONT','323 - ASS LORRAINE DES SERV MEDICAUX DU TRAVAIL','331 - ASTA09 / ASSOCIATION SANTE AU TRAVAIL DE L ARIEGE','332 - MEDECINE DU TRAVAIL VILLEFRANCHE RGUE','333 - SIMCA MILLAU','334 - MEDECINE DU TRAVAIL RODEZ','335 - SMISA','336 - SST ARTISANAT-CMTA/ETOILE (TLSE)','338 - SST (ST-GAUDENS)','340 - ASTIA/ASS DE MEDECINE ET DE SANTE AU TRAVAIL (TLSE)','341 - SAMSI / PLACE JOURDAIN (TLSE)','343 - SERVICE ST (MURET)','344 - SERVICE ST (REVEL)','346 - SRAS BPTP/RECOLLETS(TLSE)','347 - CSTG (AUCH)','348 - MEDECINE DU TRAVAIL 46','349 - ASMT DES HAUTES-PYRENEES','352 - SISTTS SECTEUR MAZAMET','353 - SERVICE PARITAIRE DE SANTE AU TRAVAIL DU TARN','354 - SANTE AU TRAVAIL ALBI','356 - SISTTS REGION CASTRES','357 - SMTI 82 MONTAUBAN','363 - ASTAV','364 - STSA - SANTE TRAVAIL SAMBRE AVESNOIS','366 - AIMST DE CAMBRAI','367 - SERVICE DE SANTE INTER BANQUES','369 - CEDEST DUNKERQUE','372 - POLE SANTE TRAVAIL METROPOLE NORD','373 - STSA - SANTE TRAVAIL SAMBRE AVESNOIS','375 - (SIMUP) HALLUIN','378 - AST 62-59','379 - AST 62-59 - CENTRE MEDICAL DE LENS','380 - AST 62-59 - CENTRE MEDICAL D HENIN- BEAUMONT','382 - AST 62-59 - CENTRE MEDICAL D ARRAS','383 - ASTIL - ASS. SANTE AU TRAVAIL INTERENTREPRISES DU LITTORAL 62','384 - SANTRAVIR','385 - GISTAF','386 - SISTM CHERBOURG','387 - SISTM SAINT-LO','388 - SMTBTP CHERBOURG','389 - SISTM COUTANCES','390 - AMTH BEAUMONT','391 - MIT VILLE CHERBOURG OCTEVILLE','392 - ASTISMIE - ASS SANTE AU TRAVAIL','393 - ASSOCIATION SANTE AU TRAVAIL','400 - SIST BTP 61','401 - CIST61','402 - ASTIF','403 - PST','404 - CMAIC','405 - SIST','412 - AMIVA ASS INTERPROFESSIONNELLE DE LA VALLE DE L ANDELLE','413 - AMSIE DE BERNAY BRIONNE ET PONT- AUDEMER','414 - ASS AMI SANTE AU TRAVAIL','415 - AMSIE REGION DE GISORS','416 - AMSIE VERNEUIL SUR AVRE','417 - AMSIE VERNON ET REGION','418 - SANTE AU TRAVAIL BTP EURE','419 - GIMETRA GROUPEMENT INTERPROFESSIONNEL DE MEDECINE DU TRAVAIL','421 - MEDECINE DU TRAVAIL BOLBEC AIHIMT','422 - AMSN','423 - MEDECINE DU TRAVAIL DE DIEPPE','425 - MEDECINE DU TRAVAIL DU HAVRE AIST','426 - MEDECINE DU TRAVAIL DU HAVRE CMHI','427 - YVETOT ( POUR AMSN )','428 - BATIMENT ET TRAVAUX PUBLICS','429 - SERVICE MEDICAL DU TRAVAIL (COMMERCE ET PME)','430 - MEDECINE DU TRAVAIL BATIMENT BTP','431 - ADESTI','432 - MEDECINE DU TRAVAIL FECAMP ISTF','433 - MEDECINE DU TRAVAIL PORTUAIRE','440 - UNION DES USAGERS DU PORT DE ROUEN','441 - SERVICE SANTE TRAVAIL REGION NANTAISE SSTRN','442 - AMEBAT','444 - GROUP INTERPROF SANTE AU TRAVAIL GIST','445 - MTPL','446 - SMIE SERVICE MEDICAL INTER ENTREPRISES','447 - SMIA DE L ANJOU','448 - STCS CHOLET - SAUMUR','449 - SMI DU SAUMUROIS','451 - S.A.T.M.','452 - SERVICE SARTHOIS DE MEDECINE DU TRAVAIL','453 - RESTEV','454 - AHMT - FONTENAY LE COMTE','456 - AHMT - CHALLANS','457 - S M T - SABLES D OLONNE','471 - MEDECINE DU TRAVAIL SOISSONS','472 - MEDECINE TRAVAIL ST QUENTIN','473 - SMIN','474 - MTVO COMPIEGNE','475 - M.E.D.I.S.I.S BEAUVAIS','476 - S.M.I.B.T.P.','477 - UMTV','478 - AISTV','479 - AMSIH','480 - ASMIS','491 - SISTA ANGOULEME','492 - SISTAC COGNAC','493 - A.S.T.S ASSOCIATION SANTE AU TRAVAIL DE SAINTONGE - JONZAC-','494 - MEDECINE DU TRAVAIL A.P.A.S.','495 - SANTE AU TRAVAIL D AUNIS','496 - A.S.T.S ASSOCIATION SANTE AU TRAVAIL DE SAINTONGE - SAINTES -','497 - SIMT DEUX-SEVRES','498 - ASSOC SERV. MEDICAUX DU TRAVAIL DE LA VIENNE','499 - MEDECINE DU TRAVAIL MSA LANGUEDOC','501 - ASSO INTERPROF SANTE MEDECINE TRAVAIL ALPES HAUTE-PROVENCE AISMT','502 - GEST 05','503 - AMETRA 06','504 - APST BTP 06','506 - CMTI 06','507 - AISMT 13. 0491812029','514 - ASTBTP13 0491230330','515 - GIMS','516 - SANTE AU TRAVAIL PROVENCE 0442162499','517 - EXPERTIS 04 91 99 05 10','519 - AIST 83','524 - AIST 84','525 - SANTE AU TRAVAIL DURANCE LUBERON 0490066160','526 - GMSI 84','527 - TRANSPORTEURS ROUTIERS DU VAR','531 - MT PERONNAS & AUTRES','532 - COMITE MEDECINE DU TRAVAIL','533 - CMT BATIMENT','535 - ASS AUBENAS ET SA REGION','536 - ASS PRIVAS ET SA REGION','537 - ASS MEDECINE DU TRAVAIL REGION TAIN-TOURNON','538 - COMITE SM HAUT VIVARAIS','540 - AIP ASS VALENCE ET REGION','541 - REGION DE NYONS','542 - ROMANS ET SA REGION','543 - SITE NUCLEAIRE','544 - REGION DE SAINT VALLIER','545 - VALLEE DE LA DROME','546 - SIST26/07','547 - SMT ALPES SANTE TRAVAIL TRAVAIL TEMPORAIRE','549 - SMT DE BOURGOIN JALLIEU','550 - SMT ALPES SANTE TRA VAIL','551 - ASSOC DE MT INTERBANCAIRES','552 - MT BATIMENT ET TX PUBLICS DE L ISERE','553 - SMT METRAZIF','554 - MT2I','555 - SERVICE MEDICAL INTERENTREPRISES','556 - SM INTERENTREPRISE','557 - SERVICE MEDICAL DU TRAVAIL DE BOEN','558 - SERVICE MEDICAL DE ST-CHAMOND','559 - SERVICE MEDICAL DE CHARLIEU','560 - SERVICE MEDICAL DU TRAVAIL DU B.T.P.','561 - SERVICE MEDICAL DU TRAVAIL SUD LOIRE ( ST-ETIENNE )','562 - SERVICE MEDICAL DE ROANNE','564 - SERVICE MEDICAL DU TRAVAIL SUD LOIRE (GIER)','570 - AGEMETRA','571 - MEDECINE DU TRAVAIL DE COURS','572 - BTP SANTE AU TRAVAIL','573 - MEDECINE DU TRAVAIL DE L OUEST LYONNAIS','574 - A S T GRAND LYON','575 - MED. DU TRAVAIL DE THIZY','576 - MED. DU TRAVAIL DE VILLEFRANCHE','577 - MED. DU TRAVAIL RHONE POULENC AGRO','578 - CENTRE MEDECINE TRAVAIL DE SAVOIE','580 - MEDECINE DU TRAVAIL DU BATIMENT','582 - ASMI SALLANCHES','583 - ASMI SCIONZIER','585 - ASS SANTE AU TRAVAIL DU GENEVOIS','586 - AST74','587 - ASMI BONNEVILLE','600 - CENTRE INTER-ENTREPRISE DE MEDECINE DU TRAVAIL (CIMT)','601 - MEDECINE DU TRAVAIL DE LA GUADELOUPE ( MTG BTP )','602 - ASS.INTERPR.MEDECINE DU TRAVAIL','603 - CTRE DE MEDECINE DU TRAVAIL','604 - CISTC','605 - STKOG','606 - INTERMETRA METRAG','607 - SISTBI','608 - 2MT MARTINIQUE MEDECINE TRAVAIL','827 - CISTTAA','833 - SST BORDEAUX','864 - SIMETRA ET ASTPB','Code SST - Libellé Service de Santé au Travail') NOT NULL,
  `medicine_id` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `productivity` double(8,2) NOT NULL DEFAULT 0.00,
  `conventioncollective_id` int(11) DEFAULT NULL,
  `code_ape_id` varchar(550) DEFAULT NULL,
  `shift_id` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `bonus` varchar(191) DEFAULT NULL,
  `rules` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `user_id`, `name`, `immatriculation`, `medicine`, `medicine_id`, `address`, `postcode`, `city`, `country`, `productivity`, `conventioncollective_id`, `code_ape_id`, `shift_id`, `status`, `bonus`, `rules`, `created_at`, `updated_at`) VALUES
(3, '48', 'New Comp', 'New', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'House-611/B, 3rd floor, South Bishil, Mirpur-1, Dhaka-1216', '1216', 'Dhaka', 'BD', 50.00, 6, '11.07A', '49', 1, NULL, NULL, '2021-11-30 03:44:35', '2021-11-30 03:44:35'),
(5, '2', 'New', 'New', 'MEDECINE INTERNE ETABLISSEMENT', '002', 'House-611/B, 3rd floor, South Bishil, Mirpur-1, Dhaka-1216', '1216', 'Dhaka', 'BD', 50.00, 6, '11.07A', '4,5', 1, NULL, NULL, '2021-12-01 00:23:54', '2021-12-01 00:23:54'),
(6, '2', 'Testagain', 'Test', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'Address', '7500', 'Ddd', 'AF', 50.00, 7, '1071B', '4', 1, NULL, NULL, '2022-01-10 07:19:58', '2022-01-10 07:19:58'),
(7, '2', 'Test', 'DAD', 'MEDECINE INTERNE ETABLISSEMENT', '002', 'Address', '7500', 'Dhaks', 'AF', 50.00, 6, '11.05Z', '4', 1, NULL, NULL, '2022-02-08 01:19:55', '2022-02-08 01:19:55'),
(9, '70', 'Speedy', 'AZRC23553', 'MEDECINE INTERNE ETABLISSEMENT', '001', '12 rue de la paix', '32000', 'Auch', 'FR', 10.00, 6, '11.05Z', '', 1, NULL, '#rules3', '2022-02-08 04:48:24', '2022-04-04 01:04:36'),
(10, '70', 'Testing', 'test###2222', 'MEDECINE INTERNE ETABLISSEMENT', '006', 'Adred---484', '7500', 'Dhaka', 'BD', 50.00, 6, '11.07A', '71,65', 1, '$200,$300', '#rules3', '2022-04-01 21:58:45', '2022-10-06 22:17:43'),
(12, '70', 'Test Company', 'Eidkdk', 'MEDECINE INTERNE ETABLISSEMENT', '005', 'House-33', '7500', 'Dhaka', '--', 50.00, 5, '4520A', NULL, 1, NULL, NULL, '2022-04-01 22:05:49', '2022-04-01 22:05:49'),
(18, '72', 'Location', 'location44', 'MEDECINE INTERNE ETABLISSEMENT', '005', 'Address', '7500', 'Dhaka', '--', 50.00, 6, '11.05Z', NULL, 1, NULL, NULL, '2022-04-12 00:27:38', '2022-04-12 00:27:38'),
(19, '72', 'Location', 'location1', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'Address', '7500', 'Djala', '--', 50.00, 6, '11.05Z', NULL, 1, NULL, NULL, '2022-04-12 00:31:55', '2022-04-12 00:31:55'),
(20, '72', 'Loct', 'ddd', 'MEDECINE INTERNE ETABLISSEMENT', '005', 'ddd', '55', 'DD', '--', 50.00, 6, '11.05Z', NULL, 1, NULL, '#rules5', '2022-04-12 00:33:27', '2022-04-12 00:34:27'),
(21, '72', 'DDD', 'ddd', 'MEDECINE INTERNE ETABLISSEMENT', '003', 'Addd', '3333', 'ddd', 'AS', 33.00, 10, '10.71D', NULL, 1, NULL, NULL, '2022-04-12 00:35:11', '2022-04-12 00:35:11'),
(22, '72', 'Test', 'ddd', 'MEDECINE INTERNE ETABLISSEMENT', '002', 'ddd', '555', 'dddd', '--', 50.00, 7, '1071B', NULL, 1, NULL, '#rules5', '2022-04-12 00:36:37', '2022-04-12 00:36:37'),
(23, '70', 'Test88', 'De565', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'Address55', '7500', 'Dhaka', 'AF', 50.00, 7, '1071A', NULL, 1, NULL, '#rules5', '2022-04-14 00:07:17', '2022-04-14 00:07:17'),
(24, '70', 'Test88', 'De565', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'Address55', '7500', 'Dhaka', 'AF', 50.00, 7, '1071A', NULL, 1, NULL, '#rules5', '2022-04-14 00:07:54', '2022-04-14 00:07:54'),
(25, '70', 'Testdd', 'ddd', 'MEDECINE INTERNE ETABLISSEMENT', '002', 'adea', '7500', 'Dha', '--', 50.00, 6, '11.05Z', NULL, 1, NULL, NULL, '2022-04-14 00:31:22', '2022-04-14 00:31:22'),
(26, '70', 'Test555', 'ddd4', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'DEe', '75', '5DDq', 'AF', 50.00, 7, '1071B', NULL, 1, NULL, NULL, '2022-04-14 01:41:49', '2022-04-14 01:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `lunch`
--

CREATE TABLE `lunch` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `paid` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `lunch`
--

INSERT INTO `lunch` (`id`, `name`, `paid`, `created_at`, `updated_at`) VALUES
(1, 'Indemnité repas', NULL, '2022-03-05 17:04:56', NULL),
(2, 'Avantage en nature', NULL, '2022-03-10 17:05:33', NULL),
(3, 'Titre restaurant', NULL, '2022-03-09 17:05:33', NULL),
(4, 'Prime de panier', 1, '2022-03-09 17:06:15', NULL),
(5, 'test lunch Paid no', 1, '2022-05-23 15:26:46', '2022-05-23 15:27:06'),
(6, 'Tota', 0, '2022-05-24 08:45:43', '2022-05-24 08:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `lunch_amount`
--

CREATE TABLE `lunch_amount` (
  `id` int(10) UNSIGNED NOT NULL,
  `lunch_id` int(11) NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_05_21_100000_create_teams_table', 1),
(6, '2020_05_21_200000_create_team_user_table', 1),
(7, '2020_05_21_300000_create_team_invitations_table', 1),
(8, '2021_09_18_105700_create_sessions_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(10, '2021_09_18_112533_create_permission_tables', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `night_amount`
--

CREATE TABLE `night_amount` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `night_amount`
--

INSERT INTO `night_amount` (`id`, `name`, `amount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'jkjkj', 670.00, 1, NULL, NULL),
(2, 'Ibis', 74.00, 70, NULL, '2022-05-26 04:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('w.etisalat@gmail.com', '$2y$10$F93/bZ/kAS.crB0z49gGWOycoRBpAGO4g7QB70nmqqUxjg9TNhr/C', '2021-11-10 18:00:39');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `scheduled_time` time DEFAULT NULL,
  `worked_time` time DEFAULT NULL,
  `over_time` time DEFAULT NULL,
  `bonus` int(11) UNSIGNED NOT NULL,
  `paid_leave` varchar(255) DEFAULT NULL,
  `paid_lunch` varchar(255) DEFAULT NULL,
  `transport` varchar(255) DEFAULT NULL,
  `night` varchar(255) DEFAULT NULL,
  `expenses` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `user_id`, `scheduled_time`, `worked_time`, `over_time`, `bonus`, `paid_leave`, `paid_lunch`, `transport`, `night`, `expenses`, `created_at`, `updated_at`) VALUES
(1, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 07:47:43', NULL),
(2, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(3, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(4, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(5, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(6, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(7, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(8, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(9, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(10, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL),
(11, 70, '11:47:42', '08:47:43', '11:47:43', 12, '12', '45', '78', '78', '89', '2022-05-22 04:47:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `interval` enum('day','week','month','year') NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `teams_limit` int(11) DEFAULT NULL,
  `trial_period_days` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_billing` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `title`, `slug`, `stripe_id`, `interval`, `price`, `active`, `teams_limit`, `trial_period_days`, `description`, `created_at`, `updated_at`, `free_billing`) VALUES
(17, 'Gold', 'gold', 'GoldqPDNNt', 'month', '30.00', 1, 1, 0, 'creation de vérification', '2022-01-15 09:28:47', '2022-01-15 09:28:47', NULL),
(18, 'Free', 'free', 'FreeDKdPcu', 'month', '0.00', 1, 0, NULL, 'Gratuit', '2022-01-16 09:38:48', '2022-01-16 09:38:48', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(0, 'admin', 'web', NULL, NULL),
(1, 'users', 'web', NULL, NULL),
(2, 'staff', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `shift_id` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `todo_id` varchar(255) DEFAULT NULL,
  `days` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `pause` varchar(99) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `lunch` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `recurring` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `user_id`, `staff_id`, `shift_id`, `location_id`, `todo_id`, `days`, `start`, `pause`, `end`, `lunch`, `description`, `color`, `recurring`, `created_at`, `updated_at`) VALUES
(36, 70, '71', '13', '10', '12', 'false', '2022-09-21T20:00', '0', '2022-09-21T20:15', NULL, NULL, '#5ac8fa', NULL, '2022-09-21 18:02:01', NULL),
(37, 70, '71', '13', '10', '12', 'false', '2022-09-23T18:30', '10', '2022-09-23T18:50', '2', NULL, '#ea1e63', NULL, '2022-09-23 16:39:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('00OgVKuDHmUNunReKGorUzI7nd4s4q3VeAtgfti6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmV6aTl6WDkzQ3UwZWFHclhPdVcyYkg1MWZNMER2YXFoajlBTFowRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079791),
('01Csz9I8EsnuN3DFRaPKiOvRGAYqcp2IJpGrCwb3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODFVdGRGc1BrRkRlZ2ZHaFMzbWM4eDgwVUx5eWlkMm1KMmxOSWpnNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080088),
('01jhNdnmio8TaMnJUfzUBMfyTZGK6bJWQnQfMphU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU9tZFFMUDFPRVFwYkQ1NmhMdG9VemF6SGlmWXlHMHNrWVB2amdzcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080105),
('022WkTby8aAnMVLefsUDjjqUmB5CSENPrOgyBpgn', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjJnSDVYTE9mRFp4cXJlOWpQSnc3SmJzcjZVVVB0ZldiT1gybFM5MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079950),
('066bNZLMXHFc59dOEUisMyDoCKMvu9a0pUWjgxlx', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0NZeVVmTFFYWHZvaEt6aGd5RE9QWFZIT0xJbHNrNHdZYUpZelNJbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079912),
('0Ahn4Lj1DIzPAwCdkSwdeKaUIRrZFEIstSvAkldb', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2VOcTdLcGFNZTVEWDdibENPT21vRTJ2bVRQN09Pbkx2d0JwVjU5cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080396),
('0F7OiKFha3fHJsSlPZxixr6ni8B6qdaAQIE6umCw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0s2UmQwYmZ5MUVhZTBnVkJLNTVoRVlrY3JZVjhkREVjTm4yRzRkQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080091),
('0fVA3KMA5kysInPTbNx8WG0eKSHqk0wDzBkAhnLH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGg2amxtRGhRaVo3WlQ5bFpzYW1NenFIa1dXeGJUNFpnYjl6dXBDRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080133),
('0jjqMOoKkTz5kpodpjwQBviWgKt53JCtOp4JVIOq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmd6S012RlZCZXhJZ3E1YVdKck44MjJCZVhoYnJtUUZDalNzNkg3WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080201),
('0Nd7SFwF9GSGWJpbr05PiVRop7ElcFrmUQS7JuPR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTNCSGszdW9CMmRtTEtKNXR3aUpneFJ0WjJZc1ZnY01KUDdaNzdBOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080447),
('0oshDMHoedipr2EcGQqGu7glf5cLq6hWz19Dfvbx', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkVBdG1odk9JZ0h3dHFXSmpCeDNWRmxaRnVwWllFQThPWUd3azJnZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079903),
('0pyB68YdlwURY4kRqvtmldbMdQx5Dwc9jHl1UwGF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTROc2hZNTVaQ3ozeWFqZjJaczl0T3JXQmM1aDBJdEZMOTBrbmw4WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079846),
('0UpwuQ0FrnPACmDLr1xmliJZf8Pqx7wCsvxLlb6U', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2ZKaHZlQUVsbFp6MG5QRXB6akdiSkhFYUxrWXZJNEY2MFVPazVlWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080034),
('0YqWjaMEixNUzjnXGz0YmQNsCLomDTytNIXkKWED', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmZqS3BMcG8xaWVRYU1vMjBzT1hFdkJtRkRmdG53QmhvQmwxNzB6diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079800),
('0ZuVAhXXT2R9ka3u9N9nev186wkss9M8J3OgTXl7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTJyYmx6VmpZVWlJTkFURnJrZGo3NHFlajN0UFU5OVh3ek1HZUMyRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080454),
('10o5YfuzvkFEnCfE4cxGuGvBRAwAxpdx7rAO0uZE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2dsRW5XeFhybno3aWY4YXdKYVdWamZ0bFBVc3Y0blZKUUF2NWJraCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080013),
('1167Ync9U9KIncfJNmcMqzEn6QEEE8y0BZqBDPrl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHdGY3lPRklhcWVjWkxhcklQRlF3c0ZPUnpTb2RZMWNxcHE2a3piNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080096),
('13JwvQuQotb2fVTG9nVndaE7OKz7VSeP25mXGzOB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2hGR2pBVnRON0VabkVGWW1RY3lRUWwwYVlzR2xUNXFGZ1M1ZHdKMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080152),
('1BJR9CB04gXjBfCHMfRKbNCcPHClTrvYxhghiERU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHdvZ1cxbEJya01kZnhadEZYRnU4cXc2Z3RtYW9nM3VZaDM4M1UwRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080086),
('1BxX1XbViDZvgJneYzmuCOLoX8pTo3PiplToRgTh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVIydXlxVWNsR1FwU0Z1bkp2bGJpMDVmV2dRVkppNDZ0WkUwaHAyZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079797),
('1dFwf5YxgShUK1saNQr0jnaMVuI8jxgX5pgClDcr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianFBUlk2SkdJUGR0S0w3b2VuaENiUkc5bXhDV1I1RHlXSmhkYUJZSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079802),
('1dWGyghet4G6dtbvZoMEcQsEvu53f3Lo2esfbL1m', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVVtdk5IeEdkVXBqalBjaHl6dHlVMFQ0RHZKenJEbHNGOEx5RVNVdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079894),
('1FDIau4UwxEiOdF621W2wIYu1CrTtKFhkk6raMAJ', NULL, '5.189.133.199', 'Mozilla/5.0 (Macintosh;                 Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML,                 like Gecko) Chrome/39.0.2171.95 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEV6WkhmQXE3R0ViUUZRWHdCWVcxY1Jub1M2NTlLSFg2dWtzNGRJYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670084168),
('1fMCJ1kZBEay4ObnZ9r8wfaPJOc2NDmvOMJFctsC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHhEc1d2cUZ6a2c3dFdFZnhmeVgzVTV3bE9MMWJ5NlpZbThIVEhYTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080178),
('1LWK5NoRbn2k3U7aGBjyZr1uNQQDe4wSJuCU9TlY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUw5SEhZcUNtWHlzOFhxTTVSMXZMUlVpM1lDSXN1a1VzaG5RWWVSaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080056),
('1mdNBoj8UFNTHpYk1rYHnx8LcnqgjzYVZ6boNbr7', NULL, '104.196.165.78', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia0wySlZnQnpHa2w1TEs3U09VQlJ3ZXNET0oxNG1NMGtQZkN3QkRiQSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovL3d3dy5tZW1vaGkuZnIiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovL3d3dy5tZW1vaGkuZnIvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670086384),
('1rMViux5UlbpC9aHM5YJRpAgT1PPw41Ckw7IPCHX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTB0NkN1TkpINGt2R2FJMHlraEFManVkWElBZHZ6dW96VnM5Mm1iVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079773),
('1vyGjn5pde6FZblCjOKWowqwqZEHKyJUh7CiSnBY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlRCcVFKM0lPcGpqVG5uMnhoZzBVQXNVcEVEb04wZ3VOUFRCSkZ5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080137),
('1x4RNjpxCAzHyZHdRWLyqDlYrwjmpxtObK07FIq4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlYzc3RhOEtMQzV2MGNNeEszYWpaR1l5Y3pDRTFZQnREVzNselVKVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080441),
('1XCpO6JcDFb5k1YAusA2l8HQW2AOIGaR3wAxpACp', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFhWTlhlYURkSDZCMDdGaHg3eXFuUkRmRFNVRlRqNXFBdGdJWWlNZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080004),
('1XEiF4rx9CZN30YhE6JlJ59OqqWkcLYqttJwkZYt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzVqOGMwRjZ3NG0yTXZWdnU0OVpzZUpRMmxxWUNiV2ZaZ3RuWjlVQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079817),
('1znZK8MlYYtKGtczDrSkWIjzrJGT7ykI7QIseEuy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDR1bmJ0VEdOR2N1NGdBNkZYeHd3cmsxVnBwWERwWXJGekJyeWV3YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079815),
('24u03WrPnXusJhSfPe7RX2H4ArPvGFL3fpw2HisG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmU4VWZOVWN5cDBQWjJPVWJNYU93WlB2U21mV2lhdUwyRnhjeTZuWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079937),
('2B1IprKb4Z8g1n9HfLRO47LS8AfcfcEsjIdPd8fC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicllTWFBXQXJyWW1hMEtwRVZCMFJvSUxXM0V6bGVNOHRsTnRYRUh0byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079770),
('2Bkm4UF1CfHBRiXreGvNjYrOqSWsRlPg1Nsw6YkM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEVaNGxiRHZzQjhWb24zcTZaek42azRWN25lejE4YjVvV1ZJdkxEUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079923),
('2dfM3d3rY1yWDjJavzJL2iYPNP1hRYRxZecWRoK2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHRnUm93b2M0NjZ5WVNpMExVTTVSSUhWOEVHSG45MTJwR09DYzZaMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080114),
('2G0vcqTlGVF1VhzCojAV0K5dw62JQSwvxOoExf9F', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW5WUjF4bnFWb0lJTkQydm1mbEc4S2VsV2M0bUM1Qnp3cEtxUTRpQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079771),
('2JneqCB5F5wLC30WIehDnV8NSnHhg0eg0UlOpLWl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDBFaW13ZTdDaTNub2s1N2d4YU5HT0w3c3hkNWhyd1BHTzV2am50RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079807),
('2MTTpqYHhvzKdQT66VMtzJ4vOxx7Nq89jQ5qgA40', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVpHMmxUVVVUSGFPVjRueVZxbDhmdnM4cUhjZ1JESEVsQTdRNkxZaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080357),
('2P5vSfFRTqUFEhOtmIzxXqlZtMc0fn3akgBFTcx5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmliSnFTMHM4YTVkMHZoWFpPcDZoVXNkWDlTRnZzUU52Vmo5czZmdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079780),
('2Rrt3kBa0mezPixtAMfX2ZdjxOMkZJTidNFsAHQT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1JhZm1SV3JXTU0yelJwZ0lNdW12SlFZbFdqM1U4YnBYZEY1azdodyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079885),
('2T9FoyEbTAig8meQLxxjTMitsQmTbZo9utCN9ZXf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHZuVldZa0dLbXQ2NE5Ha3dPMUh4aExjZUk3OXRLTGxFZHZtODloVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079864),
('2yaklef2ixAWchPhkgTtHBO4nbGoCQ33eu5ZSfXv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0JyRFAwNjlpbFYxOEQ1WG9uNGhkdWZqR2Q1V3J3RVdqQnFybXBUciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080007),
('30dxcBCBFNrSRwitzPgtmkWVM4pj8FNdRR2AoJHG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnBrU1laT2pRY2lSQW9QMXdidUx1WUtETTY5S1hWVDNYUFFjcHpBdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080407),
('30MjyTQcAv8MnIcCBukyPLyJZD8XLwtECLKM6a2F', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ29mQkRHNTlyN1I2bXZPVTNDYmI4QlRzdllHc2x0VG14ZVVaUU41MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080372),
('3bLcK0j19IjuqinbSdteZbcudCXXKo8BSnKR84fj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzRFWGk1UW9wZTdzaUFFclZpSVZLTUtwWWRrbzRwSkFXY3NGY2tRMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080003),
('3dwpgzLtTwnAe62dERfp9ScGum1N9TdUqigs6vEA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlhlVXlqcmVSQ1F6Njk4cll0UVFTdHVFRzFVVXZVTDI4c0RYWTVLNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080373),
('3F4F9vF3yfdFjQeFWfrjJ0OFBCLlukAVQzCrIQdK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVE0TlFnUFFjTGRUbWxYdnlpU2dWTzNnYWdPMHNobnBPcWxVZWl1biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080132),
('3Loyn5DLdBVNcsu8ZQG0Ebf66wRvVMxdzncWdWE9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1cxY0ZDa2c2RktQODhZV2czS0s0RElpRHE4dE1xd1BEakdtT1JpOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080102),
('3n31EdYucQ80OUo8GXSsVyoo5wcN16tRljn5ATfk', NULL, '34.221.76.127', 'python-requests/2.28.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieFVpSU4wbDYzUWNNd28wNFpJb3JUNW5vVThHRHhVQXEwV0tmUWpmWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMzoiaHR0cDovL2tvc2x1ay5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082214),
('3Ocm6iHrwwVxVhpcnKnZNary4NGiXwTaOy8lw4DX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZU85YmN4ZnBOeVppUGp6TTl5dFVaeDBTZFR1V1RqcTdLS1VMYUxtTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080507),
('3ohtkdw2bURAXiNY4ncgX2wNFLMxoauZMsGJRY1Z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2hBYUJFMWg0anZkRTZSMWJ2MXQzeGVjd05BQnFMUjZnbTBINlg4biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080093),
('3OJZHtZpNSOutrORLlp73YqKG4ivRnTSt4kvZqrS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2NoT0g4NGVQNXpjQ2ZHaE5lQU1MdjRvSFo0VnRCdEhpYVJjcU9LaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080414),
('3pwftD30QJIlfMrwK1IHpl16EOkyR7gqCTzLdnYT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblBxTGZJTVhZSU5reEpKQWJaY1g1Zk9lV2lYbVRhTWl0TGQzcllKYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079829),
('3qh4B9i0Z0untW72CS9QLJJedv2cI56gG9jUmYxH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEQ3ZmRYU3pIWlJOT0NhN1VySktpZGVaeFhneUNhWnlBaEpKekFIMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080034),
('3rIoIyi5nVlaSfEHzLpN2RvOOC7utiNETIVPd7o2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTZYY1p2Nk1MRjRGclROQ3MxekRUV2pTck9jbkM1M2ZRWGRMajdBNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080411),
('3sRjHeHi5sOeIkjQxH88mknIirT6zQDEpftRoCKl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXF0a1VaQlZ6UDQ0WjRTcTRJOXFCMlA4cnZ6YkJ2dlNWMHBKeHhYVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080016),
('3TWrUN3JbvqrjsWttCWQZpJ0hoBtOR9nWyjdH0ET', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3ZVU1RQWG5mWTNNemxwWnljVXNSNTNmcmxDWkpXS3lmQ2lQaEFPbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080377),
('3UzDyeUKMWM8EpIQxcKweEG4q0tNVHNRaUyJjWKW', NULL, '104.196.165.78', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0tFRmM1TGxUME13eHQ1TE5MMWI0ZVVENTFOdGNudzU2MFViZFBESiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9rb3NsdWsuY29tL2ZvcmdvdC1wYXNzd29yZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1670082719),
('3xnLGfBFSfWydPhocISEtI8DB627uLlr6vwRAzmi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkduTjYzbVhtQzNsRUI5OEgyNm9vQlZEWDBuY1JkemFDRTRPcnpjYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079843),
('3xOWFtQj1jQhbEeb068XnDPzEhTIxebyjy4GP0h6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2xVNktobnlyaktGd21pbG5BS05GUEIwWWxXZUY2eE1OeGxLWWFNcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080004),
('3Y9H5GEWf7SNqVLi2wVv8TdoVBId950lDEHnPEr8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0NQUzc2em54NWpqWm9ubmI2Zk1NNVhtZ2dXSUJlbjNSNXl3UGF1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080446),
('3yfaBYjZu4IzIkD2pcGrN7IT1UymRMdkahojuUzu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTZhMTNnVEduNENKWHZuWVVGcDg4OXV2SThMU2JSTnY1emYyM2dmcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079913),
('4fDsfBzzdVilfhMm6i7s73R9FlM6ndKB3aWjht8c', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmowZUg2OU4zMU1KU1V3QW0xc3dRVlhnMnpMQjVQejgzSU9qUVN0ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080058),
('4jbzAyd1KZ3VhesYSs3IpErplQPJFhJFQiHU1Piw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjVtTXp0czlSM0J6TGpXR1Q5eno0bTAyZGx6aGduTEpoQVJaemlPNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080441),
('4jNP7BQybAiuVm11f6Vvkak2rCqRZO6MniTxXslI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTQ3dzhDUXI0VXVRcDhOd2dUbUVWWUVRczZTaWU3T1hkdDNoUG9xSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080094),
('4ooU5UOG2VK5HNcixrj7ZsQrVh1IwtmKCuUBjygr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2RqYVlRUmdKeHRjZ0Exck0xbGtBVDVCRDNJU0g1YkRxa1N0NDVWWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079970),
('4TBlF8p6RiEHNPOCmmeuiHapA0aManHaGscxvmEe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDNMTlYyTmtrVnJCMTRZb0hnelNDZUlibnNjaHV3cGowYjdiUUNobiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080085),
('4Ud8FGfKaO8d3LZUInchVwcXoXt5umSY3MAASCeE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGxQNVNSSzNDMEZyeHBHeU9jaGo3cVZlVVc4Z0VNNFIya0tvbW1pOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079941),
('4umHvvMILUrO1CubysYqRJJ82SndrRa2gWUKl0IR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGw3bTQ1bDdpcHIzRW9mQTNIZ2RoYXdJWEd4MEVkNDNzR0twbWhBRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080443),
('4vkxvB82Gkr8Or3CvhpqO61m5XhECPoylTPA0Hvj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmR0ejg2cUNKdk8wMXRZT2FudW9oTkppSkpiY2gwVE5rOXF1VXZTYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080075),
('4VpraQupYd68rQABwnFwWwwZuqNEXqVIru8FDECp', NULL, '92.118.39.78', '', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSHVwejIxaUEyWmtaNUx4dkhtT092eHl0cGxyak9FRmx0bzliOWNxYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082421),
('4XkZQwZjWaxMLlmpGFdPxbtuD6uob5LZldMNwkUl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVpjam1RUjgwNkxIaUhqTkRCNnQxTVh0RGlwNlVQWGIxb1drclFQQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080475),
('4z3OJE8QaIf49DhKPIDLKzhdcPtZTHrHO1lMG1wd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGFBMHBVRHZRaFc2Q3VNU29Wa0ppTWlycUxUcTliQ3JEUzQ3UFlReiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080419),
('547jKjRGpGrnzcm3SOrtmXWsCTNnA9fK885S5uBh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTlpV1Jhb1NsT1VySkxrWXNmRWxJbzN0NnY0UmFYR0ZQcFl3M0ZySCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079851),
('54HXMqoe7QtmEYDEdHaHeimZBjNijt9VTSy778Mi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzRGSGEyWEhKMk5ielBpZkRkUlk1cTBCZks3bjlBWmJZcEMxTWRGWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079978),
('5HSnMq61VWKLMdH1bFlBBg4So6MpaKC4BWcXynfx', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXBsYXk0aUFKSmhMVTJWUTdGMGZVYlhaUUlaRTU5MTMzWmRycUJvZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080221),
('5Lu7yaevWj7Jy7Iz6w34NPg5hNw7TmdLkquWIKMH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGFzdkhaemd3UlIwRTB6T1JLemltT2JRYjM1YXJSWUF4Zm02OFhpTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080381),
('5MKTB3COtTlZJ53sucNP3UKQps68EA5ISRKe8AH5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUJXZU9HV2taR2M1VHVtVXkyaVUycDhKVGFQdmltVzBjQWJINDhYeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079907),
('5NJDQ8ButKWrsXzsVnaWL0190NOVVkpjbR7hFXeh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2hSYmJISnd4SzZiSWNjcEdYWHpNVFFrNmdSQ0xNY2NhdXlYV2VSYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079951),
('5Ny8aR7Yw5JHCkj4uDWa57GsSBdUGcwF8DGzRjG8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmJrTEhkYnBDSklZczFnZDcyQTJNTlYzQTVsQkJTemNGcGQ2WXYxbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079909),
('5ohX2y0v2frt9Yu9pzE1ENgi0vfXtgPgfNxvjkym', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmk3R1I2dmNSQVVkUFcwd3B5OE5FdUZFVExiOHdMT213bzF5WW5FaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080012),
('5oNzx20loleLLaXj8aKKSCRzzbo2Nwu0EOef211N', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1F5M0laVkJ3TkJGVWhMRXY3ZXdBV0tENGN5T1ZNSktSbU13dlJtVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080136),
('5p0gppHElvoZV36q3t6qO08IgEYJO5ZUK2fcoqJw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGxsTUJ6TkxoYTdCNU5vcm5SUmNFaEhJUVlYNnNncVZRWGlTMnhnUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080131),
('5p6nbVmPMJJO2JtaSJTplpMpQZDe6CItTcpPlh9J', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMExVTmNlQUdsMlBUcGJKNzJ5ellQdDZraW85OWx1RFdpWWpaU3VnVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080444),
('5Q8lngxwUk30zGb0jC7FD6KEANwHeysccqdRdQSl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXJwRldmYUdMUEFGOXVKRHJsdVRWcEZVSDZQbDFwVXVQdkJsS2owYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080000),
('5SGPLQDmCH4In69VIlGEnTnlw5fEkFTlryQzfwY8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1ZvY2Z4Q2NTTUVwcVVCcWhQUzlFUVVrOG1Ndkt6b1p4b1N6MGhFVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080062),
('5UbwzDy1653R2mk3wSddck8yMPJz1htus9uAS4KO', NULL, '2.187.30.63', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUkE3NUNLMFhWbDdXVFlHMjhSV0JEbXJBOXhFZ0ZzSHVKQ1dhZ3NsaCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670086854),
('5zD6dkE9BNIF4wBorTlMO7vvS2zLr9BSqydA89KV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3ZRNlZVQTFscVNuY2Exb2x3d2txODk5Z1FSZXpwRGl5bENFcURjTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079819),
('65HPMiXqVo6zB8wBwIINpjRpUIzLD6r4bNtsoRmS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHNnWlBnMFBQekpMT205NlZENmd2anp5RDNrM1o0V1dlY3RrSzR6dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080261),
('65iWt00NzCzpZ5AvlGhHdTtdnB6bv3723C7uC4kK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUNWcXVpZjhYdlNSRGJ0MHQ5b1E2V1FWT3hFMko5RzZMeGs1R0FXYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079995),
('6AQPQ84ZoIlQclLN8mD3jryWTrzja7QoRkSNVVgW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkc5RGNFSkltVnlZRDdRa1AzTlc5RDNMZVpuSEVSdGdxVUdSbVRLVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080159),
('6B4vTp4YnYR38hKgup9TSwWyoA1rxEc55P98FCPC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGp3SUk1bXk4MnRPRzZUdlcxSFRlOG56SXh5RWtPbExoZ2d3Y0hKbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079893),
('6b6lxm6IvmIG3ANhEOVTR3N0fqUha4XJFC8zpV3w', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVhvdlVkUWV0S3pNeW9SNjJPemtueEtKMTJyWDZGVk1Mblc3bmloeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079789),
('6CdPdE2EpZOtLXySh7b5DcTUERdkas8hQtQ9VNSH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU01rRjhheFZIbkJNdVNENzl6OUxvQU9yYUdPZTc4UVU3TDBIVzRMMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080097),
('6IqUhjB3B3eunCWPnUMWfZqAnJXWKYK4TV0tSs25', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk1XZUJWTEp6YkR5aDNZZGlsYzN2Vkd5SXRMQmxOSXVpUkFMSkpPdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079830),
('6K0qjahyN3yyPvc2t4ylFNgDd9QblFZOUFYJmaMU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWttSnMxbm9vdzlORjE1MkZndkJDWU9pcWI2VDNWSEtEN3hibkNZUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080494),
('6o9qY5F5A6TIQzTW4pK3Ap3Zwal5bGpNviMNJarg', NULL, '3.249.81.249', 'Mozilla/4.0 (compatible; Netcraft Web Server Survey)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk1XT3dPTDJXVzZCYnh5NmZxVjkyT2hHeU1ZZ1JMNkhGdXlYeFNWWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cHM6Ly93d3cubmV0Y3JhZnQuY29tL3N1cnZleS8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670081844),
('6qQOXEzzVXKdyxLFeV4yUFF00PNCkbxSSlQrOa0w', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVB6VDNjbzBxd0pNWGNrTXJqMkpKeDhabUhQNllVMmM5d2NaMmNRdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080041),
('6rv4LK1wbn6GtWs1t0gY18CHzcTJ9MCqqoXUaUnS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEFDZWpVTTZnRUVza1luNTQyVXJ6ZGtxNjd6M29iY0kxZE52UlQzViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080099),
('6t5KEuL8qpCJXBIZVV9kVBx8PHX2npuJ5Cxw07wG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEVnNHJQWG1ZdmJSRU1XeTQwZkxGYUlxdTBmVnlucFM1bDg3d3RGYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080435),
('6uNxwqNOQVtt4PBrBGIvZtM2iAEcxfKVagW1MCfC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVVDVlNEWlMzcjBaQ3hCRFcwcWJWUVM2MmZ3UlR2b1JDUjlwQzhWeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079979);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6y2oaBKGQ7WCjWLh7o8RbNCAnFGjIxZr3zEIDXZm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTNQZG14WllaT3BrYVk4R2NteElpdHlGQkh3bWQ2WWUxR3NuRHJMdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080037),
('72sllv3glofcsSUzc65ETUjvafjH0ufWtaHO3zQL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWtJdTZJc0xnSlhHV3VmR3hGSnZCNGFoSURvRXJoV0VlMTA4TjRCMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080426),
('74OIFz4SsrBtoqcVQXUj0m3gVPYRxmEc0OWewHWm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW5DaTFSSUJybzJ0NU9mSlFEdmliYnZRM0dkV0d5akNzNDRSNHAyNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080405),
('75sr6p9xexmMmFbMYD1Rg6VpLYkEzzj2pN98EAq4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjZpSUV6akVaT2JWazJBZVE4V3VLVm5PYkE0d1hzUjY3Q3JoSlN4NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080186),
('76tTAvLxsTgEWkViz7rIdfAbSzgDqIzcHEGaXoFd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkwzWkptTFNjd1lhakszc1NrSFZRcXVMOUZQZ2c5MndZeTd4SmhLSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079796),
('79aNmBE5mCvMCtf76SzOgnFEFMB8i6IirpHfeB5q', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2NFalJybnd5YzVic1JCamZaWW5RZ3pRTTlkSXdaTmo0YVBjaDBoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080226),
('7aasBk3sP7GvwrlUXgpzSd91g6X1Lo9Vd3xaUHQu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVFHNHM0QVZWTUNqczMxNWJXUlE0VWVzc0FjSHV1OGxTd2pBT3VEaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080180),
('7FQ5zWqiJuYuN43UoPPIrb85rXhTxkyDuKHIdrqX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXRmNmNlTDdjZlhQdnRzNGFqc1VMMVRERlRKeTRNb2ZFcWh1N0xBNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080524),
('7IdDWobVFOywuUbYdsZWdjtdKWNtwpbKX1OFv3cA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVU5kRnR2eUhNaDR2ZTRwTW0zb1JJVm1STFczaFNTeGJHSnlLcnFtcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080095),
('7lgzxYyCA03PzsPtQ8ZtAhWnDF87EuC3JG3sd52b', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGFHRHJiRnZ6MldiS2tHYWJLV3A0RGNvTjVNZzVZbUVJdkV4dlRQbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079827),
('7ozsE4MKrg0SSPb3QvVAWQBZjan6lO5uky2FyGWr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieENMbk5sRUdIVVo5SGFCcWRLVGkxWngzOTZvTEh0MGJZVndxSER4ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080123),
('7UqfVjyDQXDtIel5Mr0s5YuvdbW36ZEEFqXdi9zd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXE0V3YyMXZCQU1WaFIwYzBVTDZHa09hT0NlT1dVTnVDZ0pMTmkydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079783),
('82L9WDWTdZgJ56Ho9R5wtTrDXjAk9DBt5Cb0g1qu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWN0VElLalZQYzc5T1g1bGtIZ1N4WGIxV2lVMGlyVEl5ZlRLUG53aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080339),
('8CFxRghhbwEqgNY6xtBT1GdIZaZ4R3O2QKelRH78', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE9UbHhOTVdhcUhhVFZ3Wk1aMEhqbXNpMkUxT0NCSHd2OWw0NElreSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080484),
('8FSSmvh57245KaHUD0yOhpG3Fi6oRpqNUs2FWYFB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDhPQkJEVFF5TlR0RHM4ckREdnBSQ0lrSjlKeDR2Rk9QRll1VFBDdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080314),
('8JRD0jOUN5dU09WeumgFassTZeAd7vC3AJtDQCmk', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVFueGxQY1B2WXV0YmFCV2ZsYkRUOE5Nd3Q1TlBIZEJpVVBsQms2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079777),
('8JWaUCoDaW3XrDosBvT74kAzepZuKbKkpb4Jqdrq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2hra0hzRzZtZUM1NjJ0cUFvV3dzVWhodHlkOUwwMEdlajlyOTlacyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080135),
('8lRsy0SBGSz9w9A3mR7D00IbQkFfVCdbujozomF9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGN3OVFYYmtIY1J5Y3pBbzFTeXdCaU94cW8wVmxTQnZwSFdmc043ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080074),
('8M4VbXgLVF9imIQriSUA29ExnSZ07fOH8W7ywXak', NULL, '123.183.224.22', 'Sogou web spider/4.0(+http://www.sogou.com/docs/help/webmasters.htm#07)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnBXeEpTTDg5UU8xWnpjQ1pIclRFeEdCTjlNYXBvQlRYWXNMRDFXWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9rb3NsdWsuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670083571),
('8o2zpxOue4JMbj6vaF4HXvuSsv0DPQbQJopPBUK7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmxOdzk1eHUxSVc1R1hTQnZ4bk00RjRWbkdVSjUzSnd4dWR5NEw1UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079854),
('8OjC1NfyWlAhcxTkldrk5PxsfJrQ2Pb8AkB9dWVL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzhEN21HV2tnblB2c0c4ZkJ1RVdnRkRTcHE3YktMc0wwZW02eXltbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080045),
('8oojd6ENpvq0b4H0nhj1nbgLtabj2VTdqo3JYq5e', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXhIS1VuWU5qN2hQSk9rZHZrWWZSQkI0T1k3ZmwxTmNVUWR5Z0l6UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079804),
('8RCjyIp7QF9pw17qeusk0OAebxXfESAGN1cQC3GL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzFEVUNvdmxXaG5ldDZjOE1XbUhPY1RwRkhoUjR1aVJ2Z29jN0pXSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080385),
('8tn8RMfhYjoyCE0V2v6FiK4TUL36s508s19HUeZV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjFFWHgyOFkwbG52S0ZsRW95aE9KUDU5bmY5Z1UzWExDNGNRRGRyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080479),
('97TnqeAFLjw1pa0yAfLdpH6I9F3IRyExoNVUviTC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFNKTGtTZlBNTEt6OVhLVzBITXZFbm1ZeTNrV0o4ZDZNV0NYSUJZTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080231),
('98ud0rmPU056LPdnftrJKMCcFMO74UuCBdTE9PQD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0pzcE5kMEhVNTV4MWVRR1J2MVY2bnJuckNGQ29vSjhYcGxxU05DWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080282),
('9Bwy22iF1AFzCbhLh832iA4dMhSqyky5LOliRtaT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDY2V2pZaXZMODFyZ2xXN0lzWFNuaXN0Y0h6WG0wREhsMjd2M051byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079946),
('9BXipBHX6N6Hxy8VGXk6BQO58zypGWSYoiEbKEdP', NULL, '192.99.62.110', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2309.372 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWEoyZkpEWTgyb3pUYzhDYkNpcWVabXl2RVl0NjRzQ2tBZlFwVWdPMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNzoiaHR0cDovL3dyb2NsYXcuaW8iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNzoiaHR0cDovL3dyb2NsYXcuaW8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670079895),
('9gU0yBsnSj3l2EEwsdjnFj7Xs5EMpVaXbH9VSZsE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTducnBtd0E1Z2lQMXlETWlJY3NNUzB3NU9qVWVBMGhhMml1eE9tUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080169),
('9IA3Mhfrdlk6v51wtAzH2D3oxONyyHfeVzN8h4LF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGwzVG1CT1pQbDFTUXAwOTFQT1VDNlhDcWZYSmVlQVh1eWRZZHRjYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080127),
('9LHyWrDUGH7a7QOQxPZMKsMiwRIcSbAEmCcabND2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3R3cEVPRGFDRm9qbTNhalNNMU9ua2dYeTA0MjNWVUVaRDJtNU1EVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080452),
('9npQFOyAagXywM0Lr7PdQJhcECTGZooSoKaoFrEL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWNNVFpFcFl0MVhnTkEwSVNhRDF1dVJPbnM3YmRhdU5iQ2JlV21GRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080451),
('9ONUPyXalxSffa8oMMcWxtZSlW0w9YG6OZYt34X1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzhDZnpBQUpJUVlLZDFPM1ZoMmFkUTdqakZKaXZnTlJ6akVIanRzViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080027),
('9qMEsar1TSVyHjCfFzEoY6XrYphAWNd67UCJCUxI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXhJMnAyWGI0U3RVb2p2WGlOUWkxWlV3WExhcUdNTHJtMEMyMzU4byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080016),
('9qozW87fx07jmnabzr7dQEua4FxSomK67UvS4M9x', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmtTaDh4cDMxQjU0ZjBpbEtPVEtKU05OYTZHS3NxcElwbnI0dE4zViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079940),
('9qSe9cBl4ZhpxgcPqX2x4htImVoKdy6vg0GIKtA2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVR3TWg4RHlraThPVTFyeWtzY3RMZWFYbU9zejZsUllqN2Npc2FsNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080258),
('9rqpwqNkiDd1Z2AqiBQvS5BZGcYDALno3zd7SbPS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXh2amNyWnJmYVNUejI2N0RodFYwYjBpcTFaV1FWdk5UMkxZWUtEdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080451),
('9SHeLRpT6zPMNHEYci1XZhN60BAMxDmlrkxkkGue', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmgyS3h4ejBmd2wwc0FaWlB4N0FXMWw2Q1BRZUw1NjFXZFFvUEwzMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079902),
('9SHQ1Vi9YwzZD9x2kh09bp7F8MQcS9sQTpOxaweo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkY5RlhwR3hlSTdrN0VFWHYyTlBPWHNGUmxuUGozSUVnSHNzSnF1ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080426),
('9SUkf1wIYR9Ifnh6z9FmpzgaVYO0UcYM1lkz8KSO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlRwNDBiNzZPQkpEd21rNVExaWJ3VU5PNDBFWG9ucnNwOWJ3Tm9uMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080138),
('9UjgPuUTwfEQrk2nHDdQJHOVaz8c9dDtTd9yTKt1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWZoRGJadzJvZXNyN0pZSDVFcVN2VmVoTTRKWUdKOHNnY0ZNOUpveiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079944),
('9Xhz9Mbf3PL0Rsn8PIPXD0VEoi24qxWSGasUtndQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTROZ1Z5YjVIcGY3azl3ZDhaQ1NVS0F6SGJFUGJGdGJ6M1d6VlRiaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079971),
('a1pAPmHydcCJP7SnINB0JnaC3NUdsEcdyWqw9y1l', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2Z1Y1hMUmw4MDhjUm9TUjhnbTlXc3hQeFVjdm5jd2N2YUlBb0gyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080178),
('A3KCFYEJNLgw6zBVmMUbKnv0gTp9yUXfICwdWxOL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWl6UksxMlY0VjZwQ2VTblZITENCUWxSMDZ6Zm5YTWJtSGZCVUJQaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080068),
('A6VYevfYKkFPcziwJvnlupaf6G5tR4g7lkm3Jggm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejl5dUd4TkxnbHJMS2czbFJWWERZQlh2R1N2bkxLTTJCTDRoV3pUNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080197),
('A7vhZf7cRlACJTqHZ1d47XqCI9RiHt3qTT7vhbS5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUsyelVNWjhBOXJqb09sWW5JSlJPclpjZkRWMHZnZ1Z3UVg3YTA2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080498),
('AafZ5MdzjNHsbrWmKnEnLO1Z92IFQlfmxHv07U47', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTcyVzJMMU9sYVlKM0I4MWdBa0NaR1QzZlk5NTJUWVhGRnUybzhBeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079806),
('AEM0biDNNMWZYNyOBv5Z9VlLoUgEf6TUdCN0iLUg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1AxTjJnRUpPaTVENDU4VTZEVFVLRWs1a2NpYXBvMGFMUVcyeFF0SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080390),
('afrToa35lzevKvCaLkvQlS2CsR9uTocXjgEC7RPq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlNTcDNpUnEwUTZmQ3ExOUZ0R2ZtZ2RQQXFRNXBYYWNkcDNKNHQyMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080393),
('AGcLA2YfCuJFXQGNtRHVeSSxn5Dgmdciln7DaEas', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1lzSk0zVUgxSVc1T3YwTE9rZ0U3Y3RkeGJSMXkzME1rVGJTeFlpSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080175),
('ahw1P15giInQRq665mtQYUvBtAn0rnkPkCZyFmkW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG9OekQ0MmRsR3BWWHZJSUFFSmdmNVZZTXNTTTR2U08zWWhHYjZxbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080437),
('aiJWyKUtx8FTmZUs4FiGViTpbql3Q33DHZnsuIc7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDlRZ2gyWWx3SzVvN3ZhZGhOTkY0MklkT0x4ZDNSZmlaWnQzRU5reCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080079),
('AJNAR5tBUW1Ek6UZzDlu4fm7ezPI0vNAC8HjRRJz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEZ0MmZXc2tQQ0NvYmFuRnJCdUJRWGtocWpRd1hLZnVwekRnMHptdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080515),
('AmCvosguEqytfgusRCOGsWMDXUYrKFn7GrJh2mWB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1dEZ3JBdDJYMTRGeHQ2OE9oQUtYa2VCNTB2Z0h3eHB6UVg4eEVEeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079988),
('aMoKrd19sZENtg38vWEVbIrRmMC0vuGZr7k4beSZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlR0cU1MT0RsWnhiMUtoQ0NkZkUxaHJiTE91b25iQ3JneHI5OFpqdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079935),
('AMwctXT0Q0gn9kOfnJIndcTrjgFHSd6aYZZNtrEG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjBHeGwwb2ZsTmZYSkdZUWFZeFBjQU0wc0lvOVMwQTdYdVVPeHczdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079778),
('an9tB24B5euEczWVGMlFXBd8Eun8jHGpLdsWrLnq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibko5aHJTZHQ2S25PcTh2eU1SN0dRTzBnSE1DeFJQSmZ2V3ZldEllViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080399),
('aNZTHmjmR9Z05sDqdZMGW28MsJg9dv5C0G6KnpQD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFJnaW9mVkc2UXpiZUZWMmoxZjRHMW16YXFKa0VrN1FQdGU2UnBTYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080455),
('aPGFXDgkBPOoyOjY4SeVxgxHz2odMnzJ8lslVbmd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlpXNUJyUzluNVUwYmR6NHl1YzF2dkJaSnhkTU81WmpMeVNrZnRFUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080489),
('AqBulrD3vTGi61akHJYZqIrjbQrDcWtT0KFJvf9L', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEhlZUdPU3JPTGJGTzk3dTRXN0hUN09mUVNPUnhVOWJucXhTam5WcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079827),
('AqFPQq4pZI3212Ao7BlZPTBG9R8XE8rHGEawWWhw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWxIdUZrSTI5WWJVMFVsWjd5VzRCdXhsdzFLVm5aclJsTWRpcUZ6NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080139),
('aswcRkjayTRrol2dfGcH5zzfQ5fMjcRedDFzHzWl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjNlbFhSM2o3RGZyOU5WamNKUTB1MDZNSDBSZ2ZnajFDU0JoMGJsRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079928),
('aT53IxHMjQ7lLdRjO347vcla0JMlCcykjbrpQQzb', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVUzWkxpV3B1OVJIWWNneVh4bXlNbFZWcU12Y2UzRnJsWkdkSm9jUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080148),
('ATLlByeYDoaPUP9nAXosMJxMwzlNDSpoIJvVWGC0', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemxkVEM3bUczem1BeWhTWnZxelU2ZjJUR1hCRUh6UFJJV3ZKcEZxSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080380),
('AUBcpD242i7kdW14HfuULNfymEqupSfJNWlWd0V6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUZ2bEZ6cndZaFU0enU3UDlkazBhQlFnMVd5QUxtbElDWVBGNGd0ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080090),
('AupjTGnvqUpDgoAvrmIWUdSDCoWvCFq7MiXXXmrj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieG8yaW5WSWhFVGh5Y2R0QVZNYlpMNGo5V3BTTGg0M3ZkcVd4Nm1UNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080521),
('avlpNDBd0Zh5gqE0ADtq0s4uYdJg3uEpdydlDP9O', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQURQM2VPS3NReEpjZzdPTzZUZVN1ZFdVS2NSMjJXS2NxZ3ZGdHp0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080368),
('AXDl37uMp9X8XVIUqFDjHTJC1HM3Pfcomx3oDf34', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1NpR1lDY1VwM2R0TWxSbjl4cDdiRFBUVnFjMmdjUUVmT1BqV2hQQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080100),
('aXVvhyaJN8oswCQN2LJbUWv1IvzUQdjuM3cdez6y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW55c3NaTDZ1eEtmazVpV21DUUczbVBsTjBFYmtYN0k1SEhDUnczMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080054),
('AxyH7oNXYcRNoSnC5sH3H78IEkDDhVmjzHJmlKmr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmp0U0E2ekgwQUxiYTdOa25ROENWZW41all0aVJrOXVtcHBRa3BBUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079952),
('aYLPfSfyAqMp3Tg1UvcW1NcimAX9bZOPwYhPDjuW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWksyS3Y1d2dZWksxeUl2OVZUcEV0a3phVW1CNkpuMkk4QU1YTVZZaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079877),
('B3psWEUZ8bkmcJK5KwvILKBx4OQTcMTMT3gQN6ol', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianVYeW1aeDVZRFR3azc4Q2JOWWZ6SGhVZzNtSU9pd1pwMnJWa1dmdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080026),
('B8GZe9qB5tSH5E4o5XTJwvx2d5tzYHYBLeZ8QrkW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkQ4cTRFdFRVMmhseEQxdTd0NXZ2alJzNU54d3dNOHVQQWhQczZ5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080183),
('Ba7sNctidOD1Fg0D4y0UjOkC8Ab7oqit1FbR0hN8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWg3Mm1HeE51VTk0bGNyQk5ZVlQ0a1dFRnhpOWI0VWQxRmZUR1g4SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080478),
('bCbiTpCynOjHwzS3F2nGd9L0dQvNULUm9KxZhX5e', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVU8yZ0VuSGMwNjhoSjRsbnlHY01aeTFtdkNUUkRTaHNSSVhkd3ExZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079878),
('bD6smYsHOdW6l3EAYqwIeHfh7KLwBD7wh4bmlxOI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDdvU0hvWnhYMERHZlFzVUUwTXpCalRCOFBqaEVTdkU4dEF3RkVWSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080381),
('bdLw80M5cyNyRwgeS4SVxSVGZd4ukByCjB0N0P3X', NULL, '123.183.224.25', 'Sogou web spider/4.0(+http://www.sogou.com/docs/help/webmasters.htm#07)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMGltOUJXRDNmc3pDMDNHNjlPSDh1STIzNVMxeUd3S1dFV1VqVm1ySCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670083565),
('bETjyUrjRIm1HAc65ZG3GfP5QrVi0FB5n4oD73ls', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXNDS2FXNkVraHhYWDJ6Z3h2M25BVWxYUlVnYTNUSGltVm9VSEdhaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080528),
('bgunJs8yAYd3ivsRDr5vhj4P3R7xuGpaa0TbyPSY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk5ERjVISkJaNEtwVlRVZzl2bUlFTEFDOVhvTlh0UWU4VDdHcG1mSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079996),
('BiNObPpxQAPG70pUcGbx7uFFupcF61GGYlWVgpQf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0I3Qm9RY0RVenFhaEhzYkYySjV6b29TUE9kWlQ4ZHczOWpGRDJBVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079900),
('BO9mAuawt2XLNndUcwmdKuXXm2TjUgPBnqBT5tIk', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1pYYzVMcmlSS2tmQjBncGxxc3V0VjZsa3NabjRQMzhNSmpQdHMwUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080372),
('bOoMVcSHyhvoHFWAsStKQVaBJ5voprDDH5oRhRQK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2h4Yzl4UnJWRVAzYm9YVndaWWdvV2c4T0pBa0c0OXhLRTZwUzVCYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079837),
('BoUADRtdgcsmxSn5fxEDnkBngVY3twTlhJpXU9Ww', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1NPSG9sZ2NVVTF6Q09XeGxWTEV4YURGWG9INzVDRjVuM0dKc29pTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079825),
('bpQBbeJSDwspXhDcMB9zVglU8s6GpGsPU4HGUNlr', NULL, '199.244.88.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoielJFR1JESjduN09XV290WTlFSkZLZ1dTOWdOcWZKaGNReGVwd0VWcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL21lbW9oaS5mciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vbWVtb2hpLmZyL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670081045),
('bqDF1pgdOHVRWMQfvI4BziI0YyY9BugMEZJ49WG9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTdkY3JsR2EzcDJiZjc2OTBuRmRibHNKd3Q2TlllTWF5MFJJeUU2VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079777),
('bqIZRlo8sAuVWapg06KniOoGBhYvRgw5drZ5a09G', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib05BTHpTU0x0VXRPcm5JZDV1R0c0bjRLWFdxY1Z3eXpNRDVuWmsyQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079899),
('bRctsO7Q1bVO3GXg1bzgvb5h4L3UUtxhAb7FC9XH', NULL, '152.89.196.211', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOUZrZTByRTBoYkdHYkt6bjBldXRSQTB1YUx5M1VDNzlvQ3NRb0d6YSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1MjoiaHR0cHM6Ly8xNTkuNjUuMTIxLjQ0Lz9YREVCVUdfU0VTU0lPTl9TVEFSVD1waHBzdG9ybSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUyOiJodHRwczovLzE1OS42NS4xMjEuNDQvP1hERUJVR19TRVNTSU9OX1NUQVJUPXBocHN0b3JtIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670085281),
('btl2ChDyllOGfshpmrZINetH1VVf98u5IvmyEV5m', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnI3dkxJeFFlUGdRMElQRlRDd0FNd0F0YkRPY1IwM0xNcHZ6TWRDZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079775),
('bwjq4Qv0bnvoVm5OZL34j2C612Oz5plUOjk1rG32', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGNTYVI1dnFKUGt3QW12dDloWTFyMGFoaTNZamNRUk9WMDJMS0pYdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080040),
('BxkhYnBNhA6ou07cnmLOE387eMXrVyN9trKQl23w', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2xNbHFnSERJZUsydHN2ZTM3ZW5SMHdBQ2R5WkVGN3ZlN0RZTmRNcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080149),
('BYitQLcRTACjNSRWUlbUTnQx4d3YA64OsxIIuQRK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3c4MW5BamoyRWtxbHhXSTNITEc4R2RmMGtkMWJmWHRqbkxvdGp5NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080098),
('ByQ7VdgfJhLmQ9HGgf080BwzwBvWVu9wjOvDYmLB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN201VUpicjBaYjV6V1NIUDZuT21kRHR6UW9hYkVScXdSa2JqcXRsTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079948),
('BYwO3EC0NVEMcdzjhGgdEby16HCADvKULWuRtsxL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXVCNGttSVhPUzg5b1hoM2taQXhwMnlqaHp2dXlLSE91cFpiUDNjTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080070),
('bZdfqRabdURnTaQyCbbhoNztxC8cIUaRVJI2LcQB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid251TDRXTGRmcDVyQ3hIaGgxOFBLRVlyYVNxZnhtdEo5eEFnY2xVQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080301),
('c0X8mOUOGxAYYNeesaSfPIGGzVh7yxdQyivotCX2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWR0RHlJZVdUTjlVcHdwR2JienZTWlp3TTJtTWV5MlRiVlByZklUNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079968),
('c15ZpEMNIQiwCScsqv5eIjKplAjyrkTwGZHScM5W', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkxMVGIwS3RJUWlYaHVGYmJHZGxqRkpZMzlmc3JJQkJKMG1lYldZVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080265),
('C6b9o4ubMEgPcafFKxAz8EZvAWs5EX9C9nF0hNe0', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZndkMVlOZ3ZRQzBCMmNGUVhxcUx4bURPdExFSVdvZ09xMnlNZHJrQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080171),
('CaAZG0U40a4shXwynS2JNTZhig1BNl6XVomQqamO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVBjYU1KSWI0SHp3ZnNBTjRSeTFURE9NZnp3WHhTZWZ5U2xobWdEciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079872),
('Cd0yAsqeWgvaGCX7Z6KuKyK9Al4u4eEjnbooE8J3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGgxTXhoSWRHODhyVjY4UzJZWWZ3RU8zM3cxN2htWVZ2Um9nbjQyWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079919),
('CdKFcqSNB04aZLoyPyTvxWZVOEoDFPCQJuCRmUCR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekFSaVNxRU9zc2tEbFB2ZzVLYURpYmNqSWRERDF0ME9mNWxiRmJkaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079860),
('cE2UCBupzyLeFNnZSBunYMidQC9cNVmm3JWYV5rl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTE1kOVR3UnVPc0ZndDk4VFJ5OTNsRDM1SllrcGZFa3B5V0ZrMHRTZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080051),
('cEXZ3XCmbejNIdwMoybwdmQuWbIAFm04QnfkWcc1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmk0WXc3VTllTjI4elJIWklUQWtZcTZDSHpUUTc3azQ4NndRNGFCUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080365);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cg8SJrn5RkDue450Y1HyRbhjbzFYpas37PaQFlYy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3h1a2pEUnZNd2FTcjZ1VFBmb0Rxb0MwVVBpdTcxQXlGWkVvQkwwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080182),
('CHJJlZhkcoUQz3PjmyP4riUAyOFPoJ9z9bmd0I2V', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTmwzWVdXckloaE8wWm5OQWNTWUM4ZFV5d2sxTGVtUkJuVzlEMEdQdiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovLzE1OS42NS4xMjEuNDQvP3BwPWVudiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vMTU5LjY1LjEyMS40NC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1670079768),
('cHnTlT3l1zqy6Q4hoKYGbb4uSRxe6FhCtLM1rPMM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjRZcjNzbjA1VzlINlBKeUZTTnJLTzRvd1RLcnNDTGRBbUp2VjgyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079942),
('ckc206PF6gFPMigNP7dg6FJWYKBwW19wbDOa4xXm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEdoTVVlZnVlbzdmaThaODVicG1EM3E4b01QS25XZGt0ZW41QkhNdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080111),
('Cl31M6gpS6ILr1xVYitUmFDKGxO99IPX6lQfJHo5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDkzb0dubmpoTGwwaWNIMExmck12SVd4d0tkSGhTRVlhZVVUbXlITyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079952),
('ClWu2P8E5tXksOBDCziPdXnxBxGoCX8Wc39TQwby', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1UzME42YTBHTEczZ1VIc2lEZVJIanVvbHVGRXRFM25obFg0RlV1SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079984),
('CMrjG3vTptwEMUIhHwmtnxt9WQFARAmjxFdSM1LQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3NZYWUzTkJ3VUVLbnpnRWV4Rm9PZXM2cTYxOEI1SzBQdmE2VmRmaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080361),
('CNjsYw4S3dorqhNiwjzHY2RNTf2ruGJPCCNwHlwC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVVsYVMwMXA3M3JSTGlVcGptaVJWZTJGT25LbTY2WDRZM0k4aFVVNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080136),
('CNTCEuTCLsrJGMapUctTW3dFxLT8Wzs1poEjYYHs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3dFd1V4U3Z6OUdabUwxRjkxMHE2cXdHS2hhYWFMQ0dPQ2R6VVdRUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079949),
('cpvATtUnW3BAoCLdwwavH5occL1Qmim7TbhtwLtj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0RMQnFwUUFEbjF1QUJQYnhZdlAyazRUOFdxT2tDZ3NOeWV1RHFBUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080503),
('CQKexkjhphNFFEX26QYBTyVh2pht7KLjgcHQuwVU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUtaS0hpTktDa3ZwSFh6eFdldUhlTnV6Tk5tMkxvNVp3VkQyOFhWdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080147),
('cRdMhI9ExPmT9iCQpAy67iXEV2IwcN0RJv81HKN1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2lKTTNjc29PVWd4cFg5UUdIUUVickJNWXU5NlpCV2VscTVBTVgzdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080117),
('CsXt9OaqbagXZl6oCuJKunmzRU6q6EaUoJ1R7d81', NULL, '34.221.76.127', 'python-requests/2.28.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVHg3U0FEeXQzMmFucEU2N1VNTWlFTGtiMDFqMmRtMk5nZ0J4MXZJWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL21lbW9oaS5mciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vbWVtb2hpLmZyL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670082214),
('cumsasysIDx4C6ndnq5EBlKwgIWBN7r5HPEsSzWs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjQ1WE5EZ2ZPd0tjTWZxNU1ydk5MVWlmRVk1TzNBWTU2R2JCelhmeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080065),
('CvqJhXvVthEFwyMy1wnUgRx1xQS6EERH1XgC2tcE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSG1GcFlBa2lGQ0ozNFBtZzNWYjRnUVNodzZVenlmaGpVTjVEY1VYWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080023),
('cxS7BcJJDhyTnxDXAcEVF1WofwoJhPROsqA9s5ez', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGFUZXlGTVFjSGsyT0JtWnROVXJ0RzQ1QXQzbU5DY2Rma0N3dzN6WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080076),
('cYcQ6RjndDTHaSWDk56Q8QUYWliYxyB8qDadi49o', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWlBWXdjR0s5bmU4MG5TOE00OWNzWUh6M2hWeTBLZjlMQ1d1aGNnTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079845),
('DB4Nm8x6aB9ylOzpfd1oZS2XpSlk2LtN4JcoNlvi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXJmU2hZWHN2ck9iS1hzMk8yOXR3bjVVYXVqekxwQmZrVXVrZGxBbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079883),
('DBc2QvasVGAuoemvK5uZhyGAnviwpIs74PDWHmHU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkRSbGQyemtlRDd0ZnlHWXg1dnNDZ1ZpbGJmRUxlMzJaYU5sb3k2dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080416),
('DBF2Hr2O6YGoKZBpPktHwnCWQGC6wn0IUZuNSHOj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1JuRXRkSjE4dzBvNXZNeVM2Y3J0Tml1MUUwbXdUQWFuU2NZcVJmVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080429),
('DCWlBlOIZqJciQvpFTLfTZKveZ9OAoreFdKam3Qq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXdpcGFwMDkxUnM2b2FTR0liMmU2c1F1OUg2Yng4eDJGaVhGMGRHSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080161),
('dHfuMjRerHb3kAmDrl39UHTNgA9q6CxYI08nWsoU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVFoS1NhV3ZPUmZoaDNHN252dU9ieGZ6MXE4MmpvYXBNVkFEN3JZMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080115),
('Dhz5xHmhE1hzENEQebff1CaMGObKSoylqedabU2p', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3Y4MGViQjhSRnNRNDFabk5UM3VHaFpPMGZUcnlCTVRJVTdmTWp2ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080447),
('dkZ1OZlWKJluRMo0ENzaUchz05XvAxDq2ZZr3TB9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFBFYTU1N0NsWkNleWg5STFYdDFZRWpKZFBBMUZ1M0I5MDI1eWdxQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079960),
('Dl80VEUb0vtFDsgjJgrtgccnffGKiBvg0Jeb8rD3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFVFaVlrYzZOaXBDZ1Ayemd6ZkZHdUZmTUxpajNDQWlzRDJNWFBXOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080523),
('dNpBRjedkyp3UsQbjHSpR2xnivyuXMi6TD5CEmnJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWktCTEZPSGdwQ09oeFJuSjE1eFlmdmJLNkszVTM3ajBlMUhkWTlCNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079977),
('dnxqDpFwx2mQPgCbfMGDMKIjRWWl1ngzAVIenx5w', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnR5NGNObU9tOEJNanI2N1N0Z01uajZVTE1UdjBDWm5GOWRlRmEzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079923),
('Dol6QzcR9SpxKy5PrGOdOPXMwLgLzPv4QVWK5sZP', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1BHRFNIUWhmNUdLQzhnSDZEbUUzelJMUUpzZ3RJRGgxQlMxTkZOZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080510),
('DR15EvppTSD9rDoZWRol0lH3QW0xD0VuYExqXJwR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNE5GaFRVbWVOazh5R2VtOVZpczhDaW9TQVdVZXA3TEJwSGJoOGh4OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080412),
('dUpTxkhsDTsGmh0AaHzMXPtMaDixe5mVSj4U6yUD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnd3V2gxcHh2SUdyTlFsTDA5RkM4MzhRSzI5MDVpdW92bmJKbzF0SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079915),
('dvBbQmyvg25uieXxzpze8XsyCEJrmob4Paebv28a', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSm5UQ1d6bjFXWGdSMXN1UEtFNUFzdG1OYXltaGFOUW9ZUlZnMThiVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079896),
('DXI836CSC7XAHJziL8BSBsgLpUBIuiv1hK3MbQOJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVJzRzhJNUhheDR4Q0R2bWZVck10M2syeDE4aGtWS2FkZDNrQ0lsRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080483),
('dZ44GnhGWSMBocbpNwfyQiGud10ZpQGgdPqOq8Yg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzByZXY3VWlWTUpGMEJWa0owZVpqeUFvckdsVlBJN09SME5vSWVGYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080497),
('E0eXYcUR4dOz94NcZGGU9MLk5FBPxNmkeo0QuvP2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODBVaVNZZGU5V0szc2ZQc2hMSkYyd2J5eVdIUmxjRGhvcnpodDh5VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080480),
('e4vM2AaPnD31kfaFJO5rg8pgC2vo62EIZwOeGxmj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmRtSThpTFRuN0pvWDNJWGRVVHkwdWJONWk0ZzZGSk4xZ21iUG9BWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080057),
('e6QKg5cA2j4u7bwIFAAgWgdj7Q8ahQS4tsvn76eX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclhTTUdkWFNtMWJTQlBpVkNrc3hIMFZHUURxcDIxNVFpeW91dHJLZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079905),
('e8qOLxZhdiEUHa3KCR5Wl09OH4yp7BiH7mx0Akkn', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTR5S0JiMmZNdnRJU1dUNk1vcmFqQ0MycVpvcnZBeXpaQUZBa09QQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080511),
('E8SeFFnQxzVdDIuHhwvy7X6goRPzUn2i4YAhDQTm', NULL, '2.187.30.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQkt3eWI3WG1lMVh4VHc0dEtiS2hCSUQ4YWlqd1BuSUN0MXlOYWlQUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670086854),
('EbTByFO86OYHDjiidjIOuzRTaWV9BqW3bLcuZRfv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkN0ZDVJT0NJeUhkTG9sdTR3N251UFJ5bUpmVk9RTDd4eVJhVGoxayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080391),
('edguM4u9EMZr8OoU0Tdtk49xKizkVx9J1xFmoo8Z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXZGdFBiWDZCZ29NZkxxOW94NU5BUnJqc0lYdFA3bVhNbm5NVTl6QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079880),
('edI5KgY0c8O81dE1efQiWtDKe8qwg0KIO2wh4Vl8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3hoSWhBRWpadERyVWhHUUM0TXhhczJLQlRMcnB6aDd3YWtRNnhEcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079838),
('EEnUfUUbnYYYt5QoiF4Fpb9QgF7uQLx3rvU43GHS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk1jMUthdnFEN3pjVjQ5dVhqVW1KRWRZVGx3YTZLVFpXbG1oSXY5bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080031),
('Efl07A7w21QbjGTVgVIsIhVHIWeETG5BjJLXrWx9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWxNQVptMGlaQUJ2WHIyVE1WV29YT0cxSWJVY3BqSU9CbU5Nd1J0aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080080),
('eHyuvU5ibiDHCTIrb0zfHo6hJWq0vxAxWv2LolHJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmZWeHVwZDM1eHEwV28zOUR2MHFOU2owOU5sVWowQ2gyOGpOb3Y4VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079828),
('eIAJrQbLfFtPtU8thvGXEj0zPdqRuHnGD9ZrrSNF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFJWTndPZHF4RjdXUnA4d2xTYkNkQ285TkwzeEVlWUp3NFhZbXhQWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079963),
('eoJYWgxBlHdCXvtsLVQLQU6OsqUxipQep1pMgkRP', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3FxQ0FOWllmc29xR2lIMW1YSkF1bkp3VmhyZ3V3SUgwa2Q2YTlmbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080166),
('eOLQQGOfQOOqRJ8Ti5RqFkfgPJxFmu4nYXrLIJ7C', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlNOdXNQYU01dWdNN0RvZ0hVanpzdEpRdWZJUU9SVHVRM2FMZk9OcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079947),
('eOmLr0YPuIFhmhVa1uLMM7YFlitgi6esOvq7mpX4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGxPUDE2aFQzelNiTlhOS0MxQzh5ZW1MYkNvdjQyOFRXZUlYdUF2diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080112),
('EPGb0soCR5UJ4fqlBebejFmymPehMKLGprk2P2BS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHdiQm16eGdualF2NUVCdDRNOVdLNG9DMFFiVmdqMHU3dHlvYzZ5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079878),
('eTKrcqaHKSnChPMiFLUExc3VpYoarbftUVc0Hw81', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnhYNnh2em5CMVFGNjR0V3BYYUU2bVR3cUVBWHpWNzE0aUVVMlkwQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079958),
('eVW7VTsWqsdhL79hGjy2S521aTfSCUrdfgcfYL9Z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejNDWkhBY0NNVHhuQlJkMnFhaDFxSXZxb0trTElGTzFUbTdZa3Z1RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079822),
('EvWVaS88Wrq06NkK7g41K9cxzfeLFsSUzcbjDfmq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEFsSDVZRHJhN3pkek9iNE5CMDdvazlHMTkwNUo0YTlJb3luYmdySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080279),
('EytYcqeYj29EMhze1CEUx1WU0l9G5wYoyvUS7Nto', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0dqY1hlYzJGWTI1cG50RVp1OUhZUU1YUTI3RTdRT1d3MEZCTmNVUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080467),
('EZDLfcIJDXx6QbAW5cDqyb9ypxh7xFxvj9vVRh98', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUFJcHJabW14UmtGODJuN2VKc3R1SEFOUlA4QWVoNThOZUtFWTR3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080532),
('f0MTbfw2nYBNH7FwOhWbM6Xmy7UQZXnFBY6BPTTu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianh1YkpqZVd5eEZLSHVXZE83R0lLVEJESEtQZUxMRHVjeHdVU3ZLdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080362),
('F3BcZ4qM4rTq2Al1zUpqQ7LCMP6ffPkThAC7zzsY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEtzU1M3NG9PRU94RllTV0IzWWlEWFJ0a0ZWNFZkcEd2M3BuTXNoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079930),
('fBUVmlaYe4bPJyEPqZFurQb55CSgnLhDDDnYWqwF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUxBMjQ1VW5HS3FrSkNOWGtDQXpnYzNPWXBQS0FyZVFjTDNpZGNpNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080331),
('Fcf67XfS01x2EDqlK7pgG425kLODlDmODyxAf33e', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkpYNmJJTVlYWDFCT0N4WmNISDBnZTFFRkNkcEV6NDJKckdCdHpSNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080028),
('FD4lFt4ciLFMOcohY9GxZeL7VLpV7m5jvf7DWm4M', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRW1qVm9DY25iMUlqakdKRHpCbWpIMzdqTVB4MnBCY2xzRWlRaDQ5TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079998),
('FdbyoYwksNuaaYW8tkXkxCwnYBeDWWCl6sNMd0ia', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU9GM05JR0hiRzlDNldpYUdqNGkyZGY3NktQaWZOWTh3THpsYmpSbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080334),
('FeqeIn4wHq5V9ak0JRbUM5h039erNKLPpv3M0fsu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemhYR2ZvaGsxTzVrb0FPTWFyMW5jVWlqRndSYkVmZzdGbTk1NE9KNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080393),
('feUH3TNPsnJtKV4KlskmAB8nVxuyUO08C6DXMRE4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVZ2dGlpZXdYaGxqd1VxNWpNT1A1VmxPbUxENDVRNDFOb3A4Z2pQViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079837),
('FgHFSul4zkPw4GNUEI59vPvWwlNYROLF0uvnFaYe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEFNeVpVU2NPNWp0UGdkYkxBRGdrTFBEbUc3VXFDY01ZNmFlTVI3YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079895),
('fgNKQIXagXczKdYMYnIQKL26U2G7OPelftL63KtP', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTRGS3lER3ExWVI0Q1Q0OEVkWVoxNGhzRFlPTTVhSlY0OXg5cWwwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080147),
('FMBmGHDYJcf7HOIX1kMXDQJ0IoHMQ0rMqQEPKjPf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlJ1bzdBcjRNekgyN0NJM01BWTA2YXNqbEhFMkZMUkdReHU1amFiNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080493),
('FMhXhUmkBa5JNJnVRuhJt0uMez7kcy1DxdTaQZlG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEFMcVRQV2NJczlLa1IyRzZmN3loeUQ2TXo2YVdBb0hUVmJVWG5sdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080414),
('fMP0zcACFzVXCMP6xH4HAIPImuNqUEWAf5gMFwgm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTE5qTm5FRFZYNkVUdWtjMVN2ZHVvQW1VTWtlR3prV0JEcmtFS1lleSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079833),
('Fp86BwzGWjyZM9bMvtOT1ugHv2mtS5lGDR9h6eBt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU9GR3BtZGVZZjVXRHJLdkJ0OXhieWxQNnBQejdmOHdmR1hpcEI3cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079938),
('fPbG5HHFYd3TlLcRgoVN0jFB9cZ8m45A2kE02oEG', NULL, '205.210.31.158', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaUQ1SEJlYTBJd0F0Uk1SalByYWRhZ2hHZUFjUzFtR3ZOM1ZENFpoayI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNjoiaHR0cHM6Ly9nb2NkLmNvcmVncmFzcC5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cHM6Ly9nb2NkLmNvcmVncmFzcC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082080),
('fq4WFHgTiEio59r0470H5PzA3VKhSOMBbvIrDW91', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDFUV0dNSnBUcHNXa1lJZGZUSkc5aE9LVXVPeENGMWNBdGhZSVZmUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080054),
('FQ6YDQbtG3z9N9jXwZg455MhOmtynExaikelOUoi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk44aVhaV281WkdOaUxtenQyeVIzTWdyRHVCU0VOSVN2U0xnQ2NvaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080386),
('FQ7EFtrRbHhH6EpwvIm6U6cUJDenJgq7UKq78Dus', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUtuN0VXN3RjZ2FDWU5YdkdJY3E1VW9sNFNJNTNuQ3FwYmdqM2xVayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079904),
('fRPvUM4oCnK3gZf0JsUcooEn1rewokWL4v0B7YBn', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlJZZFNhN0JsYnF4R2hrM0VIeWR5bmJLaW9IdTViMDJKeFgyUlNhUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079882),
('FsIyymrgZT3u3GHVFxtsYVWw1vgnI7PyS0luBicC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1VpS0lQNXI0R3hMTFVqaHBmWlZ0eVY0TVBRSTV6dUxDSEtjckFBMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079873),
('fsKQnud8LeWxyPu503Bf4X1ppSx4kUDDzlNV4QJq', NULL, '34.73.104.51', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVdHcVF5OWxHb3JEeXp0MDE3ejh0WXhyU3l3MHNxWnV2bEN0ajNTYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cua29zbHVrLmNvbS9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1670082131),
('FsnvXbYEKauxrJcddBrBqFcN5fmTJHUOZUqb94cw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUQySWZlQ2pXc1R1ZHBDQ1FlN0x4aGhYdnJUUUozWk83U2RZd2JPNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080131),
('Ft5pFMkiFW8ksf0J1MceDNXwrl6zIxffeCCtxkwX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2tVTkM0SEFiYXdaVm5ZanM4UjVPV29pOUtnMWM5MnBmbzFUUmtBOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080402),
('FVPf5m2QHoPqFKYZOZYhqQ9phO4Ae8oYDcFZMWZ6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDRhald2TU9tRW1LWkJDaWZNY0RlbmM0MGh5a01idmNwczZ3Rk9teiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079892),
('fWE8v5S1zXvCcCcYu7YXBkA8BQ97dn41tHca0bx9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk16MWkwbHBlWnh2MUh3UXZNOUxEcEw1QmxuRmdPWmlYRXYyQjdoTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080509),
('FyLm2F0C7Z2WnXiRwHJ0bAf6QpauH5gP2LIBnuVX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWRWWEVONUducUl3ZVdVYUlKWmdsNUEwTW9XaDRWRk1TOEpBVzNtTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079809),
('fZPerXt7k0zliVYF1vajfbZJOqLcoi7iBHr1v4kM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTlzU3ZKUExWck5wM25ZVElYTE9YNFUxazExS3hxZUxGWUI1OHNJRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080006),
('G1eiHfjOVVz5OI36gbPhZrUrbHu7QeI7bcs2vaeY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekJVS3JvUDJGTUlkWnNUd2c5WUVsdnhESzQzaEozbmRuYlJMOFVMdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080032),
('G3ym3BUfqYRppOBtLVol12duixABNaxHRcds2PT3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWtFb0tvNlVyYXpERlFyQXBMV0x3NnU5TDFOdFVyZVA2bXJWMENTdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079997),
('g4S3bU7enPPXeiFSKzLInF8ENVaLIVjgHPtFXnEn', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhZY0tTVjNKZlFHUXV1bklrZHpETzdGaWpwMkJjMG13WWppa1FmRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079982),
('g55cj3ebSh6oMmBp9p6KlxI2mj0MdBbaa22buHIO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHQ2QVpUcTZONGlXeEkyZ21ZT2JuYTdBVzU0cWFiQmhsRUhuTGRyMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080126),
('g5XbyGrmaAx7pCTEq1YHf7BcKMsyK8tfZwHeuTLw', NULL, '2.187.30.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjIyUGxLem9vdUJTRVMzaVZsSXc1blpISWplckVvZ0xLM2NGR3pqbyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670086854),
('g7LH8O83vcylYJ128eCbTylk0AzcUaB4jpsPu3VM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0JLWndUZVF1R3R5bFBXOEc4UHlJVnBaQU9RT3d4d1VzdGhGRmxCVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080477),
('g8Jp2cGyTo33igvgVCkQzogzq0aT0ShDDcQtU2K2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGVtU2htMFoyWklrN3hFMk1RTjFwaXR5R0Jpc25nUGJ3dUMxYWhLUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080517),
('G8NggjvKBaieFpwAxO7nsNb2SSAKxV91dF81bcos', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVG1JMVdqNk91VWRiQmhJcm9VRU9NNXhNazVFMHV4TnNUeWxpdnZCTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079834),
('GAypgiQSmhMpFQ2TVYeXPpnFwnfN8L0WCsUVkUwA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUdoQklFR1c4WTFvcWFrNHhqUWxWc1FLeEcwamZGTnE0aFBQbHRReiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080504),
('gbECcqkY4h87XSFccuI5TwQJ3gNFM5EehA4LZQ7p', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVhYSnljS0RWOHhsOTFBWVZFQzlWa2diSEFlZUhCQXBBVG9BZFhwRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079855),
('gBLJw7Mr66G0swtidZvGYk9APmwH2XvENZdmwETa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0hLbnZjc2FYc3l4QnYwaDE3YjNyUXhSUXRnZnQzUzhOc2ViSjZwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080067),
('gBUCk3z0miTonagFuR8XFyVdW6JcGJmzNKOD0K7r', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGhyMzNCWXVQVHZUeVlXbVFQZDJNbTgyN1FlUlZ5bVhiczdkYU56VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080174),
('GdYKIllRzqkjfS7iUGYolWyx23jF8lvf10qA49A0', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2huSGd6bUJaanBPTExzS2IzR1FQZUs1ZlJZSWVRSURQbnlOczliSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080487),
('GEV1tAjc0mGMCEdHIfMko5gxbbn3WpE6nttvkQbp', NULL, '34.73.7.147', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWs0ZlY5U0tiTndCSFdkN01od25WZFJ3ejlPSk5WU0tmUkRIWE9vQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9rb3NsdWsuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670082264),
('ggPYNCQAq1fZncrjDmBawnZXTfOHwkMZpNrrIioa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVIzY0FFeHd3Q1NjN3N2YURkYlpwVDVMNDNnaUFOYkNhTkpETDBacyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079925),
('GGY5vOfKWkBVZupn5GpXfbGAxiiXUiG8wnO9kNJm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhHYjBuZENzUVkzOUxzQXlSVXo1anZqeFEwbjFDdHU0NlBwVjBBQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080491),
('GhAEzxp0ES2uJ7Fq4fpCG0Cx9gBTNHDANUjsCGXq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHhXMFNwbW43ZTYyczVqWUJTaDFpQkpjbkgxU0dqeUxGZDF1dmdSayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079956),
('GHk3YDeq5UWzYko7xBlQxdpx3nkdwN9v5KFR4trZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzZ3NmpuUjdobWlaUEV0MTRYaGdJbzY0V2N1QjE4OFNHc1dSVTkwTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079810),
('gigQDuxu6uwPaedpq0evkHwxSzN5y3b4kbtbY9ns', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2w1NFNyMGRFWUl2RjhOZld4NnRpOXBXNUp3VGZlR3U3S3RBVDFHVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080399),
('gihFdKsRf1Di9ivenPdXc5qTtF6hooWXGiiVJaEs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib25oZm9SZVM5WUtHR2RHZE01S2dWZVQ5NElLZDV0ZWx2ZEJHbGRMQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080428),
('grxzachbuNOSheKSRVdbHwGZpzFQolJXwQCBfaOK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjBQakI0TXg0MnVFc0p4U1BaZ0VsUUlibXRiMzExZHNid2hjSkRqdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080429);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gsIJdXTnH2wYV2iEU5gg5d9uRYGq4hnvBQ8oxyXZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG1KekIyM25qRFNCWWNqYTBlVktiZnZubEtIdkZzTVhCcVlFQmdqOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080508),
('GTB8TksMfmIpbptVKpnSxLc9CypwV1hs3pLoTBqf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2JBUlZERXZPVjZVcVlqSkh0MlE0MWxmdGRReDB0enNHQWtnUzVyayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080471),
('gTUeyiLrvZ6Osr5w11X55AsQvglq4uIpfWEgSzZd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXFNdW5ZbVpVV2lEZWhxRGZyamFRYjc2T3BqVGpCUWtic0l4VTh4WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080461),
('GUCA9VtrQWUXd5it0WCvWOdaitHHa6xU9d6zaSf0', 70, '176.145.81.174', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiOFd3QXZxSWJ5aTI1VXIwazVxYU9PbXo0Wk9CY2U5bkU2UUNLM0dtVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTU5LjY1LjEyMS40NC9leHBlbnNlcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjcwO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkMmVCeEdZbzBzdUxxNENERkhpRzdXLlRWeWhUNFpIcFlSbWVwa1pnV3pIenZZb294ajhtTXEiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDJlQnhHWW8wc3VMcTRDREZIaUc3Vy5UVnloVDRaSHBZUm1lcGtaZ1d6SHp2WW9veGo4bU1xIjtzOjg6InVzZXJfMmZhIjtpOjcwO30=', 1670084144),
('gvZGzjJxrM9DipVSWL1StpH1nnH387ZDGKI7mhNM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkZraXpPZXhwbUl4YlZ5ZnhZbW1SNDV5Z2hGQXgyMXZkTTJxNEs4OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079945),
('GwmdvU0TfKsZ9AkBJEZla9H9ihW59X9b30EUFdfs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXY3NnpBcHhOdExoMEhpWGZXTDkzWFZUWnVsT2NsQzFMdG1aUTRtdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080277),
('GWWEbCceEjydwWW2wvgOutmDWiO0wYM0ZB6QneEc', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXE2Z09RRXp3VWxVS29YNmdwaTJWV0hlTWJrZ3FXUndTWlJDMWJkbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080080),
('GYDv74QTRybn9sFKxlWguKoX6uEdrhbZo8VkoSdt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjh6S2ROcDR1V3I5b2o4bnR2d3I5Y2w2SDgwc2M0N0JWak55UkU0VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080209),
('gYWwvZy8O7gjXcotMZxM7QWWg04ysMLVaghYXmEp', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3NWb29na200VU1YUmxwcXgyMVFiVE1IRnVZdzVlU0JVZE9jWXdmViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080465),
('h2gsrwp7rPtuPtBSg7RKdlN0VbDVGnWQ2CATiiCy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1VUWklRN3o4V01hS0V4bXdRRWxRZ0tVUmNOcHZ4OUlJeUZvOEFLaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079891),
('H2Kmx1m3pKwKl0JLi8jvtSu1nzvMQylgpzgRXF2z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzhWV1MxRUVBOWhLOHZ1TkRnekxOMEx1VG9mdmNwNDk5RXVMMkhMMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079934),
('H7nv9b1YvgzWBMxdYRcXeQZUcqfSX333Z4PCkQU9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDYwVkR3aDg4MXRqN2tIdHBXajRuNnlmWTNyNmhhVExFZ2lQUGdZbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080348),
('HaLBerxkCcAI4G6jbhRYjo5xhVoUC9pkw6qxqpbQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidU4wbjRJOVZSNnZHaVl2NFpFTHVpRlhOMm1GMmJDSThsV09YOVJhcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079881),
('HBxXacJU9Ff7u2ZqBGbsY6AX1AUCZPvXyBb4dNiW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEZnSTFSS3JLdVpKbFhCSW9NTlRkbDNOQUV1WGlud2d5ODRWSXB2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079969),
('hC7jaPy6H3NyESBfLffSqyNesg38Eu0MCPqDFX6Q', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVU3SVJOdFRvcUVITkVLd005R2JDUHE2YWMxdkp0alJjZkpSMkJzcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080088),
('hCQf6rt22eIpZs8GlGSy3jPeaLLdjwoBzqlKCNnc', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1BjWnlOMjRaaGJpNUJ1dXp4YjR1aFB4WmVaWW9SV1JFNUxVb0VobCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079973),
('hDrM5ikrw3eLCg4o0rzcykCJ77MPMNhUwjwctVKZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlZmOFRXaFZDUjRhd1hUVm0xaFVrNGFYM2R2SVdoMWFEaE5aYm5MWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080069),
('hfM0POMz6qPimZYjNZ1lUvzotHZIFbCofjQ6ei2n', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkVBOW9USkF0REU0d2dGeWkzTWwxbExDOUFrVnFxUUFHSVFZcW43ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079957),
('hfVKhIHHzazEIHYcPEySadrmLjV7EuKnD0KcCf6m', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUxEcDFueU5LNEJ3bkxjcXJtdEJmcXlCdmNmaWRWbVpUMDVGNHRLdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080470),
('HGeQ3s6viaHZBSswYZmRp4W25Mls4FvU86Qbb6Gg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUJLdFI4NDBFY3RYcE5CbFB3UFdrVU1Pakw3RWtoWG8xbld3eDVmQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080492),
('HGfjmg5HiOjKjjtwNjXQc0DdC8xVgDX9clXS4A9O', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDFJdmhUWDFCYVlEWDlpOXZ3S1I4RDc3ZGRpelgzZVg0d3ljbGRyZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080470),
('hHPAdaEsgenGGXeuB8gICs1d1n4uZYMN5BiG1fnd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkxWS1BQZHpxV0xaRXFxSmZQTG4wVkY0bmp2TWt6UENsTlJjcFNaNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080518),
('hHtMp6Mn6OF50p6Mg8o5rUZMDqqaMgyyGPxMEIsB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHNMUjU0RjFKMVhGTHVmZkdxbUI2Zmh5YWh5WVNPa3lpTlJvbzRpYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079782),
('hhwiss7iX0JDiaM2Q2JSkWeWSfTiFSzPTV2365Kw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDdHQU9pM1loNEUzNHJoejhFYkg0SFRBbGhad1hBU09JemNaTFFQSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079999),
('hk8XP6pyVkfi7mlaX56d60p71fnqihIyhb4aGKiZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDgzVVZVVWZtZXg5Z2FsTW9VTFlzN3ZCOWJhRWlSeXY1NlA3V1hONyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080272),
('HKyDXJZy5lvAQ31YFkdqrUdKrLgPh5jupWUqQ1HK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFNtUHdyTkpQeTZVQVV0eUJnMFFCY0pqWWN4M3dCYjNBelhudWtJYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080086),
('Hll1xACKzoAvF7Bn4EiDdCw3y5uBgX9B7iQFgO97', NULL, '143.110.222.166', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZmVZMTk3NTBXclI1WVJaSXF0Y0pyMDNaMUlLTGY1WmVybldzVGdUNyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670086975),
('hMQtBdYEdoa4YFSnNZ1JeQPK29UHoz3WsczWLJuE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajI4RmxWZTZKZjNRc2dGSDdRUWRFVUwzZ2h1NVJ4TFg2cjF3MFQ3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080165),
('hoFJR19NwOg2aITQxtE27zwhSImDDcgBJ49f27vU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE1XckV1eHQ1TXZqdUFqZ0xwVnRhSjBmb3ZiQ2psRjNXNlhyZVFKUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080434),
('HoGO8c09nWYo50zFaAXFfVWxhLRXPgwjcU0NxIk4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaURKZm5EVEZnYzVqa3dvTTdtZjNuZTRDb0RBRW14WXRJU0c1TWo2dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079976),
('HQsZVIVsDW3zT0hQzzwM6un6MorjMFoq54KRN5zz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEk4SnNxZ1dkVUwwRjV6T0RDQXY2Zm1VVTV3cUdkNFdkd2djOFFnRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079891),
('HREx1oisiPyrsKgveHjk5tUCaILk0Tiz2JPJuZM3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUx2bUVHdVVnTTJGY3Y5Qnhhd05pM3UyVVVQeHBMMnA4MlNFYWthWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080011),
('hRRd5yFQoUxc4QnsW3BkO8Km2YyLH28u3ea4Frqq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHJta1FzdkxLbng4T0lCS1VlcUhmQUR4Z3E2bHhvQnQyekQzd0xGTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079784),
('hSbRjBwqJL6WjFz9JK91zBjnrqmqySdMKkiVQO8w', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVA4eFFVb1NJdUJuQXdCR1J6RldXdFRKVmFQVGNYYUgxQ0NDN3JCTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080188),
('hsVU5sHhcoaALjDhW2yPfCPYRU6GsKp5YeMAABHw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUs0Zzl2SlB3UXl6WmQ2RzJod08yWEplY0hUMnMyWVY4NGVmRWxmbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080362),
('hu9yNZm1qnC5IZwtawk1mA7971Raty1flfrFQMUU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWxHOFJ6TmY1Y2hVank2cFZuajBMaDcwQVBBS1NndWVRd3gzMjVwcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080386),
('hwDDm6eLPaGgFINfW6JxAc3qtx0NnU0e1lKI0KSL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ21KUE5NSmdCdmdnV3BvWEtKb1NwSEJEQkY5WEpqeGk0TkYwWVExQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080250),
('HWp8t3AJ30rkQq7UBBlPDGDy80IC6gJvmwaKXoKs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWpDTXpkN0k4NjhUNmdwdHVQQ05KM1c4bTZyYUM3RndpQllTdTM0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080118),
('hYsGBAhdyk2cMT6tECcWXzps2L4H008vBK6qwjY6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0FyY3BkRlZ3RkkxbUZTZlI2bjJUa0Z6a0dqclNLSzRKT2x1akhOTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080496),
('I1Iz8Xq5edkcGXTJiREgmzzCQqkiKp49qyFB5j4N', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkZUVEdVVzNmWWdWM1F5d3pUd1h5cnlsOW4zWFFjRGUwSDY2bFZVZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080374),
('I4c3IzgGKtxcrTmiVpx1T2LEN1Y0enR2dgUxfFE0', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME9QT1VEZHlXMDcyeE9NUExVa0pXT0RSTXBPaXhMcTVyREVPTnBjeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080063),
('I8Z1ILGwMSRrrxPWaFiYc2bnIlOYisvxaCyTfvDg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3FWMDlHdXRnQllxWmk4UDVXVlVRUFdONUZYRFFYTVZQcngyMExYWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079986),
('Ia7wXELsFmOdv2rMngNSOhpLUE9nifh0EtazicGf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0o0WUZ3aWJHWE41eHRsMU1XcE9haG4wZ3hpWHVoVVFHTkNXZ29KeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080239),
('iaDC0OFWib9fcU3oeZ2Uk3w7UfQQbhgK8R14Ncig', NULL, '192.249.113.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjZ0T3hEd0RVTnRlM2hTbWhWQWpYVGZNQmVla3p1eW90MTQ5cWFrUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9rb3NsdWsuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670083139),
('iAUc2a4ns5wvZnZtYPMMKuujMgrReOBfp4YNyGSf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGtlckd0TVk1Qm05Z1h4RDdYRDdwb2Z0Tnd4VmNEb2M4YXh2a2RTaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080129),
('ibJ3phOAPMNpvB6njAJbl2y1wVQNAHZ96cj5qqAa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWsxbnFNTENBNGxKdU9welc3WklZV2NEaXQyY29GZ0x2ZEdrMnlCdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080413),
('iC7wPfe2FQKaE1cZrgaPNkN5va4jEdEaNAZOuoUW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU5pckphWFVLMnRVSm95ZEgyNmVQNmdUa3ZVZExOUDc1UmpKR1RLdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079868),
('iCi9t5cFlshlENbUZsVIb3Fc8eKxy9CSRD7pE34p', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEN6aWpwQk9MRmZqWXpaTVJmek5adEM3M3F4WTNCVWlUM3hST2NYaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080458),
('IfoSgVg3RLrX8aDax565wGqvOO0thqtPZBbp9vR9', NULL, '34.221.76.127', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoib3JJOVBHNVNXZEFBZlp5VmFCN3I2UVJJTkc3b1BYaGxSUXl6WFpPZSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082133),
('IGnXNtECwAaNCB4xSiqwQd7BJBfuSAZgGhZmXgHg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlBwTFFVWGZEWlB0STBEVmpGRnpwU3l5eEdIRWV5cjJmMTdtNXBtbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080375),
('igThpaA5fZFQOrNlqZsRNNPi1ZAKyziMXGlgkBac', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEdxMlJlWTZJTFpmYmp2Wk4zTDhma05GM3h0SkJSYnlRMEUyalA4VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080503),
('IhSFW741TdCNVBuarZfQIFZSSBe34cPCAzUXOvdS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlhwMjRqOVVPU3kzeE9kaWhxOVJpQWZBMDVvc0hsQlhMSXNBQ3ZnbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080114),
('IjCAPq6gcv3oZgwcGteo9K8IlqdAYZimMrPOEEIJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDNKTXNSd24xOXEzZ2Ezbk93OUFJeENVR1VFbnRxQWdaUFljM0xNNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079918),
('IjydHf7wVOa4ctahKtDaULPnxkDRLIQgWN5kssm1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXJQR1FKS0UyeFYyUk50TlNDSjhZYmduYVc1a1BuSURBZVlnNGZraCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079862),
('iKeJANMwayiAly6WrWD9Fo4W0DeCtofuUwMMX5Hg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2s2THVrM29wY1dRZnVTa0F6c2dzNm5raHMwazJjdUJlZ3Y2cjMyeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080288),
('Invj0mqnq3kcHOqhfpNYElbfZamdvohFCsvArDxh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkVxa29kM1dsdDhrd0RpTzh1cmlXc2Q0UEFKV21FelFydE9kRHNQbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079931),
('IoCWLG70vqkHiERgyD8XiOyROrhS7qaUbxybsVuL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiek16RklkbkJBQzlxcTBDc21NN3VqYUc1dVlsV3ZUNk9wNktCYkEwSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080463),
('IolnyVWDhqGhwjsWcIsclTLKNBLAlspwtbuO2LTE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWpKMEljWnNxQzV5b1VES2IwR1dkRVZzSWhJOFQ5b0J3RExDWEFZMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080035),
('iqn1FPWytqy2UfuUbVXj1Ntvt75Fx3XbxeFvVSjF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick5KV3BidGJ5OW1sT3JsV01PMDhyOU96NHRVYVlhRTFrNzZYR29oTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079889),
('IR4zb4F1iFdexf6iVVkGgTOPAgRdiyz7MyJHWDub', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5XVllHdVZWeHV4OWplSzB5Z290cFlNMHA2VGxsRG5JNEFKdVBPQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079901),
('IRmMYbpETPEB6ws3MHUA0989AZdnboVKUt7nDP1Q', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWM1TXZ4Z1Q4NGNaWHpIN2hzS2tkZWxLZm5wUjZsU1Q5MzdiUVl1cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080108),
('IrmXRaQuMRDfgn2iUvMhAQD0mcN2BIm3Lj9vLsIq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGVJMEIydksybjBrTTlEV3BIZ2dPaGhQanFNNnlPVEw4aWxaWUVkcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079886),
('Isb6DAo88utlPItRspstVCFHWfPCvuqakgExYIQm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVlqR1ZGQURqRElpTVdrUG9YRjg3eDBtRjNXMVFLRmM1ZVZQQU9zSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080009),
('isdnkFRIM0bcP31Q9MBJizF4jACnkKu4VQEgKrCV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3VmSkpVNUt0Rk1nYVdwWHRZM1liZGpma01BRVZjQ2tIaWpoSVBHWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079805),
('iStmEWj8kZFCI60gN5AWWL3OMdkXxPKzDIwpAjP2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWJOY3VlMDExZDVjRzlvT2w4ZnN6T0xwU0tuUlBmME84Mm95c3E3TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080042),
('iuZy8fq09dQF0HJDk8naEMua0aKtTQrU8SgWNTLv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR29ZbE5BN250YzlkVW1ydjdvdHdQMUZ4MDh0ZXBLeUpQRTB5SW5JSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079769),
('IvcMbX8ULuFJIj7YBgRDJeHQUhnk3ZcGMODk460W', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnZYZGpuU0JxVG4yMVJCRWt6QnRSeGdwWGFLdEVVWVRZeERpWmtLdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080116),
('ixJmTNQr59RdgZExEI6C84EAjG4JXmcAqZeP2PDu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieURRcHgxWkVIbEZveUZWejA3NEw5MkhiTzBYR2pCS2g4YmM3ZTdTRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080025),
('J065R16GkYIJGf0sGnrLPp9V31bX9jOCtYZf1ciL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnVZY0l0aHhnVlhRTWFxWnlxakVweHBXTnJhNGk1RDI5UmNTYVhPMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080051),
('J1cxxEF8vfWAtyf0iLkibsOjN2FjRBEQnamNfU77', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1M0eWtjbHdyeXFtUjluYjdWWHFTWUdPSWlycGxpQmxjN2plOWFrSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080513),
('j3AsYxwIfglHwuwnQ0ydQ3ALx3g56tIuWAFU4sQf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkdlMXJpclJ4OFpqUlBaaDNUdTlBT2VDSmRTWXRESGk4d3piVmhNYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079858),
('j4U7F0o8qX7JYrTIUfgwIoBQaKTtp7ZtiJfRclUQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzN1aEl4RVN6VXl0TlhXeHlETHhoM2pvOXRGRWF3eUNpbDM2UTd6MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080408),
('JfRFGCHdVubCVKXJmy7X7WtAMhiIupNtPfmSJfwF', NULL, '192.99.62.110', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRWlsSWt3bWNvT2U3WlhIZU9RNzQxWW9qc3JWTG1acGE4VFhEc3Y1MyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNzoiaHR0cDovL3dyb2NsYXcuaW8iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNzoiaHR0cDovL3dyb2NsYXcuaW8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670079895),
('jGELJNdgAB7GkvIVlaEAo5sDNJmjXqZgkmLvJLes', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3hhNWZKYlBIVHhiYnZ0R3pXR250ckRDTVhDRjcySG4wWFg1WEZoWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079933),
('jGVutPgLpvoqkvCbSNiMEV8JplIwzFwfafNi6jZk', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDFIQXJBWU96RTI1QkxsMnpZSlZpbVY1a0tjeHJoazBWd0d6MHRVUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080402),
('jiSZcAXevgNlhpsB3PF18l3EAqxJbaDz4Y7mkY0d', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzZGVEVFWU9hR3Z0dWdLOGdtVk41Mm5aRkFGQVJmaEtuS0dKdXNVMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080073),
('jJ3yQMw40p2wMfXrddX0hEw0V73RSqNuqdPjj75n', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXNyTkQwdXJ2ZVFPelo4b2twbGpYeUloNDU0NmJ1SW42MFFJdDkwMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080417),
('jj5BoXQCZke4axn2fuNGMLCfYekMz4UWfZYEmTNZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmQ5eDZXOVZEMHB0cGFtMEpGUlU5dDVPMDhrNWI3ZFRLUW1CakYwdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079781),
('jjJjSd2U3vNTvXmilfqrrRDoXWfLmY8SnfuvOllK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGVFQmtLR0ZuRXgwTHRnQU1qU3JxbVZ0V2NueWc4Q3JMc3dNU0UxciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080387),
('jJLyPl7fG6qh0GB7FbOKnmjiGyJI53YVyQjXZGAN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzhZd2ZPZ0xOWFBKVGhCb3pudXF3TjhqazFGWG95V05yc3lKaTg3UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080473),
('JMYeZoo4cpW5kzwnmYn7TigmkoOdHXhRtXp0jIPv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUpIdHkxSVpJVjR0MTk3R01COWlmSGI4bzBSQjNRSVhZU3F1eVFHNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080090),
('JMZ3N9hlLmfO5wj4JGUp9leEdqZOzeTgxurhwLTd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWhobU5YTnI3ODdQYUg5enFqajN2ZXl0S0NVQWJIdHgxbzN5VEhzViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079908),
('Jo15zXAQYgdycgZTaSs3YWN9m9HAW4Ekj4wCI9zC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidThJdkVEZndRTldJaHYyOVdSd2pzV1NsM0xpRDlpNTZzV2UyNDl6eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080141),
('JOMLpB5Im1hGx7f5BPF8d15teggRmMNn1Vkhgmy8', NULL, '205.210.31.158', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXNER3FxbFhBWk9weU5lQk5JdDQ5bFVNOFRDWkZxYlBCUjBldU1qbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vZ29jZC5jb3JlZ3Jhc3AuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670082080),
('JoZBioWHw00bKNNPDqbGdgX7GQ5nfUPXjZlkuNEz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUIwMWV6UHZnOWU3Vk85Q3VJbmNEcnlSUHRvOEZ6SzI3eDI1Nnh4UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079944),
('JQrO69JxW4NiQzd3PuWBA6kCkSZQzImxArs9XeGV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlVSbjFTV0diNGRUdVVlUkxKUkdmOU5lOXpnU2xDZk9lMzNveUp6bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080442),
('jR1HUqZ6KOVC0LtWUUuCxwtCEBDLOMx13PUx8aVN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3REb0hkeExxc3JYMkNVRGdqU08zSEdoT09JdjdUbGVCTElHeVdDZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079858),
('jTKwQMgmcbQ8CWKJkzht0cK3cxbLPYGIHoj1pYKr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWFqZzk1TzZ4WGNWTFJaMGlwZWdXZEd1ZU40cWtwd1BveHp2cWZSMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080213),
('JtMSMgdrzGFSc6x16iYUdNboDRYx8qCNpJ7wvsek', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHhMQ1VVNFQwcmNoS0l0Q3pvbENOVjVpQmN5dUpYSTFTMVVHd1ZhVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080275),
('jvPfb7O5gQpdGDMd3fjsVHguRuBT5vTkPGBMOgoe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTVQYVVtcFNsRzFWUDZ3U2tFU2tpNFJuRWlUVHAyemtYN29VNlY2cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080404),
('jX3OlIJzhJLYJvFvjnfOAyUpyjKXG59IhZwfbLgI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODlwZmJTd2lpMm92WHNXU296bmFKQjRHcnlQNWR2bE1tbldtZVBqYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080525),
('jXp1A389mBaPVaCIN8noTvnVYlVj74sldvmlRfZ6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMldaMTlsTTM3N1l1eUpuajBDVERuRm9rdXdsNEpjRDYyYmtWQndNdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080185),
('jyo8OoAm1yb3lzplfMJd6Gb9bxHiE7crW1hBzvRe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmVSWm8yeU11QWhxcmNKR0ZoNTNQSmpVZlpzbFN6dFY0UEg4QVlNNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080324),
('JzHdAvBSf878WKjzrpjc8XH9JDYlHjoN5oFQvtt3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzU2bFkzVlZISHZwTEtOWEk4MUNaMmtUZ0R4SmQzdFdDdmpnWmxQZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080162),
('K4wYD5zg98BFDv5NXdA0wNr9GrdQdZ4ul0SGMhWR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGJBSmxZUmJWY0k3RXd0RlpyNkZSbWRaVzNDcU4yOEZGSzNieFJDbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080527),
('k5sgzINf1LKqRwooxVHl68rquiJ8nAkRnznem4f5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEx6cXRmdWpkY2VNQTR0dWtoTW5IWDd0WklSd3N0dDRrR2dLTzJPayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079992),
('K9ZJlb5OVRf4oKTrH4vmrPApx8SAMFwWsVCzSnwe', NULL, '31.172.80.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3Q1QW5PQUhqQnZPY2EwNmhwVVVWQ1h1a3BtbTUwZjRBSGsxWWYzRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9tZW1vaGkuZnIvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670080660),
('KaNb0BHXPwcUiUDNiCiuuvHUJEHU8oEbGSL9KJwO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnljYUNlNWZHQVEwT0RkMlg4Um5heUFvMTJseWNDU2h1ZEFwd3U0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080310),
('KBEMP4pU3pPCOuY8wKXCSBcal2M4IQmNMFShMAE2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidW1pcXAzWTZ2bVJVdDhkam5RRUNYSWthUHc2MU1UUno2YTFadUxXeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080164),
('kdbLMPHRK3FQ3B1fKtTzAJU1GLwiggW3BCbGld5m', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk5aSzMyTFVKV2Q0Z29TdzdLa3RiZUp0U0xKWURqdjM0NE01S0sxTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079921),
('KDLynJkiWi3lbrALIAgWpfen5axLnXcRA11Xur4N', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk1ySENnYTBIVDRNZzlsSjVjY2JLM081MDBpUkxBTEtTRzhmcm1OVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080366);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('kEep4G6CzjINDbNoBdehgrh4wfWIml4NQyyjVbRT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUduOGZKd1Rya0Z6bWhleVBIcDJHekRtWUJia1R2RHNmSHY4NkltNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080379),
('kFTklvBxaRT3GBuEMnz3a27D4jkKydhnYZOxP697', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE9IQ1FCNjVmVEplWVBGcDFraWhkV3Q0Vmt5Y3Q4bmsxcGh4QVhlcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080394),
('KIq6etYBZ7I4Pcjfqoh8RPjfcPA2XDNk6ze8h414', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2NmdXlPYWJQTlFaaGhpRG5ERUR0VlFhcXNRUTd2OWJjZ1FBNUpnOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080395),
('kjTg9LruEIH566beYNEERMm8HmOv2eavxb5wuhHA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2hpQTRiNU8zSU5OMjBUcXd2MWNzNXk1cVRUTURLVjliRkQ1RlgzayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080106),
('kjV1rpop1Qbi6thmAQGQpeUCTr2ooKIVqlU9kgci', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnFGbGFEOXdNMDBkc3VJT0d4UjlTZHJEUVRUY0hNZjNmbW41WVpCUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079927),
('KkIEfnD9DPkl2KoBBLPOxLUufp5WA1WEE1lXXvCc', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUFuWDdQeDlsZEZrdEZDeTM5NGQxYzJpUUVWY1ZWMlp6ZDRsTE1lTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080044),
('KLd2gor4uYe4g4WWr12RwgtmO6f6PdfHkYAo3GKG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGo2ZXJnZDVPQnFYbmp6NGpDMkxoV3czUlNONmJqSURTR1JtMVd0MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079790),
('kliGIwOo13Bjk5gvdi8AbueYD73PmPV5FLNVgGqO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielJFQVgwUUJnSU1RcEhrNEhvOHl5cm11aUh0cGhkc25KN09nTXBEQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080031),
('Kpy5Ora2RCKrvtrUThWH1QQlAiwGBmJqlGVAr6yo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2pHZkJZSGtTb3hqMGxvaUF6NVpVM256aEs5azFGRWo3ZUtaakFsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080462),
('kSU2D6cUxADVAz8oKcntE24MjzdgEDMcxqrdkpO9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmxIT2pEYkkyOEZEWWxmY3JRY1hPODBIQzRxbTN5OEpHMXp5NG5PaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080364),
('Kt3T1pvb7AWvw8yHEndMlUnlJYzKXoDbDwbfo1G5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXF1UzNLaGZxbHc4aFdRRktZd1RGMU50clV1VDlpSzIyQVh5UElmeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079847),
('Ku3SAJUSIroZWiI2PltkOy0D2pV7tpost29uRJvn', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWZOSTdjQU5WTDJFZEJRWFg3dDMxMWxZdW0wRmVsRlBtQWRlRmNXdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080172),
('KUDXQit4v3G5yoAwFhf7LqrXPbocMS7ZV8YmiQq8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVkS29ERE4xSlBMUlJ5RFRVUktDeEh2ODEwcFdZT0VDNFpCbkhvYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080421),
('KvjUGliRqGkO2yzO0sYxDhXqu5HNd7zMNiSeggfM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXJFWnhkYUp3d1loek5EV0tadnZ4c2dxT2xTRzRiSVNGSk9iRjJ4NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079874),
('KVpvBATt7EuoA9uzZN1xxzmqK9wqRzWUihvSLUPx', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmo1cWlUQlRXR3BNaDhxQXBzWXcxT1ZVcE14QWVpM3FUYVBkbERGOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080207),
('KWBXXmESpNLpdHWN9xJt5WcDS8jBe74fonjoGv7W', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGpPbXg1SDNleGM1cUhJRkxhdUJjZ2N6Mzc5M3dGNTdPNE5kZEoyaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080417),
('KwYB9kTmzMrMkWKFu9O8BUxZiXuJN6Nq8RdNDRgf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3QwRTRGS09qY2xrM29tWlJ1V2xNV3huSm9nOUVVZmcxRW1VWkNNNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080506),
('kXwSOScaQlXXGZuY5vX8HhEyZnfUDLw9K5iBVl0p', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWkFwVmo0YnFTQlBGUjF5dWZKOTVvR3VXOHBYODFMTFd0NFRxZ0dHcSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovLzE1OS42NS4xMjEuNDQvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670080536),
('kYcJvSBaGYlTC8yJt5pyBuLUEhORuaw82fxyFhGW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSklDUGJqVm92SEE5WlIzVHBucDc3bG1QOWpqbFJJOHV2UU44WFhpYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079850),
('KZVgXXOLTIENw3D70p0BULcluD4JXQyorDCMN7FN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkxnZHBqNjVCR21ISFJJSmVaamZjVFA0eFBkVTRZbGQ0YmpQYzV6ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080490),
('l1vLGqrTumQ2O5hcd7fBN32k291zI2MGQujhCdZN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibW5YQmZMVkVGRmlORkJpMUFZeDJYTElLTFBDVTlPSU15Mzc5M0FzRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080392),
('l7GgPi5vuOnYSOsk6EZLW4KiQN2cbEKXDxdFNLp5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkhwUE82THdlcVNEMnZGbzUyN3YyUnN6Mkh2SFFLRnMyVUswMHhPWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080010),
('L8U35F7Fvfi6qp5Qw9ArxJlfzNtca7ZYxxytMcF8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZks3aWlENFdKUThLY243U2FGY2REQkFuR0FMVXllZUJmMjF4d3dYTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080495),
('lA0OQ1qX13EXAllAYLo9mXmUya0ANiEnkrLWsDY9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1M0UTR2YjI3OUg4VmxFVlJGNlgxZXN0cXBORDBiSlpHVlJnS2NSOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080383),
('lambevGWm8LYefEp4Jac1FPKv6cUUT04updtWCEm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkZ4ZG9mWjh1eGxkNGh6Um9lNG1sRk1qdjNtT1BiNnZsUDBwTUpVUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079819),
('lBexdrutGgFnaeNv5RNUkvizQ51mBhqHZhghDlUf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUY4MXZwRXNEQURRb09qVGFvRGJRd1plZVpTc1dsOFlRS0R4aFhFcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080400),
('LC1ai4GdJFsRAKVyItMlSQvc8WqUHACTCcmpIbUP', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUdjZUtYek9PbmR0UHhuQjEzV29OZ0xjbUF5aWJaUFdRZjlxSHZJNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080424),
('lCoGzslWvFtG5ZVqmwqZxuTxz34if8FJocfelAI4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1VEYmh1dkI1bUJOc0NGbTV2aER2dmtDNkY4VWE1QzNaekVhYnBrNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080485),
('LDmUUIQH2HGocc46fYduxemUlHr6lNeAsHaDf0XY', NULL, '143.110.222.166', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUlRKMDlUSTZwZElMVFN1TEhtZXFXamg2cG0xYzY0MEJmdWtrdWo2OSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670080485),
('LF8mleib4ZZxJNCZ0yNqrwjARaGDvYOGi2hMSyUN', NULL, '141.255.166.2', 'Hello World', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOHZmMTRTZWxCaGhCdnpKV2lteTNWSXVuSTR6Y2ZEWUEzQkJFYjBkZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670083315),
('lH6tKuJOE2oVS8EHvEvSGKDTvldTAzbXfjHdKZ7v', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEJrQlRKZWxoZlBVSm1iNnpZc3E0MTdycjJIbDZTUkY1ZnpMdU8xYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079813),
('LkAJH5sZAZiAPf1KWJjbHRCr51gwkIJBkVDRjESC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFh0QmhLUVNLRllOZlBET3pBdzI0STBZVXZOUmxuZzZVNkpLZDdBcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080157),
('lkBFn8eW2RfXreykLHv4YLmNGg75k2TJK5o0ZccH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGw1OGxDcnlBOWc0czREYnhZM2hLU3lnZkVaTElHQlVXQkNoaHBudiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079985),
('LLmUAcLJWzg47srYhUPQ3dRIZotiyNquB7m3ZKW7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjZKYWt6Mzg4VjMwUmgzckJ3ZnNOczlXS2pEN2pGUjlDT01lYWpxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080389),
('LMf5ibIgLCsOUQpEizFkkGWSH72goCPEqhQZkPUT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk1rM0EwYmYza1BqeWRsOGVxR3ZXZWxub0JCS0NqektrN3A4MUFKUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080130),
('lmZUpeYwfuPQyab2lvPS2vQhiRcYz8gL6cOXASCr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFBZMng2VURtdHJKclFGMUphbWZ4MXBDS0ZBNVZpQmZIZmtNdVZwdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080490),
('Lnl0rvwkvg6FIXpSu1mOpOy6h9HHhAHbeSb5ccmX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlUxaXZ3NFlvNUJVekdMRFpXRkVHdjRUVGpIb2xEQjNGN2twMFNQbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080514),
('LQ0v8s1jG4SVXTuZBGXkGGiojm9QKr6nSTDacu8q', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTllSW03ajBpVmFFZVZvbjZiRm5KdU96d2ZOTEw5YzhXdjhvc1pORyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080170),
('lqQHW7BlNZ7Z7rUQxMWXqEzvSXcKT5XGarUO1tRV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEdwYVNOR0x1eVFNbE5VajRoNG1BUTRiTWx1dGxyOE1QUVpTSjA5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079868),
('LrbcyI6VUlsWmgaUWmzIjlYMZSDAPpgpgtLPicIR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVd0YjdYM1NaOGVaUVFFQTFFbFJZZUNoRjBYU1Z1RFdOZnBLWHdNZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080001),
('lrxXl8NTQ68Ree3C4HE8VsZK4Fnsv1t1U92gsY41', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmJ2Vno5dkFUM1lrc2xOaVdxYTNUdm1KNzBUOFpLOXpIOG9pMk9oZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080160),
('LsjhqwrKIp3MbVk6n250aVMsL6WhffgjrN0I3Gtd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHh2Uk91MWhPMFlOOGpybmpEMUd0eUZjU2xrbWpkY3gyVmtGbkcyaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080481),
('LtKhYwh6FIjuXzpXhCTJBotbuQ5uhpALxBzUBuP1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm10STdTNE9WUTl4T21odW9WZ01qYTFiVThyRnpSSU5PUm9uajVBUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079932),
('lVc1ZyUMbBbR9AA20ZzW5FB3S4TQJNV90M4EAlXK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkFKd2NuNGpDSGRZNGtPcXQ1cmQzM21pemdoUTFWMlRoRHRpdkpJbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079879),
('lyxCtP6iMA6T1H4VSX6YmiRhFRKCGJ7FirDuNaLX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3lkTDN2eEZUekZwUlNsZmFEMUJEeUt4aFlET0ljbE5WeTdRVTFKQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080190),
('lzXDUPdqZKzOLDwR2XrjCAMuUxYMfoD4Pfn9Ly92', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUNNNzNKWk9iemx2bnpnZEJzRFBINkc2MUdRUkhEd2YybHJBYWVkQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080268),
('M4eyPbGbUxUsA21m5Zmm3DbiY052Vw5pvsZMvLGC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2dsVEllRVFFTTRrTHlnWWdTUkFCcGRSdjg4Q1Vhcnl0eGZ4bGxsaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080113),
('M6NqvOS5ZhNXZaalI1tlDNGaAz6FVT80IYsJ29kC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2lNMjVyVWhISTg0QWZXT1VtQTMwZUs4U1F5WnVnTXFadVV2SThpcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080039),
('M9isbaSXTKv8L4gVLl9uiFFnUcI1IfBQ3vEtvWZ7', NULL, '35.237.72.2', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWd3cHp6SGV2bFdvN0drcHZncGNwbExKR3oyVHc0M2hIS1VTYWM0NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9rb3NsdWsuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670086164),
('MBJbZWoOhJMKHstuTBPA3T3JjOWVKfvz3As8DO3c', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTk1dEk4ZmYySVdnZWVjZzZWMFhtbkdsYXdSQWdrNWtoWXd1M2xkYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080150),
('MDwjiozp7X29Uw9BSjdYwMuaP3Xccr3ehfNc2alQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTldTamg2cW5QalZDb1RTVXdaSkRaZ3FVZzdUWlBTSWV4SUp3SUlVNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080192),
('mEkCvRerOPo2XTMSZO1E2x5MPFUVY3m8Unt7vj9c', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlBmbkhBUzZZelk3SmtJMW0wcWRRWTFDMjBZMVY0d2FXUEdZWTc4biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080156),
('MF8hrxVwNfRmWJgZGbyiMHVH91Xj0vlBIkgJ2Q55', NULL, '35.237.72.2', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid21kN3RYbnN3TlA3Q2lTS1h1OTV5ZGowRFdMSkJWek53TVRWTG95dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cua29zbHVrLmNvbS9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082971),
('mFoY3AvuLtypeoEKSnwf7Z6qA6df5XNSoFGQIBfr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2xjTDRhMG5UanZiR1ZKekdmeWc4dk1EM2xnTzRyM0hGZUh4Yll1MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080359),
('MHyUqpHtMICpR1oIUg0cSF0NKmzkMxCZyj47jex7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0dtVFZmM2hiMzJob1VleEtLOG1lOFh3aTFCaTNGM0F3MjFYa2xKTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079911),
('MJru4cazhxp0KBBjJMultmwZwT8ohqECI1TNCOrz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2t3dm0xbWdwYnE0WUxjUG0xOUpRUldGMlpVMjFZQmlLRUNlREYzciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080185),
('MKPI3Aa7p6tELCxJKRFhh3BaUZ2NPATvRSgXHrYg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWxzQ0s2TGgyUnhnbGl0UTZtamVrc1lUNnlZZ1BlcmNUd1JuMEJFRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079972),
('mlJxERQg5dQWsmedOEcPLzDnolWWcSCM3wufQpLf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXBXMkZvRVFtcUFTMmVWYkVJaldmRVV0NUNsd0wxeVdKQTRCSjU2aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079960),
('mlr3sgHorFxoh80VSXH6PlP1U3cnAIApA38w67TJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnNEUjRWV0RJdER1SENLQ0F5dk4waGdOZVJqaEtlNUJ2cjNkcHI0aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080440),
('MmPGUfVgLuMgcLVJ0pIDi4ga2Ruzy91F1oGJ0KVU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0x0cUFWd0NXNTE2ZEg3ODFLNHlCTHdwUUJxMG9KM2ZWSk1WT3l3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079990),
('mNKAVqcbquaOF0kishIPi1S6HeaxmOJozD2soWTN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVh6ZFh0OUpzYkhXRXgwTFB0Nlk2UUJWemZsVmVVU05sT0xJcTA5TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080425),
('mqvs3w9JPiZQIO7OfiBj3DILDW3JXuMu8tk3WsWN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0hOTGw3c2lSYUFlaVVSUWdKTDY5OTE3eTJXb2Q3alpEN2J5VzZJZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079929),
('msmCh1krdhCU8zxIUfagdB6XBLEfzruVSC7cCucY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0tGdDRrazZyd29UT3J3dXpTWWdJdjdNT1pGbk0zZTh4UFNseEdGeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080506),
('mT1WFmtPMj7on7qpYT1vhwU2ptateOloPsbcw9sq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU9sZUd6ODF0SWhOelV4dzRwaXF3MFM1UjJqSUUyaUFxOW5kdHB3aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080103),
('MVaWLj2GVFrGnmI85O986T8cEo51lpkRu4Gafk8O', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTNOa01KUmUxMGVIdWd0REVXc1M4bm1pMlpwUUplVks5bWN4RXRGTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079842),
('Mzd27ElMpA8u4MecEgRRfK2F37xRtqcXwtFn5jgm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFNiTjlaT3JmVHZkSlRUSVlzMDJMWnJ5dzdDeVNaendaVTZCYkFpZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080430),
('n0gC4q664Imh3UF1PO1VXekCerjIlCHdlssuMv7E', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazNXVzRNSXBGRlA4bnZuUEdidFVWNFFHMHNCblZWOXB4RTQ0TG1iTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080336),
('n2KxJr7YYq0XXiiqzSkMRhWrVpC9uPtTfa8Ceziy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVhEOHlicFRWTnhJV2ZZRXhDaEExd2pvM2FCamRqQWJRRDJSTk5SUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080482),
('N6gRtryu1oE5eDadpEPCsidDQGBVUrbDrQDCGXaR', NULL, '34.221.76.127', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRnlHdHpwOXJNbXdJMGxCbUxlTm41TUwwekxYNExEQmxCTkRZWWluQyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxNzoiaHR0cDovL2tvc2x1ay5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082584),
('N96YSmInkw76zaYoJjKJHOp8gnroxHCPNQ0OWJey', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVh4SDVienM4NUFqTXVrQTRUWkxrS1pwbzhlQ21kSlB5NndPVlMzZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079786),
('NBcwithUKhwu5GStZH0QhVR3DPbU7viwVawS5hHK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0xlUml2UXV6eXhxbEFycmVLbUE3MDljOWVuMTg1REtpVjFQVTJQdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080472),
('ND7GrayWsgTrGVxVAYbOts7UUnvEZBAAJbeUNmv4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVBzSmEyVnBJbWNTem5OZllYR2Y2WG53VTBRMFpXaDE5MWZ4a1I4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080418),
('NdFKf7EpZaJY0dw86Uueq56wZ4gnbXUoj2wCPVRo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmZUdm5rRnNpU2FxWHM5cE1Oa0dtOG1hSkZaaGlaOWVteUZ3ZjNGSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080134),
('NdWWXXWoNm8BGMUAUT4g2HQPmXlGz3JhdbgcXl4B', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWNidW5FakhpMXlBa1EycHd6TE44NkIzd2E0aEZlVHJwNmpMcEFvZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080049),
('negdtUwZjSaCV5QT09bs86lwfvOq0Kaa4MAeZ4Z2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlpMUW1KVEZXTzd1aTdkbVFTVGRJaE1XZFNaS0FEQmduU0ZwaFIyeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079926),
('NGHsE3FbdFqJkPKKsBRXe1d0O4CU6oFc9nFkiOrW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDZ4a3NmSnhEeFd4amFyNUhORGdjVDdoRE4wS1ZtOWxLeFByM1c4VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080432),
('NHDFGw5QM0SxMKXyXgM6uhLr6krSY1cTdRv1HxVa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmU1Q0ZNclhGUUQwQ2RtQVBlR2sxVmNVTGhFY1MwMmhHU2ptU3EwNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080181),
('nhiMioldPPWkP5CaQnxQRSKnbFnyrlOQg857ywUD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlhqYU15dGlyS2hSRzM5RDVrcnloczNTcVlkbnpqZmZEM1B0dTk1cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080457),
('niuwt6E00pqo88ZrQmTx3zBLilAfHVrkejOsE7vC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXNCbmJMYjY0WWZzd1hhOU91aWhBQ21zNWd4cm1zYVBsaHRKWE5mdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080019),
('NixEEyHPslfQYLhJA2HfaVHLtsKOFme9PnRFMhRb', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlU2ZXY0YkVjejZ6b1BJUHN5aDZ3SjdRNTA5SFdvQVFSYzZaMkRhcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080396),
('nKs2i7JSkAAg0RqadZtHUg3ziP46sIe0mtHHm5LT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEF2RVhtZUxiMWd0elJQa0RFYXIwQk1tVXd1dTVjUG1vZ2FvMlZ2eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080432),
('NLVHJCflPyhBGHFW4p1sYQARGY4lwc0PreXn9syY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNYeWwyaXh2NHR0VTFmNjlocVljdGdKa0g0MU5zbkR2VWJDcU0ySyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080007),
('Nna0JMD1BpN35WvRBPyWi4x1U861AfrhnkFKt5J9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUElRTks3V1Q2TnFJMktNOXExb0hkYWdZN2kzTFJZV2E5cnRmWUZpYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079935),
('nniBoBDfOQBXvzZ9h5uVK8vFLhIjo3fOPen7Edrl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzJueHgzeFR0Q3d5cGdqUkFhSmtrVG1naHdBRkhrcERHaUpHbk9tSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080252),
('NOQtFPpiI6rgmwNhmi2kI6Cn8trwHOSeINVR6piY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXdGN2E2TG94WHgxWDgybUVxSERxdjVxWkFCRDRneVRHdnNhaXhQRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080064),
('noxMfzO7xjDpldIs3Ak6ZzEaBIwZOw1hctl0MunC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2VxVzVDNGFES1FYTmY2WVhLcnM5S014Tk9kMGx5blhXVmYwY09ZTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080008),
('NppLe8nDMuTZgJyEZHzOarBXRfSeAXACCQ12ZGR1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG83MVdtNzdweDBPY2xvMkpsd29TM0FqaWtRZ2xyMXdCTkpYZzFEcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079895),
('Nqx3l0HJPMDaWdZGttMyMcWgubLW5MJ0uWnxCNi8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0J3TW9EbDVEelptRGVEdk13dmxKZWlHS2szMmdmazd5dWEybmNjUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080512),
('nV3EqoBPXjvYKt86BebYzj7E4dhG0M1W5L9icFoh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUJEcVp1dzAxT0UzbU13Zm9ZWHRnUDVlTXNsVkQyM01XaDlnblU2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080376),
('NVFUVpFIyEDkIc9aSGLhKtmcfEkmDc8uFolFEChM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVp1UkZPaVJlR0dBTGFBTmRLdXM2VTdsdFREM0ZNbDVJaW13dVFFRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079769),
('nVti1gLri33XteGTclRRbQ6pOqpynjfOvgN4ZVzQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXlWYXN0bktPYTdjR25Wb3lIR282SmEweFRLazM4R0V3T3ptZ2RXWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080448),
('Nwtqgd4e90qcudNLiMoXwrQX7A237QC9CQ9D6saF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmdsSkxHeEY4SkhxMlJjelVhY3lySEZDQmlzcmo4NjRxZ1Jtc3IxNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080084),
('NWvnzJ7GFZ1pYMpwsj1zd8OSdyVi9Bk8wr6PUj0a', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFJBbXo5ZTlKYlJwcXBWYlJkYlVtMXkxUjVsYk9vUVBoSXVKOGZ1RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080445),
('nXy3D41eyJoNTrpomLSW6S77I7VeQ3yfyjoVU06k', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFpqZHB2eGx0TXVRTG1xbFN1Y0U2VnRBYWF6dFMwNkVKYm9Hc3A4MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079840),
('nyHIAx6oywjWsjFWd9q7qKRqC2jRqY8JCWYOpRiL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWtScURzdlRTYkRBM29vem1mNjdtSnlENm1tZXRYWHlPU0RlVkI3cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080046),
('O0hKzms5WcwWjOO2K0ChGiLBmfABNZM1j02C8IwF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickw2NmtoTjdka2ZsV25BVllVdXF1UEpPaEtKY2x4Skh4NmFsbGJ4YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080020),
('o3om3ARUCuPZ4iTZ4VlJ0dBhlSuMs7PcJ5p6Hkid', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEp6MnkwbUR2alVQSUNETmZPaG54cExuYkQxcVFza1pDVzB6V3Q5UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080168),
('o5e9qTirLKEoDOVFR2AZqLDbf8fuZb16vlB7A1El', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGJZZVhpcUpLTkxCdlRiU1ROSnl0bGc4UENDdFZVeElsQ3ZNN1J4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079938),
('O69Jvsq4eFEuAaDyD29DsXhC0AjKiw9UcE7MEowQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN09TNzNUbDVGeUFiTTdLN1pzbndaM2dlQ1I0RzAzRm5LczlObWlsQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080146),
('O7RSXQP4fKn1wg5HH9F6AgAr6GxIghpsKtACyb3C', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVNtRElvdUxqaEZ5YVJKbkdXdHlsVjhTdndMQXRoaVdtZ3pFVVFlYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080512),
('o8zxMCxkFyhu99OqkbFbzBTKyXlervj3H9gErDr2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVFVbkFVRHNlVFppUURkY2ZITnhBTUVVMEZ0YVBsWld6RXJ3eXlKUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080075),
('O9dKXSY0olPknih7Dify8nhvsR4NYCv88TphjvC1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVJlOGhBY3d4ZTFUQndYbjdEUmRxVDAzN1JhbzBNOE1UaThxcDI0aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080124);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OAClKyZ1ZLM8sKkyt9w2XVXvurVfhb07OmAvGzRD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1pGODhhbjlQZThTQ3B6UnFFUHdoWFZHaG5oWE5wTWV0YlJqZnBwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079839),
('oalpOfn3yIK4l775hGwdv0n9ucirYCGSqRvmGEMJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTFCRlRkTk9rWmlPSGVGenhsandYWDVCN3dhcWZlaU1PTDZ1eVJxNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080487),
('oAYPUJxEq15XUEZOC9j9CdsZWP3xGwnhb90qLdhU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXBjcFlVbnJiWFJvQ1ZrM0E1VHBvREFEUkhuSlVmSU1yS1NzUVhydCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080384),
('OBCXRrx1E5wn8KwJmzmU9IcUP46fj27p3kZQ2PXd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic05WMDJSOGRra0hSRGlSUFFLT1BCS3QyMmtSNGMzRGpvRlFraUJKMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079865),
('oCliiyEicLodXjQQ8K8IqFE5hqHIXfyYe3V0pkkA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUttWlljRERWR2FkcmxBVkk3eVlGMXNlWWh4V1U0cUR3d0hBQThMUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079774),
('OddIQNFu4KJIB3ZEAN6hlGByrQtEs2qUEwWtMLj9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0xZZFBvTG1GQnNHUloyOUs4ZFFBaDBsRzFuNmN5WUxENGY0QXZ1NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079809),
('oJPREiHN9p1zuZ0VbEWJGc6qvXUpwlw18CMd80Ru', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDR1bG90akgwSEIxSnVXZzB6V1NJODh1V2ZDa0pCWExBNVdrRzlraCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080482),
('Ok2sPLf5JkNfUBAZrYYsrONWdhITSmdc26ZezgtN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFYyZm1zMUZ2c1l1T3JzSHdRUnlWRWIwaDRQOHNITVdiOHdqQ085YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080205),
('oKR0ZDwndzbZ8ETQgHCWcufrbVB9LduSNGsyVSH5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEZMdWlNQlQyM0tTN0xBMThKUGMycnpVaGsxR0pqVW1GT1JZcDE0QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080143),
('OlwHR6tA5f9kmwIlWlAoGDQf0gYEehfKLhH3wc1y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHdUUWEwUjBZZDlpRHVWdHNGQ1RKV3A0M2FDeFRjczVNNEFYUmoyeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080306),
('oLzUhbI8YeyOcztwMqJMevj7tT0KuJpUfMiY1Uo7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTN4WEVKdW83WFNpVVdleGNqTXVET0tObzA5SFludXhNQTVJc2ZocCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080175),
('onpNSzJjWeS8uVcfEF1hf2tvuTUKeXu6agm9YzHw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkdCY21zSWF2eUU0NzlORXl4Nnphdk50endVNHRndjRoU3ljZXNMVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080121),
('oorB1xJN7jRBBhaqQBilZlBJPlVOM9kb4dGOgsDR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjVOWnlqQ2w2dEtmMDIwcmxqUUVnV1VaUHhoc0VxNU40NGFQWXdYQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080169),
('oqfTD3zHfFqjGo8pKZh2f58aII5UlYp3nbGpnLS1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHdtS2xPQXhnbGlXdzFWdUJGNGtNUGgxQ1M4MUtpc3JVMlRyV2YwdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080423),
('oQjqg3rYgMDkBNuVljIUL9lLIezXNYGbmMZCzUgO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzZGVjUzbDJhR0VZVkl1MmhaV0E5ZW9RNlJQajFBaXVDUGx0SlhKMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079796),
('OrKBZqxojetEuLeEckmswYXJNXVteCWAanNhCohT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGpaeTRKRFRTTjQ3dHlwZHNxMkZiS01RUUR1Z0ZOTG11TU9PQVVQcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079813),
('oSEImk9LoJwvChV80yM0pcXAcAi6p412lQ3whBHn', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicktwOFVCdm8ySksxQVhXWE9uQVp6QWN1TVBaTWVNUjkzRUpmNmVvRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080190),
('osRw5Wb9QtlEXZyyvhSe5dKKTAVIYFPjxECZhNkH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE5GNEJUOWxYcDd1dklPY2ZlY0o5dXNSV3RSSWNOekhEaWVZSEd6NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080165),
('OT7LWBClnkFq0O3qNAXmydhUA7Ctb7SW1S2SHoOj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVE12amllU0lVdWNtdGdldzF6U1cxMkR5STd5QnAyakRxT0I0akhWQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079773),
('owKm8Ke1CPDPcQlCXwc9xgtkhsERUUMsfmLe3aGi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUNrQ0xCeXVYZ1JGN1d6RElKQklmSzFSSnYyVkpJRFhSbXZiZzlpZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079853),
('OXJHUIIG2g1GNQNEqb55CM5hDoBPvMRBayzW18KB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWl2WTZmUnp5amp1dU1IejAyUGlzYlNOTkI2cTZVOWIwWXRBR1NDNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080078),
('oxT0mRqScfEWX71fn5D6WN1B40ohpEosNPFc6AQ4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWFUemRaRUY5TkZ1aDlMTDVtbzNUZng4bHlLeTQxWE5iaVFxOHR1RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080444),
('OyGMaQnDVXAnXiyusvdaZxrRUhXomjbTuyj5ej3H', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzNGcWhXQTQydWZUMmlwZ3U4cDVtVGIxcXBxRzB6SEpjZWRRVWJ2RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080502),
('oYWRlRVo2qfzCzmBNVHUke59RgEBV6IolToLpJms', NULL, '5.189.133.199', 'Mozilla/5.0 (Macintosh;                 Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML,                 like Gecko) Chrome/39.0.2171.95 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2FUTUYyWXZLc0RxMmRubVhOaFVMN1pWZGUwVXF0NVNsRmhSYTRQdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670084169),
('OZgwByLegfL9R9bekxdethsSXOCjjOMp4SQ2oSHD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWhBanFZYnpyUjJIbGNaeGl0Zm14RUdreGpkTGtlQ1lEdXlicGk0OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079785),
('oZuMqHYzO3THU1z9ONgevNJ3TO4FvQYkV0ZjDoBi', NULL, '192.99.62.110', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2xKMXlRaU1WU2ZRSHAzOFdQSGQyMTN2eUpFZkdpS3ZaakU1dEJ3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93cm9jbGF3LmlvL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079895),
('p2qXCFbmcr5IWYaO0bn6ZmMsdiITOHoPbrOIgwTC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1BONlNUWFZOYzlLNzEzdUpNVGtUTnplUGJ2dVJFYVd4Szg1WmJ2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079849),
('P42tvhye3naOIpdDqZeznKYfmW7ic0h1otQZjGZW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk9vblYwNkRjMUJYUXM0SEJsT0lnWGo1TWIwcXczbE9qNDFQbzBhdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080055),
('P8nsFxZqleZdttIPg5N8UEMCyOTZapekcwrdPFG5', NULL, '57.128.37.136', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR0gyT0F6V3lreXl6YzlIUjhXcUpkb1c3N0dGOEg2WE5iVWx1eTlZTyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL21lbW9oaS5mciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vbWVtb2hpLmZyL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670085495),
('PA2ofmQUGGIubXD1zx5HVnbnzjTA9r69RvEY5xHH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEJqcW9sbEFpSkpmN1RMeE9rcXVCVFRSZ0J3c2xIN2N5aTRHZ1F6aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079912),
('Pa5IZOh5v8x0eZUjw7T8qdkGxhYx1O5wGEMIRhUP', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlFweDcyQTBZOG9OUzJ1U01uYTJWUzJNa3dDREdFajRmWVpQVHRKRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079885),
('pAhLS2QA0MQzTaWUj7hGYetm6KZt4aN3c8SmiBVs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUM4bnNtakxkSW53ZlFJbU1nY2JvcHdOQ3YydUxUU013QnJsRDZaMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079861),
('PAm4HRUFB3ysu0tjfnvCmPOMZIj6Lgm6AWyvYFM7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZERBV3JkYlV5YmNKOHJ6V2haUDZlWmE0M2hiUWZFQlNKRXIydTBOdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079836),
('Pc2mM3fqZFFSRBgDn6HWQdhKS7zhW0QF11optTy9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzh2a1U3T2Znc3ZYd1VuVGJCZXJlRFhuYzh0UHhsMnNTWGcxRmtVYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079772),
('PdcNaX0jfhoFR6P4FCKOb8R9AgQ0amAh0sU61UQ2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHB2SEZKU1R5Vkx2dUFjRUR6enFvcG1JNmh4STV3aWh6ZHBuSmhnUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080439),
('PdM2uFD635JsoiCRR69vLHnSPjjrCMcKa0PMeMPZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1pjZUppMlVpSFVOekUwVEVFRWZxeGZNbG1aeW1yakR6QzFvOFR0cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080454),
('PDTQPUip4C6xVh1i2KmraYQFQBVNnathJtEusmcU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXJscnZkS3JqMHNFcWJCUjQwMWVSeFcwYUNsWXNaNkdESU5STlM1TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079848),
('pfA68h6KxbGFr6tGeN2FmDgWTwys15Addj7BEphq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWFJVW10SmNNV3l0SFpaREFTOE9wNURyMjFhWTlFOFI1Q1g0T3pvVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080389),
('PhRnZb1j1YYBWr5BngEr8k2kdddR1F8DNM3PCGfO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWVrVFloWUM1MG9GdUN2UTNPeWNGWEpBdVdGOWtsVGZ2bXFNVUtaTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079932),
('pj3Lna6awtDwKQxC09JaEPZD1VrwTUmg6Ga858Ww', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDQ1SHlMTHFnb2xOS0pxd2hrV0JuWm1aS2RZUE5Vc1IzeTlIa0FmNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080107),
('PKNdGPQVjTUWjNFjEcBQFi73LpnTSQTAWhT6pn6z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQloyb2FNb0x3RkpqVWZTNGVSekhSREZMQUVrSEFwRWJDSGxiblVpeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079975),
('PLTML5dmfo1DuqhE2xBgN72iI8CEkZaXH1aPNzOz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldkU3BoWUxUdktpczJCYzhMd25Xc2lYSTRjeVpaTEplYU5oY2t5OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079815),
('Pm7tAW2bi7OHIbyjD4nS7nMslGbHd8srMLf8HMWX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU81UWlmcGhkQjZPOGkzNzFIUGdTZEcxbFZlMnlSOXd6Uzh3MG5OZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080172),
('PmBDoMy3rZFuCtkKshOCm5JitLgebdhUwobfLevX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFkyRE5OU1NhOGpUcTdYUkRMdERwa0xEdHp1MG84Q1dBSFBGUTZJRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080405),
('PMVrjy5YKBgUQ2TbDbF3qpsrbZC2HzANeYiw2k7H', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0hEUnRUZ2YwaFM3aE5lOU40b1JGYU5UeDM3enY5NWtBdVhGSlhDUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080177),
('PNmvYLG1EJXsTCRzTDgvCteLTBQQPrijaNRgiYqT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEVQSkxqNHN5a1FxOVBSNnVmbFNiVFM4Tk42UXNzVDRKTGtmSm9RVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080368),
('POjoCQl8BLGb7eMakwf3i38QrPEtdFPH8ojcVbOQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGhqNnVWbnRlcEdGZmIzaWpac21Jb2V1aVI4akd5RFo1ekRPS0wzNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079904),
('pQvkftcfo0HcB4nFSIoDjSZHnBJzy3C7XnsiltyL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDEybVgxdUU2TEd3Mnd1UE4zY3RwbWlYdkZZcDlrYlNVRjBNNUFUayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080037),
('pteklPXNRFTSMsy0tkh5e9EWEuAQoBeKKfipCWSL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW9GRko1d2wydzM1SWIzRVRnWTl6WEhMT0FoblFSdFEwcHpwcTdLQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079845),
('PuMgSdiP1gIOIwtpWF98YAsGibdX571vH6W3QoDC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienVXZkFadG5tbklNbW9heUhyNjA5TklYVExMenFJd3AycU04SW9DaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079818),
('pwVD0iYKYbtbdqdVtw1ieqBv2M3WnjSamjVDcw6D', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic20zSU00NGptRUtaVWZrbmg1UWJiRnN0SHd2eWNqRldqdDZwajZVRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080403),
('pX05ZxkbE4KS1rLRlJ9lD5OOEQN58iy2PQyScIsJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXlUN1dQaXpKS3BDY1pBbDY0SjhyZGVISDhpUWt0MkRYS0l2NDF0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079967),
('pXr5mBIlMEU1PIaW7rD3FDh4s1NclWUO7tKv71do', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU9kWVJ4czk3TFh0cVhsZGNsZXZBQ01XU0hYUlBKWG5La0puQW52UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080083),
('PZRed7gDJegPQWx7Pjoeodl2o6g3eddziLVWi06a', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmlETmlqUUV6OGVVQnRUUjlGczM1TVVWQmtGSDFWZnV0ZElXT0xhQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079849),
('PzsFlGvSfC3kEt90yqfC8gSlOf4H0cYRgExEEV3o', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEFCNjlRVHF3bHZ1QzlOU0h0MDhTQjg0UmNxZ2hFZW1vbjUxQTBLRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080505),
('q3Vlr1SVSYbM4UOMgYgAdD1L9YcIXSWzIlr4dmJJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzhaa3drcndpcUdtYXBBck9iSHg2TXpyeEZ3NFVkUVRhajJyOGp1TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080158),
('Q4WLRSKO6BIupSwHKlnLR9jIXAiBZF8IJl4vRuZY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXBNVmo5U2I2R3Z5d0RTMzBMRWZyTndjRkxuSTliQkNXcGVwVVF3dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080369),
('q7gCBT6NCxDJyMKZCjd363J2Pe9BeC7VoMlCoG0l', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWJsS0lVVnZYVnAwZjBocm85UHdoMHFEYVJIbDBXQTV1Q0tJNG1BQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079941),
('Q9Z2dTkCtbltGNcw3vkFPLzCZDKeOY3UpVRYvOqE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWdZdUlnbHpDcmxrR1FWcVVGNWdtWEdLVk5ERFI3Wmp0TUxyYzRjQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079788),
('qbCk73MtjShtIFveH4nSyzrJ5QzRRBQwlsUl1G6r', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkg4aDUxSTEwVUVhTGZ5d3V5b0dURnB0eW9QU1JlaDJvbmR5VFhJNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080438),
('QBNiLiFlulRRCIfQbmIbfyd3LwzrDEycwhtWqpQz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieU5xUmVjUHB1OFY4MGhqc3BVd3pFUFpvMnZZM0hPdTdWSXZxVUJnbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080217),
('Qc7wD4uNjcMTEiA0KLCTBJmhtwxDWdDmSeK69JCf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVdQRXRDRGswU2o1dTBsMUNHWmlpUTNFbU04TnhERWd6eUVWekRvdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079808),
('qCDCUuNqzKE9khrDevxXXSL2X9MmV3NCicSQMAXJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid25MOThhdHdUUHMzQldITjBMQjhqaWlzc1BVRzVtUktrZ1NERW5YYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080101),
('qD9oGUK9NYC28lVTQBkYfrfAVugQI7dVH9FNa8er', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk1BNm9mUjhhNThva0FWZHJmdHZvMUFBcDBHT2twWEtmSEJ1S2k3SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080529),
('qFeyBytlG4xB9iSDojnDEYiJteK07prVrOaw1yNH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam1YaHFvdGdqd0ZrMTIweWxrSWs3VElaR2w0aTRmQThSZGJxeXRUdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080097),
('QgvhtZEtWSxMruLgg4r7nzmaB7cmHIDQuR9VCCEC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVlJVUpWblZ4b1VYR3NUY0xsREdmeENNY1dZVndhUlh1NDlVeG5FeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080476),
('qH0KLoa46RBFOTvlUwoGre0TJLWl06JytB2dklCW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2I2WnRWM1lzbEVwQ2dOcENGRExTZjhaeG5Sc1VocHNla1pqeG1jSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080488),
('QIEB3PoBUw0DGt4tZtzqd70uAJqAcYS1uFFzefrw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2FzZWc0REJMZ2dXZmJadnhkaFN0c3A0N0JpR3N5S2NONDRXZGtXNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080093),
('QIEe7BSQlmqlgGxMRnYOl7NGc2CroxUoEqnsVtsH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzVCYkpBRlk0eERpMGNNdnlpY3ZzcW5Ob2lPNHZueTJSbzNDNFhlbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079799),
('qjR0GKZGgRPd3QLKGOnaY4WQ02JbdoIqFJtQMtQD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHJUU0Naa1JvRXJrMEs1WmRLcGtLVGx1QkdUYlJFVUZWd0czcURJcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080509),
('qKujJfHPBg3PZJOU4c2zbpTnN2tde2gcsLtkFzY3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3I3bEd1RkhkS3hNY0JTYTBwVk5xTzJUWEdwUFdJejdFSzQ2a2xkUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079939),
('QL55nRkKRphpNoRwzMaHCmeQffdCDjdOt789wExg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlZWZUdxQXZNMkhwMVF3OFNLWWdwWGt2bllsUkMwdEs0R09WZXN0UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079994),
('qm8g0ZtkhPQAfKFrdYTinRqPG00vYpezwrPLADCq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUZnc3JyUU1oSlRQV1lIdGxoMHljN01OcVFic0VLSUlrWEc3WGlGbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080066),
('QNYtQ4RpYsBOXUMm8qJL7AlxndHD7xORgAnEOpbM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHJSaVVVWDVpN0lhZHlVTkV0MzhtS0gyNUxUY3Nqa3NJMHU2TlAzbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080024),
('qOkCcWzX9r4MO5lmBIGn1FPzyXMBa0v6XhLrsbXw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU5XVHZiaUgxYjNubkljMm9TUU5SV1BuMXRmQmVYeEw5NGNsV1JDNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080244),
('QP5iAJ966GhiF4rl1BQQxuH9JFDfEs2xRbrF4BK6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHdWWDFva25PR24ycEZ0aEpsU0xBNEtTRlY5eVdJbW9pZkJ6a3JZdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080144),
('qQXyyoA3ejNXhvjXTo1221Yzn3LyzkEkOUgkw6QV', NULL, '192.99.62.110', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2309.372 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRW1HeGdwNTFRN2FFS3BxQXV4T0pCamFjS0o0RkRkdzdLOVFBRzVRYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly93cm9jbGF3LmlvL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079895),
('qR5T8XZrookFSX1HmKRYvm707Nn0TJDSFfXCjzcf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1AwVENxeGtjTGN1ZTY2V0N4VkVQME9EQnJiVUhzQVBsMG9sWnpDSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080081),
('QSReF0Dh0tWOyHbqkO7JlMUpg2Xnr7WnDAtou8Hf', NULL, '141.255.166.2', 'Hello World', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUnhqZ2NteGEzajVOZ1FTU25wcmxzQnpqMXg2THBQRklvS2FSZTlWQyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovLzE1OS42NS4xMjEuNDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670084088),
('qsvlV4VKTqwpgn9bWM4IRg1HojFcYG4b5rs8EBS6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVZ5YU5XV1NIUDFNRnZJRE9tVnFQd1MyTUFwZGZ3YnF5YnM5aXlSZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080140),
('qtrIYPCQtqcb0wInOAcHW7isv40legu5YH7WzNoB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUZ1ejRNRVFmcW9WZUZTMXVxUXYwYTJnQ0JNN1d1Umsybm51ZWFDQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080087),
('QwL3TduR2CWSvp4CGj68lNr5Hiao8v3ZNuEBEsLK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlo2MG5IS1pTdTJ1SjEzaGpuTzFWc3FLYlNGS21YSWlpVzV5OHhPNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080038),
('QyITdltCjyXopZvhiapDdAtXKVuoFTpP3vrafjUE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1YwMDQ4SUVuMlpxbE9qajVaUjY0Zzk2aFhjYWlBbE5OcktMVzE2QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080104),
('qzwwreEGCcw9rBlHi9in3LDSRJp0MEL6QPbw2YJi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlg5dnduU3BsSWZSTUloYlc3SG02OVdqenlOTmFaSzUwaWJPYlhURSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080013),
('QzYsiIcnqZaDotSV6pz8pKtCPEYUYAS1uTGluvkk', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXhWM0xzVDdWYlhUNGFXU1QxV1V1SlhqNnBGOEhYTDdyeE91RURkMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079987),
('r9UJcxQq7KdnFsIkdPjNSFS3irCAXsJIhkFHBTbt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ25UVjRtV3ZKVTlIQ1pPczkwbzhmcEtmUXhMMm5DZmZpcWI2VTBJWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080370),
('raTsiSYptg2mE2oFQEdQRbw2YgulxRvuocNPlHt5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVVHdDZoSndnTWJvQzJrbmsyVndFcVhkdG5wV1drZnBsZHVsUzhsUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080433),
('RgaJZutrxeFinWGcK6d9uAwtwQLn3NMfwyoZu3s0', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWt2NGhraFBuV3ZJaXRUaWxKM3M5Sm5RWFVmaHJWM2VGcFNOME1zTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079983),
('RgFD9kyJzb8fxAs2nGBisIT6VzCVsj2L63tBNUWq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMERETTBwUEpjRzlCQ0VJaUxzM2hIQ2V4NlpISHBKbXhMTHNnbUt6YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080435),
('RHxq9vLKMikQjfvZlXZ4TprHMenTaoS2NFriLAID', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjFYOHNqM3JJbE9hQVZYYmloNEg2d1l2RlZoZkZYdjZJb1BUeWF3aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080072),
('rj2nOQahZaMCouMOEKw4gyjsLErjEJHThMLLbCr2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDVKb1lleUh3TTJIbWZuWVBxbzNOeTJ6RUM4Nmk0V0dlUVVTOG5WQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080203),
('rNOS0Htd603lGoxWplTMlAQDzrQHjln3kDCIRnEX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmJ5aEk2MnR2aDBYZTJsS3F2RnhmcVMydlpac2NuWGcxS2hBMFd6diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079906),
('rqQzlVd0amDzDggDJWE0a4BPkzVOTLY3ZzNwceBo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1lONHJpWGZrczlwRTZIQzhaUFREZm5kdWtkYnlXUW9neWMyTUxNViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080025),
('rQtNOJaClnm5aEuKadFVYIvPardytS9RemQhTagH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3V6Y2pWc0w0dTlKUzFYZ3h5dkQyb0R5QjJzbzA4OWV2cTRCODRJayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080363),
('RTelY9uG5uWUxSP6JhV0S1KVaOTKB1i1i6wxt7cB', NULL, '5.189.133.199', 'Mozilla/5.0 (Macintosh;                 Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML,                 like Gecko) Chrome/39.0.2171.95 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR25zSVFlSUhDUFdLVDdXSlo3TlllODN1WWhnR2M2aFpYa204UWlBayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670084168),
('rudu1TxpY5veswYkOWrkgzy9C2gZmMVjeK67pPnt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3BIMnJsd3dJQzlybHpCTFBHbVQxY0FJUHN3UktEakhpNVd1UnoyUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080236),
('rUkwIMnoHBx63BqEYXGAsPPQA0FYVCptWuhd0gIG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1dBeHNRWlBUcHRTT21RSGRESjdZdXVUaTd1WHgyaHFHbDBSUzJqQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080030),
('RVHTpsCgcB1AbL9Wtf2eR8GEMjcxMrKEMOpZI3yA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNuVlRYTFdmVjlJT1ZuTHpwOGtWSmRQd3IwMVJIMkpoOWlaaWhhNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079971),
('RwcPO9UMEYBmXJoycSLckLLYnk0KKIQDMpwRqhwA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGw4MDdyMVk2V3haeUhmQUZUc2d1VE10MjBIUkR3d0dCNnRoSGVsMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079826),
('rXFidTRHmfBCzYqjWnHjek7QaykXjMagihQxPR0s', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFBITFdiVjJXWjl5d01TVmthWGUwaUhxelk1RXRtdG5jRWFtbU9rbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080415),
('rYacju5873oZvwEw2yZHXrJZsdtmAw4yQomwfNaO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXU4Sm1hdUNuYXU5NlhXRTM1RmpkRURJUDY2U1NOcnR0OFhYOVpUdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079955),
('rZ7J8yISH6fXygkDc5lDgI65vfaV5TVCcUaDQa2d', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGwwaWg4aTc4VE1ZRnZFQzV0d0JYcGFCV1FSVU1PcTlRUGZBMklPeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079792);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('s1sWrerIfkqB5nn1IkxxGCjJVjkqJEpsVT1YKDkh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblNacmVza3hhUVhBZlFxN09vZWVTdFZDWXZKQ2lUSDdGOG1sN2lFSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080521),
('S3b8MpE5ctGZKYIRS7SeWt7qIQKygFT9w8iz1sON', NULL, '34.221.76.127', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWFVHVDFnaVdBUW5WSkFVNUJFWGFkMDExbGFERXZxTGZVU0Vhb2tTRyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL21lbW9oaS5mciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE2OiJodHRwOi8vbWVtb2hpLmZyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670082133),
('sAhGvhcC61m4AeEzrlOyWfdlYzj0KcjZDvlEAmMj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGF0YXc0eGt5eWxMZlVHcHF5MzdHcERLMkh3RW9IQ1BsbEQxbm5wQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080215),
('SaWw6NZbf1FIsLI5tyurGAeMkIvWECEtpb3yDNsF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlRjc1pXeGNxV1lvMVY0cEhZYkQ0TGtaUXNRU0F5TXV3ZGc3aXVIVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080500),
('SBjaqwqks5sJLIKeSdEuR0e7RE0iAKvtGtcOa2PD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXQ1OGZiT2Zha2Fic2V6c2FBWDZFZmdUN3dzc2pNd1hKZU1sNk8zcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079953),
('SC4tLZc9oIV1rA5OIkpLS4VaUx9M3BDKyQOpSsD8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEhTZWg1UzlSS0JObjNnZlBZdnRWTkR6YUZZaEROaTgzZ0tuU3drWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079961),
('SCaN1dj3dCkGZVwU1QFawoQTSTiaxkgMa2tLaM5b', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmI1Vk9OM0FORlV3T3dxeldCekNHbjd5Wm5JUlhUczh6UG1IdkhmQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079966),
('scDuBdXODhvhfWiHxwfi4FGxPviaLMhU2pK8EdHb', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2hJUVgzZGcyWXpPTmhLdDF0R0NVSG1udEFaTEF0RXdib3pRTGNMaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080530),
('SCne6mo7jdsJc0cEcEY0JyFaAs7ZeioRB8DAFphC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDZiZ3E1b04zakxQY3hwdjl3Z2RuRmQ1SGVCbmNjSHRHRG93NTZRQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080360),
('ScroMFd5RvtyWjhMp38rAhZKO86pj4Z0Tq74WDbA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1loZDJORktOdUhaMlRlVlY4UUpmSzJpNGZqUlRGSFh3M3Rlc3ZlTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080486),
('sJhw8DtZApvxoJiTYrEFqsCFq2AeurMSsq38Ie01', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFZleTF1TjIwNkhERkN1ZW9GNUkwUnV4ZzhLeThYanYwOXJZUDhWRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079978),
('SJOjpyea1CdiNRPIYzQls57bjktAmejqt9kK6X9d', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakpSUzZKR1BRcm5yRGh4aUYzTFJsRkFMRGc5Ynl3bVhMblJVMXpzdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080110),
('SkCYAax6gLTLTHD86Dokv0fk53Rde5b9qb4XUoYZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzlhaDM0bU11Vm0zeGdLbDlTTkc5Z1F5TGpGWWg4TTZ2bGJNeE5IZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079954),
('SlJm2oR6ADP6BUT50WUNTvGVREOz1tt8uCYIB6H2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUlybUN1emdoTFJzM0RKY29wTHlNQUpadUxIRDZHSWgzWlVyMUhxRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080119),
('SN6MAjfdPEp8FplcGXBhhVghKD4JbkN2gUVR3pF3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXhLbkhvS0RsSHBVRHRob2dOSmIyazUwQzRNS2Z5Y2pDUkNvVGdLQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079916),
('sNn0jaC6IXrgtd6TPxheIjpYt6PNY5L2Cez4kEf8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2dYOEF4QWs4ek5ic1lwTHpzMkszaWI4VTdWVnpxUGhzRUIwYnVmTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079888),
('sPLMNvREJuzo1qZV52cz2GJvxZxxGUL00oHMqjDP', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXFlMHhrTzFQZDBqN1I4a2xsbUx5MThBUlRSRnZsWExGY1NwTURGcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080234),
('SRG5y5FTPr5bAYldkfJGghSoEfdU9vMMcFB0gKOc', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2Q3a0lKaHFHZWV0TW9pb09CTjRKRDJ6Zmk5VDRuczJsQ1lrYVJ3eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080048),
('SSkR6F4rROOXqx48cKBTfEtLDfbcNsE8fHegVgbh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGJiRnN4cXRxdlBEdEtZNDZFMm15RWMwdXdrY1gxSzlMcDAwNDFsOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079890),
('sud9cvHwwbr8zfhOjhlLovw2lkQQXlnihOe0gUDf', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGlwUldCRTZkUkN1VjRKNFhrZktOOHRqM1hyQklXT3RVaGNlQ1RWdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080520),
('SURKvUfP1Jg0GOSR1xIS9w2Ecw9zHAEvmS2cuvAK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1AxM2lqMjNBY0lwNExQa3huck1WelFaYjVKY0JTcThWUXBIQmhFdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080128),
('SWdQM7DYVKmnVzf0ulUG2jkEsBgcDrxdwoDg62FL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW9TUk44NHdEaFRwSVd5WFdrS1NFS1llZ0k3WnZvTjRTYUUzaVpLRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080516),
('swh0ey3F7fqu3GzLf5K6FcnqNUUL3JfNaenV0d0Y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDNMQnlSNlEyc1ZMRVhnb3g1cXF4R1FYTmI1Z0d5NFhLaGhwZDdwTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079875),
('SxpfH0x15dXvD3Elax6ei8HJf2UxGr3E0LKDWjfr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmhqVzBDRkhqbEdTZldXWm5sZmtmYmRCZ1BwMHR4VGRndUV6TTJRNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079801),
('syjoM7Wj5rgeIAl2pP7mb6b8zdFEl3frsLifq3bh', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUViVU5kTnZ0Mk5XbDQ5Q0tEQzQxVVBxRnI5WUlVbWtzV2NPNUo1WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080524),
('sYUMtEiLVTxivODuuDbIPZBVlGL5868hBDcR9pnQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG5ZRXlmZUFYMDBFYWx6bUR5VUNzMFFOeXNVRWZmcFRrdUlKN0tsZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079988),
('t0TQ6xbUkyb98RKdiSKXTrk2nkCyqLMGXu4nx2AY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlVqSlN3VjZpaEhucTcwVG9BYmxGMzQxbWxMOWVKVmhWd2lXVDkyUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080047),
('T0zoLoc48Urbw3Z15ZJ7QwCJUabCrAOphy2lQ1uj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjhtZkJtOU80UXFtN0UzRk91OU1OVHpTb0NrdFZHVXpHNEpVT0I5OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080533),
('T4qhcEQlVfdlk82kxuQTGDSSrUgAO0tniZWRoswb', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmFBQ0pzbUZSNFRoY2NOZzdlRkJOb2dFVFNUNEpOYzE3MHVaTUloNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080388),
('T51k3RsQLcQRYH1lAmK50owQsa8UAOvquseje7m9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDE2UlVwdEx0eDFvM1lmWU9sQVNkRDJoZXJxdVF6MUNrcUFIQjNIcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080154),
('T8zBpAoz1apKNYFN3pN87PvMvmvusUTkqt9OGaKQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU5yVTlTcHJhN0syUm5wMGtjelVJaU9tcFhncFltU2VyMnVLWkQybyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079936),
('t9Kh64YZrmmQ7pRtDEptlJXw5IaFSPGI7WyBmQPy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEkzbHNEdzBQRWc1TE9FZ05sMnAwYmh0WVBKZUgwTFZSRld4ZjFrWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080194),
('TakopMn6Eq92CmwD8eqoa0DghNwA5A5rThjP9riN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTJhcEtNQ0w5a1VJSFVRMnEzbUJ2T2s1bmV6N2RxaDN3TExqOXkyZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079981),
('TBRpETtcPWyH8xpF2O6WKiQt3n5UwOXflWPqIlyx', NULL, '5.189.133.199', 'Mozilla/5.0 (Macintosh;                 Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML,                 like Gecko) Chrome/39.0.2171.95 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU9QS1d0QThrSWxKM0ZRcTZpN3NNVXhyVGI5NENBZllzVEJ1Qk1hYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670084168),
('tc72JrBwFpVChdqtBlj7gAvxTaPPAYrPe39s9HuQ', NULL, '104.196.165.78', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGlDN2NRdUZwc2hIQzlMcWNzRU9hVk8zdllmZHdoMExkODBRUXNIUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cua29zbHVrLmNvbS9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670082523),
('tCcEYh4ofR9VmcwHyIxK6j8tjTYz1QWrAZGHRcis', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkhJZUhkbkRjMEJja3hacTJpc0pQOFdodVpHcjlRdEFnY0RiTW11RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080459),
('TCcHDrfDJcUzAtlpSQPICd3s3IfVRHXycnty6W4C', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHlsMWZTTGE1SHhSRTNKREdvRFBZVEFKaFR1ZUh5V3BRN25GQXc1bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080401),
('TCXRSXKMB69gWA18R19YsFnK2XY0wkacrZSfQzG9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczZNRlBmb01YSzRVOEo1MDVWZlFsU3BKM3dRbUs4RlBrT25mY3BHNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080526),
('TfaqCVh6hgRPhmBmMWhDouLUIHTw9f1KfiReUFbw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVZRcU9BUGRrRkN3V0YxY2pUMzV5Q1NTRzZmRUVHSFM4MHVHRFFyRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079787),
('Th7oT72rqbSw0b655yuyzFLHoMbgXfgsdg6l9RTy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUVJVExtNkVhcDRaUTZuMUVWOElWYkJxSFRaZTBhUW1Dd0JpOHMwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080358),
('tnSrEsxBesStrexGXd5eEz5t9sisTE5UOntG4oyq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOThCY1J6Vmt5V2dyUWxtak9ibWhhWWRCQkQ5T0hobnFmTG9Uc0ZZQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080050),
('tqLImikTf3mBjdq15frnXjf5n5rEnfpOdAduZQTE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGJPNHFGa0VWZm03aWFDbndGc3BCTXdJRGhwTW1mOVlCbU9oUnBudSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080123),
('tR9svjiPJIsZUpkJmwsCepUxXvSXjogM0pHBUASM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVN3NEZxRXUwV2lFVUNXSWlGeUFHd1htTkhrT1NNdXVQOXVuYWtTYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080467),
('tRu0yHQQfs6YUBhMTGVB9NjVRKbvh9qljpEXc2ez', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUm15aDhsZXl1RTd3NERkTFQwREd1SEJrelFadG5KT3JjMTF5M2Q5MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079820),
('TvIDeMIbX0fZMfr4N0PGfHmhlT4jL6sL6gwAHwKw', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDVPOWhIa2RHUmdnMEloVUlDQmtJWnp0c2ZZYVI4Y2NEcVF0MFYzVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080187),
('tvqGB9tMwVIKpBRmjAjzcopNNblVWP2pBxI9dFER', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkJLaHNlSHMzYXJReDJRMUs2VWVQdFZvUjgzazNlN1ZEaXBxZ1BxTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080519),
('tWNpZ49aqH1WuUxN34Q71SCTrxslmiUc26sdp6uF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjJqM3RhaklCSXBRNE1xTVBmZ0tpMkh6OGpsQ1IwaGhtQVM3MFhjSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079884),
('txC63dOs4F2F9CB3ottkAU0UQrHGtF5nRiGXnLr7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGhCWjEyMTBZaW5hdkZSTk82dEM5WlJONGhOOU5jVVZ1ZTFHaU92RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080047),
('TyOjMVv4z5xG5kpFewsbsNGBfT3tp9NDWI7nxTSm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJXU1JpMnZTUHBycDN0RFpQanJUNXlPbW9ocndJN0dydkhKWXpPRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079831),
('TzdE0xq7Wug7oWc73RSHJAFuS34VrXZPcnGvlRbR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2dTQ0NVejk1dENxWThxYnlCZ1N3Vk8xeXNOcVV4c3RZekpudEJjWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080142),
('U260LryEXR0R8OPIfvYPDAwrgHgv6m3LfQAN0gTj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVc1MEFGR2VsZXMxYkE0RlA4ZGNNOEJzbWxTZEF1cGdUTHBMVjNRTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080043),
('u4MYiXRKqQVF7dHOwH6eeZYPU9b2BgwIWxV1p7MG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUNHSGhnRWVoNjVQSGJ0ZTJ2Z1E3VE40VXVTQW52N0w1TXQ2a1BGTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080456),
('u7j6T0T8lgWszewUXppCOoNLDZGbJswGxsBcKsSI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU9zWGp0N3ZjNEJWNHJCY2RBYkpRQjBpTDlPSUtvc3o5MXRpZnU1biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079981),
('u7StPuPjrxoow4tbyTsw6GybarY9jWc6r0Utz7Se', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0JxbUV1S3djRzBYRHRndXJYOEY4VG10aDhaYW9pcUpIWkpGZDFUWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080457),
('U8b9S9lHB3vOtKjB0eFRsGiTxgZ4hGEqg68Aypnt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFg1eUE1azJmMGxYUldERjRPWjJhMnk0UFd0RVBLMTBsTzd6VGtTVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080155),
('U8RoTwvW6m3RtrqxtnLxv7KWRnrpHWrbZSoYD8lS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidk9MZWZkWkNwa1VwS0JuODZJTHNZM3o3RFdXNUxnQnVYcXdwTEtjYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079863),
('uc9guxWFE59arv3pujkMqQGBufTrYakK5m2Tp4k8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnRmTXczeE43WVp6OUdJOENqZXQzY1Fja2FCZ24wWUhxeGxOMk1hQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080534),
('uDI83mWMh1SKShxmHqHeJRXQNjJHnkrQR4oboXG3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVFIR2JrMWQ5OUU4QzZRdW1zRHE5UjhRYkhiSnBlekNtMmZXaDZ5aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079816),
('uel2MRUBNbmm9m1UZwT4Ek33UiadiGwfd14vEcdo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUo3YXQ0RnBDTzVPVFF3bE9DY2tSbHBKU0lUV3hWZ0ZaRzBnYVF5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080128),
('uf3uSeofgV9u1eyDHbUtKkS9GxpTHlpLLKpSKCAk', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXFWNU55eVRpMDJ2NXdEb3drRldiSm1saVhJaFZmSmlkWWZ6d2RYaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080522),
('uFu81HLuOfrDmrDJJ7gVUakR61MToMHm9AJuYDpx', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHBzUVV4VDlPdHJ0bGRWZzhVYUR6ZmRoUllVWUk1NDF1eXM0ekhyOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080422),
('uhhzXZiI8kmsKU7Ikrh1WV7W44WkqXz5S8jGw67t', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1pWNlJxNjNIQlBXcVRwWnZjOTlmdVBGaDFYd1hWQkVSc2JmdFBFYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080015),
('UhWFHHPNc4VOjjbfZ2yvJ7QH3EvCGNdTZfROGea9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNGU0pXM25yWjlBWXptZXNKMWVjSGtQaTJ1U1FQRHk0eUJLNHdnVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080070),
('UhzXFhq1vzw2hAdB2o8dfxUNqdblWWcUVWf5l3rz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnpwTDN6Q2dnYTJFb01BbktTcjVLVWVaZEpSUlVXZ1YwZ3laQWZaWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080411),
('uiHMVxon30OjYLE37yksnzsR9UJp6kcrCV4ZrBNl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0cxbXgxaU1lZUdOYUNsQXRvUGV2V3lja0VUa3NFaHdtWDRqVUtTaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079832),
('uldOcsMNLqaiQVpuqv4fzOrJZ4ZnzlloCVkEQ0c8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0tyQ2U3cU43Mk85d2VxUGROcGRPU2lHYTJmOUxESDd2VmhReEVZNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080219),
('uLUKCJ0jucOB8Cm2iUPKQOsWrhtCHRvpUrNBc9g3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzRlUlRUbUdKSzR0aHdaSndwSTVPRmp1VnBpZjd2R2lRVWVOWWxoaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080142),
('Um5pelYW4XAJs6Oxn4KIBD5DoMeC8Gg2JcAoW1as', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmxZdGEwTjdNMG13NFdjak9nSVRRWFg5ZTFKbEtKWWtaVWtWd2pBRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080450),
('uNdkJGPzdkdu3dr0c1TnLiURiYjBnkRouE6daUgW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWpBNm12eGdrMjVDRElveE1EVXBkMHdWT1dlcU5PY3dtOTVXZmdLRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080022),
('up2zj3VKf63NLK13wGjJXdjNVzQb2JF1xCs3R8zN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWN4cjJCNUF6NG43OE83T0RiY0s1bXpiZGdaejdRTUdvTGNYQ2M5SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079917),
('UPLAjGtGGAewwI1OrVqm6ZLrNg3sNYwOBmGez01F', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3FIZFBjSlRDZGYyNHgxRlRVUEk1cWl5VFE3V2hsR1JTd1daZkZHVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080531),
('uq6fFmLEylFlhd3oNMo07qhtGYkrW9ZgGRtikoiq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXQ3cHQxUGxWdXYxZklXTDJqWndITVF6OEFiR0hGSk5QeTlCZGl5QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080359),
('URDMxsktfUDX67c4HpprkRyOgkWpE05UMoD4OBlt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmhVOHlPY3ZOc3FYcjJSejFIOVZ4cmI2M3RlUzhSWmFRVUxEQkc4OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080071),
('urJND8G0y4nCo4u5sVRH41FIbcT1Spq0299Xov7m', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTBQRzVEM3FNaXN5QlRvcDYzY0R0NGxyN2w4SXA3M0tSSzY0RVVkRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080173),
('URPYqd75kIcWZsFIdtenMIDBQw4n6lpb6RsNiQ3J', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzRJM2VBOE9xaEhodU5RUllXRFlGMVU0bm1ZNGRUOXJac3ZudG1FQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080052),
('US7bFRbyyp9ixlujHoxZrsX2YSRvrSxieu6XwJlt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmU3MGdPbnVyc25DRXl1NDNXV2h4Y2U5QTRUOE14cHBwSnY5MG4xZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079798),
('Ut9ehobkqsald3f19bm3cxOEwHdrdLTlASQpJwWO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGw4T2N2Y0hGUk9mU29zc1pyOW1DcFR5Q3BzTDk5V2JzTVhEalpIRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080176),
('uVAphrESPVVwAM814rhVLhdqkoEFZgHrhVs9DAKv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDNFaUdwS1RCeE1FMm80UEVKSmtuYzRhV0RRaTRiNkhteG85dXAwZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079784),
('uwHqVzZxIJohJ04FQD6oFOTUa2skI0UDBFWgqE6k', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXZxdUxwWmxQclZvNjUwNVZrcGhNTnhiUlpqdzBZcE1tQmRaRk1ZRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079964),
('uxilHYsZSjpXfFz9s0ovEu1ujehjtSzqHzu4wbzo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFg1Qk5abkxDSDJYbVlYemVaaXh0TUtIV0RqVGdhRGc0NUhteEhJbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079924),
('UXZUbfXut9S4zQVp2J9RXnay6WCbjXl5GjHjruAH', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXBMUnVOZlFLcVhUbWFRWHdNMHBucldQNHBLQ1BYU29ETVJUNTNWUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080118),
('uYWJbb20NMcIhqEgUC7Voiaj4bWEOdFWmQGEKiQU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3RacVFBcGNUR0loWU9Vd2hQdXA5UEtNOEFjWFlUeEI3aUo0T3BsUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079804),
('UZ2zCRYy9KIPv2Tp3BrKFJJ9jhqLlPpCec6I5lsg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2V3SmxycnY4WkpSSERPdDV3ekVLZ25hSkV5WHpBbUtZRmE2dXFYMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080476),
('v0wy9uCZqZMxKYpz8gNnMqgfJ5HgYLokzPEPfbYF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTRzcWQ2akc1TDAzRnJ4S2loNHF3ZEE3WjM1SzZNTVNtb1h5ZHhLNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080308),
('V199TQd6UrfufmSYHIDhl97y4QYK8TfmKOesFwOE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1JoSllTUVZXbG92NW9PSW1qUnptMGxFa2UxWlBXRzFXU0NMSHh3aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080162),
('v30oh99bzimk6f7tevJBLNTsp5HAOrQWnERphWpC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielNncEY3NmVGZzRPYVBQVEFXRnM0QUdHZ0ZGaWxXQ214aUZBVjJwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080153),
('v5WhMBX9WfvdnAXnPUv54h9RTqCQ6dSTGxcoJxJR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlJYNE5ZTmxaTzByd3Z5N29PSEQ0RFdIQm5NUlNGRXFqUjZkclFHRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079856),
('v8EV5i3Lk6Su81bwsjoHkKU45SERw793XmssOZYU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEwwdnNxUVl0YW9mQlRjU1dXTEhCa3ZwbTd6dVA5YlJjbmwzRkZIbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079943),
('v8oGac30G2xS53GacA3tiPZggEDzYc089DdfA1Lu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGpWVjJ3UmJXQ0tGb2ZCcHA2RnFmVXFNdDhTS2Y5Z28wc3dZMjdNVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080468),
('VAsI1xv4psr5tLNSgejN21G5jd8LLh5vyM1RoKmL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXVPUTJ3azRkM2lhWGRJeGpZUFBQTzZSUWw3NndTMjhGU1BSSGJpbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080286),
('Vdp5foRtttZsfMqLSCc7eSGyUWnrEaNDFnAONjtL', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmkzREhTTHhmVGVZYUdjeXhCSjk4OGluNUZxYUpQT052MzhEaXJHdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079866),
('vEIHFRj2VFtWlh4xxMvZTuXIzCuei33kD3B3tE0Y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclIyaG12UXpRZ29oYzk4YjdQOGJxeEs3YTNBanV5YU03RkVoblpacSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079779),
('veMumYUYnDcuoClK4iCLxHJdY9qwhTYa7Fs1IcDQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUM4akQxcnMwbWVUWW5mUGp6d3JrdnU3MTlKZnI1ZEJaam15ZHVkZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079920),
('vEwNM2kmi1mgccisTwGRLQf1rYXuq5sPjHbWBddZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUxLR3RadUhDdHhWb3FoMEd6SjBhQ3NHRm1rWjBDRENqbXVZcGdqUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079811),
('VFWtT0ZutCp5Dg6NODIFixtpzkGuvjd2FP0APRQ5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlZ1b0x2amllYUpwRGN1ckFDYW5MbWdPc2cwYnFjWURXUjI5emYxeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079926),
('VINtG8N6kADEj91j4ickwWhv2N0OcdY2K3loQ0bI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidno0eXlncUthUnh4WklWNUJ3UXFaakhHVnFhUjdRZWVQOWlYSkJ3OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080321),
('vjSIiN8G4b1uGn5gcBlPHE4FJsZwqp26QJI0Gp6k', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWVjeG9keG1UQ05PdVBuZTJDcXh2QzZwR3lVSzVjME8xWFFBSHRhSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080431),
('VK7ZvyzGdE3Yb9moIKNPX3sc2MUiD12GCAyx3bNk', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2N3cUNwcHllQ094RGZjU3JnRWhZZEk0c29DbTd2c1RSc0Z5dUhxNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079950),
('VMPSZC90MiLd0Pd4LjsxpjjSSVsecrjhc6G5Qb8i', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGRKTlFKd2MwYVdVdHdMR1BYZUlBdE10dXpCQ1FYY1c3N29EZjJqMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079898),
('voMOHPm4s8vuhILuZ7pSJTMI7TgmOljTxW61Mxf1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmlIT3hHU3JuMzZqWnF4bFJUWnZyeFY0cHhObjhIRVd4ZnllWVp2dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080120),
('VPQB2HJV0DN4j9CPZEyI2Z1VuRBO2kWhgOg0AYC8', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFZ6d05TWnRXb1N2M0tkSE5ZMWptRHRSd1Z1bTdwQ3NwWlJpTkVLcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080464),
('VpWX62ucKx56l6bpp9ZPWANkVWZ8qKqcPuksofMU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFZpM1A0UU9iVGdxeUJIU0dwb2NIb2E0Z0d2WU8wS3ZNaGc1NjNodSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080367);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vQeswfzjlADSSX4GEJuaNBEwPw2lLEqZGS5GTq52', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEZXSmlaYVFpVGtsTWdvWlhNQzBlbWZ3TDNabTM3T1JaeFpaaEtUZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080184),
('VQvPofyuWoD5CZg1sHIb4w5udTE9e5B95wNuOnJv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlE1Rm91TlpsUjViTUNobXphMkdKQ05pbGUxRlFydWZuWXNvTzY3SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079861),
('VR7ZNkX76yFzxQgNuVWwXMmA6EEBctMflVRM6ycJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFN5d2UyMm5WS2kyUGFucWFjR3l0cmgwdlhTaktVaFM3OE5rSXFZRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079959),
('VsiQ5VhI4JV34MOnZcqviJqFt7YyC7HwHZuf7oYO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWVYUTRUSlpEU0NKM1pEckNNYnZLQ3U5V0t3aGI3MU5vQVVMZFlyWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080406),
('VWbX05hUZteaiHFkAv0EhlT0Vgia5fBoydgLWb9P', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUQ0VHVtc2FXS1J4Q0p0TWpIREpmZFFaRURJUXJkM2RBRENCcXpEYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079888),
('w13DxSwVxuXzXCWcbeXXVmPXPDLd68VHy52oKSvt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGFGQzNGSUdiSkx6MXVNSFFldVNYbFU5SGJXUXFmcUxaeTVCcFFJRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079857),
('w2czhSq2pry5y3KHspR6rEZ2hEDTkvypVKlNq4rU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTRrbnJ1U0R1c0pGS3hGOWlmNHkxSXhRQlRNYWc1NWRCd2h4MW5hNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079989),
('W3UpsjqmvRCL3MhBBeHqAqM5j7YuBgBFxAx8mSQM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlFwcXp1YUFTUVNrQjdVREhoNmhYZGZiYXIwVGpIYkJrMGtQRkdDNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080005),
('W6crP3w2STnelnVHVsneJbN9qqApHOKmRrQ2oRaJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3hVZ0RWZG82MzR1ZzM1SHplT0ZXTm5BS1FTalRudjRzYTg0bkRieCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080474),
('w6f5KJhKuHRoJPyQb07x1v5W06U0HvuAmsp9YNeU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3htOFFnZmd6ODdBUXh5UnVIMGNmNHZEWlFsWlltalZFVHB4RjB2ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080420),
('w9FNk0zDZgyTjjeQxXxyTT3Q18iUawEOSGTRDMfN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVNDeVpTZm5GSHVveFpFRnBraWMxMGQ0bk53a0I2QXBMdkxhSnlGVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080062),
('wAFPd9i58gJOE0zly8c10WLfSh48A1FTVHbhyTo2', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDZyNDFRa2w2TENpVWNJeTdmeFo0dGIwU1BmMDVaMnR5RVU1NDZiZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080019),
('WcUlbjCkiT4jEiwpOeZoXPUXQewOPEQhdiAmDpoF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVp0S1k5T1lCb0xzYnhOZXM4ekh1bjhBcG1RV25tWHV2VndXb1hwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079887),
('Wg5Mthcpw9k6fq45I7OWBdIEDy8VFgjeFRbt9Onj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlVLUERSUFpEQ0pJWEIyc0JOY3ppaFhpQzg1ODZUVThOS1p2b3J3eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080410),
('whDivgu9VaaaAkGRCgc3ZFArVruy2EqHXHe72oJK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1o2cHJvODVGVWZiWGc0Um11SDVQaGxTRlowSnlNV0hTbmFoVTV0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080001),
('whPFKycv0daEnwCjymuLu6kK76lX66K9kwlE3KRf', NULL, '5.189.133.199', 'Mozilla/5.0 (Macintosh;                 Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML,                 like Gecko) Chrome/39.0.2171.95 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXh0QkZBbUNJenBVOHlicEF6ZXQ1RWUzQVJEakxJaDE2ZFJoYXVhdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670084169),
('wjZQ5fmvnkPhQngWQe6eUcpemOpgv3VU6ogstAvT', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDRqeUhHQ3B3R1BlZU1sMEJ5NzBYQm1vVkloa2NqTmtXa2hTdDRkTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080382),
('WkfMyrbbPLdZP6l1ALCRNRMm9IvjVaG1980Ihbe3', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkpnNEdNWXhTaEE2N0Z1NGxXWWE5MjNLNVZkdGlZeFk1MEViakVCTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079876),
('wKh4x4k4crozw8phFsZx7PDJXaBDHvNLGCoq4VcJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDBUallVeFRIZUFoOFVRTWFkZVhYVGdmMzhRRWphZmhEYzFHQWc4UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079898),
('WKwb7IVHwB28jWuOOY3c3hjGbF227Y3N4k9JePPA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUhySVNOR1pPU2Y0RlV1QkVTT0ZSRWZ3a044eWg3YzZtUUlqdFdGTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080029),
('WlSwRdveDwXcPFCF94vA81oOKBOA2Gq1wbSPGU6R', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzNpV251cHJ3dFQ4YjhKY0NMMGtMRUlRZllST0RlcWpiVDVETDdncCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080060),
('wms9rF6r8qG7qHXgVcfxcruYcLPdMmaACllVg8ng', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjdsbWE5NkJBY2VJN2lYTWpCbEs5R21Ob01OVHllcGU1b3k3VlEwaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080017),
('WnaeumbkPLV47cAMNLEJpd1gOFmS8obgFshRPYhi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVBpZXJmRHlHOFk5UjJXbTlJYU5iblF3RkdTbkFCYUtFZUROREJoRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080163),
('WOmzlSfOeXdj9qHPkqAJY1G8ZFFDDgw4lrewprhO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVZYeHJsTTE5YkRWMEFpSzhEM2FVMG9BS3ZrWnc5UEV6VXZydzdhSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080479),
('wp2XDM9BqwyIN6R87RbZunI2hvbdvInTOe2Fp0BS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmF1SGtzc3FvT1RwZ3A4ZUEycEdEUklGNGhLN3NTa2tEczFLSzlBMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080179),
('wqfay3iQ91s0QuV8Gb9TypoiJPwXEOkLrPXXjKj5', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEVmblcwZGZmdkFzekc4SFEzQkxIekNsMWJyQWl4c0RUaFY3Sm04MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080532),
('wqfw80f72Va6tzl9WQpyvkr2V3lswEZjRvnLhS9B', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUZXd2JDNlM1bGhaYzdhMDl3QmtzOWpaNTQ2a0pVZGE1T0pGdUhNMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079922),
('WQku9KEElraMOLtnpV1PPxwNCED5wiWFsakhP4zW', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGxxSkFjZHhaOVpmZkdtZlV2cGx4Y1MxT29wTEpmb0FoNENYcWxSUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079910),
('WQUK6pAu5OobskdIrvag6jmqSYSdGEt58eWEbF09', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3BPOHk0cmtHUVR3ZWloRTcwMm5wT09GRkE2SENaa1RxeVNWZ1NkZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079897),
('wRYB0dgXZwX52i1JPzZ7lOvsaNQN7YfmmxgK2z9r', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnRBaFJmWUNoQXVDRnRCYU1VbzVucmFHMXM5aWg2UTNWNW1MVXdNdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080082),
('wuW92TvmY2Q5BciZEiZKeEufpWmiMej4uks5CN5z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUW8zdkYzRm5HMUNHSVdwbW1JOUhxNFZPVkJQaG5DZEU0VFl3VFZ4YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079824),
('WVLrbfpO4qVR4p90uG1yjhGyyXFQ6vmfiZeN10WO', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVFNM0w5WlQ0ZVNrVmNKMHY0T1hxNHFkMmw2SUJwTkZPSHpaeVh0UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080101),
('WWhoDAqVPUUxV2DyHa6CKxGOUa3PXMsc1oPFHAN4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDM2YW5nQmc4ZzNNOXRXMHJsNnMwYXlkWU9TcHN0UnhWY09iYlNpWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080298),
('WWQtbCQfxJcdGoi5KnOwMGwrdERLtRUiEY49DefQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTJ6a2VDT1FkQXdWSHYxa3RVOHVWZVVpY2d1MXlGTm1nRVlxaTU4dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079795),
('wWXkTYCifuQFxeedc9g7LBresGaUPSsbxXlwzZPe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFQ5OGRWVkU1NzhvdVRJY1g5ek5odzkwOUFCeHVWTGtoRkJaVHJsWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080493),
('WYCQxu7vWpA8JaSiHySLW10QqKiEe0rqjj10NnNA', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSENoakpmdlA5NG4yd1Q4NHRRdW1xaGs3bGM5WnVzMDhrQk5yYVlUWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079867),
('WZbW0JoMv8fRI2moW7eoDah46nVSAVd4krM4ypsI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEdneFdNTUJEQUtSOTdDSWtXRHFFNHZvRndrRkVNbU1mNXZMMGNWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080059),
('X1Q9F4jyZEgcBurmaysbeqtoqcEPM1jy8xgkEu5Y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblVmeHhKTWl1WTBBOTdjYnV5VElUejhMcXRqSXJNejdzS2UyeW8xYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080053),
('X2cEJqHRRs7XnWbMkiAjDBRGRm729ISOYhG1IQlg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTdGdGt3NkdYdVRXVkdLVVE2THhibDZDZUNXUEs0b2lPenNLTXp6diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079823),
('X32ObBcCx2iBwI42ap0QjcRNSDygp5y1jrpzsxcb', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXc2OHgzbTlpOEduZkR3WXdGeFdmRTJNNnBaWW5XRHpvRnBwRUMyNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079833),
('XAeTp3dKp4k6QEg2J9nkX0PjB81KUm0GLvsNSnmt', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzBVbWVGVGtrRGJJcm9tb3ZnTDRpRThDZlpEM1B5OUNKTmR0QlRSUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079974),
('XaPlpeErm3v90ofh3fXRs7K2Lbs9T1jJaWKjkR9k', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWRzQTVLY2xTTTFBZ2Jnak9qaVZ4Y2ZWSkdLSTFZbGlaVlZSZ0twSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080464),
('XBsfjeylBeW9UuLZmuvxmhubhIcl8BxmqRFZweT9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHVZWnZERXY3Smk4TUlJQlpjQm84bjlGamduQ2xoRzB2dHdsZ1lVUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080499),
('XCjJYvX7AUPoxw6bT1aKEhwh1VByQMUV0KqudRgM', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnBmdVRiMERPMXBsSFBDczdKTTRuUDJYY0FvcWNTNkhzNWJiQzhWdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079908),
('XeuLs0K7pgT48HOae4RObMwQjrBKJVfnLXyOIEwr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZIVVkyVHZCcXhWQXRSTFpRUDliYldJV2pGcUhnSmd0Sm9GZmQzUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079852),
('xF9faux7aLA46Sv6otPBrchxQgpVZqq3QSWS9hZF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWdld202NkZkeEl5V2VRaUZJV3RzcTFmWnRPWDZmUXVXVXJYUzdadyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080066),
('XFcqYfLvXeNYieq3HmLXodPcKgk0hAUhaDWRDd3Y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ01qc2dKTW1BUWZHZHpUaGV6dU95WXhRdG5OVlQzYUFhN0NRRmFJWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079840),
('XFYo1NCDJfMBtJgSeXO8IL1mFFTZGFQOaYR5MYVG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1FPSWZuWkpVZ2pJZDlOV083RnQyY1MyM2tRVnYwcEVNbWczeFIzQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080461),
('xgFRj7xnRjHtMrbcQeMeBCVw38qh5IsPmP2vjaQq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlBZeGQ3VWtNdXcyOVFJdlR3WU9TTEo1WXpiZzV5OVdPY2ZrSGNXdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079919),
('XhQVFyRcVCkfK4VE078Oq9WrkYzZmfP6TrYEikNa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnAyM0xEa1pIYWljdGpCOEdrOWdjZExvbVhxSDlMRnU4OHowb3o5ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080371),
('xjJUWq5gu7iZa2KpAFQ3VlBOIm4fw6xHMfCjzmeN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnI3ZjEyZTZxSkNMTFUydFlZUFlEVHRaeFRPNzhyMURudXlseVlTVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079824),
('XlHqRxeY7RSF3X0OlAjs3Kia78mUeFq1TwIZdVVl', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFhBWGlrQ2lYM1ZmZXpmTUJvNFpJVlVFdHZkazdTbUVPb2VHWUNSOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080341),
('XLucYOtW1cMFTCpCPUie8IEOXjNzh7R10QZ1ArPX', NULL, '152.89.196.211', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUhVcnJJaGR6aVpXYXhzdTVhSmIxbTVqaENITDdYTHFVcUdBRldjOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vMTU5LjY1LjEyMS40NC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1670085281),
('XQ17xITJM6LCH2pQOgt8CZI9awBIM3cJvnM8604A', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWd1YmJCaFdUeUtTQmJTSTFTMDhyU0JmYTkxSUUwbDk3NmZ1clNTRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080497),
('xQPmAbKytZGmNNXKZ6BxJrZ7mR1C7mK0aSDuAHE4', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHJQQmVsa00ybzJxOUozeDB6WHFYMWlWQWdFdGpKWFlRM0NQQnNZUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080077),
('XrFrnWGnZyIC7u42vd4wSrtaYV09sv3YUlwbBuaE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDNTVkU5aWxzSjhtTVhaQmlZaVVXdmRpRTBRQ2FydnhPY05IV0hiVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079835),
('xrK7vhaZb084O87vnjP3L92XYnAO10gwcFxTIyNd', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3RSRXRTTGhiME5BcHhkV2hMcWRNeFp5WE5RSHFlTFFMRXluMFdqViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080377),
('xs3PO6KjQssvEaCtrkd3ZbwHrZ7eiFTxXQOasScR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVV2YXRnWTNPWmowNlczQnV6blBhMHVhZVFjcVg2Z1VKcENXWmZoZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080397),
('xs8595s9u6pbRH4ULfk62yL3xraDw47gsZsU7QyV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHZaVld1TFBPTVFPSFpwZ0NpQmZKbnJJUGgxWmJTU0g0N1BDZEwycSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080484),
('xT7fIh1kShDd0N4gNhDPGLGGtut8TNKkI0RPxGYi', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnlSUVVPT2QxaUhvOXVaTnZXSWpzMnlSMG5nSHREaWdDTEtVWkZLSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080145),
('xuBzxzCnrkEst2d7BH70FJRulsSLYx8x6yXGxV6m', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmZTcnJzWGVCS2xnN0RPbk5GVnE1UEt5YWFlMmpoWWlGcUpwdWZaQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080466),
('Xw1TEyBd0yr4YJ71OsjW8VkyQ5Orpo1YIzroMNlv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGp6UE5MekpwZTVxcWNqV3FRZlJzR2hLYndjT09hTWZXbWR1YUdociI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080350),
('xw5729zvq9RYFkivGnZQW8ClaNAQx9Gas93MvHVa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHAwSmdjTUhpNHRaVlR1ekZSTTVQTmdoZVVqZm44emtXaTJrdGNBWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080167),
('XWYQQebrGiLyjsgEANcSCHOXKV1tXvK62inRnT6Y', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWZQZGZMcld1VWhZZ09lSEhrMm5QdUUycXg5SFgxWUhFYkFTRkh1NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080304),
('xxdnChNIcQZ9PQ2G9IG26OD7iekhpjHB8HdL71wN', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXNLZVJPQXlGM20yd0RpMFN0Z2FDUmZyNDB1VzZxU2wyV3dYNHdWdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080283),
('XXhMqRqRUpJj5VI50P6baXZfF3zs80olCV1CFKr7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEROSzF5MnN3OUg0S1hnNm1wUFdRdU1GZGFFT3dGNGpNY0F2SDhBWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080473),
('Xz7o9otpyR5tpPLnMFROBlxcYsN43UkxWuTIpNHZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUdOWENlbXBGT0U0eGF2ZUtabTlITGZYVHNKTGtmYUJUTmdMSXlxaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079841),
('y0E3AzAnR3vS9I2Uro6OUSiLbvNKmFOh2iDqg02w', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG5XQmZYOGFNMGZWRFRCMFZHaVRQRUhoU0FEVHNHOW8ycU5wNmNBViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079947),
('Y3eXQQYQTrGcaf9N1jJWQ4KD7jglrO0utUpsUO2L', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDR4S1pqVWpzM2RCR2FMVklONXhEVkljMDBNT01paUJtZUdkSzQxYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080355),
('Y4yMQ60XYFspwwsFszfJaa0z064l5ocnrIPepACe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVI5bXNkTDYwOHhFRWpVZTVFUkZDaGFMUEh4SDZ2bldpT2ZZYmcxYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079852),
('y5P7RmHebQeIvuZDme0d4la5iItm29cxluQRH2WY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjA3NmpvTjRHSU5OdXRlNUswaWlvbXhYZFJuSHJ1RjFCaVJRZkdubiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080365),
('Y6ywZEoW384Vc2a1fJVdIyKTcIWijMnmDbWWsUNX', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHVTdGhoQ24zZ2trVkYxWXpGdW5LQVRXQnFJano1dFU2cFZ6dllBaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079991),
('y8ndiyzWdcUO8si8Tq3I690Y0SPvtEy60Ss2IBD7', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnk5NWdDVkJUUU9XRUZ6RjN1Z2NvUlNwWk9ESzdPVW5FZzZ4UDZsUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080125),
('yAmTlLEYy6nzSmGsEbaRKQndbpE9vk3dAp8OAHT1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUZidnFxUndUVm9YdDVud3NyVWxNZ2g4MjhQRTB2NkVnQkdURjg1diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080527),
('yayQ34kPj3lzEjwBfhd4tLxe6yS78rz1N9iKUiH9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFFZTHZXQ2NFNFlOd3RnZnNmVWh0WlI1akV5RnNEdVoxRWM3WWl6byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080229),
('YbDo8gmdHRbwZG3UcrTtmMCVJXtaLvFba6iKrOFD', NULL, '34.221.76.127', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR0lzSDYwcXJDRjE0RmNqR2ZmaXEzQlA2dFJJcjA4clF5Z1JoSjIwWSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNjoiaHR0cDovL21lbW9oaS5mciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE2OiJodHRwOi8vbWVtb2hpLmZyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670082585),
('YbGLZDs8LVPte6u6LC7e4UrKJeZJAIOhSFn9kfHr', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzF2Smo5TXUwbVZ1dUtPSW9WRW9xcWhaUWs5UlJIU3RxV1BBMVZLNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080104),
('YbzPERVJKO1yqC0cZfd300VVlUP4JEBq9LJDijUV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjhvcUl4V1NudG9jdkJoRHJjVXgzWWhUS1k5Y2VZVklRUUtsbDlZeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080014),
('YC39XbNttxhOJPkDQzjyorTjmTzIRQCZNWQDV5km', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHdwNGFVSmV6aVR4N2FzNkZrb29MWXRxYTNJR0JzN05IdVlUZkpqWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080398),
('ycJ7pcZ2fyjDdYrxQ4uo4C2X8b84It1O0zITSN7z', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUNQMUh3MGIwbnY2eEJib0U2YXllOUoweE5JTFRYS25Na3BUd1djdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080182),
('Ye21D6r8emG99W5Q8hoIRUcJp8dHMjWTN6leLe2W', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamZzTjRzTWxkTHk1ZHdxVHlsWkdSS0VXMGlyN2ptbzYzbUE2MmJoSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080378),
('yEj6sRdtNjCELh0h39M8TLGeUrGX0Dv306mebpPZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWlUbE1vdXE0N0FhZVl1RzB5S0IwRGNmSDVrdEoxR0p5cnVnUURucyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079980),
('YEj9KhJGs0ENLCt2jfpiror2pCkKDF14kBJlpOLI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3lqSWVIZkxrTFV4eFZ5c2hiVkNBQWxPYmpOSWRjVHBxV01rc0N0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080010),
('YEntgDXdvMiARvhzWEwnEcGAxGRzn16Fx0F1fUZE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSThIYTV5d2k5bWFTSkpKTU1ORExmbGJTcXAzdUMxSzlCMlkxcmwzZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079859),
('yEPCy5IKJ93RRbO3LeohCkN8ny6D525EEVq9dnI1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGllRFo3MzdVS241ek1VeFFMc1o0dHg3dnUyb01HN1JiNXhwQUxGbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079793),
('YepngUMTUkihI10gQ6J2WoAhtb5H82Dg8YYVh67V', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEdqNlBNckN3RXNNNGNDZHltdjlsb3pna1E2Y2RJVlBaNFI3dGVmTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080449),
('yFGQsHKWq7mwIJLRCs4CyHXWDxwUEV4vp4ESJduY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFhXVExxaEF1SzQzVEZpbFZrcjVWeFZ2OHVBY0dMNzZhWHA0OTNVSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079993),
('yfokm1sIO33vpiB5IabjZ0Kc7K0dOJTnEGlSuLgm', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHQzVHNyTWh2MXpLU1VaRklSZUIzRjcyZ01pVDlNQVF0TTJFaE1JYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080501),
('yFQG630a2vlu8yK87ObXPd23ZqePwQ0ock9jOaDp', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmhhNFhjRGxzYzFZbm5yMnhzTm01ckpWZGJyQnhjRlFsaG9UQXpCOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079985),
('yfSC76aQtGS4JAQVp2dhZP3x5OlFZl0D8rohwvoz', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTN6WllkVTlTQjBReGNTYXF3dmF1RUFEUGZLRTdwVHF3QTJDOU5CYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080427),
('yGxyEz7PT0wuW6i0mjZ2dOO6rSpzUvbWUzKj3fZ1', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1RWcnRSdnltTzdpdFVqRlRHMjZ4WjNxaFBmSTlLZldUY0UyaGlZRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080438),
('yGYlhPzq19OujxuP0dm7MybYhSC0OgWJ1FexIA90', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieURONGNRMm1KMFZBSkEzY1Q4U0Vxdmc4OVdsVFhyeHh1Tzc1UDE0ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080423),
('YI8ksqPOQTzP21y0tLIIjRpdPbYhKTp08uB86dhg', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWdyZzdsam1XZzB4Q2MyVUFFOTAyY0djNVVXRkVtZnZjNDZtcEtWaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080211),
('YjGStjgGBtVnt3zYKZI9ELKI4fFFz44TC6BYNrkE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3hVQ25TYzF2cXFDMlNLUzVGRVdyUWkzOWY0RVB6aGh2bVY5RTBTbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079955),
('ym8WhcARwIaQtBfzzv8gGgCFWpecuH0xlByBQnfY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0tzeFBMbU1tYmwwbklZbk1Bb1dtT3AxWlNHaXd1OXlmbmI5Q09pUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079869),
('ymkIfzpGeg6zMXv2LOED9qWTEdits5IluJ6nYhCS', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXR4elZ6UjVCSDNQNE56cDF4a1k5OEZiT3JoRUJhQm9RNWsyaGRpMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080044),
('ymZnQCYv6IWb980EXjiajvHVXMKW5vSL7jCocOTG', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVc5ckcxVEF6bG1ObUp1b01EdHk0SnppNTJXZWlWeExhWDNQQVlrdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080002),
('yOhuOi5Xx39m2LUWwv8l5yyf9tQ62Q1XBHhAy4v9', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnVrYU5vamRMcjVib0JlanhoNmNacUhHVzRaQWhleWdKTFNkN0hrZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079914),
('yoOOvaGHkN3nHDeXd9rmtWm0MD4v0eeLjbY5LYKC', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHNMS01uV0N3QUhnNjFReWN0bmRGTU95WGFNd3pvdmpDbEtGSVRQaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080290),
('YpQI0QqRRCIo2tuCqebvXHYVsqFPmBNm36HMaxds', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2hycTVqQWFCYXFxYVRzTUhySFhLekRtWFVwWVE2NVZodGdyS25BMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080033),
('YPUdYDlvoLRxyYWceT0S3WbAMatOiplVKPlDEgxU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjBCc3NnOXRrdnpGU0ZYbk5mVHRQWW50UUExR0NrbjFxeWlSSlY5ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079844),
('yR6XDVEStEfcDucbbUn8Rl3r5gPChXINit3Htyyu', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFRXZ3ZTN0g5T1ZUWXBDRWVWaWZDcExLcXlIaTVJTk1vZFNQaklsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080021);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('YrnUhwKoFXKfxQdrNg4HKfqTmwwabqMleQfSYvy0', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmVxWGh1MThoMVpjNkZzM1FJWW5Eblh6SXM4UGFSYUtwZktlSHBmdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079865),
('yrznDGT3yCmAVjXTwEG2pHLx94OzwMuWF3iRicOe', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkdIYVRNYmUyRk9YUEpjUHIzdmE1aXJqTFE4TkNmeWZOZHEzaU9sYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079965),
('YSPTazV7lv5dD0k3R0Ml3VPdQJg7HaVseMYNYlfB', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNSSGlIZEpBeG02Y2J6Y3g3WHVlUjlhY0Q4bFZJb0hpYWk4U0VtayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080518),
('ySSIquVThWw2ZuvQEVc1yWxvA5qeZioQ4Dgx0jhs', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEhTRnVic1hGYVlJdTVrdjd0NUt5S2Y5dDVqWEFXM203UDF3WHlMTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079967),
('YTG3Dqe9KaMTZ03s3vOxICd7mRSJvsgCijIhhZvE', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0JNblNFZTFWN0h5ajhkTWhOcGlNWFFSOFoyOXZ6ZXA5MGpyY0RxSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080469),
('YTmxtARqHmkDEEXNZkeYVUVC3UGiXUvYjSqt6KYF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEx4VlYxNHVoMEJBOHFRYXJ1Q1NmN3loZDR6MnpLcUl4ZGF4WlNnUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080420),
('YTvtPij2tOGgdf6cDEkF2WikiSxBOMsMtpq6fVys', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2R0SHoyM3pXZjhmd01ia095VGhUUFkybjRERVpBTTRMZjNOejBpUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079803),
('yVpWXH8nlJLUtbuj74XmMWylreBtzYKjFRMtp1bv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWVvTG5yNTM2aDdUTHoxczVqWkhFMnNwdkFmRzhFR0NRRWpNamRWdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080157),
('YyfNx971ZYziTBlQzrq48q5XjBTCHi0XFtnLFE7l', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFJlNG5mamdxZlR4d241Y0duajA0VVcwV21CTmVMdVFkNTJYTWc3dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079855),
('YzQniqKEP5t4ydTnSmw7LKCeDZdUVki4n60VPxaZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibW0wMnNVcXN0MnFjT1lWWlMxakE0endhTDBVdFRuVFkwUFVUWklGdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080241),
('Z5LdMoe9jEO4bIv8ebGn1qkLuBBMV0vDDCrddoFJ', NULL, '34.73.7.147', 'ZoominfoBot (zoominfobot at zoominfo dot com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3pTcUJOTnNxTzBvUTk3Z0VodU1kOWNqYWxDV3A4Zk1kTG9WYjV5byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cua29zbHVrLmNvbS9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1670085182),
('z8lQMOUCMSA7BRf9z3ProYItykEzlTpbWAytUlPU', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazM5MHJEUGtrMzdwWHliWnFxcDdXbzJSU3BBZHdYVk9Ud05rT1JrNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079871),
('z9XZHKsoyLn4gl36H85uwP3hApPc3YePQx4xsnIY', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1I1bnlrTXdtSlhWV3hJZ3d4bUpPVlpGR3RVWjJ0bGI3YmczcVgweSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079776),
('ZaOZfccYiwMkv6K3Fsr6v0dpBmqTPHhNEXzKf5rD', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2o0TmZwb3M4ZEhLR1VpZHM3eVB4TnBsU0NIRjRPb1JSYU9Ia0pObCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080453),
('ZczoW860TmBqdEyUtUDOKjFTmHWMveqnghuUg1FV', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVBNYXFjMU40QmJQWkp4SURJWXd1VWdiSTA5NXVrbVhYRG15NnpkQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079929),
('zdceVOlpy7gHl0Qhqmo3Oiz9yzfoWxkPuCqCgJMJ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjVPdnlHd25hdm00UXJCN3ZBeDRmMVNGejA5RDJqV3lyYVVlNjZJNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080515),
('ZDUVR5ZXzqy7ZMyjlcLqanPDn3RhV2z2i6erNljR', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGpqYUV5N3BtRUJRUHNlN0w1SEQ4dXhpblRlV3RremFvOGszUFEydCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080328),
('zfkFXLWoLAoANeh1rjxiYnsu7bJcgzg1PldeD2ti', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWJPU25rUUk3cEZDTkF1bzdEaG9QTlNJcVFMVWcwYmF5T3JheGZ1ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080018),
('ZfpCMqFSRIyuC36o7NmHh6NqJzDLPWxaKZECdZvq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVJiTTd6clY3VmUzMTlIZW5DR3JQYTAzRmRUbTNQR1VCMDRjaXgxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080409),
('ZgS0zm8LBUWd8B2bHRi51a2Em4UabaUxtqnOsrvj', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzZBN0RwZ3A1TE0wUTFpWkhvRXVBaGs0NkpFVUNxRGVHalBNTDMxcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079794),
('zgwCadZs2l9toG0QNt8cDdBlftkjbNlu2AWt0tOo', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDJNVW1UdE5zdmFQaG5XSVNEMEZ0bk1GbG8yZEpEYkphR0sxUGM5cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079830),
('Zh4WiNXDHE4xkWYrOFx5Zt9K430bjlGU8iqiwxtc', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzhCVzlDMmZlcXk1NjBLbmU3OG9zWU5zTTZ4V0d3cDBPZ3VOcWg1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080036),
('Zjnc66PB4lF1ZYENzf7rSpLHky6ygLq7NdCVAhpF', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTU9mOXlnYzJad1U0MDJhM1BJZmdDRWpMazdWdnV1YWpBZUkxWVlMOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080436),
('ZjUN9LX2qlCEvBSP4IRLFRgSHRQZDiKKF7SiupaZ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1NZWnU3cms4ZGhZNm9IbXR2YnpuWDZ5MXFhdDJOYjFYem5KeGJzbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080460),
('Zk6s5l0RB9s9UiTX7OwDX1vYWbHv2k1XyPVFbzFa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGV5cndnRlM2SDJkMFdoV0Q5M0drQ2taVEJTcXhsZElIV05Jak5VeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079875),
('ZM5IRJ2S4GiCkbFDKaBQD9nT2blRf8wG2aH1IEjq', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemNIbEpwVk1FMWdnUEgybEJQYWtVVlROTVZPb0lVMG9McFhNS29XQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079812),
('zNEd728LiAKWsen2JW6vUjh26OmTSBOUVPRAc6XK', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkRMSnBEQjJhT2RHWVVFY0ZKN0pkekZ1NzhTelBBZGk2Z2Z0cGpFOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079821),
('zNM2tWzk2CD8xS9SFX4Y9NvIUk0beoXJDpfon5nI', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiek1Nc0FUc1d0Y0Fka0ZsMXhVSU1Hc2QzdjBFeTBVd0I5aVhmUE4zNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079916),
('znqGGNX3BehRuxzYAPRDxxvhG9OQGGaVJYikRbyQ', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG1WTktySUJKeFF0RzRKYUpPdUZVVXFlMGptcFhOVlJIbVY4VlRiaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080092),
('zQihIkWKqRuh6Dhr4YIT5PPPBtbZqW1FsKdDrD7g', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTdCbnJSd0xMRjE2TGx0OU9YSWNzQ1lkNVJzSFRodDNPU3d2bFBieiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080255),
('Zsc5wT3T8YIz3RGfnZfSZsGebQaH9XPnhEJI3I8c', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVV0T1JQamV2TFRHSzZiQWZOeGVlb0VvTEFKWlp3TUZQUVlMUzUxNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079991),
('ZSgBpBY4QAiaaeNJD7RLkcu5LSdsAmaAUcXrSZkv', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWZuaE16WWNFRzRDUFdTejBZZ21UeFhpWkJkcXc4NWttV1RweWN1eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670079881),
('zSZ4s0JBt8TM8U3ZARCjEcaF0UXLBRfXyEML3LMa', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW5WbDdDVmxzcjdyakZqaG1nUnRHenpPVHlidU5aM1E5VVlJVjAxdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080109),
('ZuPoWxwoPEdH75827OJhT2fS5Ez75yNswRX1B9kx', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFFxS1UydUl6YWU3SjAwZUg3dnlzd09rMTZvWU1VMVBGbkJpMEp1MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080151),
('ZvoFGwv6Dwv8JwcQyuZGyB2HJwQMCQoDnY3hFrDy', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnRuakkyR051U0hPVG1kc0VnSzhndTlDYVZjS2RjaUlIV3Y0UzVMVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080041),
('zX24CzOkIrINEGT699QESngiwP0TdIBxRRAIymK6', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEtDVnJENVZlVXlock1zM2xIbnEyQUliakNmQXdrdXBPNlVoOTBJQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080061),
('Zxq3FJ5ssfNKgOhrtSBe1miXyfHsi0PhWYTdJY28', NULL, '178.128.82.227', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEdXdk14eW5IOWlCUkZqT0FFZXpKUmNTZHVWbW4xSVM3eXRjckpMNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670080530);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  `break_time` varchar(50) NOT NULL,
  `working_time` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `user_id`, `name`, `start_time`, `end_time`, `break_time`, `working_time`, `created_at`, `updated_at`) VALUES
(1, 2, 'Administrator update', '12:00', '12:00', '90min', '', '2021-10-20 13:06:23', '2021-10-22 08:41:31'),
(3, 2, 'Night', '18:00', '01:00', '20min', '', '2021-10-22 08:54:06', '2021-10-22 08:54:06'),
(4, 70, 'Night shift', '17:00', '05:00', '0', '12:00', '2022-02-08 06:46:22', '2022-04-01 05:31:14'),
(7, 72, 'Test', '17:00', '05:00', '0', '12:00', '2022-04-12 08:46:29', '2022-04-12 08:46:29'),
(8, 70, 'Day', '11:55', '12:20', '00:05', '00:00', '2022-05-18 14:19:25', '2022-09-21 11:49:00'),
(13, 70, 'coco', '18:30', '18:50', '00:10', '00:10', '2022-06-03 08:44:00', '2022-09-23 18:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `placebirth` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `nin` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `expiry_date` varchar(255) DEFAULT NULL,
  `identification_number` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `qualification_action` varchar(255) DEFAULT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `time_type` varchar(255) DEFAULT NULL,
  `hiring_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `stop_date` varchar(255) DEFAULT NULL,
  `restart_contract` varchar(100) DEFAULT NULL,
  `contract_status` varchar(255) DEFAULT NULL,
  `categorie_professionnelle` varchar(255) DEFAULT NULL,
  `echelon` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `monthly_salary` double(8,2) DEFAULT 0.00,
  `hourly_salary` double(8,2) DEFAULT 0.00,
  `overtime_salary` double(8,2) DEFAULT 0.00,
  `weekly_working_time` tinyint(4) DEFAULT 35,
  `daily_breaks_time` tinyint(4) DEFAULT 0,
  `holidays_per_year` tinyint(4) DEFAULT 0,
  `shift` varchar(255) DEFAULT NULL,
  `bonus_id` varchar(191) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `is_contact` tinyint(4) DEFAULT 0 COMMENT '0= contract, 1=suspended',
  `role_id` varchar(255) DEFAULT NULL,
  `night_amount_id` int(11) DEFAULT NULL,
  `transport_amount_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `current_plan` varchar(45) DEFAULT 'Basic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `name`, `gender`, `placebirth`, `nationality`, `nin`, `address`, `postcode`, `city`, `document_type`, `expiry_date`, `identification_number`, `qualification`, `qualification_action`, `contract_type`, `time_type`, `hiring_date`, `end_date`, `stop_date`, `restart_contract`, `contract_status`, `categorie_professionnelle`, `echelon`, `location_id`, `position`, `monthly_salary`, `hourly_salary`, `overtime_salary`, `weekly_working_time`, `daily_breaks_time`, `holidays_per_year`, `shift`, `bonus_id`, `status`, `is_contact`, `role_id`, `night_amount_id`, `transport_amount_id`, `updated_at`, `created_at`, `current_plan`) VALUES
(1, '2', NULL, 'FEMALE', 'sa', 'Bahrain', 'as', 'as', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5.00, 4.00, 3.00, 35, 2, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Basic'),
(2, '10', NULL, 'MALE', 'Paris', 'Argentina', '5533FD4566', '12 allée de paris', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1589.00, 12.00, 12.00, 39, 1, 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-03-28 15:43:54', NULL, 'Basic'),
(3, '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Basic'),
(4, '71', NULL, NULL, 'Paris', 'France', '344FFF3333', '12 rue de paris', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CDD Saisonnier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35, NULL, NULL, NULL, '$200,$300', NULL, 1, NULL, 2, 2, '2022-08-10 14:42:58', NULL, 'Basic'),
(5, '65', NULL, 'FEMALE', NULL, NULL, NULL, '2 chemin de maurens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CDD', 'Temps partiel', '2022-09-21', '2022-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35, 0, 0, NULL, '$300', NULL, 1, NULL, NULL, NULL, '2022-08-10 14:42:58', NULL, 'Basic');

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave`
--

CREATE TABLE `staff_leave` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `allDay` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_role`
--

CREATE TABLE `staff_role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `staff_role`
--

INSERT INTO `staff_role` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_role_permissions`
--

CREATE TABLE `staff_role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `menu_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_schedule`
--

CREATE TABLE `staff_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `allDay` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `color` varchar(64) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'accept', '#d5f1ea80\r\n', '2022-03-10 10:17:16', NULL),
(2, 'pending', '#fde4c880', '2022-03-10 10:17:17', NULL),
(3, 'refuse', '#ffdbdb80', '2022-03-10 10:17:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `stripe_status` varchar(255) DEFAULT NULL,
  `stripe_plan` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `team_id`, `name`, `stripe_id`, `stripe_status`, `stripe_plan`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`, `stripe_price`) VALUES
(21, 68, 'default', 'sub_1KIBetLHurbUYlc1diK6yBQI', 'active', 'GoldqPDNNt', 1, NULL, NULL, '2022-01-15 10:47:06', '2022-01-15 10:47:06', NULL),
(22, 69, 'default', 'sub_1KIESALHurbUYlc1OtTPiOrM', 'active', 'GoldqPDNNt', 1, NULL, NULL, '2022-01-15 13:46:09', '2022-01-15 13:46:09', NULL),
(23, 70, 'default', 'sub_1KIGx9LHurbUYlc1TPyWllSU', 'active', 'GoldqPDNNt', 1, NULL, NULL, '2022-01-15 16:26:19', '2022-01-15 16:26:19', NULL),
(24, 71, 'default', 'sub_1KIX78LHurbUYlc1XuFPotV2', 'active', 'GoldqPDNNt', 1, NULL, '2022-02-16 09:41:38', '2022-01-16 09:41:40', '2022-01-16 09:51:15', NULL),
(25, 72, 'default', 'sub_1KImbzLHurbUYlc1nKSZAOfH', 'active', 'GoldqPDNNt', 1, NULL, NULL, '2022-01-17 02:14:33', '2022-01-17 02:14:33', NULL),
(26, 73, 'default', 'sub_1KIu5hLHurbUYlc1SqPaBU6t', 'active', 'GoldqPDNNt', 1, NULL, '2022-02-17 10:13:41', '2022-01-17 10:13:44', '2022-01-17 10:23:38', NULL),
(27, 74, 'default', 'sub_1KLZAKLHurbUYlc1Zd3JzCVy', 'active', 'GoldqPDNNt', 1, NULL, NULL, '2022-01-24 18:29:30', '2022-01-24 18:29:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_cancelations`
--

CREATE TABLE `subscription_cancelations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_cancelations`
--

INSERT INTO `subscription_cancelations` (`id`, `team_id`, `reason`, `created_at`, `updated_at`) VALUES
(3, 71, 'Too expensive', '2022-01-16 09:51:15', '2022-01-16 09:51:15'),
(4, 73, 'Lacks features', '2022-01-17 10:23:38', '2022-01-17 10:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `stripe_plan` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_product` varchar(255) DEFAULT NULL,
  `stripe_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_plan`, `quantity`, `created_at`, `updated_at`, `stripe_product`, `stripe_price`) VALUES
(7, 21, 'si_Ky7uiM9hG85url', 'GoldqPDNNt', 1, '2022-01-15 10:47:06', '2022-01-15 10:47:06', NULL, NULL),
(8, 22, 'si_KyAn3chQtxpi96', 'GoldqPDNNt', 1, '2022-01-15 13:46:09', '2022-01-15 13:46:09', NULL, NULL),
(9, 23, 'si_KyDNAeoavlSCjB', 'GoldqPDNNt', 1, '2022-01-15 16:26:19', '2022-01-15 16:26:19', NULL, NULL),
(10, 24, 'si_KyU5dNdVmnkAtm', 'GoldqPDNNt', 1, '2022-01-16 09:41:40', '2022-01-16 09:41:40', NULL, NULL),
(11, 25, 'si_Kyk6HQS4UPISj2', 'GoldqPDNNt', 1, '2022-01-17 02:14:33', '2022-01-17 02:14:33', NULL, NULL),
(12, 26, 'si_KyrplA5ElTZ5cR', 'GoldqPDNNt', 1, '2022-01-17 10:13:44', '2022-01-17 10:13:44', NULL, NULL),
(13, 27, 'si_L1cPod5waEvJR7', 'GoldqPDNNt', 1, '2022-01-24 18:29:30', '2022-01-24 18:29:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `card_brand` varchar(255) DEFAULT NULL,
  `card_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `pm_type`, `pm_last_four`) VALUES
(1, 1, 'Admin\'s Team', 1, '2021-09-19 08:33:31', '2021-09-19 08:33:31', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Team', 1, '2021-09-19 08:55:38', '2021-09-21 15:37:27', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 'Test team', 0, '2021-09-22 06:58:41', '2021-09-22 06:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'Company team', 0, '2021-09-22 07:00:55', '2021-09-22 07:00:55', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 9, 'Decarero\'s Team', 1, '2021-09-27 18:07:01', '2021-09-27 18:07:01', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 17, 'Kader\'s Team', 1, '2021-11-17 14:18:58', '2021-11-17 14:18:58', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 18, 'sawas\'s Team', 1, '2021-11-17 16:24:00', '2021-11-17 16:24:00', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 19, 'Kader\'s Team', 1, '2021-11-18 15:28:37', '2021-11-18 15:28:37', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 20, 'Kader\'s Team', 1, '2021-11-18 15:29:37', '2021-11-18 15:29:37', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 21, 'Kader\'s Team', 1, '2021-11-18 15:30:19', '2021-11-18 15:30:19', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 22, 'Kader\'s Team', 1, '2021-11-18 15:31:42', '2021-11-18 15:31:42', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 'Encoder Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 23, 'Standard\'s Team', 1, '2021-11-25 09:40:54', '2021-11-25 09:40:54', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, 'Standard Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 24, 'Basic\'s Team', 1, '2021-11-25 12:39:49', '2021-11-25 12:39:49', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 0, 'Encoder Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 25, 'Standard\'s Team', 1, '2021-11-25 12:45:56', '2021-11-25 12:45:56', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 'Encoder Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 26, 'sawas\'s Team', 1, '2021-11-25 13:13:08', '2021-11-25 13:13:08', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 'salut Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 27, 'sawas\'s Team', 1, '2021-11-25 18:32:05', '2021-11-25 18:32:05', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, 'sawas Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 28, 'Nayem\'s Team', 1, '2021-11-29 15:49:07', '2021-11-29 15:49:07', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 0, 'Nayem Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 29, 'wetisalat\'s Team', 1, '2021-11-29 21:32:20', '2021-11-29 21:32:20', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 30, 'Sanjit\'s Team', 1, '2021-11-30 13:06:23', '2021-11-30 13:06:23', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 0, 'Sanjit Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 31, 'Maria\'s Team', 1, '2021-11-30 13:08:14', '2021-11-30 13:08:14', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 32, 'Maria\'s Team', 1, '2021-11-30 13:09:08', '2021-11-30 13:09:08', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 33, 'Maria\'s Team', 1, '2021-11-30 13:12:40', '2021-11-30 13:12:40', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 34, 'Demo\'s Team', 1, '2021-11-30 13:23:06', '2021-11-30 13:23:06', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 35, 'Demo\'s Team', 1, '2021-11-30 13:23:38', '2021-11-30 13:23:38', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 36, 'Maria\'s Team', 1, '2021-11-30 13:47:12', '2021-11-30 13:47:12', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 37, 'Maria\'s Team', 1, '2021-11-30 13:49:46', '2021-11-30 13:49:46', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 38, 'Maria\'s Team', 1, '2021-11-30 13:51:20', '2021-11-30 13:51:20', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 39, 'Maria\'s Team', 1, '2021-11-30 13:53:50', '2021-11-30 13:53:50', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 40, 'Naiem\'s Team', 1, '2021-11-30 14:01:49', '2021-11-30 14:01:49', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 41, 'Naiem\'s Team', 1, '2021-11-30 14:04:15', '2021-11-30 14:04:15', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 42, 'testing5\'s Team', 1, '2021-11-30 14:07:18', '2021-11-30 14:07:18', NULL, NULL, NULL, NULL, NULL, NULL),
(40, 43, 'Maria\'s Team', 1, '2021-11-30 14:21:35', '2021-11-30 14:21:35', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 44, 'Maria\'s Team', 1, '2021-11-30 14:22:13', '2021-11-30 14:22:13', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 0, 'Maria Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 45, 'Nusrat\'s Team', 1, '2021-11-30 14:24:17', '2021-11-30 14:24:17', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 46, 'Nusrat\'s Team', 1, '2021-11-30 14:27:10', '2021-11-30 14:27:10', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 47, 'Kamalkk\'s Team', 1, '2021-11-30 14:31:28', '2021-11-30 14:31:28', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 48, 'Doue\'s Team', 1, '2021-11-30 14:37:48', '2021-11-30 14:37:48', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 0, 'Doue Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 50, 'hotel\'s Team', 1, '2021-11-30 21:41:23', '2021-11-30 21:41:23', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 51, 'Local\'s Team', 1, '2021-12-01 01:02:14', '2021-12-01 01:02:14', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 0, 'Local Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 52, 'Testing\'s Team', 1, '2021-12-01 01:10:01', '2021-12-01 01:10:01', NULL, NULL, NULL, NULL, NULL, NULL),
(52, 0, 'Tesdadd Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 53, 'MyTest\'s Team', 1, '2021-12-01 06:30:59', '2021-12-01 06:30:59', NULL, NULL, NULL, NULL, NULL, NULL),
(54, 54, 'MyTest\'s Team', 1, '2021-12-01 06:32:32', '2021-12-01 06:32:32', NULL, NULL, NULL, NULL, NULL, NULL),
(55, 55, 'TestingDemo\'s Team', 1, '2021-12-01 06:35:35', '2021-12-01 06:35:35', NULL, NULL, NULL, NULL, NULL, NULL),
(56, 0, 'Testing Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 56, 'saw\'s Team', 1, '2021-12-01 13:30:37', '2021-12-01 13:30:37', NULL, NULL, NULL, NULL, NULL, NULL),
(58, 0, 'JEan Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 57, 'koko\'s Team', 1, '2021-12-01 13:36:14', '2021-12-01 13:36:14', NULL, NULL, NULL, NULL, NULL, NULL),
(60, 0, 'koko Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 58, 'llol\'s Team', 1, '2021-12-01 13:38:29', '2021-12-01 13:38:29', NULL, NULL, NULL, NULL, NULL, NULL),
(62, 0, 'lolo Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 59, 'Basic\'s Team', 1, '2021-12-01 23:47:49', '2021-12-01 23:47:49', NULL, NULL, NULL, NULL, NULL, NULL),
(64, 0, 'Basic Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 60, 'price\'s Team', 1, '2021-12-02 06:36:40', '2021-12-02 06:36:40', NULL, NULL, NULL, NULL, NULL, NULL),
(66, 0, 'price Teams', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 2, 'Jan', 0, '2022-01-10 07:13:15', '2022-01-10 07:13:15', NULL, NULL, NULL, NULL, NULL, NULL),
(68, 62, 'Simen\'s Team', 1, '2022-01-15 10:46:58', '2022-01-15 10:47:03', 'cus_Ky7uit3bPkuOkV', 'mastercard', '5454', NULL, NULL, NULL),
(69, 63, 'Creatydev01\'s Team', 1, '2022-01-15 13:46:01', '2022-01-15 13:46:06', 'cus_KyAneEK2eKdlSo', 'visa', '4242', NULL, NULL, NULL),
(70, 64, 'eau\'s Team', 1, '2022-01-15 16:26:10', '2022-01-15 16:26:15', 'cus_KyDNyzZBFyKrJy', 'visa', '4242', NULL, NULL, NULL),
(71, 66, 'toulouse\'s Team', 1, '2022-01-16 09:41:34', '2022-01-16 09:41:38', 'cus_KyU53SbpLNq3te', 'mastercard', '5454', NULL, NULL, NULL),
(72, 67, 'Simen\'s Team', 1, '2022-01-17 02:14:27', '2022-01-17 02:14:31', 'cus_Kyk6kHjpssTc6p', 'visa', '4242', NULL, NULL, NULL),
(73, 68, 'bounty\'s Team', 1, '2022-01-17 10:13:38', '2022-01-17 10:13:41', 'cus_KyrpjM9apjfIFP', 'mastercard', '5454', NULL, NULL, NULL),
(74, 70, 'test\'s Team', 1, '2022-01-24 18:29:24', '2022-01-24 18:29:28', 'cus_L1cP2UoctJf2bl', 'mastercard', '5454', NULL, NULL, NULL),
(75, 72, 'Reviewuser\'s Team', 1, '2022-04-12 00:02:04', '2022-04-12 00:02:04', 'cus_L1cP2UoctJf2bl', 'mastercard', '5454', NULL, NULL, NULL),
(76, 73, 'awdawdaw\'s Team', 1, '2022-10-19 07:39:17', '2022-10-19 07:39:17', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_invitations`
--

INSERT INTO `team_invitations` (`id`, `team_id`, `email`, `role`, `created_at`, `updated_at`) VALUES
(2, 3, 'test1@demo.com', 'admin', '2021-09-22 18:35:35', '2021-09-22 18:35:35'),
(3, 3, 'test23@demo.com', 'editor', '2021-09-24 04:00:28', '2021-09-24 04:00:28'),
(6, 3, 'test@demo.com', 'admin', '2021-09-22 18:34:10', '2021-09-22 18:34:10'),
(9, 3, 'decaretro@gmail.com', 'admin', '2021-09-27 18:24:35', '2021-09-27 18:24:35'),
(10, 4, 'test40@gmail.com', 'edit', NULL, NULL),
(11, 4, 'test@demo.com', 'editor', NULL, NULL),
(12, 3, 'eduardom@gmail.com', 'editor', NULL, NULL),
(13, 2, 'as', 'editor', NULL, NULL),
(14, 4, 'eduardom@gmail.com', 'editor', NULL, NULL),
(15, 2, 'tesvvv', 'editor', NULL, NULL),
(16, 2, 'prueba12@gmail.com', 'editor', NULL, NULL),
(17, 2, 'prueba123@gmail.com', 'editor', NULL, NULL),
(18, 2, 'john@demo.com', 'editor', NULL, NULL),
(19, 12, 'kadddadder152@demo.com', 'admin', NULL, NULL),
(20, 14, 'standard@demo.com', 'admin', NULL, NULL),
(21, 16, 'konock@demo.com', 'admin', NULL, NULL),
(22, 18, 'newtest@demo.com', 'admin', NULL, NULL),
(23, 20, 'sawas@hotmail.fr', 'admin', NULL, NULL),
(24, 22, 'sawas@hotmail.fr', 'admin', NULL, NULL),
(25, 24, 'nayem@demo.com', 'admin', NULL, NULL),
(26, 27, 'sanjit@demo.com', 'admin', NULL, NULL),
(27, 42, 'maria1@demo.com', 'admin', NULL, NULL),
(28, 47, 'doue@demo.com', 'admin', NULL, NULL),
(29, 46, 'testStaff@demo.com', 'editor', NULL, NULL),
(30, 50, 'localfree@demo.com', 'admin', NULL, NULL),
(31, 52, 'testomg@demo.com', 'admin', NULL, NULL),
(32, 56, 'testingDemo@demo.com', 'admin', NULL, NULL),
(33, 58, 'saw@demo.com', 'admin', NULL, NULL),
(34, 60, 'koko@demo.com', 'admin', NULL, NULL),
(35, 62, 'lolo@demo.com', 'admin', NULL, NULL),
(36, 64, 'basic@demo.com', 'admin', NULL, NULL),
(37, 66, 'prince@demo.com', 'admin', NULL, NULL),
(38, 59, 'kiki@demo.com', 'editor', NULL, NULL),
(39, 67, 'eduardo@gmail.com', 'editor', '2022-01-10 07:14:04', '2022-01-10 07:14:04');

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`id`, `team_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(6, 4, 10, 'editor', NULL, NULL),
(7, 3, 11, 'edit', NULL, NULL),
(8, 2, 12, 'edit', NULL, NULL),
(9, 4, 11, 'edit', NULL, NULL),
(10, 2, 13, 'edit', NULL, NULL),
(11, 2, 14, 'edit', NULL, NULL),
(12, 2, 15, 'edit', NULL, NULL),
(13, 2, 16, 'edit', NULL, NULL),
(14, 46, 49, 'edit', NULL, NULL),
(15, 59, 61, 'edit', NULL, NULL),
(16, 70, 65, NULL, '2022-01-15 16:46:57', '2022-01-15 16:46:57'),
(17, 73, 69, NULL, '2022-01-17 10:17:59', '2022-01-17 10:17:59'),
(18, 74, 71, NULL, '2022-01-24 18:32:10', '2022-01-24 18:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `theme_mode`
--

CREATE TABLE `theme_mode` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `theme_mode`
--

INSERT INTO `theme_mode` (`id`, `user_id`, `status`, `updated_at`, `created_at`) VALUES
(1, 2, 0, '2022-05-01 21:12:56', '2021-10-10 11:02:10'),
(2, 1, 0, '2022-05-01 21:12:56', '2021-10-10 11:12:39'),
(3, 4, 0, '2022-05-01 21:12:56', '2021-10-16 08:37:26'),
(4, 6, 0, '2022-05-01 21:12:56', '2021-10-16 14:23:54'),
(5, 22, 0, '2022-05-01 21:12:56', '2021-11-25 15:54:25'),
(6, 22, 1, '2022-05-01 21:12:56', '2021-11-25 15:54:25'),
(7, 27, 0, '2022-05-01 21:12:56', '2021-11-25 18:33:56'),
(8, 56, 1, '2022-05-01 21:12:56', '2021-12-01 13:34:34'),
(9, 3, 0, '2022-05-01 21:12:56', '2022-01-05 05:24:28'),
(10, 70, 0, '2022-08-30 08:16:44', '2022-01-24 18:34:23'),
(11, 71, 0, '2022-08-18 15:41:31', '2022-02-09 14:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `location_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` time NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time NOT NULL,
  `break` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `break_time` time NOT NULL,
  `total_time` time NOT NULL,
  `status` enum('Work','Break','Missing','Leave','Overtime','Vacation') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gps` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `overtime` time NOT NULL,
  `cash_tips` double(8,2) NOT NULL DEFAULT 0.00,
  `credit_tips` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `due_date` varchar(255) NOT NULL,
  `tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('','Important','Completed','Deleted') NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `user_id`, `title`, `assignee`, `due_date`, `tag`, `description`, `status`, `created_at`, `updated_at`) VALUES
(6, 2, 'Test again', '4,6', '23-10-2021', 'Low,Medium', '<p>Editing post</p>', '', '2021-10-23 00:32:12', '2021-10-24 05:38:10'),
(7, 6, 'Testing upo', '6', '23-10-2021', 'Low', '<p><span style=\"color: rgb(94, 88, 115);\">Description</span></p>', 'Completed', '2021-10-23 00:35:48', '2021-10-23 22:01:07'),
(8, 2, 'Test staff', '4,6', '23-10-2021', 'Low,High', '<p><span style=\"color: rgb(94, 88, 115);\">Description</span></p>', 'Completed', '2021-10-23 00:36:14', '2021-10-23 22:00:50'),
(9, 2, 'Section test', '6', '23-10-2021', 'Update', '<p>Descends</p><p><strong>En Bas</strong></p>', 'Important', '2021-10-23 04:11:19', '2021-10-23 21:59:57'),
(10, 2, 'Dimanche', '6', '28-10-2021', 'High', '<p>toulouse</p><p> <strong><em><u>Bordeaux</u></em></strong> </p>', 'Completed', '2021-10-24 04:01:12', '2021-10-24 04:03:03'),
(11, 2, 'Adam', '6', '26-10-2021', 'High', '<p>Adam regarde la <strong><em><u>TV</u></em></strong></p><p><a href=\"http://google.fr\" rel=\"noopener noreferrer\" target=\"_blank\">http://google.fr</a></p>', '', '2021-10-24 05:58:03', '2021-10-24 05:58:03'),
(12, 70, 'test todo', '71', '29-08-2022', 'Medium', '<p>gogoogo</p>', '', '2022-08-29 04:58:43', '2022-08-29 04:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `transport_amount`
--

CREATE TABLE `transport_amount` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `transport_amount`
--

INSERT INTO `transport_amount` (`id`, `user_id`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'nmm', 78.00, NULL, NULL),
(2, 70, 'Bus', 60.00, NULL, '2022-05-26 07:56:49'),
(3, 70, 'Car', 6.00, '2022-05-24 09:13:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT 1,
  `plan_id` int(11) DEFAULT NULL,
  `shift_id` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `fullname` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_code` text DEFAULT NULL,
  `two_factor_expires_at` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_id` int(11) DEFAULT 0,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `stripe_subscriptionId` varchar(191) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `last_login_at` varchar(45) DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `terms` varchar(45) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `is_subscription` tinyint(4) NOT NULL DEFAULT 0,
  `plan` varchar(200) DEFAULT NULL,
  `pri_name` varchar(100) DEFAULT NULL,
  `pri_relationship` varchar(100) DEFAULT NULL,
  `pri_phone` varchar(50) DEFAULT NULL,
  `sec_name` varchar(100) DEFAULT NULL,
  `sec_relationship` varchar(100) DEFAULT NULL,
  `sec_phone` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `role_id`, `plan_id`, `shift_id`, `status`, `name`, `firstname`, `lastname`, `fullname`, `username`, `email`, `email_verified_at`, `password`, `two_factor_code`, `two_factor_expires_at`, `remember_token`, `phone`, `address`, `country`, `city`, `postcode`, `birthday`, `current_team_id`, `staff_id`, `profile_photo_path`, `stripe_id`, `stripe_subscriptionId`, `provider`, `provider_id`, `last_login_at`, `last_login_ip`, `terms`, `website`, `note`, `is_subscription`, `plan`, `pri_name`, `pri_relationship`, `pri_phone`, `sec_name`, `sec_relationship`, `sec_phone`, `bank_name`, `account_no`, `ifsc_code`, `pan_no`, `created_at`, `updated_at`) VALUES
(1, 0, 0, NULL, NULL, 'active', 'Admin', NULL, NULL, NULL, 'a1', 'admin@demo.com', '2021-11-18 13:25:06', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', '337106', NULL, 'cFmnrWsn5rDf3x6odirWTfEcInFRwcqyJt3PckHyZK3YyXxEz6hW4MuU87Fh', NULL, NULL, '9-small.png', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-19 06:33:31', '2022-10-29 00:25:36'),
(2, 0, 1, NULL, NULL, 'active', 'User', 'Eduar1', 'Gon1', NULL, 'a2', 'user@demo.com', '2021-11-29 19:45:38', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', '474676', '2021-11-03 10:49:48', '426Q6S22sShF2bI74tMOzNbWCA8l02pH6D5wnYPdIZ458Kv3aCZvCIoD273o', '43242234', NULL, '9-small.png', 'asd', '213', '12-15-1298', 67, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'dd', 'dfsa', '858', 'ee', 'adsf', '888', NULL, NULL, NULL, NULL, '2021-09-19 06:55:38', '2022-03-29 01:25:30'),
(3, 2, 2, NULL, NULL, 'active', 'staff', NULL, NULL, NULL, 'a3', 'staff@demo.com', '2022-01-03 16:54:00', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', '207923', NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Test', 'test', '5555', 'ddd', '5dd', '55', NULL, NULL, NULL, NULL, NULL, '2022-05-12 12:21:55'),
(4, 2, 2, NULL, NULL, 'active', 'Eduardo', 'Eduardo', 'Gonzalez', NULL, 'a4', 'eduardo@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 2, NULL, NULL, 'active', 'Eduardo1', 'Eduardo', 'Gonzalez', NULL, 'a5', 'gonzalez@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, 2, NULL, NULL, 'active', 'teste', 'teste', 'test', NULL, 'a7', 'tes@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 2, NULL, NULL, 'active', 'test', 'test', 'tes', NULL, 'a8', 'Test51@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 1, NULL, NULL, 'active', 'Decarero', NULL, NULL, NULL, NULL, 'decaretro@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-27 16:07:01', '2021-09-27 16:07:01'),
(10, 2, 2, NULL, NULL, 'active', 'test', 'kevin first', 'kevin last', NULL, 'kevin', 'test40@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '0612121212', NULL, '9-small.png', 'Londre', '75000', '12/12/2000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 2, 2, NULL, NULL, 'active', 'Eduardo', 'Eduardo', 'Gonzalez', NULL, NULL, 'eduardom@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 2, 2, NULL, NULL, 'active', 'as', 'as', 'sa', NULL, NULL, 'as', NULL, '$2y$10$AMQ2FA9CX6N/V1H5z9eGO.DdD6U9rkmTdZnTc.oO/R6LYxAK.MILS', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 2, 2, NULL, NULL, 'active', 'prueba', 'prueba', 'prueba', NULL, NULL, 'prueba12@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 2, 2, NULL, NULL, 'active', 'Eduardo', 'Eduardo', 'Gonzalez', NULL, NULL, 'prueba123@gmail.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 2, 2, NULL, NULL, 'active', 'John', 'John', 'Doe', NULL, NULL, 'john@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 0, 1, 2, NULL, 'active', 'Kader', 'Encoder', 'Ultimate', NULL, NULL, 'kader12@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '356 525 4562', 'Address', 'BD', 'Dhaka', '7500', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-18 13:28:37', '2021-11-18 13:28:37'),
(20, 0, 1, 2, NULL, 'active', 'Kader', 'Encoder', 'Ultimate', NULL, NULL, 'kader152@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '356 525 4562', 'Address', 'BD', 'Dhaka', '7500', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-18 13:29:37', '2021-11-18 13:29:37'),
(21, 0, 1, 2, NULL, 'active', 'Kader', 'Encoder', 'Ultimate', NULL, NULL, 'kaddder152@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '356 525 4562', 'Address', 'BD', 'Dhaka', '7500', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-18 13:30:19', '2021-11-18 13:30:19'),
(22, 0, 1, 2, NULL, 'active', 'Kader', 'Encoder', 'Ultimate', NULL, NULL, 'kadddadder152@demo.com', '2021-11-18 13:31:55', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '356 525 4562', 'Address', 'BD', 'Dhaka', '7500', NULL, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-18 13:31:42', '2021-11-18 13:32:13'),
(23, 0, 1, 2, NULL, 'active', 'Standard', 'Standard', 'User', NULL, NULL, 'standard@demo.com', '2021-11-25 07:41:07', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '587 458 7458', 'House-5, Road-4', 'Bangladesh', 'Dhaka', '7500', NULL, 13, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-25 07:40:54', '2021-11-25 07:41:12'),
(24, 0, 1, 3, NULL, 'active', 'Basic', 'Encoder', 'update', NULL, NULL, 'konock@demo.com', '2021-11-25 10:40:04', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '545 855 4585', 'House-5, Road-4', 'Bangladesh', 'Dhaka', '7500', NULL, 15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-25 10:39:49', '2021-11-25 10:40:08'),
(25, 0, 1, 3, NULL, 'active', 'Standard', 'Encoder', 'Test5 update', NULL, NULL, 'newtest@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '855 555 5555', 'House-5, Road-4', 'Belarus', 'Dhaka', '55555', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-25 10:45:56', '2021-11-25 10:45:56'),
(27, 0, 1, 4, NULL, 'active', 'sawas', 'sawas', 'sisi', NULL, NULL, 'sawas@hotmail.fr', '2021-11-25 17:32:24', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '0292992999', '54 rue papa', 'Bangladesh', 'Paris', '65555', NULL, 21, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-25 16:32:05', '2021-11-25 16:36:04'),
(28, 0, 1, 3, NULL, 'active', 'Nayem', 'Nayem', 'Man', NULL, NULL, 'nayem@demo.com', '2021-11-29 13:49:23', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', '283904', NULL, 'nXRqkfwdriiUHIPXDHGqy2EXwknfnOsfYx9z4eQQ6azE0OOVaExGHvMDo1e7', '454 545 4545', 'House-5, Road-4', 'Australia', 'Dhaka', '75000', NULL, 23, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-29 13:49:07', '2021-11-29 13:51:02'),
(56, 0, 1, 11, NULL, 'active', 'saw', 'JEan', 'Charles', NULL, NULL, 'saw@demo.com', '2021-12-01 11:34:02', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '333 333 3333', '12 ueueuue', 'Brazil', 'Pan', '33333', NULL, 57, 0, NULL, 'cus_KhKMWVj8vWmB6E', 'sub_1K1vhbLHurbUYlc1G7wXx1W7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 11:30:37', '2021-12-01 11:34:20'),
(57, 0, 1, 11, NULL, 'active', 'koko', 'koko', 'barge', NULL, NULL, 'koko@demo.com', '2021-12-15 05:03:42', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', '701600', NULL, NULL, '555 555 5555', 'ko place', 'Brazil', 'koko', '32322', NULL, 59, 0, NULL, 'cus_KhKRmHkzWdsAis', 'sub_1K1vn1LHurbUYlc1GiJFA53L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 11:36:14', '2021-12-15 00:05:17'),
(58, 0, 1, 12, NULL, 'active', 'llol', 'lolo', 'fefe', NULL, NULL, 'lolo@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '222 222 2222', 'lazooaj', 'Belarus', 'ppa', '22222', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 11:38:29', '2021-12-01 11:38:29'),
(59, 0, 1, 16, NULL, 'active', 'Basic', 'Basic', 'Demo', NULL, NULL, 'basic@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '555 555 5458', 'House-611/B, 3rd floor, South Bishil, Mirpur-1, Dhaka-1216', 'Bangladesh', 'Dhaka', '1216', NULL, NULL, 0, NULL, 'cus_KhUJSyovoLzVfV', 'sub_1K25KtCxmUdqpjEzBRc52MQm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-01 21:47:49', '2021-12-01 21:47:52'),
(60, 0, 1, 11, NULL, 'active', 'price', 'price', 'due', NULL, NULL, 'prince@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, '327 737 7377', '123 rue papap', 'Bangladesh', 'Map', '34343', NULL, NULL, 0, NULL, 'cus_KhauFb8oA13SIP', 'sub_1K2BiYLHurbUYlc1xTEdYn7V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-02 04:36:40', '2021-12-02 04:36:45'),
(61, 72, 2, NULL, NULL, 'active', 'staff koko', 'staff koko', 'koko kiki', NULL, NULL, 'kiki@demo.com', NULL, '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 0, 1, NULL, NULL, 'active', 'Simen Online', 'Dukens', 'Thelemaque', NULL, NULL, 'info002@simenonline.com', NULL, '$2y$10$843UmrGAY9yDR0vwjYixieUO.hJ1b26bE721dpx3oa2qmtPqaduWm', NULL, NULL, NULL, '+50937703581', 'Bois verna', 'China', 'Port-au-Prince', 'HT126', NULL, 68, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-15 08:46:57', '2022-01-15 08:46:59'),
(63, 0, 1, NULL, NULL, 'active', 'Creatydev01', 'Dukens', 'Thelemaque', NULL, NULL, 'info28@simenonline.com', NULL, '$2y$10$.oSw16MJ7pdqmfme4.UF5.dgckqTQMkszoQSUPQtu8RLjhYQvpkoS', NULL, NULL, NULL, '954 268 1989', 'Bois verna', 'Brazil', 'Port-au-Prince', 'HT126', NULL, 69, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-15 11:46:01', '2022-01-15 11:46:02'),
(64, 0, 1, NULL, NULL, 'active', 'eau', 'eau', 'feu', NULL, NULL, 'eau@demo.com', '2022-01-15 15:26:53', '$2y$10$h.0HPR3ZnrEx/3ubLKeETe36taP7Np518Qq7TES7297Zt14xo2VMC', '795058', NULL, NULL, '0100102992', 'feu de bois', 'Australia', 'PAris', '96228', NULL, 70, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-15 14:26:10', '2022-01-15 14:52:38'),
(65, 70, 2, NULL, '8', 'active', 'lara doe', 'lara', 'doe', NULL, NULL, 'lara@demo.com', NULL, '$2y$10$r/PJnod0MKXy5uCnlnBkEeYg2dOhOfr0x5uZWaMnKLdk8rguHyi5.', NULL, NULL, NULL, '0612992299', NULL, '9-small.png', 'Cugnaux', '31270', NULL, 70, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ing', NULL, NULL, NULL, '2022-01-15 14:46:57', '2022-01-15 14:46:58'),
(66, 0, 1, NULL, NULL, 'active', 'toulouse', 'toulouse', 'paris', NULL, NULL, 'toulouse@demo.com', '2022-01-20 08:43:02', '$2y$10$wmE0lkBwquLqDUTqvkxBueDRYGxkEpbsMdtg26FxgTGsni40jxmkK', '655909', NULL, NULL, '019299299', 'rue de toulouse', 'France', 'toulouse', '31000', NULL, 71, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 07:41:34', '2022-01-16 09:08:12'),
(67, 0, 1, 17, NULL, 'active', 'Simen Online', 'Creatydev', 'Wilner', NULL, NULL, 'info26@simenonline.com', '2022-01-16 19:15:56', '$2y$10$uxp/EAhQEmI5Ho.IumD1EeZlNJMV1CHYcBaJGLC.UAWWS1EyDQG5.', NULL, NULL, NULL, '509 377 0358', 'Rue Jasmin #8', 'us', 'Port-au-Prince', 'HT126', NULL, 72, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-17 00:14:27', '2022-01-17 00:14:33'),
(68, 0, 1, 17, NULL, 'active', 'bounty company', 'bounty', 'ludo', NULL, NULL, 'bounty@demo.com', '2022-01-18 09:15:17', '$2y$10$ME7taZgnIkgTWPTWSVACkeEJsKRlgvP8zBh51N/7CiUaVfWKhFzV.', '509942', NULL, NULL, '1 200 202 002', '12 rue pieere', 'br', 'La courneuve', '93120', NULL, 73, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-17 08:13:38', '2022-01-17 08:22:40'),
(69, 68, 2, NULL, NULL, 'active', 'chooub patail', 'chooub', 'patail', NULL, NULL, 'chouby@demo.com', NULL, '$2y$10$Vf6Oa1fkVTJdTYl2CdXdzOc4hEXCTJy8/vBYGoi/fj3VpVNwMhAbC', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, 73, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-17 08:17:59', '2022-01-17 08:17:59'),
(70, 0, 1, 17, NULL, 'active', 'test comp', 'test', 'corp', NULL, NULL, 'user2@demo.com', '2022-01-24 17:31:07', '$2y$10$2eBxGYo0suLq4CDFHiG7W.TVyhT4ZHpYRmepkZgWzHzvYooxj8mMq', '938394', NULL, 'PgdaMihTKgjibJTxwk9TxA8K1tVIlQeUdtuO58Tb75acaeZ2q42jmxkE8DYt', '1 827 728 288', '12 rue blan', 'au', 'Paris', '33452', NULL, 74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-24 16:29:24', '2022-12-03 16:14:26'),
(71, 70, 2, NULL, '8', 'active', 'diana doe', 'diana', 'doe', NULL, NULL, 'staff2@demo.com', '2022-02-08 13:02:00', '$2y$10$fNtCTsonBn5vStArM9XI6uHrq1XeUisOK9e9udQLXo1rGjs6l9LNS', '810603', NULL, NULL, '123456789', NULL, '9-small.png', 'Paris', '95000', '12-12-1990', 74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Rakib', 'Friend', '012366548', 'Ishita', 'Wife', '012364578', 'Islamic Bank Bangladesh Ltd.', '11125458', '5455', '4444', '2022-01-24 16:32:10', '2022-12-03 16:12:36'),
(72, 0, 1, 18, NULL, 'active', 'Reviewuser', 'Review', 'deo', NULL, NULL, 'reviewuser@demo.com', '2022-04-12 06:03:17', '$2y$10$x0VrzYJMy6MeIwuvVuoBwOnqTOEvgS3KU5S2V0zBO.LbKg1L.G8dW', '733799', NULL, NULL, '0123654789', 'reviewAdd', '--', 'Dhja', '7500', NULL, 75, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-12 00:02:04', '2022-04-12 00:43:58'),
(73, 0, 1, NULL, NULL, 'active', 'awdawdaw', 'awdawd', 'awdawd', NULL, NULL, 'humamcak@hotmail.com', NULL, '$2y$10$ckGLVuEzcV7193iVHSYOTObIR1pHuKCtpaMlqkyyuPeiG0/3wcD4.', '613627', NULL, NULL, '1 234 567 890', 'awdawdad', 'au', 'awdawd', '52115', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-19 07:39:17', '2022-10-19 07:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `staff_id` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `leave_type` text DEFAULT NULL,
  `leave_paid` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allDay` tinyint(1) NOT NULL DEFAULT 0,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vacation`
--

INSERT INTO `vacation` (`id`, `user_id`, `staff_id`, `reason`, `leave_type`, `leave_paid`, `description`, `allDay`, `start`, `end`, `color`, `status`, `created_at`, `updated_at`) VALUES
(14, 70, '65', '5', NULL, NULL, NULL, 1, '2022-09-16T23:00', '2022-09-16T23:00', NULL, 1, '2022-09-16 20:54:04', NULL),
(15, 70, '65', '22', NULL, NULL, NULL, 1, '2022-09-30T00:00', '2022-09-30T23:59', NULL, 1, '2022-09-29 05:47:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vacation_type`
--

CREATE TABLE `vacation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(195) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `vacation_type`
--

INSERT INTO `vacation_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Vacation1', '2022-04-13 08:44:15', '2022-04-13 08:44:15'),
(2, 'Vacation2', '2022-04-13 08:44:15', '2022-04-13 08:44:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`),
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convention_code_ape`
--
ALTER TABLE `convention_code_ape`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convention_collective`
--
ALTER TABLE `convention_collective`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_category`
--
ALTER TABLE `leave_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_reasons`
--
ALTER TABLE `leave_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `lunch`
--
ALTER TABLE `lunch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lunch_amount`
--
ALTER TABLE `lunch_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `night_amount`
--
ALTER TABLE `night_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`),
  ADD UNIQUE KEY `plans_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave`
--
ALTER TABLE `staff_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_role`
--
ALTER TABLE `staff_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_role_permissions`
--
ALTER TABLE `staff_role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_schedule`
--
ALTER TABLE `staff_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_team_id_stripe_status_index` (`team_id`,`stripe_status`);

--
-- Indexes for table `subscription_cancelations`
--
ALTER TABLE `subscription_cancelations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_cancelations_team_id_index` (`team_id`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `theme_mode`
--
ALTER TABLE `theme_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_amount`
--
ALTER TABLE `transport_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacation_type`
--
ALTER TABLE `vacation_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `bonus`
--
ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `extra`
--
ALTER TABLE `extra`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leave`
--
ALTER TABLE `leave`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `leave_category`
--
ALTER TABLE `leave_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_reasons`
--
ALTER TABLE `leave_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `lunch`
--
ALTER TABLE `lunch`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lunch_amount`
--
ALTER TABLE `lunch_amount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `night_amount`
--
ALTER TABLE `night_amount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_leave`
--
ALTER TABLE `staff_leave`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_role`
--
ALTER TABLE `staff_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_schedule`
--
ALTER TABLE `staff_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subscription_cancelations`
--
ALTER TABLE `subscription_cancelations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `theme_mode`
--
ALTER TABLE `theme_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transport_amount`
--
ALTER TABLE `transport_amount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vacation_type`
--
ALTER TABLE `vacation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
