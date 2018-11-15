-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 03 Octobre 2011 à 00:09
-- Version du serveur: 5.1.43
-- Version de PHP: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `amalgame`
--

-- --------------------------------------------------------

--
-- Structure de la table `droit_autorisation`
--

CREATE TABLE IF NOT EXISTS `droit_autorisation` (
  `id_droit_autorisation` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_profil` bigint(20) NOT NULL,
  `id_droit_objet` bigint(20) NOT NULL,
  `autorisation` int(2) NOT NULL,
  PRIMARY KEY (`id_droit_autorisation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `droit_autorisation`
--


-- --------------------------------------------------------

--
-- Structure de la table `droit_objet`
--

CREATE TABLE IF NOT EXISTS `droit_objet` (
  `id_droit_objet` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_objet` varchar(15) NOT NULL,
  `cmt_objet` text NOT NULL,
  PRIMARY KEY (`id_droit_objet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `droit_objet`
--


-- --------------------------------------------------------

--
-- Structure de la table `droit_profil`
--

CREATE TABLE IF NOT EXISTS `droit_profil` (
  `id_profil` bigint(20) NOT NULL,
  `lb_profil` varchar(100) NOT NULL,
  `cmt_profil` text NOT NULL,
  PRIMARY KEY (`id_profil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `droit_profil`
--


-- --------------------------------------------------------

--
-- Structure de la table `element`
--

CREATE TABLE IF NOT EXISTS `element` (
  `id_element` bigint(20) NOT NULL AUTO_INCREMENT,
  `lb_element` varchar(50) NOT NULL,
  `cmt_court` text NOT NULL,
  `cmt_long` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `actif` int(1) NOT NULL,
  PRIMARY KEY (`id_element`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `element`
--


-- --------------------------------------------------------

--
-- Structure de la table `histo_element`
--

CREATE TABLE IF NOT EXISTS `histo_element` (
  `id_histo_element` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_element` bigint(20) NOT NULL,
  `cmt_histo` text NOT NULL,
  `id_utilisateur` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_histo_element`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `histo_element`
--


-- --------------------------------------------------------

--
-- Structure de la table `histo_profil`
--

CREATE TABLE IF NOT EXISTS `histo_profil` (
  `id_histo_profil` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_profil` bigint(20) NOT NULL,
  `cmt_histo` text NOT NULL,
  `id_utilisateur` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_histo_profil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `histo_profil`
--


-- --------------------------------------------------------

--
-- Structure de la table `histo_question`
--

CREATE TABLE IF NOT EXISTS `histo_question` (
  `id_histo_question` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_question` bigint(20) NOT NULL,
  `cmt_histo` text NOT NULL,
  `id_utilisateur` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_histo_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `histo_question`
--


-- --------------------------------------------------------

--
-- Structure de la table `histo_signe`
--

CREATE TABLE IF NOT EXISTS `histo_signe` (
  `id_histo_signe` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_signe` bigint(20) NOT NULL,
  `cmt_histo` text NOT NULL,
  `id_utilisateur` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_histo_signe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `histo_signe`
--


-- --------------------------------------------------------

--
-- Structure de la table `histo_utilisateur`
--

CREATE TABLE IF NOT EXISTS `histo_utilisateur` (
  `id_histo_utilisateur` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` bigint(20) NOT NULL,
  `cmt_histo` text NOT NULL,
  `id_utilisateurmodif` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_histo_utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `histo_utilisateur`
--


-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `no_action` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_joueur` int(11) DEFAULT NULL,
  `priorite` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `dateaction` datetime NOT NULL,
  PRIMARY KEY (`no_action`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=496 ;

--
-- Contenu de la table `log`
--

INSERT INTO `log` (`no_action`, `no_joueur`, `priorite`, `action`, `dateaction`) VALUES
(1, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 06:11:26'),
(2, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:12:25'),
(3, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:32:56'),
(4, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:33:01'),
(5, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:33:32'),
(6, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:34:31'),
(7, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:35:45'),
(8, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:42:16'),
(9, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:48:22'),
(10, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:48:23'),
(11, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:48:24'),
(12, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:48:37'),
(13, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:54:35'),
(14, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:54:36'),
(15, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:54:36'),
(16, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:00'),
(17, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:00'),
(18, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:00'),
(19, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:00'),
(20, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:07'),
(21, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:07'),
(22, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:07'),
(23, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:07'),
(24, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:07'),
(25, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:55:47'),
(26, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:57:04'),
(27, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:57:14'),
(28, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:57:15'),
(29, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 13:58:22'),
(30, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:00:27'),
(31, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:00:27'),
(32, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:01:08'),
(33, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:04:00'),
(34, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:04:27'),
(35, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:04:34'),
(36, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:05:22'),
(37, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:05:42'),
(38, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:05:43'),
(39, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:05:44'),
(40, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:05:44'),
(41, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:09:45'),
(42, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:11:29'),
(43, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:16:44'),
(44, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:17:13'),
(45, 112, 1, 'Le joueur n°112() possède l''IP : 127.0.0.1', '2011-09-27 14:17:14'),
(46, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-27 14:17:28'),
(47, 112, 1, 'Le joueur n°112(romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-27 14:17:28'),
(48, 112, 1, 'Le joueur n°112(romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-27 14:18:26'),
(49, NULL, 1, 'Tentative d''intrusion dans la partie administration de l''IP : 127.0.0.1', '2011-09-27 14:18:58'),
(50, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:09:05'),
(51, 112, 1, 'Le joueur n°112 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:09:16'),
(52, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:09:17'),
(53, 112, 1, 'Le joueur n°112 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:09:18'),
(54, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:09:18'),
(55, 112, 1, 'Le joueur n°112 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:09:19'),
(56, 112, 1, 'Le joueur n°112 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:09:24'),
(57, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:16:35'),
(58, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:24:48'),
(59, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:24:49'),
(60, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:25:13'),
(61, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:26:03'),
(62, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:26:03'),
(63, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:31:10'),
(64, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:31:12'),
(65, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:31:12'),
(66, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:32:37'),
(67, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:32:38'),
(68, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:33:06'),
(69, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:33:07'),
(70, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:33:17'),
(71, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:33:18'),
(72, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:33:23'),
(73, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:33:23'),
(74, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:33:27'),
(75, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:33:27'),
(76, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:33:31'),
(77, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:33:32'),
(78, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:33:38'),
(79, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:33:39'),
(80, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:34:05'),
(81, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:34:05'),
(82, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:34:44'),
(83, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:34:44'),
(84, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:35:31'),
(85, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:35:31'),
(86, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:35:53'),
(87, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:35:54'),
(88, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:36:02'),
(89, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:36:02'),
(90, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:37:10'),
(91, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:37:10'),
(92, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:37:55'),
(93, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:37:55'),
(94, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:38:03'),
(95, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:38:03'),
(96, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:38:06'),
(97, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:38:06'),
(98, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:38:52'),
(99, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:38:52'),
(100, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:38:59'),
(101, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:38:59'),
(102, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:40:34'),
(103, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:40:34'),
(104, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:44:38'),
(105, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:44:38'),
(106, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:44:46'),
(107, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:44:46'),
(108, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:44:56'),
(109, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:44:56'),
(110, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:45:06'),
(111, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:45:07'),
(112, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:45:11'),
(113, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:45:12'),
(114, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:45:16'),
(115, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:45:16'),
(116, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:45:52'),
(117, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:45:53'),
(118, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 00:46:34'),
(119, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 00:46:34'),
(120, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:31:40'),
(121, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:00'),
(122, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:31'),
(123, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:31'),
(124, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:32'),
(125, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:58'),
(126, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:59'),
(127, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:59'),
(128, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:33:59'),
(129, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:35:03'),
(130, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:35:14'),
(131, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:40:10'),
(132, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:40:37'),
(133, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:41:01'),
(134, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:41:16'),
(135, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:42:23'),
(136, NULL, 3, 'Tentative d''intrusion dans la partie administration de l''IP : 127.0.0.1', '2011-09-28 22:42:28'),
(137, 116, 1, 'Le joueur n°116 (dd@.com'';select * from joueur) possède l''IP : 127.0.0.1', '2011-09-28 22:43:19'),
(138, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:54:08'),
(139, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 22:54:19'),
(140, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 22:54:43'),
(141, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 22:59:39'),
(142, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 22:59:40'),
(143, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 23:00:22'),
(144, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 23:00:23'),
(145, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-28 23:01:18'),
(146, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-28 23:01:19'),
(147, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:41:35'),
(148, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:48:46'),
(149, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:48:47'),
(150, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:53:29'),
(151, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:53:29'),
(152, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:54:00'),
(153, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:54:00'),
(154, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:54:54'),
(155, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:54:54'),
(156, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:55:20'),
(157, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:55:20'),
(158, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:55:36'),
(159, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:55:37'),
(160, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:57:00'),
(161, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:57:00'),
(162, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 00:59:46'),
(163, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 00:59:46'),
(164, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:01:39'),
(165, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:01:39'),
(166, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:10:02'),
(167, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:13:51'),
(168, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:13:52'),
(169, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:13:54'),
(170, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:13:55'),
(171, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:13:55'),
(172, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:13:55'),
(173, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:14:18'),
(174, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:16:28'),
(175, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:16:29'),
(176, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:16:38'),
(177, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:16:38'),
(178, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:16:42'),
(179, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:16:55'),
(180, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:16:55'),
(181, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:18:26'),
(182, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:18:27'),
(183, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:20:57'),
(184, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:22:53'),
(185, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:22:53'),
(186, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:23:23'),
(187, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:23:24'),
(188, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:23:36'),
(189, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:23:36'),
(190, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:23:40'),
(191, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:23:40'),
(192, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:28:00'),
(193, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:28:00'),
(194, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:28:44'),
(195, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:28:45'),
(196, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:29:11'),
(197, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:29:11'),
(198, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:29:19'),
(199, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:29:19'),
(200, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:29:31'),
(201, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:29:31'),
(202, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:29:40'),
(203, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:29:40'),
(204, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:29:53'),
(205, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:29:53'),
(206, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:30:00'),
(207, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:30:00'),
(208, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:30:10'),
(209, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:30:10'),
(210, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:30:23'),
(211, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:30:23'),
(212, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:30:44'),
(213, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:30:44'),
(214, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:31:00'),
(215, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:31:00'),
(216, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:31:14'),
(217, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:31:15'),
(218, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:31:19'),
(219, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:31:19'),
(220, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:34:25'),
(221, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:34:26'),
(222, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:36:38'),
(223, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:36:38'),
(224, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:36:49'),
(225, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:36:49'),
(226, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:39:44'),
(227, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:39:44'),
(228, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:40:14'),
(229, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:40:14'),
(230, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:40:25'),
(231, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:40:25'),
(232, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:42:14'),
(233, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:42:15'),
(234, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:42:30'),
(235, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:42:30'),
(236, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:42:47'),
(237, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:42:47'),
(238, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:44:02'),
(239, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:44:02'),
(240, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:44:10'),
(241, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:44:10'),
(242, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:44:50'),
(243, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:44:50'),
(244, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:44:59'),
(245, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:44:59'),
(246, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:50:20'),
(247, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:50:35'),
(248, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:50:54'),
(249, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:51:23'),
(250, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:51:24'),
(251, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:53:38'),
(252, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:53:38'),
(253, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:37'),
(254, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:37'),
(255, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:41'),
(256, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:41'),
(257, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:47'),
(258, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:48'),
(259, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:49'),
(260, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:49'),
(261, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:50'),
(262, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:51'),
(263, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:51'),
(264, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:52'),
(265, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:52'),
(266, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:52'),
(267, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:53'),
(268, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:53'),
(269, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:53'),
(270, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:53'),
(271, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:54'),
(272, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:54'),
(273, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 01:54:54'),
(274, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 01:54:54'),
(275, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:01:32'),
(276, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:01:32'),
(277, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:02:03'),
(278, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:02:03'),
(279, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:02:38'),
(280, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:02:39'),
(281, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:02:59'),
(282, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:02:59'),
(283, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:04:30'),
(284, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:04:30'),
(285, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:09'),
(286, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:09'),
(287, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:37'),
(288, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:38'),
(289, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:52'),
(290, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:52'),
(291, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:55'),
(292, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:55'),
(293, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:56'),
(294, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:56'),
(295, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:57'),
(296, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:57'),
(297, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:58'),
(298, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:58'),
(299, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:59'),
(300, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:59'),
(301, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:05:59'),
(302, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:05:59'),
(303, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:06:00'),
(304, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:06:00'),
(305, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:06:01'),
(306, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:06:01'),
(307, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:06:02'),
(308, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:06:02'),
(309, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:06:02'),
(310, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:06:03'),
(311, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:06:03'),
(312, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:06:03'),
(313, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:06:03'),
(314, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:06:04'),
(315, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:07:55'),
(316, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:07:55'),
(317, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:07:57'),
(318, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:07:57'),
(319, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:07:58'),
(320, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:07:58'),
(321, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:07:59'),
(322, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:07:59'),
(323, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:07:59'),
(324, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:07:59'),
(325, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:08:01'),
(326, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:08:01'),
(327, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:09:14'),
(328, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:09:14'),
(329, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:09:19'),
(330, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:09:19'),
(331, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:12:58'),
(332, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:13:03'),
(333, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:13:15'),
(334, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:13:16'),
(335, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:13:50'),
(336, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:14:16'),
(337, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:14:29'),
(338, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:14:36'),
(339, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:14:56'),
(340, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:15:08'),
(341, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 02:15:08'),
(342, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:15:31'),
(343, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:15:38'),
(344, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:15:43'),
(345, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:15:51'),
(346, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:16:03'),
(347, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:16:45'),
(348, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:16:53'),
(349, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:16:57'),
(350, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:16:58'),
(351, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:17:48'),
(352, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:17:56'),
(353, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:17:57'),
(354, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:18:29'),
(355, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:18:35'),
(356, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:31:20'),
(357, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:32:42'),
(358, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:35:59'),
(359, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:02'),
(360, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:03'),
(361, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:04'),
(362, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:05'),
(363, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:06'),
(364, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:07'),
(365, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:36:08'),
(366, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:40:09'),
(367, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:40:11'),
(368, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:43:52'),
(369, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:46:06'),
(370, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 02:46:49'),
(371, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:46:58'),
(372, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 02:46:58'),
(373, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 02:48:13'),
(374, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:49:07'),
(375, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 02:49:07'),
(376, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 02:50:10'),
(377, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 02:57:02'),
(378, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 02:57:02'),
(379, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:00:25'),
(380, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 03:00:26'),
(381, 2, 1, 'Le joueur n°2 (Ali) possède l''IP : 127.0.0.1', '2011-09-29 03:00:41'),
(382, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:00:47'),
(383, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:01:13'),
(384, 120, 1, 'Le joueur n°120 (a@a.a) possède l''IP : 127.0.0.1', '2011-09-29 03:02:15'),
(385, 120, 1, 'Le joueur n°120 (a@a.a) possède l''IP : 127.0.0.1', '2011-09-29 03:02:23'),
(386, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:02:46'),
(387, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:02:51'),
(388, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:02:51'),
(389, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:02:56'),
(390, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:02:59'),
(391, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:02:59'),
(392, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:03:02'),
(393, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:03:05'),
(394, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:03:05'),
(395, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:03:08'),
(396, 1, 1, 'Le joueur n°1 (Alain) possède l''IP : 127.0.0.1', '2011-09-29 03:03:13'),
(397, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:11:16'),
(398, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:11:26'),
(399, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:11:26'),
(400, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:11:32'),
(401, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:11:40'),
(402, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:11:40'),
(403, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:11:41'),
(404, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:11:41'),
(405, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:11:42'),
(406, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:11:42'),
(407, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:22'),
(408, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:22'),
(409, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:23'),
(410, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:24'),
(411, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:24'),
(412, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:24'),
(413, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:25'),
(414, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:25'),
(415, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:26'),
(416, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:26'),
(417, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:26'),
(418, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:27'),
(419, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:12:27'),
(420, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:12:28'),
(421, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:14:46'),
(422, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:14:46'),
(423, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:14:48'),
(424, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:14:49'),
(425, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:14:50'),
(426, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:14:50'),
(427, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:15:03'),
(428, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:15:05'),
(429, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:15:06'),
(430, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:14'),
(431, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:25'),
(432, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:37'),
(433, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:37'),
(434, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:45'),
(435, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:46'),
(436, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:47'),
(437, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:47'),
(438, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:49'),
(439, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:49'),
(440, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:50'),
(441, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:50'),
(442, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:51'),
(443, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:52'),
(444, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:16:53'),
(445, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:16:53'),
(446, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:23:26'),
(447, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:23:26'),
(448, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:23:48'),
(449, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:23:52'),
(450, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:23:52'),
(451, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:24:22'),
(452, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:32:11'),
(453, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:32:12'),
(454, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:37:15'),
(455, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:37:16'),
(456, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:37:32'),
(457, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:37:32'),
(458, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 03:41:48'),
(459, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 03:41:48'),
(460, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 04:32:08'),
(461, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 04:32:32'),
(462, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 04:32:32'),
(463, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 04:40:26'),
(464, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 04:44:20'),
(465, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 04:44:21'),
(466, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 05:26:37'),
(467, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 05:26:37'),
(468, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 05:26:56'),
(469, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 05:32:44'),
(470, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 05:35:02'),
(471, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 05:37:12'),
(472, 115, 1, 'Le joueur n°115 (romain_chapon@hotmail.com) possède l''IP : 127.0.0.1', '2011-09-29 05:39:46'),
(473, 121, 1, 'Le joueur n°121 (romain_chapon@hotmail.com) possède l IP : 127.0.0.1', '2011-09-29 05:51:25'),
(474, 122, 1, 'Le joueur n°122 (romain_chapon@hotmail.com) possède l IP : 127.0.0.1', '2011-09-29 06:01:49'),
(475, NULL, 1, 'connexion de l''IP : 127.0.0.1', '2011-09-29 06:08:55'),
(476, 122, 1, 'Le joueur n°122 (romain_chapon@hotmail.com) possède l IP : 127.0.0.1', '2011-09-29 06:08:55'),
(477, 122, 1, 'IP : 127.0.0.1 joueur n°122 (romain_chapon@hotmail.com)', '2011-09-29 06:13:11'),
(478, NULL, 1, 'IP : 127.0.0.1 Connexion', '2011-09-29 06:13:50'),
(479, 122, 1, 'IP : 127.0.0.1 joueur n°122 (romain_chapon@hotmail.com)', '2011-09-29 06:13:51'),
(480, NULL, 1, 'IP : 127.0.0.1 Connexion', '2011-10-02 23:09:13'),
(481, 122, 1, 'IP : 127.0.0.1 joueur n°122 (romain_chapon@hotmail.com)', '2011-10-02 23:15:04'),
(482, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:15:56'),
(483, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:17:19'),
(484, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:20:10'),
(485, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:20:22'),
(486, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:20:29'),
(487, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:20:30'),
(488, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:20:47'),
(489, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:20:50'),
(490, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:40:58'),
(491, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:41:31'),
(492, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:42:38'),
(493, 122, 1, 'IP : 127.0.0.1 joueur n°122 (Le Ch@p''$)', '2011-10-02 23:49:57'),
(494, NULL, 1, 'IP : 127.0.0.1 Connexion', '2011-10-03 00:07:41'),
(495, NULL, 1, 'IP : 127.0.0.1 Connexion', '2011-10-03 00:08:10');

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

CREATE TABLE IF NOT EXISTS `parametre` (
  `id_param` varchar(20) NOT NULL DEFAULT '',
  `lbparam` longtext NOT NULL,
  `descparam` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_param`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `parametre`
--

INSERT INTO `parametre` (`id_param`, `lbparam`, `descparam`) VALUES
('TITLE_PAGE', 'Le Prénom', 'Titre pour Affichage page WEB'),
('CHEMIN_STYLE', 'templates/style.css', 'Style de présentation'),
('STYLE_JQUERY', 'flick/jquery-ui-1.8.16.custom.css', 'Style de la bib Javascript JQUERY'),
('VERSION', 'Version Rototo 11.9.15', 'Version');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id_question` bigint(20) NOT NULL AUTO_INCREMENT,
  `actif` int(1) NOT NULL,
  PRIMARY KEY (`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `question`
--


-- --------------------------------------------------------

--
-- Structure de la table `questionelement`
--

CREATE TABLE IF NOT EXISTS `questionelement` (
  `id_questionelement` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_question` bigint(20) NOT NULL,
  `id_element` bigint(20) NOT NULL,
  `id_signe` int(11) NOT NULL,
  PRIMARY KEY (`id_questionelement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `questionelement`
--


-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
  `id_response` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_question` bigint(20) NOT NULL,
  PRIMARY KEY (`id_response`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `reponse`
--


-- --------------------------------------------------------

--
-- Structure de la table `reponseelement`
--

CREATE TABLE IF NOT EXISTS `reponseelement` (
  `id_responseelement` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_response` bigint(20) NOT NULL,
  `id_element` bigint(20) NOT NULL,
  `id_signe` int(11) NOT NULL,
  PRIMARY KEY (`id_responseelement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `reponseelement`
--


-- --------------------------------------------------------

--
-- Structure de la table `signe`
--

CREATE TABLE IF NOT EXISTS `signe` (
  `id_signe` int(11) NOT NULL AUTO_INCREMENT,
  `lb_signe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_signe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `signe`
--


-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_profil` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motdepasse` varchar(255) NOT NULL,
  `actif` int(1) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `utilisateur`
--

