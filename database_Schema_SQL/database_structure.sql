CREATE DATABASE  IF NOT EXISTS `tripitto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tripitto`;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: tripitto
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id_activity` int(11) NOT NULL AUTO_INCREMENT,
  `last_connexion_date` date DEFAULT NULL,
  `nb_like_action` int(11) DEFAULT NULL,
  `nb_comment_action` int(11) DEFAULT NULL,
  `nb_being_mentioned` int(11) DEFAULT NULL,
  `nb_video` int(11) DEFAULT NULL,
  `total_nb_views` int(11) DEFAULT NULL,
  `nb_user_views` int(11) DEFAULT NULL,
  `nb_playlist` int(11) DEFAULT NULL,
  `nb_message_received` int(11) DEFAULT NULL,
  `nb_message_sent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_history_like_comment`
--

DROP TABLE IF EXISTS `change_history_like_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_history_like_comment` (
  `id_change_history_like_comment` int(11) NOT NULL AUTO_INCREMENT,
  `action_comment_like` varchar(45) DEFAULT NULL,
  `author_comment_like` varchar(150) DEFAULT NULL,
  `object_concerned_comment_like` varchar(45) DEFAULT NULL,
  `field_concerned_comment_like` varchar(200) DEFAULT NULL,
  `old_value_comment_like` varchar(300) DEFAULT NULL,
  `new_value_comment_like` varchar(300) DEFAULT NULL,
  `change_date_comment_like` date DEFAULT NULL,
  PRIMARY KEY (`id_change_history_like_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_history_profil`
--

DROP TABLE IF EXISTS `change_history_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_history_profil` (
  `id_change_history_user` int(11) NOT NULL AUTO_INCREMENT,
  `action_user` varchar(45) DEFAULT NULL,
  `author_user` varchar(150) DEFAULT NULL,
  `object_concerned_user` varchar(45) DEFAULT NULL,
  `field_concerned_user` varchar(200) DEFAULT NULL,
  `old_value_user` varchar(300) DEFAULT NULL,
  `new_value_user` varchar(300) DEFAULT NULL,
  `change_date_user` date DEFAULT NULL,
  `profil_id_profil` int(11) NOT NULL,
  PRIMARY KEY (`id_change_history_user`),
  KEY `fk_change_history_user_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_change_history_user_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_history_travel_step`
--

DROP TABLE IF EXISTS `change_history_travel_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_history_travel_step` (
  `id_change_history_travel_step` int(11) NOT NULL AUTO_INCREMENT,
  `action_travel_step` varchar(45) DEFAULT NULL,
  `author_travel_step` varchar(150) DEFAULT NULL,
  `object_concerned_travel_step` varchar(45) DEFAULT NULL,
  `field_concerned_travel_step` varchar(200) DEFAULT NULL,
  `old_value_travel_step` varchar(300) DEFAULT NULL,
  `new_value_travel_step` varchar(300) DEFAULT NULL,
  `change_date_travel_step` date DEFAULT NULL,
  PRIMARY KEY (`id_change_history_travel_step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_history_video`
--

DROP TABLE IF EXISTS `change_history_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_history_video` (
  `id_change_history_video` int(11) NOT NULL AUTO_INCREMENT,
  `action_video` varchar(45) DEFAULT NULL,
  `author_video` varchar(150) DEFAULT NULL,
  `object_concerned_video` varchar(45) DEFAULT NULL,
  `field_concerned_video` varchar(200) DEFAULT NULL,
  `old_value_video` varchar(300) DEFAULT NULL,
  `new_value_video` varchar(300) DEFAULT NULL,
  `change_date_video` date DEFAULT NULL,
  `profil_id_profil` int(11) NOT NULL,
  PRIMARY KEY (`id_change_history_video`),
  KEY `fk_change_history_video_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_change_history_video_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `video_comment` text,
  `action_date_comment` date DEFAULT NULL,
  `author_comment` varchar(150) DEFAULT NULL,
  `comment` text,
  `delete_date_comment` date DEFAULT NULL,
  `delete_author` varchar(150) DEFAULT NULL,
  `general_video_id_general_video` int(11) NOT NULL,
  `popularity_id_popularity` int(11) DEFAULT NULL,
  `profil_id_profil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_comment_general_video1_idx` (`general_video_id_general_video`),
  KEY `fk_comment_popularity1_idx` (`popularity_id_popularity`),
  KEY `fk_comment_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_comment_general_video1` FOREIGN KEY (`general_video_id_general_video`) REFERENCES `general_video` (`id_general_video`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_popularity1` FOREIGN KEY (`popularity_id_popularity`) REFERENCES `popularity` (`id_popularity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment_has_change_history_like_comment`
--

DROP TABLE IF EXISTS `comment_has_change_history_like_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_has_change_history_like_comment` (
  `comment_id_comment` int(11) NOT NULL,
  `change_history_like_comment_id_change_history_like_comment` int(11) NOT NULL,
  PRIMARY KEY (`comment_id_comment`,`change_history_like_comment_id_change_history_like_comment`),
  KEY `fk_comment_has_change_history_like_comment_change_history_l_idx` (`change_history_like_comment_id_change_history_like_comment`),
  KEY `fk_comment_has_change_history_like_comment_comment1_idx` (`comment_id_comment`),
  CONSTRAINT `fk_comment_has_change_history_like_comment_change_history_lik1` FOREIGN KEY (`change_history_like_comment_id_change_history_like_comment`) REFERENCES `change_history_like_comment` (`id_change_history_like_comment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_has_change_history_like_comment_comment1` FOREIGN KEY (`comment_id_comment`) REFERENCES `comment` (`id_comment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_request`
--

DROP TABLE IF EXISTS `contact_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_request` (
  `id_contact_request` int(11) NOT NULL AUTO_INCREMENT,
  `author_contact_request` varchar(150) DEFAULT NULL,
  `send_date` date NOT NULL,
  `msg_object` varchar(100) DEFAULT NULL,
  `recipient` varchar(150) NOT NULL,
  `message_sent` text NOT NULL,
  `profil_id_profil` int(11) NOT NULL,
  PRIMARY KEY (`id_contact_request`),
  KEY `fk_contact_request_profil_idx` (`profil_id_profil`),
  CONSTRAINT `fk_contact_request_profil` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continent` (
  `id_continent` int(11) NOT NULL AUTO_INCREMENT,
  `continent_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_continent`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id_favorites` int(11) NOT NULL AUTO_INCREMENT,
  `favorites_video` text,
  `nb_video_favorites` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_favorites`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorites_has_profil`
--

DROP TABLE IF EXISTS `favorites_has_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites_has_profil` (
  `favorites_id_favorites` int(11) NOT NULL,
  `profil_id_profil` int(11) NOT NULL,
  PRIMARY KEY (`favorites_id_favorites`,`profil_id_profil`),
  KEY `fk_favorites_has_profil_profil1_idx` (`profil_id_profil`),
  KEY `fk_favorites_has_profil_favorites1_idx` (`favorites_id_favorites`),
  CONSTRAINT `fk_favorites_has_profil_favorites1` FOREIGN KEY (`favorites_id_favorites`) REFERENCES `favorites` (`id_favorites`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_has_profil_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follower`
--

DROP TABLE IF EXISTS `follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follower` (
  `id_follower` int(11) NOT NULL AUTO_INCREMENT,
  `follower_user` varchar(150) DEFAULT NULL,
  `follower` varchar(150) DEFAULT NULL,
  `follower_date` date DEFAULT NULL,
  `follower_picture` varchar(255) DEFAULT NULL,
  `follower_nb_video` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_follower`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `id_following` int(11) NOT NULL AUTO_INCREMENT,
  `following_user` varchar(150) DEFAULT NULL,
  `following` varchar(150) DEFAULT NULL,
  `following_date` date DEFAULT NULL,
  `following_picture` varchar(255) DEFAULT NULL,
  `following_nb_video` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_following`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `general_video`
--

DROP TABLE IF EXISTS `general_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_video` (
  `id_general_video` int(11) NOT NULL AUTO_INCREMENT,
  `video_position` int(11) DEFAULT NULL,
  `video_title` varchar(100) DEFAULT NULL,
  `video_description` text,
  `video_link` text,
  `video_user` varchar(150) DEFAULT NULL,
  `video_size` int(11) DEFAULT NULL,
  `video_duration` varchar(45) DEFAULT NULL,
  `format` varchar(45) DEFAULT NULL,
  `resolution` varchar(45) DEFAULT NULL,
  `loading_time` varchar(45) DEFAULT NULL,
  `video_status` varchar(45) DEFAULT NULL,
  `equipment` text,
  `equipment2` text,
  `equipment3` text,
  `link_equipment` text,
  `link_equipment2` text,
  `link_equipment3` text,
  `cover_picture` text,
  `number_tips` int(11) DEFAULT NULL,
  `profil_id_profil` int(11) NOT NULL,
  PRIMARY KEY (`id_general_video`),
  KEY `fk_general_video_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_general_video_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `liked`
--

DROP TABLE IF EXISTS `liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liked` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `video_like` text,
  `action_date_like` date DEFAULT NULL,
  `author_like` varchar(150) DEFAULT NULL,
  `delete_date_like` date DEFAULT NULL,
  `popularity_id_popularity` int(11) NOT NULL,
  `profil_id_profil` int(11) NOT NULL,
  `general_video_id_general_video` int(11) NOT NULL,
  PRIMARY KEY (`id_like`),
  KEY `fk_like_popularity1_idx` (`popularity_id_popularity`),
  KEY `fk_like_profil1_idx` (`profil_id_profil`),
  KEY `fk_like_general_video1_idx` (`general_video_id_general_video`),
  CONSTRAINT `fk_like_general_video1` FOREIGN KEY (`general_video_id_general_video`) REFERENCES `general_video` (`id_general_video`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_popularity1` FOREIGN KEY (`popularity_id_popularity`) REFERENCES `popularity` (`id_popularity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id_notification` int(11) NOT NULL AUTO_INCREMENT,
  `preference_language` enum('FR','EN') NOT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `newsletter_date` date DEFAULT NULL,
  `newsletter_date_out` date DEFAULT NULL,
  `notification_online_video` tinyint(1) DEFAULT NULL,
  `notification_comment` tinyint(1) DEFAULT NULL,
  `notification_mention` tinyint(1) DEFAULT NULL,
  `notification_follower` tinyint(1) DEFAULT NULL,
  `notification_video_following` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(150) DEFAULT NULL,
  `playlist_name` varchar(100) DEFAULT NULL,
  `creation_date_playlist` date DEFAULT NULL,
  `delete_date_playlist` date DEFAULT NULL,
  `nb_video_playlist` int(11) DEFAULT NULL,
  `playlist_videos` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_playlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `popularity`
--

DROP TABLE IF EXISTS `popularity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popularity` (
  `id_popularity` int(11) NOT NULL AUTO_INCREMENT,
  `nb_views` int(11) DEFAULT NULL,
  `nb_like_popularity` int(11) DEFAULT NULL,
  `nb_comment_popularity` int(11) DEFAULT NULL,
  `nb_share` int(11) DEFAULT NULL,
  `nb_playlist_included` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_popularity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `id_profil` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `pseudo` varchar(45) DEFAULT NULL,
  `identity` enum('lui','elle','equipe') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `location` varchar(36) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `type` enum('visiteur','videaste') DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `profil_link` varchar(100) DEFAULT NULL,
  `nb_countries_visited` int(11) DEFAULT NULL,
  `profile_picture` text,
  `profil` enum('Passionné de voyage','Créateur de contenu','Photographe & Vidéaste','Blogueur voyage','Autre') DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `ingredients` enum('Aventurier d''abord','Les copains d''abord','Escapade romantique','En famille','Digital nomad','Iles  Plages','Montagnes  Campagnes','Safari & Animaux','Grandes villes','En foret','Sport & Aventures','Festivals & Musique','Plaisir culinaire','Histoire & Culture','Spiritualité','Humanitaire','Ecotourise','Luxe','En sac à dos','Rencontres d''exceptions') DEFAULT NULL,
  `option_msg` tinyint(1) DEFAULT NULL,
  `facebook_link` text,
  `instagram_link` text,
  `website_link` text,
  `inscription_date` date DEFAULT NULL,
  `inscription_type` varchar(45) DEFAULT NULL,
  `password` char(250) DEFAULT NULL,
  `password_forget` char(250) DEFAULT NULL,
  `checked_option_msg` tinyint(4) DEFAULT NULL,
  `is_checked_her` varchar(45) DEFAULT NULL,
  `is_checked_team` varchar(45) DEFAULT NULL,
  `is_checked_him` varchar(45) DEFAULT NULL,
  `New_password` varchar(250) DEFAULT NULL,
  `isAdmin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_profil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_has_change_history_profil`
--

DROP TABLE IF EXISTS `profil_has_change_history_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_has_change_history_profil` (
  `profil_id_profil` int(11) NOT NULL,
  `change_history_profil_id_change_history_user` int(11) NOT NULL,
  PRIMARY KEY (`profil_id_profil`,`change_history_profil_id_change_history_user`),
  KEY `fk_profil_has_change_history_profil_change_history_profil1_idx` (`change_history_profil_id_change_history_user`),
  KEY `fk_profil_has_change_history_profil_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_profil_has_change_history_profil_change_history_profil1` FOREIGN KEY (`change_history_profil_id_change_history_user`) REFERENCES `change_history_profil` (`id_change_history_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profil_has_change_history_profil_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_has_change_history_video`
--

DROP TABLE IF EXISTS `profil_has_change_history_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_has_change_history_video` (
  `profil_id_profil` int(11) NOT NULL,
  `change_history_video_id_change_history_video` int(11) NOT NULL,
  PRIMARY KEY (`profil_id_profil`,`change_history_video_id_change_history_video`),
  KEY `fk_profil_has_change_history_video_change_history_video1_idx` (`change_history_video_id_change_history_video`),
  KEY `fk_profil_has_change_history_video_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_profil_has_change_history_video_change_history_video1` FOREIGN KEY (`change_history_video_id_change_history_video`) REFERENCES `change_history_video` (`id_change_history_video`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profil_has_change_history_video_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_has_follower`
--

DROP TABLE IF EXISTS `profil_has_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_has_follower` (
  `profil_id_profil` int(11) NOT NULL,
  `follower_id_follower` int(11) NOT NULL,
  PRIMARY KEY (`profil_id_profil`,`follower_id_follower`),
  KEY `fk_profil_has_follower_follower1_idx` (`follower_id_follower`),
  KEY `fk_profil_has_follower_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_profil_has_follower_follower1` FOREIGN KEY (`follower_id_follower`) REFERENCES `follower` (`id_follower`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profil_has_follower_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_has_following`
--

DROP TABLE IF EXISTS `profil_has_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_has_following` (
  `profil_id_profil` int(11) NOT NULL,
  `following_id_following` int(11) NOT NULL,
  PRIMARY KEY (`profil_id_profil`,`following_id_following`),
  KEY `fk_profil_has_following_following1_idx` (`following_id_following`),
  KEY `fk_profil_has_following_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_profil_has_following_following1` FOREIGN KEY (`following_id_following`) REFERENCES `following` (`id_following`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profil_has_following_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_has_playlist`
--

DROP TABLE IF EXISTS `profil_has_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_has_playlist` (
  `profil_id_profil` int(11) NOT NULL,
  `playlist_id_playlist` int(11) NOT NULL,
  PRIMARY KEY (`profil_id_profil`,`playlist_id_playlist`),
  KEY `fk_profil_has_playlist_playlist1_idx` (`playlist_id_playlist`),
  KEY `fk_profil_has_playlist_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_profil_has_playlist_playlist1` FOREIGN KEY (`playlist_id_playlist`) REFERENCES `playlist` (`id_playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profil_has_playlist_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_has_popularity`
--

DROP TABLE IF EXISTS `profil_has_popularity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_has_popularity` (
  `profil_id_profil` int(11) NOT NULL,
  `popularity_id_popularity` int(11) NOT NULL,
  PRIMARY KEY (`profil_id_profil`,`popularity_id_popularity`),
  KEY `fk_profil_has_popularity_popularity1_idx` (`popularity_id_popularity`),
  KEY `fk_profil_has_popularity_profil1_idx` (`profil_id_profil`),
  CONSTRAINT `fk_profil_has_popularity_popularity1` FOREIGN KEY (`popularity_id_popularity`) REFERENCES `popularity` (`id_popularity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profil_has_popularity_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `travel_information`
--

DROP TABLE IF EXISTS `travel_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_information` (
  `id_travel_information` int(11) NOT NULL AUTO_INCREMENT,
  `countries` varchar(60) DEFAULT NULL,
  `departure_month` varchar(30) DEFAULT NULL,
  `travel_duration` int(11) DEFAULT NULL,
  `nb_step` int(11) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `accomodation_budget` int(11) DEFAULT NULL,
  `activities_budget` int(11) DEFAULT NULL,
  `travel_type` enum('En famille','En couple','Entre amis','Aventurier seul') DEFAULT NULL,
  `general_video_id_general_video` int(11) DEFAULT NULL,
  `continent_id_continent` int(11) NOT NULL,
  PRIMARY KEY (`id_travel_information`),
  KEY `fk_travel_information_general_video1_idx` (`general_video_id_general_video`),
  KEY `fk_continent_id` (`continent_id_continent`),
  CONSTRAINT `fk_travel_information_general_video1` FOREIGN KEY (`general_video_id_general_video`) REFERENCES `general_video` (`id_general_video`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `travel_step`
--

DROP TABLE IF EXISTS `travel_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_step` (
  `id_travel_step` int(11) NOT NULL AUTO_INCREMENT,
  `video_travel_step` text,
  `step_number` tinyint(5) DEFAULT NULL,
  `step_name` varchar(100) DEFAULT NULL,
  `step_type` varchar(45) DEFAULT NULL,
  `step_duration` int(11) DEFAULT NULL,
  `step_weather` text,
  `step_transport` text,
  `way_get_around` enum('Voiture','Moto','Vélo','A pied','Taxi','Transports en commun') DEFAULT NULL,
  `way_get_around_comment` text,
  `district1` varchar(45) DEFAULT NULL,
  `district2` varchar(45) DEFAULT NULL,
  `district3` varchar(45) DEFAULT NULL,
  `district_comment` text,
  `accomodation1` varchar(45) DEFAULT NULL,
  `accomodation2` varchar(45) DEFAULT NULL,
  `accomodation3` varchar(45) DEFAULT NULL,
  `accomodation_link1` text,
  `accomodation_link2` text,
  `accomodation_link3` text,
  `restaurant1` varchar(100) DEFAULT NULL,
  `restaurant2` varchar(100) DEFAULT NULL,
  `restaurant3` varchar(100) DEFAULT NULL,
  `restaurant4` varchar(100) DEFAULT NULL,
  `restaurant5` varchar(100) DEFAULT NULL,
  `restaurant6` varchar(100) DEFAULT NULL,
  `bar1` varchar(100) DEFAULT NULL,
  `bar2` varchar(100) DEFAULT NULL,
  `bar3` varchar(100) DEFAULT NULL,
  `bar4` varchar(100) DEFAULT NULL,
  `bar5` varchar(100) DEFAULT NULL,
  `bar6` varchar(100) DEFAULT NULL,
  `must_visit1` varchar(100) DEFAULT NULL,
  `must_visit2` varchar(100) DEFAULT NULL,
  `must_visit3` varchar(100) DEFAULT NULL,
  `must_visit4` varchar(100) DEFAULT NULL,
  `must_visit5` varchar(100) DEFAULT NULL,
  `must_visit6` varchar(100) DEFAULT NULL,
  `sport_activity1` varchar(100) DEFAULT NULL,
  `sport_activity_comment` text,
  `crush` text,
  `advice` varchar(255) DEFAULT NULL,
  `general_video_id_general_video` int(11) NOT NULL,
  PRIMARY KEY (`id_travel_step`),
  KEY `fk_travel_step_general_video1_idx` (`general_video_id_general_video`),
  CONSTRAINT `fk_travel_step_general_video1` FOREIGN KEY (`general_video_id_general_video`) REFERENCES `general_video` (`id_general_video`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `travel_step_has_change_history_travel_step`
--

DROP TABLE IF EXISTS `travel_step_has_change_history_travel_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_step_has_change_history_travel_step` (
  `travel_step_id_travel_step` int(11) NOT NULL,
  `change_history_travel_step_id_change_history_travel_step` int(11) NOT NULL,
  PRIMARY KEY (`travel_step_id_travel_step`,`change_history_travel_step_id_change_history_travel_step`),
  KEY `fk_travel_step_has_change_history_travel_step_change_histor_idx` (`change_history_travel_step_id_change_history_travel_step`),
  KEY `fk_travel_step_has_change_history_travel_step_travel_step1_idx` (`travel_step_id_travel_step`),
  CONSTRAINT `fk_travel_step_has_change_history_travel_step_change_history_1` FOREIGN KEY (`change_history_travel_step_id_change_history_travel_step`) REFERENCES `change_history_travel_step` (`id_change_history_travel_step`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_travel_step_has_change_history_travel_step_travel_step1` FOREIGN KEY (`travel_step_id_travel_step`) REFERENCES `travel_step` (`id_travel_step`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watch_later`
--

DROP TABLE IF EXISTS `watch_later`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_later` (
  `id_watch_later` int(11) NOT NULL AUTO_INCREMENT,
  `video_watch_later` text,
  `nb_video_watch_later` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_watch_later`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watch_later_has_profil`
--

DROP TABLE IF EXISTS `watch_later_has_profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_later_has_profil` (
  `watch_later_id_watch_later` int(11) NOT NULL,
  `profil_id_profil` int(11) NOT NULL,
  PRIMARY KEY (`watch_later_id_watch_later`,`profil_id_profil`),
  KEY `fk_watch_later_has_profil_profil1_idx` (`profil_id_profil`),
  KEY `fk_watch_later_has_profil_watch_later1_idx` (`watch_later_id_watch_later`),
  CONSTRAINT `fk_watch_later_has_profil_profil1` FOREIGN KEY (`profil_id_profil`) REFERENCES `profil` (`id_profil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_watch_later_has_profil_watch_later1` FOREIGN KEY (`watch_later_id_watch_later`) REFERENCES `watch_later` (`id_watch_later`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-24 14:31:35
