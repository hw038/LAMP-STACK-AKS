Warning: Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 5.6.51, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.6.51

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
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `time_insert` datetime NOT NULL,
  `time_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` tinyint(4) NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `argv` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_insert` (`time_insert`),
  UNIQUE KEY `slug` (`slug`),
  KEY `page_user` (`user`),
  FULLTEXT KEY `search` (`name`,`body`),
  CONSTRAINT `page_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'2021-02-16 04:03:35','2021-02-16 04:03:35',1,'example-page','Example Page','OK. You discovered that there is also a page functionality. But what is the difference between a **page** and a **post**? This is simple: There is not really much difference. But you can style posts and pages within the templates CSS completely independent from each other. For example, use **pages** for things like your imprint, your terms of use, your FAQ or other stuff. And **posts** for your main blog posts. A **page** (and also a **user**) has exactly the same functionality as already described within the [first post]({POST[1]})! 8)',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `time_insert` datetime NOT NULL,
  `time_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` tinyint(4) NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `argv` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_insert` (`time_insert`),
  UNIQUE KEY `slug` (`slug`),
  KEY `post_user` (`user`),
  FULLTEXT KEY `search` (`name`,`body`),
  CONSTRAINT `post_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2021-02-16 04:03:35','2021-02-16 04:03:35',1,'hello-world','Hello World!','Hello! This is the automatically generated first post on your new blog installation. You can type [Markdown](https://daringfireball.net/projects/markdown/) plaintext into the editor to format your content as you want. In this post you can see several examples to [format your content with Markdown](https://daringfireball.net/projects/markdown/syntax) and with the special features provided by this blog application. After you are familiar with the text formatting and done with the exploration of your new blog application, you can delete this post and create your own. Have fun! :)\r\n\r\n![Demo image: Computer Guy (Public Domain)]({FILE[\"image/content/computer-guy-public-domain.svg\"]})\r\n\r\n## Parsing emoticons (if `POST.EMOTICONS` is `TRUE` within your `configuration.php`)\r\n> You can insert one or more of the following emoticons into your posts by typing the emoticon as simple ASCII text. The emoticon parser will convert your ASCII emoticon to the HTML multibyte unicode equivalent. Each emoticon comes with an further explanation if you just hold your mouse over a emoticons face:  \r\n> :) :( :D :P :O ;) ;( :| :X :/ 8) :S xD ^^\r\n\r\n## Dynamic internal URLs for items\r\nIf you want to link an item, please do not put the URL to the item hardcoded into your content! What if you want to change your site address (or the base directory) in the future? Then you have to change all links in your content. This is not cool! Thus, you can use the following code **without spaces between the braces** by knowing the ID of an item to link it dynamically:\r\n\r\n1. Example: `{ POST[1] }`  \r\n{POST[1]}\r\n\r\n2. Example: `{ PAGE[1] }`  \r\n{PAGE[1]}\r\n\r\n3. Example: `{ USER[1] }`  \r\n{USER[1]}\r\n\r\n## Dynamic internal URLs for other resources\r\nThis also applies to any other resource that exists in the blog system and that you want to link to! You can link any other resource dynamically either relative to your base directory or relative to your resource directory for static content:\r\n\r\n* Example: `{ BASE[\"foo/bar/\"] }`  \r\n{BASE[\"foo/bar/\"]}\r\n\r\n* Example: `{ FILE[\"foo/bar/\"] }`  \r\n{FILE[\"foo/bar/\"]}\r\n\r\n### Anywhere …\r\nYou can use these codes anywhere in your markdown plaintext. This codes will be pre-parsed before the markdown parser gets the content. If the markdown parser begins then all codes already have been converted into the URLs.',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `time_insert` datetime NOT NULL,
  `time_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `slug` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` char(64) CHARACTER SET latin1 DEFAULT NULL,
  `fullname` varchar(40) NOT NULL,
  `mailaddr` varchar(60) NOT NULL,
  `body` text NOT NULL,
  `argv` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_insert` (`time_insert`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'2021-02-16 04:03:35','2021-02-16 04:03:35','change-me','ChangeMe','$2y$10$jH48L1K1y9dB303aI2biN.ob0biZDuUbMxPKadi3wDqOIxj6yNT6K','John Doe','mail@example.org','Describe yourself.',NULL),(2,'2021-02-16 05:03:35','2021-02-25 00:01:46','admin','admin','$2y$10$rkOW3hZ87ORLCkAMfbLs3e0XfmYDqoz3XHsyGAomgr4Xqde2il1Xa','admin','mail@et.org','eee',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-25  0:02:06
