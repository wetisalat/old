-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2022 at 08:52 PM
-- Server version: 10.6.7-MariaDB-2ubuntu1
-- PHP Version: 8.0.19

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `user_id`, `lunch_id`, `vacation_id`, `extra_id`, `paid`, `amount`, `cost`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(21, 70, '1', NULL, NULL, 0, '70.00', 35, 2, 1, NULL, NULL),
(22, 70, NULL, '1', NULL, 1, NULL, 0, 0, 0, NULL, NULL),
(23, 70, NULL, '1', NULL, 1, NULL, 0, 0, 0, NULL, NULL),
(24, 70, NULL, '2', NULL, 0, '25.00', 5, 5, 1, NULL, NULL);

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
  `arrival_hour` time NOT NULL,
  `break_duration` time DEFAULT NULL,
  `break_hour` time DEFAULT NULL,
  `late` time DEFAULT NULL,
  `late_time` time DEFAULT NULL,
  `departure_date` varchar(50) DEFAULT NULL,
  `departure_hour` time DEFAULT NULL,
  `departure_picture` varchar(191) DEFAULT NULL,
  `gps_out` mediumtext DEFAULT NULL,
  `hours_worked` varchar(50) DEFAULT NULL,
  `over_time` time DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT 'attendance_status',
  `is_end` int(11) NOT NULL,
  `week_number` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `transport` varchar(32) DEFAULT NULL,
  `extra` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL,
  `staff_status` int(11) DEFAULT 2 COMMENT 'staff_attendance_status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `arrival_picture`, `gps_in`, `arrival_date`, `arrival_hour`, `break_duration`, `break_hour`, `late`, `late_time`, `departure_date`, `departure_hour`, `departure_picture`, `gps_out`, `hours_worked`, `over_time`, `status`, `is_end`, `week_number`, `comment`, `transport`, `extra`, `location`, `staff_status`, `created_at`, `updated_at`) VALUES
