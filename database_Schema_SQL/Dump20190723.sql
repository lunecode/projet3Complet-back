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
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `change_history_like_comment`
--

LOCK TABLES `change_history_like_comment` WRITE;
/*!40000 ALTER TABLE `change_history_like_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_history_like_comment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `change_history_profil`
--

LOCK TABLES `change_history_profil` WRITE;
/*!40000 ALTER TABLE `change_history_profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_history_profil` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `change_history_travel_step`
--

LOCK TABLES `change_history_travel_step` WRITE;
/*!40000 ALTER TABLE `change_history_travel_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_history_travel_step` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `change_history_video`
--

LOCK TABLES `change_history_video` WRITE;
/*!40000 ALTER TABLE `change_history_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_history_video` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `comment_has_change_history_like_comment`
--

LOCK TABLES `comment_has_change_history_like_comment` WRITE;
/*!40000 ALTER TABLE `comment_has_change_history_like_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_has_change_history_like_comment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `contact_request`
--

LOCK TABLES `contact_request` WRITE;
/*!40000 ALTER TABLE `contact_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_request` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES (1,'Autres'),(2,'Afrique'),(3,'Amérique'),(4,'Asie-Océanie'),(5,'Europe');
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `favorites_has_profil`
--

LOCK TABLES `favorites_has_profil` WRITE;
/*!40000 ALTER TABLE `favorites_has_profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites_has_profil` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `follower`
--

LOCK TABLES `follower` WRITE;
/*!40000 ALTER TABLE `follower` DISABLE KEYS */;
INSERT INTO `follower` VALUES (1,'Jeremias Del Pozo','Abonné à vos aventure depuis 27 jours',NULL,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNy_3EuiT67YMJff9uMLStwO2j2z40CkAVRdo5HVSbO7ZX8bdj',NULL),(2,'Alicia Stanger','Abonné à vos aventure depuis 27 jours',NULL,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNy_3EuiT67YMJff9uMLStwO2j2z40CkAVRdo5HVSbO7ZX8bdj',NULL),(3,'Donat Twerski','Abonné à vos aventure depuis 27 jours',NULL,'https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg',NULL),(4,'Daisy Murphy','Abonné à vos aventure depuis 27 jours',NULL,'https://cdn.pixabay.com/photo/2017/03/26/12/13/countryside-2175353_960_720.jpg',NULL),(5,'Mohsin Salahi','Abonné à vos aventure depuis 27 jours',NULL,'https://cdn.pixabay.com/photo/2017/02/22/20/02/landscape-2090495_960_720.jpg',NULL),(6,'Kong Yijun','Abonné à vos aventure depuis 27 jours',NULL,'https://cdn.pixabay.com/photo/2015/07/06/13/58/arlberg-pass-833326__340.jpg',NULL);
/*!40000 ALTER TABLE `follower` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
INSERT INTO `following` VALUES (1,'Ethan Evans','Vous êtes abonnés depuis 25 jours',NULL,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzJQg0Q_-8aQb6aQKs0oVuZSZJZi4-gX6Fndyo8e5RVymebp9m5w',5),(2,'Malin Quist','Vous êtes abonnés depuis 25 jours',NULL,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNy_3EuiT67YMJff9uMLStwO2j2z40CkAVRdo5HVSbO7ZX8bdj',9),(3,'Chineze Afemafuna','Vous êtes abonnés depuis 25 jours',NULL,'https://i.ytimg.com/vi/BfCwN4iy6T8/maxresdefault.jpg',4),(4,'Faadhi Al Rahman','Vous êtes abonnés depuis 25 jours',NULL,'https://cdn.pixabay.com/photo/2017/03/26/12/13/countryside-2175353_960_720.jpg',9),(5,'Pedro Amorim','Vous êtes abonnés depuis 25 jours',NULL,'https://cdn.pixabay.com/photo/2017/02/22/20/02/landscape-2090495_960_720.jpg',13),(6,'Sua Hua','Vous êtes abonnés depuis 25 jours',NULL,'https://cdn.pixabay.com/photo/2015/07/06/13/58/arlberg-pass-833326__340.jpg',7);
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

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
  `video_description` varchar(150) DEFAULT NULL,
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
-- Dumping data for table `general_video`
--

LOCK TABLES `general_video` WRITE;
/*!40000 ALTER TABLE `general_video` DISABLE KEYS */;
INSERT INTO `general_video` VALUES (1,1,'Road Trip','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','WFQhSFUUF3U','Jean Dujardin',NULL,'10:02',NULL,NULL,NULL,NULL,'Crosstour Caméra Sport',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/4/1562840200-usa.jpg',60,1),(2,2,'Le berceau du Yoga','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','44rTTLjZZz4','Rachid Badou',NULL,'21:35',NULL,NULL,NULL,NULL,'Crosstour 4K Caméra Sport',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/3/1562768813-inde.jpg',80,5),(3,3,'Les grands Lacs','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','WteZwxsvICc','Tony Lee',NULL,'05:41',NULL,NULL,NULL,NULL,'DJI Osmo Pocket',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/3/1562768683-canada.jpg',70,2),(4,4,'L\'île de beauté','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','G7865-ME21A','Mamadou Absadoum',NULL,'06:31',NULL,NULL,NULL,NULL,'Caméscope 4K Vlogging',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/3/1562768683-corse-ile-de-beaute.jpg',60,3),(5,5,'Masai Mara','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','A-9YKfh-oM4','Estelle Dupuis',NULL,'12:53',NULL,NULL,NULL,NULL,'Campark Caméra Sport',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/3/1562768683-kenya.jpg',60,4),(6,6,'City of Gold','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','SLaYPmhse30','Caroline Moujin',NULL,'09:02',NULL,NULL,NULL,NULL,'WiMiUS Q1 Caméra Sport',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/3/1562781111-dubai.jpg',90,7),(7,7,'Au rythme de la Samba','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam','y0d8zaI_wgg','Hector Benardin',NULL,'10:12',NULL,NULL,NULL,NULL,'ATian TAKSTAR the SGC-598',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/28/3/1562781111-bresil.jpg',100,6),(8,8,'Le pays du soleil levant',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://img.ev.mu/images/portfolio/pays/113/960x640/852192.jpg',NULL,1),(9,NULL,'A la découverte de l\'île rouge','Un circuit pour parcourir les différents paysages de Madagascar','1roGkBs8NbA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sony Alpha 7 ',NULL,NULL,NULL,NULL,NULL,'https://image.noelshack.com/fichiers/2019/29/1/1563177376-madagascar.jpg',NULL,1);
/*!40000 ALTER TABLE `general_video` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `liked`
--

LOCK TABLES `liked` WRITE;
/*!40000 ALTER TABLE `liked` DISABLE KEYS */;
INSERT INTO `liked` VALUES (1,NULL,NULL,'Jean Dujardin',NULL,1,1,1),(2,NULL,NULL,'Tony Lee',NULL,2,2,2),(3,NULL,NULL,'Mamadou Absadoum',NULL,3,3,3),(4,NULL,NULL,'Estelle Dupuis',NULL,4,4,4),(5,NULL,NULL,'Rachid Badou',NULL,5,5,5),(6,NULL,NULL,'Hector Bernardin',NULL,6,6,6),(7,NULL,NULL,'Caroline Moujin',NULL,7,7,7);
/*!40000 ALTER TABLE `liked` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `popularity`
--

LOCK TABLES `popularity` WRITE;
/*!40000 ALTER TABLE `popularity` DISABLE KEYS */;
INSERT INTO `popularity` VALUES (1,123,103,NULL,NULL,NULL),(2,523,421,NULL,NULL,NULL),(3,421,235,NULL,NULL,NULL),(4,56,23,NULL,NULL,NULL),(5,241,125,NULL,NULL,NULL),(6,143,80,NULL,NULL,NULL),(7,369,42,NULL,NULL,NULL);
/*!40000 ALTER TABLE `popularity` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` VALUES (1,'Dujardin','Jean','','lui','Jean@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$wW8oRNIvrJDB0zoDdrl82uNCeXlahAsbd20QVMHHVG0YoLue1Mc.C','wildforget',NULL,NULL,NULL,NULL,NULL,0),(2,'Lee','Tony',NULL,'lui','Tony@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$MBm4Nz7vqxn.0lC5yzGbL.Llvz1qr8c.kPgmFon7HaZbbdKDmX7L6',NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'Absadoum','Mamadou',NULL,'lui','Mamadou@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$YMraX8EmLX/kXe1V8OqRlOXi9JBVY4KjXomyo3oyXnX2LzWw3snnG',NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'Dupuis','Estelle','','elle','Estelle@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$9yF5KjqNRdRsqL7ijjp8m.M5jXaOtDw0ixTHVScL6/LJwIOEGC4NK',NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'Badou','Rachid','','lui','Rachid@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$rJbvYEFZF.p50QA2DoUzl.NzmvN5tkSc./nevLMXe1V7c.PX4ln8u',NULL,NULL,NULL,NULL,NULL,NULL,0),(6,'Benardin','Hector','','lui','Hector@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$/sXWvRf1cluwqiJcsMgQ9uFBkomNyvBEcYiqtYccKqcvSrTRjcE62',NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'Caroline','Moujin',NULL,NULL,'Caroline@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$ohauRGbzg8NeSCHCbR04QuFSMBDyOcfQp9r9GeyqfFD84pS5BLK0y',NULL,NULL,NULL,NULL,NULL,NULL,0),(8,'Jonas','Dupuis',NULL,NULL,'Jonas@wild.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$10$CtZbQzgAHMN6Cx2g2B0L1eWs8oIpbQFOc9r6kvNiWCcJ5G2M7JjFS',NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil_has_change_history_profil`
--

LOCK TABLES `profil_has_change_history_profil` WRITE;
/*!40000 ALTER TABLE `profil_has_change_history_profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_has_change_history_profil` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil_has_change_history_video`
--

LOCK TABLES `profil_has_change_history_video` WRITE;
/*!40000 ALTER TABLE `profil_has_change_history_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_has_change_history_video` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil_has_follower`
--

LOCK TABLES `profil_has_follower` WRITE;
/*!40000 ALTER TABLE `profil_has_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_has_follower` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil_has_following`
--

LOCK TABLES `profil_has_following` WRITE;
/*!40000 ALTER TABLE `profil_has_following` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_has_following` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil_has_playlist`
--

LOCK TABLES `profil_has_playlist` WRITE;
/*!40000 ALTER TABLE `profil_has_playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_has_playlist` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profil_has_popularity`
--

LOCK TABLES `profil_has_popularity` WRITE;
/*!40000 ALTER TABLE `profil_has_popularity` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_has_popularity` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `travel_information`
--

LOCK TABLES `travel_information` WRITE;
/*!40000 ALTER TABLE `travel_information` DISABLE KEYS */;
INSERT INTO `travel_information` VALUES (1,'États-Unis',NULL,12,1,'$',400,500,'En famille',1,3),(2,'Inde',NULL,20,1,'$',500,600,'En couple',2,4),(3,'Canada',NULL,14,1,'$',500,400,'Aventurier seul',3,3),(4,'France',NULL,7,1,'€',500,500,'En famille',4,5),(5,'Kenya',NULL,15,NULL,'€',350,600,'En famille',5,2),(6,'Émirats arabes unis',NULL,10,NULL,'$',650,800,'Entre amis',6,4),(7,'Brésil',NULL,16,NULL,'$',420,550,'Entre amis',7,3),(8,'Japon','2017-07-04',15,NULL,NULL,800,500,'En famille',8,4),(9,'Madagascar','2018-10-10',20,NULL,NULL,850,600,'En famille',9,2);
/*!40000 ALTER TABLE `travel_information` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `travel_step`
--

LOCK TABLES `travel_step` WRITE;
/*!40000 ALTER TABLE `travel_step` DISABLE KEYS */;
INSERT INTO `travel_step` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'South Los Angeles','Vallée de San Fernando','Hollywood',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Charlie Russell','Fritz Railroad',NULL,NULL,NULL,'One Star',NULL,NULL,NULL,NULL,NULL,'Museum of Modern Art','Metropolitan Museum of Art',NULL,NULL,NULL,NULL,'Golf',NULL,NULL,NULL,1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rishikesh','Jaipur','Jodhpur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AnnaMaya','Spring',NULL,NULL,NULL,'Bukhara',NULL,NULL,NULL,NULL,NULL,'Andhra Pradesh',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,2),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Le Mile end','Le Plateau','Le vieux Montréal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Josephine','Lola Rosa',NULL,NULL,NULL,'The Great Canadian',NULL,NULL,NULL,NULL,NULL,'Le vieux Port','L\'oratoire Saint-Joseph',NULL,NULL,NULL,NULL,'Saut en parachute',NULL,NULL,NULL,3),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'La rue Fesch','La place Foch','Le sentier du Patrimoine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Terra Cotta','A Nepita',NULL,NULL,NULL,NULL,'Natation',NULL,NULL,NULL,4),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nairobi','Kibera',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sikia Fine','Tatu Restaurant',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jumerirah','Dubaî Marina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fortaleza','Porto Alegre',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Transports en commun',NULL,'Akihabara','Asakusa',NULL,NULL,'Hotel','Chez l\'habitant',NULL,NULL,NULL,NULL,'Kitaohji Teigeki',NULL,NULL,NULL,NULL,NULL,'Tokyo',NULL,NULL,NULL,NULL,NULL,'Shibuya',NULL,NULL,NULL,NULL,NULL,'Golf',NULL,NULL,NULL,8),(9,NULL,1,NULL,NULL,20,NULL,'Avion','Voiture',NULL,'Antanavarivo','Analakely',NULL,'Centre névralgique de la capitale, avec le marché.','L\'hôtel Baobab','L\'hôtel Hilton ','La maison de Robert',NULL,NULL,NULL,'Shalimar','Dzama','Le Carré',NULL,NULL,NULL,'Kudéta','Suite 101','Le Six',NULL,NULL,NULL,'Le Rova','Le marché de Zuma','Le parc Isalo',NULL,NULL,NULL,'Saut en parachute',NULL,NULL,NULL,9);
/*!40000 ALTER TABLE `travel_step` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `travel_step_has_change_history_travel_step`
--

LOCK TABLES `travel_step_has_change_history_travel_step` WRITE;
/*!40000 ALTER TABLE `travel_step_has_change_history_travel_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_step_has_change_history_travel_step` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `watch_later`
--

LOCK TABLES `watch_later` WRITE;
/*!40000 ALTER TABLE `watch_later` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_later` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `watch_later_has_profil`
--

LOCK TABLES `watch_later_has_profil` WRITE;
/*!40000 ALTER TABLE `watch_later_has_profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_later_has_profil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-23 16:30:19