(44, 71, 'https://time.memohi.fr/uploads/picture/1653936290.png', '2B Chem. de Maurens, 31270 Cugnaux, France', '2022-05-30', '20:44:00', NULL, '20:45:00', NULL, NULL, NULL, NULL, NULL, NULL, '00:01:07', NULL, 'off', 0, NULL, NULL, NULL, NULL, NULL, 2, '2022-05-30 16:44:50', '2022-05-30 16:45:09');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contract_type`
--

INSERT INTO `contract_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Contract 1', '2022-03-10 03:45:36', NULL),
(2, 'Contract 2', '2022-03-10 03:45:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `convention_code_ape`
--

CREATE TABLE `convention_code_ape` (
  `id` int(11) NOT NULL,
  `convention_collective_id` int(11) NOT NULL,
  `code_ape_id` varchar(50) NOT NULL,
  `code_ape_text` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `user_id`, `date`, `type`, `salary`, `attachment`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(23, 3, '01/16/2022', 'Carburant', '22', '1642362391.pdf', 'ordo', 0, '2022-01-16 17:46:31', '2022-01-16 18:20:09'),
(24, 71, '10-03-2022', 'Carburant', '120', '1646916828.png', 'comment', 0, '2022-03-10 10:53:48', '2022-03-10 10:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `extra`
--

CREATE TABLE `extra` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`id`, `user_id`, `staff_id`, `reason`, `description`, `allDay`, `start`, `end`, `color`, `status`, `created_at`, `updated_at`) VALUES
(41, 71, '71', '2', 'papa', 1, '2022-04-01T00:00', '2022-04-01T23:59', NULL, 2, '2022-05-01 21:12:56', NULL),
(42, 70, '71', '1', 'comme', 1, '2022-03-29T00:00', '2022-03-30T00:00', NULL, 1, '2022-05-01 21:12:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_reasons`
--

CREATE TABLE `leave_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `paid` int(11) DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_reasons`
--

INSERT INTO `leave_reasons` (`id`, `name`, `paid`, `time_limit`, `created_at`, `updated_at`) VALUES
(1, 'Reason 1', NULL, NULL, '2022-03-10 05:45:36', NULL),
(2, 'test', 1, 33, '2022-03-10 05:45:36', '2022-05-24 08:44:41'),
(3, 'Congé', 1, 55, '2022-05-24 08:42:50', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `user_id`, `name`, `immatriculation`, `medicine`, `medicine_id`, `address`, `postcode`, `city`, `country`, `productivity`, `conventioncollective_id`, `code_ape_id`, `shift_id`, `status`, `bonus`, `rules`, `created_at`, `updated_at`) VALUES
(3, '48', 'New Comp', 'New', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'House-611/B, 3rd floor, South Bishil, Mirpur-1, Dhaka-1216', '1216', 'Dhaka', 'BD', 50.00, 6, '11.07A', '49', 1, NULL, NULL, '2021-11-30 03:44:35', '2021-11-30 03:44:35'),
(5, '2', 'New', 'New', 'MEDECINE INTERNE ETABLISSEMENT', '002', 'House-611/B, 3rd floor, South Bishil, Mirpur-1, Dhaka-1216', '1216', 'Dhaka', 'BD', 50.00, 6, '11.07A', '4,5', 1, NULL, NULL, '2021-12-01 00:23:54', '2021-12-01 00:23:54'),
(6, '2', 'Testagain', 'Test', 'MEDECINE INTERNE ETABLISSEMENT', '001', 'Address', '7500', 'Ddd', 'AF', 50.00, 7, '1071B', '4', 1, NULL, NULL, '2022-01-10 07:19:58', '2022-01-10 07:19:58'),
(7, '2', 'Test', 'DAD', 'MEDECINE INTERNE ETABLISSEMENT', '002', 'Address', '7500', 'Dhaks', 'AF', 50.00, 6, '11.05Z', '4', 1, NULL, NULL, '2022-02-08 01:19:55', '2022-02-08 01:19:55'),
(9, '70', 'Speedy', 'AZRC23553', 'MEDECINE INTERNE ETABLISSEMENT', '001', '12 rue de la paix', '32000', 'Auch', 'FR', 10.00, 6, '11.05Z', '', 1, NULL, '#rules3', '2022-02-08 04:48:24', '2022-04-04 01:04:36'),
(10, '70', 'Testing', 'test###2222', 'MEDECINE INTERNE ETABLISSEMENT', '006', 'Adred---484', '7500', 'Dhaka', 'BD', 50.00, 6, '11.07A', '65,71', 1, '$200,$300', '#rules3', '2022-04-01 21:58:45', '2022-04-14 20:52:53'),
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
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `night_amount`
--

CREATE TABLE `night_amount` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `user_id`, `staff_id`, `shift_id`, `location_id`, `todo_id`, `days`, `start`, `pause`, `end`, `lunch`, `description`, `color`, `created_at`, `updated_at`) VALUES
(131, 70, '71', '4', '9', NULL, 'true', '2022-03-03T17:00', NULL, '2022-03-04T05:00', NULL, NULL, '#5ac8fa', '2022-03-24 05:48:29', NULL),
(132, 70, '71', NULL, NULL, NULL, 'true', '2022-03-30T00:00', NULL, '2022-03-30T23:59', NULL, NULL, '#5ac8fa', '2022-03-28 07:57:37', NULL),
(133, 70, '71', '8', '12', NULL, 'false', '2022-05-20T18:00', NULL, '2022-05-19T16:26', NULL, NULL, '#4baf4f', '2022-05-19 14:26:56', NULL),
(134, 70, '71', '8', '12', NULL, 'false', '2022-05-20T18:00', NULL, '2022-05-19T16:26', NULL, NULL, '#4baf4f', '2022-05-19 14:26:57', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0EFlu4GDSbTAQ8Iz1vkxinAiGhv055zkpRFxzi2c', NULL, '5.190.82.17', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWpldXNqNG9pTHJmc3NvM0hadVVyVENJbjlJZVU3cHZKdlZVNmIyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653934534),
('7y2E9OZ9aXa82zEN8fLgWTB8kyVBfg1egnyfFnS6', NULL, '154.209.125.54', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMkw1M083UlJMOUttOXZIb1VyUnRzTW9wbkRKa3BoazVONUg2eTRZeiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNDoiaHR0cDovLzE1OS42NS4xMjEuNDQvMmZhIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0LzJmYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1653931258),
('aP6Pp2UElpBQ0cdW18cJHP0PCGGxNrwv455tW9Ym', NULL, '86.69.237.96', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWx1NHdoc2VxdEVXaE5pVGlLU2lVTHNOZTI0TmVKQ3F6U01heHdhSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9tZW1vaGkuZnIvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653936203),
('B84ASCeWvgqYY1iqV0ubTAEXYHXlu1KD332wNVJZ', NULL, '54.78.80.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:81.0) Gecko/20100101 Firefox/81.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEprSjNRVkRQdHR2OGo3TWRmMlk2V3hVRVNHWmRrYm5pMjZ6MWhxdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9tZW1vaGkuZnIvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653931670),
('bc6KH9bdq6FAYpPs7vgvfvNdS9BrwEe55kqugMY1', NULL, '54.78.80.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:81.0) Gecko/20100101 Firefox/81.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzhZb1c4aGN1V2RvZXRlZzE0dGxtczBFNVdlT0Z6THVjQmU4eDBwTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovL21lbW9oaS5mci8yZmEiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovL21lbW9oaS5mci8yZmEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653931670),
('DbiEPJQE8Xq1qhRvYKw960R4OnwGHZN2nSfY1Wlw', NULL, '212.47.251.118', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWN4ZURHUjhnZTNOMGdKVW1aNmNJYkNwb01sVGQxUFdmUGtNbDJlVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8va29zbHVrLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1653930791),
('ddvh7vHxLjn9SngNjhzNYeYUkZQQtBHD3NCIuoMl', NULL, '46.161.27.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/536.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUExRa2s2d1U4bTdzakt5VjBQcWV5ck5qVGlKSWZxUTR2WXdlU1pHaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9tZW1vaGkuZnIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653931184),
('DGoyd0vRTH2IldMlZ3eTDMwNVXM8intbBxmfXfee', 70, '86.69.237.96', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZnphMlFNakpCeGRtNWhkenRPSFN5dDUwSEdOcWp6Y2U3VVNyM2tEdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vbWVtb2hpLmZyL2F0dGVuZGFuY2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NzA7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQyZUJ4R1lvMHN1THE0Q0RGSGlHN1cuVFZ5aFQ0WkhwWVJtZXBrWmdXekh6dllvb3hqOG1NcSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkMmVCeEdZbzBzdUxxNENERkhpRzdXLlRWeWhUNFpIcFlSbWVwa1pnV3pIenZZb294ajhtTXEiO3M6ODoidXNlcl8yZmEiO2k6NzA7fQ==', 1653934317),
('Dju4UcJOvkLM7eOFbH2Lyq6XuPUQZOWgQPKjlt1m', NULL, '154.209.125.54', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1NnUDd3ZFJvZ1pRWXc0ZklrZDZ4R0tpcDh5M0tHQTNuS2JFSERlSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xNTkuNjUuMTIxLjQ0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653931257),
('fAtQkS2MEC15rib66kTL1o8JdplMBrfvfn49FVWi', NULL, '86.69.237.96', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/102.0.5005.67 Mobile/15E148 Safari/604.1', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6InNJS0E4b1VjSDVXTGZRam8zWURGZktwek5wUE51aXNqUllsUUNiaGgiO3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjI6Imh0dHBzOi8vdGltZS5tZW1vaGkuZnIiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyODoiaHR0cHM6Ly90aW1lLm1lbW9oaS5mci9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoidXNlciI7czowOiIiO3M6OToibG9naW5UaW1lIjtzOjA6IiI7czoxMDoiYXR0cmlidXRlcyI7czowOiIiO3M6NToiYnJlYWsiO3M6MDoiIjtzOjU6ImhvdXJzIjtzOjA6IiI7czo3OiJtZXNzYWdlIjtzOjI5OiJZb3UgYXJlIGxvZ291dCBTdWNjZXNzZnVsbHkgISI7fQ==', 1653936313),
('ftftnptcBLUcopmVOvwXRYhdbMqft8FN2jIyWfKS', NULL, '58.19.45.253', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSnM4WDRmd1ZPV3J3WVJOWjk5MXpUMkg0ZFhFNUdtWEIwcjhnSUpNWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653932507),
('fUa2GvdS0nABEjv4j12Wya8EgheWumDNv30U94P2', NULL, '46.161.27.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/536.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEpiSEdwVnhSYlR6S1dpVlZVUVlWcEJRRWdXeWtZdVYxVVIxV0FsdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9tZW1vaGkuZnIvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653931184),
('gMBA4uhkGqSqaaDmR71jBlq2OxUyjXAsYqQZvVMb', NULL, '119.60.105.128', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlQ4TzUwYkg5b1kyMHRLcDRSMlMxeE1BR245bVhxd3U3QUNTMGhjdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly93d3cubWluZ2h1aS5vcmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653932512),
('haYq7Taj8Zdejj7FGLsaPgtOmQYy6i7SNDvByGsf', NULL, '58.19.45.253', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzRpUTR5MWJwRHg0cHF3ME52NXRyVldOMk9xUHBDd0JKaVJlNHVlMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxOToiaHR0cDovLzExMC4yNDIuNjguNCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1653932506),
('ieJwnrRwQW3dSi7ZQ7hFlanKwmw5EvMp9j2ymF5z', 70, '86.69.237.96', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoib2pqTFNlYnQ1SW1wZDlpdDYyRlRsOFFlWXpPMXhWRVdLRThxSFZreSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9tZW1vaGkuZnIvYXR0ZW5kYW5jZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo3MDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDJlQnhHWW8wc3VMcTRDREZIaUc3Vy5UVnloVDRaSHBZUm1lcGtaZ1d6SHp2WW9veGo4bU1xIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQyZUJ4R1lvMHN1THE0Q0RGSGlHN1cuVFZ5aFQ0WkhwWVJtZXBrWmdXekh6dllvb3hqOG1NcSI7czo4OiJ1c2VyXzJmYSI7aTo3MDt9', 1653936328),
('KsPNPBarEwL8Wk2ACttkLhL52LbMf8byIX3Pxka7', NULL, '104.248.4.49', 'Mozilla/4.0 (compatible; Netcraft Web Server Survey)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQUNmaEtRWVBHaWlyMGNndkdIck45WFBCU2x0ZEZnVWEyUlJieHlPciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653935314),
('lDIE9YZkGfNryl7FuYfSANliztNoWXoB5BE8leSn', NULL, '220.250.63.164', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkczWHRaOFBtc2xSR3R4aWJUdUpKRDAyeU5LaU5XRmExcVB0Z0dqZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly93d3cuZXBvY2h0aW1lcy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653932512),
('mKuaIkW4FqcxcZwk93G7qRaA7YEtcSSDzd61amEb', NULL, '54.78.80.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:81.0) Gecko/20100101 Firefox/81.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW5ITHdnWmxwTGpSUWlDazY1VmduYnRhazQ2U0JocFVXQ2Rwd25ScSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9tZW1vaGkuZnIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653931670),
('NITxqoQwEC45QiB0sOSaVuUvhpkKCFjD7nBs4Roi', NULL, '86.69.237.96', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:101.0) Gecko/20100101 Firefox/101.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmRUdHc4c09HbGNhazdsb0lLa2xkR0pLcTRQdmNRM0w0dnFBQk82ZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovL21lbW9oaS5mci8yZmEiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovL21lbW9oaS5mci8yZmEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653936202),
('NLWusgkKfWbGTFJTuvLX3rMg7beNrGMX1CsPqyti', NULL, '171.37.206.88', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNndQVmhwdkhIWGRUcEp3VFNFRW5kZFpCN1MxTE9DampITlpLV1F3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly93d3cud3VqaWVsaXVsYW4uY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653932510),
('Oe5eIe7XzAcPcJz4WP7h4a4Gq8oInURQiCH2GrOM', NULL, '124.227.31.60', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGlXeHVXV1RyOUJhYmNsck1FRDhSTzVLdHFVRm9VeUMyc3RIVVNSYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly93d3cuc29zby5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653932508),
('QiGhhpmasm5t76LmBX4PVwcyiu2fNrV9kGhflFwL', NULL, '193.106.191.48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUdxS2NSTzg4ckpjQmhMUVNYUFFtM0xwQXhUTGJjOXZpekVONVJYcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vMTU5LjY1LjEyMS40NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1653932179),
('S6Sw9n36IWtJlQg0VKosApzXYZlAvyUhrRFF5SVv', NULL, '58.19.45.253', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibmVLbnJORm5NWWZHV1pGS3BoS1prUnVHVFVEdGtaWFZOa0JkMHRZdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653932506),
('vPnsc1MBwgdY8xyDACTetbjEZAcExUsGVZTW3WJN', NULL, '124.227.31.60', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHhncmtmcFNGMUhFQXhDWVJnaXB6QzBUTk0wbEF5SG14MTBBUGRqeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly93d3cuc29zby5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653932507),
('X0hmdYeVltb3X44F5vKfmbAxHJpF3eu87nh0OAhr', NULL, '46.161.27.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/536.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTGpVeHJ0bXNFNEJXcnZ6QlBwemlPZ04ybktRQ2c2Z3VMVXc2RWhqNiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMDoiaHR0cDovL21lbW9oaS5mci8yZmEiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMDoiaHR0cDovL21lbW9oaS5mci8yZmEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653931184),
('xtyiPjEKvN0RxtItvoJi0m00RjcFSOD94RuNzb54', NULL, '86.69.237.96', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/102.0.5005.67 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ3ZYbGdlWWpFZzBkZ1hRVENKN25CdjI4b2t2c1g3ZEhrU3dJV2ZneSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMjoiaHR0cHM6Ly90aW1lLm1lbW9oaS5mciI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIyOiJodHRwczovL3RpbWUubWVtb2hpLmZyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653936267),
('zY78rhNosJ2UeWe2wej9oVfMGNiH8Gj6QqB9cGx8', NULL, '124.227.31.60', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSmRNeTF0MmFNYklZWGhiMUlZeGlWM1BVSFkzbzRndWtWRDdVQkdSbiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMzoiaHR0cDovL3d3dy5zb3NvLmNvbS8yZmEiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMzoiaHR0cDovL3d3dy5zb3NvLmNvbS8yZmEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1653932508);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_time` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_time` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `break_time` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `working_time` varchar(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
(8, 70, 'Day', '17:00', '03:00', '0', '14:00', '2022-05-18 14:19:25', '2022-05-18 15:06:31'),
(10, 70, 'test shift', '20:00', '21:00', '00:30', 'aN:aN', '2022-05-30 18:43:13', '2022-05-30 18:43:13');

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
  `qualification` varchar(255) DEFAULT NULL,
  `qualification_action` varchar(255) DEFAULT NULL,
  `contract_type` varchar(191) DEFAULT NULL,
  `hiring_date` varchar(255) DEFAULT NULL,
  `stop_date` varchar(255) DEFAULT NULL,
  `restart_contract` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `name`, `gender`, `placebirth`, `nationality`, `nin`, `address`, `postcode`, `city`, `qualification`, `qualification_action`, `contract_type`, `hiring_date`, `stop_date`, `restart_contract`, `location_id`, `position`, `monthly_salary`, `hourly_salary`, `overtime_salary`, `weekly_working_time`, `daily_breaks_time`, `holidays_per_year`, `shift`, `bonus_id`, `status`, `is_contact`, `role_id`, `night_amount_id`, `transport_amount_id`, `updated_at`, `created_at`, `current_plan`) VALUES
(1, '2', NULL, 'FEMALE', 'sa', 'Bahrain', 'as', 'as', NULL, NULL, NULL, NULL, '2', '15262', NULL, NULL, NULL, NULL, 5.00, 4.00, 3.00, 35, 2, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Basic'),
(2, '10', NULL, 'MALE', 'Paris', 'Argentina', '5533FD4566', '12 allée de paris', NULL, NULL, NULL, NULL, '2', '12/12/2020', NULL, NULL, NULL, NULL, 1589.00, 12.00, 12.00, 39, 1, 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-03-28 15:43:54', NULL, 'Basic'),
(3, '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Basic'),
(4, '71', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '04-25-2022', NULL, NULL, 10, 'Manager', 0.00, 0.00, 0.00, 35, NULL, NULL, NULL, '$200,$300', NULL, 1, NULL, 2, 2, '2022-05-19 14:25:04', NULL, 'Basic'),
(5, '65', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 10, 'Cleaner', 0.00, 0.00, 0.00, 35, 0, 0, NULL, '$300', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'Basic');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff_role`
--

CREATE TABLE `staff_role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_schedule`
--

INSERT INTO `staff_schedule` (`id`, `title`, `start`, `end`, `allDay`, `color`, `user_id`) VALUES
(8, 'New event', '2021-12-15T10:00', '2021-12-15T11:00', 0, '#cc6599', 2),
(9, 'New event', '2021-12-14T10:00', '2021-12-14T11:00', 0, '#cc6599', 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(75, 72, 'Reviewuser\'s Team', 1, '2022-04-12 00:02:04', '2022-04-12 00:02:04', 'cus_L1cP2UoctJf2bl', 'mastercard', '5454', NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(10, 70, 0, '2022-05-01 21:12:56', '2022-01-24 18:34:23'),
(11, 71, 0, '2022-05-01 21:12:56', '2022-02-09 14:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_id` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `date` date NOT NULL,
  `location_id` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `time` time NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time NOT NULL,
  `break` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `break_time` time NOT NULL,
  `total_time` time NOT NULL,
  `status` enum('Work','Break','Missing','Leave','Overtime','Vacation') CHARACTER SET utf8mb4 NOT NULL,
  `gps` mediumtext CHARACTER SET utf8mb4 NOT NULL,
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
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `assignee` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `due_date` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tag` text CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `status` enum('','Important','Completed','Deleted') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
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
(11, 2, 'Adam', '6', '26-10-2021', 'High', '<p>Adam regarde la <strong><em><u>TV</u></em></strong></p><p><a href=\"http://google.fr\" rel=\"noopener noreferrer\" target=\"_blank\">http://google.fr</a></p>', '', '2021-10-24 05:58:03', '2021-10-24 05:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `transport_amount`
--

CREATE TABLE `transport_amount` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `role_id`, `plan_id`, `shift_id`, `status`, `name`, `firstname`, `lastname`, `fullname`, `username`, `email`, `email_verified_at`, `password`, `two_factor_code`, `two_factor_expires_at`, `remember_token`, `phone`, `address`, `country`, `city`, `postcode`, `birthday`, `current_team_id`, `staff_id`, `profile_photo_path`, `stripe_id`, `stripe_subscriptionId`, `provider`, `provider_id`, `last_login_at`, `last_login_ip`, `terms`, `website`, `note`, `is_subscription`, `plan`, `pri_name`, `pri_relationship`, `pri_phone`, `sec_name`, `sec_relationship`, `sec_phone`, `bank_name`, `account_no`, `ifsc_code`, `pan_no`, `created_at`, `updated_at`) VALUES
(1, 0, 0, NULL, NULL, 'active', 'Admin', NULL, NULL, NULL, 'a1', 'admin@demo.com', '2021-11-18 13:25:06', '$2y$10$jakoh.UN6HtUWlSfl3jI1ub80zPGWkRDyqcIkWiBsWtH/0Upsj1Du', '289254', NULL, '4NEH6MOGOQ2df2iJYdVnsKoPSrljBTazhgTb6vP11v6JSW0eCMaL42JREmu2', NULL, NULL, '9-small.png', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-19 06:33:31', '2022-05-24 08:40:55'),
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
(65, 70, 2, NULL, '6', 'active', 'lara doe', 'lara', 'doe', NULL, NULL, 'lara@demo.com', NULL, '$2y$10$r/PJnod0MKXy5uCnlnBkEeYg2dOhOfr0x5uZWaMnKLdk8rguHyi5.', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, 70, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-15 14:46:57', '2022-01-15 14:46:58'),
(66, 0, 1, NULL, NULL, 'active', 'toulouse', 'toulouse', 'paris', NULL, NULL, 'toulouse@demo.com', '2022-01-20 08:43:02', '$2y$10$wmE0lkBwquLqDUTqvkxBueDRYGxkEpbsMdtg26FxgTGsni40jxmkK', '655909', NULL, NULL, '019299299', 'rue de toulouse', 'France', 'toulouse', '31000', NULL, 71, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-16 07:41:34', '2022-01-16 09:08:12'),
(67, 0, 1, 17, NULL, 'active', 'Simen Online', 'Creatydev', 'Wilner', NULL, NULL, 'info26@simenonline.com', '2022-01-16 19:15:56', '$2y$10$uxp/EAhQEmI5Ho.IumD1EeZlNJMV1CHYcBaJGLC.UAWWS1EyDQG5.', NULL, NULL, NULL, '509 377 0358', 'Rue Jasmin #8', 'us', 'Port-au-Prince', 'HT126', NULL, 72, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-17 00:14:27', '2022-01-17 00:14:33'),
(68, 0, 1, 17, NULL, 'active', 'bounty company', 'bounty', 'ludo', NULL, NULL, 'bounty@demo.com', '2022-01-18 09:15:17', '$2y$10$ME7taZgnIkgTWPTWSVACkeEJsKRlgvP8zBh51N/7CiUaVfWKhFzV.', '509942', NULL, NULL, '1 200 202 002', '12 rue pieere', 'br', 'La courneuve', '93120', NULL, 73, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-17 08:13:38', '2022-01-17 08:22:40'),
(69, 68, 2, NULL, NULL, 'active', 'chooub patail', 'chooub', 'patail', NULL, NULL, 'chouby@demo.com', NULL, '$2y$10$Vf6Oa1fkVTJdTYl2CdXdzOc4hEXCTJy8/vBYGoi/fj3VpVNwMhAbC', NULL, NULL, NULL, NULL, NULL, '9-small.png', NULL, NULL, NULL, 73, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-17 08:17:59', '2022-01-17 08:17:59'),
(70, 0, 1, 17, NULL, 'active', 'test comp', 'test', 'corp', NULL, NULL, 'user2@demo.com', '2022-01-24 17:31:07', '$2y$10$2eBxGYo0suLq4CDFHiG7W.TVyhT4ZHpYRmepkZgWzHzvYooxj8mMq', '881845', NULL, '8ybwB0dFPJV2HzgRFmI5JS92eYkMLHmXgqhQOetShfnZzJ0lCz3pGD8GJnC2', '1 827 728 288', '12 rue blan', 'au', 'Paris', '33452', NULL, 74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-24 16:29:24', '2022-05-30 16:38:34'),
(71, 70, 2, NULL, '10', 'active', 'diana doe', 'diana', 'doe', NULL, NULL, 'staff2@demo.com', '2022-02-08 13:02:00', '$2y$10$fNtCTsonBn5vStArM9XI6uHrq1XeUisOK9e9udQLXo1rGjs6l9LNS', '640864', NULL, NULL, '123456789', NULL, '9-small.png', NULL, NULL, NULL, 74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'Rakib', 'Friend', '012366548', 'Ishita', 'Wife', '012364578', 'Islamic Bank Bangladesh Ltd.', '11125458', '5455', '4444', '2022-01-24 16:32:10', '2022-05-28 08:09:41'),
(72, 0, 1, 18, NULL, 'active', 'Reviewuser', 'Review', 'deo', NULL, NULL, 'reviewuser@demo.com', '2022-04-12 06:03:17', '$2y$10$x0VrzYJMy6MeIwuvVuoBwOnqTOEvgS3KU5S2V0zBO.LbKg1L.G8dW', '733799', NULL, NULL, '0123654789', 'reviewAdd', '--', 'Dhja', '7500', NULL, 75, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-12 00:02:04', '2022-04-12 00:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacation`
--

INSERT INTO `vacation` (`id`, `user_id`, `staff_id`, `reason`, `description`, `allDay`, `start`, `end`, `color`, `status`, `created_at`, `updated_at`) VALUES
(41, 71, '71', '2', 'papa', 1, '2022-04-01T00:00', '2022-04-01T23:59', NULL, 2, '2022-05-01 21:12:56', NULL),
(42, 70, '71', '1', 'comme', 1, '2022-03-29T00:00', '2022-03-30T00:00', NULL, 2, '2022-05-01 21:12:56', NULL),
(43, 70, '71', '1', 'papa', 1, '2022-04-02T00:00', '2022-04-02T23:59', NULL, 2, '2022-05-01 21:12:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vacation_type`
--

CREATE TABLE `vacation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(195) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `bonus`
--
ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
-- AUTO_INCREMENT for table `leave_reasons`
--
ALTER TABLE `leave_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transport_amount`
--
ALTER TABLE `transport_amount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
