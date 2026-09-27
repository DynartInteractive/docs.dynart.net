-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dpress_dev
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `dp_auth_attempt`
--

DROP TABLE IF EXISTS `dp_auth_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_auth_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(32) NOT NULL,
  `key_hash` char(64) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_scope_key_hash_created_at` (`scope`,`key_hash`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_auth_attempt`
--

LOCK TABLES `dp_auth_attempt` WRITE;
/*!40000 ALTER TABLE `dp_auth_attempt` DISABLE KEYS */;
INSERT INTO `dp_auth_attempt` VALUES (1,'login','ac500fe52d548840264c1d6707210b0e36d90a9bd51a17a5438cbe57d89b8aee','2026-09-02 08:18:00'),(3,'login','ac500fe52d548840264c1d6707210b0e36d90a9bd51a17a5438cbe57d89b8aee','2026-09-02 08:18:06'),(5,'login','ac500fe52d548840264c1d6707210b0e36d90a9bd51a17a5438cbe57d89b8aee','2026-09-02 08:18:10'),(9,'login','ac500fe52d548840264c1d6707210b0e36d90a9bd51a17a5438cbe57d89b8aee','2026-09-02 08:19:05'),(2,'login','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:18:00'),(4,'login','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:18:06'),(6,'login','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:18:10'),(10,'login','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:19:05'),(12,'login','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:20:45'),(13,'password_reset','258d8dc916db8cea2cafb6c3cd0cb0246efe061421dbd83ec3a350428cabda4f','2026-09-02 08:20:52'),(7,'password_reset','ac500fe52d548840264c1d6707210b0e36d90a9bd51a17a5438cbe57d89b8aee','2026-09-02 08:18:17'),(8,'password_reset','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:18:17'),(14,'password_reset','eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3','2026-09-02 08:20:52');
/*!40000 ALTER TABLE `dp_auth_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_block`
--

DROP TABLE IF EXISTS `dp_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `settings` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_place` (`place`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_block`
--

LOCK TABLES `dp_block` WRITE;
/*!40000 ALTER TABLE `dp_block` DISABLE KEYS */;
INSERT INTO `dp_block` VALUES (5,'tag_cloud','sidebar','Tags',0,1,'{\"limit\":\"20\"}'),(6,'category_list','sidebar','Categories',1,1,'[]'),(7,'markdown','sidebar','About this site',2,1,'{\"markdown\":\"A **markdown** block: whatever you write, beside the content.\\n\\nIt is the same markdown as everywhere else, so `media#12`, [internal links](post#1) and\\nshortcodes all work in here.\",\"html\":\"<p>A <strong>markdown<\\/strong> block: whatever you write, beside the content.<\\/p>\\n<p>It is the same markdown as everywhere else, so <code>media#12<\\/code>, <a href=\\\"http:\\/\\/localhost\\/dynart-dpress-app\\/public\\/post\\/welcome-to-dpress\\\">internal links<\\/a> and\\nshortcodes all work in here.<\\/p>\\n\"}');
/*!40000 ALTER TABLE `dp_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_category`
--

DROP TABLE IF EXISTS `dp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `thumbnail_media_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_slug` (`slug`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_category`
--

LOCK TABLES `dp_category` WRITE;
/*!40000 ALTER TABLE `dp_category` DISABLE KEYS */;
INSERT INTO `dp_category` VALUES (1,NULL,NULL,'News','news','',2),(2,NULL,NULL,'Guides','guides',NULL,1),(3,NULL,NULL,'How to','how-to','',0);
/*!40000 ALTER TABLE `dp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_category_aud`
--

DROP TABLE IF EXISTS `dp_category_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_category_aud` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `thumbnail_media_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`id`,`rev_id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_category_aud`
--

LOCK TABLES `dp_category_aud` WRITE;
/*!40000 ALTER TABLE `dp_category_aud` DISABLE KEYS */;
INSERT INTO `dp_category_aud` VALUES (1,NULL,NULL,'News','news',NULL,0,2,'add'),(1,3,NULL,'News','news','',0,43,'mod'),(1,NULL,NULL,'News','news','',0,44,'mod'),(1,NULL,NULL,'News','news','',1,199,'mod'),(1,NULL,NULL,'News','news','',0,200,'mod'),(1,NULL,NULL,'News','news','',2,211,'mod'),(1,NULL,NULL,'News','news','',1,213,'mod'),(1,NULL,NULL,'News','news','',2,214,'mod'),(2,NULL,NULL,'Guides','guides',NULL,0,2,'add'),(2,1,NULL,'Guides','guides',NULL,0,184,'mod'),(2,NULL,NULL,'Guides','guides',NULL,1,185,'mod'),(2,NULL,NULL,'Guides','guides',NULL,2,186,'mod'),(2,NULL,NULL,'Guides','guides',NULL,1,187,'mod'),(2,NULL,NULL,'Guides','guides',NULL,2,190,'mod'),(2,NULL,NULL,'Guides','guides',NULL,1,192,'mod'),(2,NULL,NULL,'Guides','guides',NULL,2,193,'mod'),(2,NULL,NULL,'Guides','guides',NULL,0,199,'mod'),(2,NULL,NULL,'Guides','guides',NULL,2,200,'mod'),(2,NULL,NULL,'Guides','guides',NULL,1,211,'mod'),(2,NULL,NULL,'Guides','guides',NULL,0,212,'mod'),(2,NULL,NULL,'Guides','guides',NULL,1,214,'mod'),(3,2,NULL,'How to','how-to',NULL,0,2,'add'),(3,1,NULL,'How to','how-to','',0,181,'mod'),(3,1,NULL,'How to','how-to','',1,184,'mod'),(3,1,NULL,'How to','how-to','',0,185,'mod'),(3,NULL,NULL,'How to','how-to','',1,186,'mod'),(3,1,NULL,'How to','how-to','',0,187,'mod'),(3,NULL,NULL,'How to','how-to','',1,190,'mod'),(3,1,NULL,'How to','how-to','',0,192,'mod'),(3,NULL,NULL,'How to','how-to','',1,193,'mod'),(3,NULL,NULL,'How to','how-to','',2,199,'mod'),(3,NULL,NULL,'How to','how-to','',1,200,'mod'),(3,NULL,NULL,'How to','how-to','',0,211,'mod'),(3,NULL,NULL,'How to','how-to','',1,212,'mod'),(3,2,NULL,'How to','how-to','',0,213,'mod'),(3,NULL,NULL,'How to','how-to','',0,214,'mod');
/*!40000 ALTER TABLE `dp_category_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content`
--

DROP TABLE IF EXISTS `dp_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'post',
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `featured_media_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `markdown` longtext NOT NULL,
  `lead_html` longtext DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `published_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_slug` (`slug`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_author_id` (`author_id`),
  KEY `idx_published_at` (`published_at`),
  KEY `idx_type_status_published_at` (`type`,`status`,`published_at`),
  KEY `featured_media_id` (`featured_media_id`),
  CONSTRAINT `dp_content_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `dp_user` (`id`),
  CONSTRAINT `dp_content_ibfk_2` FOREIGN KEY (`featured_media_id`) REFERENCES `dp_media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content`
--

LOCK TABLES `dp_content` WRITE;
/*!40000 ALTER TABLE `dp_content` DISABLE KEYS */;
INSERT INTO `dp_content` VALUES (1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.\r\n\r\n> [!WARNING]\r\n> Do not do this on a live site.\r\n\r\n> [!DANGER]\r\n> Very dangerous.\r\n\r\n> [!INFO]\r\n> The setting is in **Settings → Code theme**.\r\n\r\n```php\r\n<?php\r\n\r\nclass ThisIsATest {\r\n\r\n    private int $test = 0;\r\n\r\n    public function __construct() {\r\n        $this->test = 1;\r\n    }\r\n}\r\n```','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote class=\"callout callout-quote\">\n<p>A blockquote, for good measure.</p>\n</blockquote>\n<blockquote class=\"callout callout-warning\">\n<p>Do not do this on a live site.</p>\n</blockquote>\n<blockquote class=\"callout callout-danger\">\n<p>Very dangerous.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>The setting is in <strong>Settings → Code theme</strong>.</p>\n</blockquote>\n<pre class=\"language-php\" data-enlighter-language=\"php\">&lt;?php\n\nclass ThisIsATest {\n\n    private int $test = 0;\n\n    public function __construct() {\n        $this-&gt;test = 1;\n    }\n}\n</pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 19:00:20'),(2,'post',NULL,2,NULL,'Árvíztűrő tükörfúrógép','arvizturo-tukorfurogep','Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.\r\n\r\n---\r\n\r\n![vlcsnap-2026-01-12-13h14m17s948.png](media#7)\r\n\r\nEz a törzsszöveg. A cím slugja `arvizturo-tukorfurogep` lett, nem pedig kötőjelek sora.','<p>Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"vlcsnap-2026-01-12-13h14m17s948.png\" /></p>\n<p>Ez a törzsszöveg. A cím slugja <code>arvizturo-tukorfurogep</code> lett, nem pedig kötőjelek sora.</p>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 08:24:22'),(3,'post',NULL,2,NULL,'A short note','a-short-note','No separator here, so the whole thing is the lead and there is no body.','<p>No separator here, so the whole thing is the lead and there is no body.</p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 06:40:32'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\n---\n\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.</p>\n','<p>Still being written.</p>\n','draft',NULL,'2026-08-04 17:13:38','2026-08-04 17:13:38'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.\r\n\r\n```css\r\nTest\r\n```','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n<pre class=\"language-css\" data-enlighter-language=\"css\">Test\n</pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 12:37:11'),(6,'page',5,1,NULL,'Contact','contact','How to get in touch.','<p>How to get in touch.</p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38'),(7,'post',NULL,1,NULL,'test','test','test','<p>test</p>\n','','draft',NULL,'2026-09-02 08:53:14','2026-09-02 08:53:14');
/*!40000 ALTER TABLE `dp_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_attachment`
--

DROP TABLE IF EXISTS `dp_content_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_attachment` (
  `content_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`content_id`,`media_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `dp_content_attachment_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `dp_content` (`id`),
  CONSTRAINT `dp_content_attachment_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `dp_media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_attachment`
--

LOCK TABLES `dp_content_attachment` WRITE;
/*!40000 ALTER TABLE `dp_content_attachment` DISABLE KEYS */;
INSERT INTO `dp_content_attachment` VALUES (1,2,0),(1,4,0),(2,10,0);
/*!40000 ALTER TABLE `dp_content_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_attachment_aud`
--

DROP TABLE IF EXISTS `dp_content_attachment_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_attachment_aud` (
  `content_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`content_id`,`media_id`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_attachment_aud`
--

LOCK TABLES `dp_content_attachment_aud` WRITE;
/*!40000 ALTER TABLE `dp_content_attachment_aud` DISABLE KEYS */;
INSERT INTO `dp_content_attachment_aud` VALUES (1,1,0,30,'add'),(1,1,0,31,'del'),(1,1,0,32,'add'),(1,1,0,33,'mod'),(1,1,0,34,'del'),(1,1,0,35,'add'),(1,1,0,36,'del'),(1,1,0,37,'add'),(1,1,0,38,'del'),(1,1,0,42,'add'),(1,1,0,54,'del'),(1,2,0,2,'add'),(1,2,0,39,'mod'),(1,3,0,2,'add'),(1,3,0,100,'del'),(1,4,0,2,'add'),(1,6,0,52,'add'),(1,6,0,53,'mod'),(1,7,0,66,'add'),(2,7,0,105,'add'),(2,8,0,104,'add'),(2,8,0,151,'del'),(2,10,0,150,'add'),(3,3,0,108,'add'),(3,3,0,109,'del'),(4,1,0,26,'add'),(4,1,0,28,'del'),(4,3,0,27,'add'),(4,3,0,28,'del'),(4,8,0,56,'add'),(4,8,0,58,'del'),(5,1,0,45,'add'),(7,7,0,111,'add'),(7,7,0,134,'del'),(7,7,0,135,'add'),(7,7,0,144,'del'),(8,4,0,114,'add'),(8,4,0,118,'del'),(9,2,0,117,'del');
/*!40000 ALTER TABLE `dp_content_attachment_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_aud`
--

DROP TABLE IF EXISTS `dp_content_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_aud` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'post',
  `parent_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `featured_media_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `markdown` longtext NOT NULL,
  `lead_html` longtext DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `published_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`id`,`rev_id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_author_id` (`author_id`),
  KEY `idx_published_at` (`published_at`),
  KEY `idx_type_status_published_at` (`type`,`status`,`published_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_aud`
--

LOCK TABLES `dp_content_aud` WRITE;
/*!40000 ALTER TABLE `dp_content_aud` DISABLE KEYS */;
INSERT INTO `dp_content_aud` VALUES (1,'post',NULL,1,1,'Welcome to dpress','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'mod'),(1,'post',NULL,1,1,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38',3,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\\n\r\\n---\r\\n\r\\n## And this is the body\r\\n\r\\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\\nseparator is all lead and no body, which is exactly what a short note is.\r\\n\r\\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\\n\r\\n- a list item\r\\n- another one\r\\n\r\\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.\n\\n\n\\n---\n\\n\n\\n## And this is the body\n\\n\n\\nThe body is everything after the first line that is nothing but three dashes. A post with no\n\\nseparator is all lead and no body, which is exactly what a short note is.\n\\n\n\\nMarkdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.\n\\n\n\\n- a list item\n\\n- another one\n\\n\n\\n&gt; A blockquote, for good measure.</p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 09:46:55',29,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\\\\n\r\\\\n---\r\\\\n\r\\\\n## And this is the body\r\\\\n\r\\\\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\\\\nseparator is all lead and no body, which is exactly what a short note is.\r\\\\n\r\\\\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\\\\n\r\\\\n- a list item\r\\\\n- another one\r\\\\n\r\\\\n> A blockquote, for good measure.\n\n![A sunset](/uploads/2026/08/sunset-photo-e6dd2d.jpg)','<p>This is the lead. Everything before the separator shows up in listings, and only that.\n\\n\n\\n---\n\\n\n\\n## And this is the body\n\\n\n\\nThe body is everything after the first line that is nothing but three dashes. A post with no\n\\nseparator is all lead and no body, which is exactly what a short note is.\n\\n\n\\nMarkdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.\n\\n\n\\n- a list item\n\\n- another one\n\\n\n\\n&gt; A blockquote, for good measure.</p>\n<p><img src=\"/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"A sunset\" /></p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 09:51:26',30,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\\\\n\r\\\\n---\r\\\\n\r\\\\n## And this is the body\r\\\\n\r\\\\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\\\\nseparator is all lead and no body, which is exactly what a short note is.\r\\\\n\r\\\\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\\\\n\r\\\\n- a list item\r\\\\n- another one\r\\\\n\r\\\\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.\n\\n\n\\n---\n\\n\n\\n## And this is the body\n\\n\n\\nThe body is everything after the first line that is nothing but three dashes. A post with no\n\\nseparator is all lead and no body, which is exactly what a short note is.\n\\n\n\\nMarkdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.\n\\n\n\\n- a list item\n\\n- another one\n\\n\n\\n&gt; A blockquote, for good measure.</p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 09:51:48',31,'mod'),(1,'post',NULL,1,1,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![Example icon](http://localhost/dynart-dpress-app/public/uploads/2026/08/icon-85e1b2.svg)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/icon-85e1b2.svg\" alt=\"Example icon\" /></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 10:54:34',40,'mod'),(1,'post',NULL,1,3,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![Example icon](http://localhost/dynart-dpress-app/public/uploads/2026/08/icon-85e1b2.svg)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/icon-85e1b2.svg\" alt=\"Example icon\" /></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 10:55:05',41,'mod'),(1,'post',NULL,1,3,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![vlcsnap-2026-01-12-13h14m17s948.png](media#7)\r\n\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"vlcsnap-2026-01-12-13h14m17s948.png\" /></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-06 16:31:19',67,'mod'),(1,'post',NULL,1,3,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" /></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-06 16:31:44',68,'mod'),(1,'post',NULL,1,3,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-06 16:33:00',69,'mod'),(1,'post',NULL,1,3,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-06 20:06:55',98,'mod'),(1,'post',NULL,1,3,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 09:41:33',138,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 15:10:16',176,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 17:32:05',218,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(media#10) }}\r\n\r\n{{ video(https://www.youtube.com/watch?v=qfDc10opQf0) }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p>\n<p>{{ video(media#10) }}</p>\n<p>{{ video(https://www.youtube.com/watch?v=qfDc10opQf0) }}</p>\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 17:38:35',222,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n![screenshot](media#7)\r\n[News](category#3)\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\n{{ video(\'https://www.youtube.com/watch?v=qfDc10opQf0\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"screenshot\" />\n<a href=\"http://localhost/dynart-dpress-app/public/category/how-to\">News</a></p>\n<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19--><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC93d3cueW91dHViZS5jb21cL3dhdGNoP3Y9cWZEYzEwb3BRZjAiXX0=-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 17:38:53',223,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 17:39:58',224,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.\r\n\r\n```php\r\n<?php\r\n\r\nclass ThisIsATest {\r\n\r\n    private int $test = 0;\r\n\r\n    public function __construct() {\r\n        $this->test = 1;\r\n    }\r\n}\r\n```','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php\n\nclass ThisIsATest {\n\n    private int $test = 0;\n\n    public function __construct() {\n        $this-&gt;test = 1;\n    }\n}\n</code></pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 18:08:44',240,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.\r\n\r\n```php\r\n<?php\r\n\r\nclass ThisIsATest {\r\n\r\n    private int $test = 0;\r\n\r\n    public function __construct() {\r\n        $this->test = 1;\r\n    }\r\n}\r\n```','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php\n\nclass ThisIsATest {\n\n    private int $test = 0;\n\n    public function __construct() {\n        $this-&gt;test = 1;\n    }\n}\n</code></pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 18:12:45',245,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.\r\n\r\n```php\r\n<?php\r\n\r\nclass ThisIsATest {\r\n\r\n    private int $test = 0;\r\n\r\n    public function __construct() {\r\n        $this->test = 1;\r\n    }\r\n}\r\n```','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote>\n<p>A blockquote, for good measure.</p>\n</blockquote>\n<pre class=\"language-php\" data-enlighter-language=\"php\">&lt;?php\n\nclass ThisIsATest {\n\n    private int $test = 0;\n\n    public function __construct() {\n        $this-&gt;test = 1;\n    }\n}\n</pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 18:12:45',246,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.\r\n\r\n> [!WARNING]\r\n> Do not do this on a live site.\r\n\r\n> [!INFO]\r\n> The setting is in **Settings → Code theme**.\r\n\r\n```php\r\n<?php\r\n\r\nclass ThisIsATest {\r\n\r\n    private int $test = 0;\r\n\r\n    public function __construct() {\r\n        $this->test = 1;\r\n    }\r\n}\r\n```','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote class=\"callout callout-quote\">\n<p>A blockquote, for good measure.</p>\n</blockquote>\n<blockquote class=\"callout callout-warning\">\n<p>Do not do this on a live site.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>The setting is in <strong>Settings → Code theme</strong>.</p>\n</blockquote>\n<pre class=\"language-php\" data-enlighter-language=\"php\">&lt;?php\n\nclass ThisIsATest {\n\n    private int $test = 0;\n\n    public function __construct() {\n        $this-&gt;test = 1;\n    }\n}\n</pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 18:57:47',250,'mod'),(1,'post',NULL,1,NULL,'Welcome to dpress!','welcome-to-dpress','This is the lead. Everything before the separator shows up in listings, and only that.\r\n\r\n---\r\n\r\n## And this is the body\r\n\r\nThe body is everything after the first line that is nothing but three dashes. A post with no\r\nseparator is all lead and no body, which is exactly what a short note is.\r\n\r\n{{ video(\'media#10\') }}\r\n\r\nMarkdown works as you would expect: **bold**, *italic*, `inline code` and [links](https://example.com).\r\n\r\n- a list item\r\n- another one\r\n\r\n> A blockquote, for good measure.\r\n\r\n> [!WARNING]\r\n> Do not do this on a live site.\r\n\r\n> [!DANGER]\r\n> Very dangerous.\r\n\r\n> [!INFO]\r\n> The setting is in **Settings → Code theme**.\r\n\r\n```php\r\n<?php\r\n\r\nclass ThisIsATest {\r\n\r\n    private int $test = 0;\r\n\r\n    public function __construct() {\r\n        $this->test = 1;\r\n    }\r\n}\r\n```','<p>This is the lead. Everything before the separator shows up in listings, and only that.</p>\n','<h2>And this is the body</h2>\n<p>The body is everything after the first line that is nothing but three dashes. A post with no\nseparator is all lead and no body, which is exactly what a short note is.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>Markdown works as you would expect: <strong>bold</strong>, <em>italic</em>, <code>inline code</code> and <a href=\"https://example.com\">links</a>.</p>\n<ul>\n<li>a list item</li>\n<li>another one</li>\n</ul>\n<blockquote class=\"callout callout-quote\">\n<p>A blockquote, for good measure.</p>\n</blockquote>\n<blockquote class=\"callout callout-warning\">\n<p>Do not do this on a live site.</p>\n</blockquote>\n<blockquote class=\"callout callout-danger\">\n<p>Very dangerous.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>The setting is in <strong>Settings → Code theme</strong>.</p>\n</blockquote>\n<pre class=\"language-php\" data-enlighter-language=\"php\">&lt;?php\n\nclass ThisIsATest {\n\n    private int $test = 0;\n\n    public function __construct() {\n        $this-&gt;test = 1;\n    }\n}\n</pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 19:00:20',251,'mod'),(2,'post',NULL,2,NULL,'Árvíztűrő tükörfúrógép','arvizturo-tukorfurogep','Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.\r\n\r\n---\r\n\r\nEz a törzsszöveg. A cím slugja `arvizturo-tukorfurogep` lett, nem pedig kötőjelek sora.','<p>Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.</p>\n','<p>Ez a törzsszöveg. A cím slugja <code>arvizturo-tukorfurogep</code> lett, nem pedig kötőjelek sora.</p>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(2,'post',NULL,2,NULL,'Árvíztűrő tükörfúrógép','arvizturo-tukorfurogep','Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.\r\n\r\n---\r\n\r\n![vlcsnap-2026-01-12-13h14m17s948.png](media#7)\r\n\r\nEz a törzsszöveg. A cím slugja `arvizturo-tukorfurogep` lett, nem pedig kötőjelek sora.','<p>Az ékezetes címekből is olvasható URL lesz, mert a slug az ékezeteket az alapbetűre képezi le.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png\" alt=\"vlcsnap-2026-01-12-13h14m17s948.png\" /></p>\n<p>Ez a törzsszöveg. A cím slugja <code>arvizturo-tukorfurogep</code> lett, nem pedig kötőjelek sora.</p>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 08:24:22',106,'mod'),(3,'post',NULL,2,NULL,'A short note','a-short-note','No separator here, so the whole thing is the lead and there is no body.','<p>No separator here, so the whole thing is the lead and there is no body.</p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(3,'post',NULL,2,NULL,'A short note','a-short-note','No separator here, so the whole thing is the lead and there is no body.','<p>No separator here, so the whole thing is the lead and there is no body.</p>\n','','draft','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 06:40:31',5,'mod'),(3,'post',NULL,2,NULL,'A short note','a-short-note','No separator here, so the whole thing is the lead and there is no body.','<p>No separator here, so the whole thing is the lead and there is no body.</p>\n','','published','2026-08-05 06:40:32','2026-08-04 17:13:38','2026-08-05 06:40:32',6,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\n---\n\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.</p>\n','<p>Still being written.</p>\n','draft',NULL,'2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\r\n\r\n---\r\n\r\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.</p>\n','<p>Still being written.</p>\n','draft',NULL,'2026-08-04 17:13:38','2026-08-05 07:23:30',11,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\r\\n\r\\n---\r\\n\r\\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\\n\n\\n---\n\\n\n\\nStill being written.</p>\n','','draft',NULL,'2026-08-04 17:13:38','2026-08-05 07:23:53',12,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\r\\\\n\r\\\\n---\r\\\\n\r\\\\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\\n\n\\n---\n\\n\n\\nStill being written.</p>\n','','published','2026-08-05 07:25:44','2026-08-04 17:13:38','2026-08-05 07:25:44',13,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\r\\\\\\\\n\r\\\\\\\\n---\r\\\\\\\\n\r\\\\\\\\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\\\\n\n\\\\n---\n\\\\n\n\\\\nStill being written.</p>\n','','draft','2026-08-05 07:25:44','2026-08-04 17:13:38','2026-08-05 07:25:45',14,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\r\\\\\\\\\\\\\\\\n\r\\\\\\\\\\\\\\\\n---\r\\\\\\\\\\\\\\\\n\r\\\\\\\\\\\\\\\\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\n\\\\\\\\n\n\\\\\\\\n---\n\\\\\\\\n\n\\\\\\\\nStill being written.</p>\n','','published','2026-08-05 07:25:45','2026-08-04 17:13:38','2026-08-05 07:25:45',15,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.</p>\n','','draft',NULL,'2026-08-04 17:13:38','2026-08-05 09:46:28',25,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.\n\n![A sunset](/uploads/2026/08/sunset-photo-e6dd2d.jpg)','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.</p>\n<p><img src=\"/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"A sunset\" /></p>\n','','draft',NULL,'2026-08-04 17:13:38','2026-08-05 09:46:29',26,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.\n\n![A sunset](/uploads/2026/08/sunset-photo-e6dd2d.jpg)\n<img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/logo-a02c1d-medium.png\">','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.</p>\n<p><img src=\"/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"A sunset\" />\n</p>\n','','draft',NULL,'2026-08-04 17:13:38','2026-08-05 09:46:29',27,'mod'),(4,'post',NULL,1,NULL,'Something unfinished','something-unfinished','A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.','<p>A draft. Visitors get a 404; anybody who may edit posts can preview it.\\n\\n---\\n\\nStill being written.</p>\n','','draft',NULL,'2026-08-04 17:13:38','2026-08-05 09:46:29',28,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\n\n---\n\nPages are hierarchical. This one has a child.','<p>About this site.</p>\n','<p>Pages are hierarchical. This one has a child.</p>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(5,'page',NULL,1,NULL,'About','about','x','<p>x</p>\n','','draft',NULL,'2026-08-04 17:13:38','2026-08-05 07:26:32',16,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-05 11:02:24',46,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.\r\n\r\n<a href=\"#ref\">Just testing</a>','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n<p>Just testing</p>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 12:15:21',158,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.\r\n\r\n```\r\nTest\r\n```','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n<pre><code>Test\n</code></pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 12:16:22',159,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.\r\n\r\n```css\r\nTest\r\n```','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n<pre><code class=\"language-css\">Test\n</code></pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 12:16:43',160,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.\r\n\r\n```css\r\nTest\r\n```','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n<pre><code class=\"language-css\">Test\n</code></pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 12:37:11',175,'mod'),(5,'page',NULL,1,NULL,'About','about','About this site.\r\n\r\n---\r\n\r\n![Example Sunset Photo](http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg)\r\n\r\nPages are hierarchical. This one has a child.\r\n\r\n```css\r\nTest\r\n```','<p>About this site.</p>\n','<p><img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"Example Sunset Photo\" /></p>\n<p>Pages are hierarchical. This one has a child.</p>\n<pre class=\"language-css\" data-enlighter-language=\"css\">Test\n</pre>\n','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-09-02 12:37:11',246,'mod'),(6,'page',5,1,NULL,'Contact','contact','How to get in touch.','<p>How to get in touch.</p>\n','','published','2026-08-04 17:13:38','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(7,'post',NULL,1,NULL,'test','test','test','<p>test</p>\n','','draft',NULL,'2026-09-02 08:53:14','2026-09-02 08:53:14',110,'add'),(8,'post',NULL,1,NULL,'ZZ target','zz-target-renamed','target','<p>target</p>\n','','draft',NULL,'2026-08-06 16:10:17','2026-08-06 16:10:17',63,'del'),(8,'post',NULL,7,NULL,'','auto-draft-883ae43449aade7b','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:06:19','2026-09-02 09:06:19',113,'add'),(8,'post',NULL,7,NULL,'A Post With No Save First','a-post-with-no-save-first','Body text here.','<p>Body text here.</p>\n','','draft',NULL,'2026-09-02 09:06:19','2026-09-02 09:07:14',115,'mod'),(8,'post',NULL,7,NULL,'A Post With No Save First','a-post-with-no-save-first','Body text here.','<p>Body text here.</p>\n','','draft',NULL,'2026-09-02 09:06:19','2026-09-02 09:07:14',118,'del'),(9,'post',NULL,1,NULL,'ZZ referrer','zz-referrer','See [the target](post#8) and ![pic](media#1).','<p>See <a href=\"http://localhost/dynart-dpress-app/public/post/zz-target\">the target</a> and <img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"pic\" />.</p>\n','','draft',NULL,'2026-08-06 16:10:17','2026-08-06 16:10:17',63,'del'),(9,'page',NULL,7,NULL,'','auto-draft-655f3f2b5064c4f8','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:07:23','2026-09-02 09:07:23',116,'add'),(9,'page',NULL,7,NULL,'','auto-draft-655f3f2b5064c4f8','',NULL,NULL,'auto_draft',NULL,'2026-08-01 00:00:00','2026-09-02 09:07:23',117,'del'),(10,'post',NULL,1,NULL,'ZZ target','zz-target-renamed','target','<p>target</p>\n','','draft',NULL,'2026-08-06 16:11:10','2026-08-06 16:11:10',64,'del'),(10,'post',NULL,8,NULL,'','auto-draft-6ebd4a176fee5bfc','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:12:30','2026-09-02 09:12:30',121,'add'),(11,'post',NULL,1,NULL,'ZZ referrer','zz-referrer','See [the target](post#10) and ![pic](media#1).','<p>See <a href=\"http://localhost/dynart-dpress-app/public/post/zz-target-renamed\">the target</a> and <img src=\"http://localhost/dynart-dpress-app/public/uploads/2026/08/sunset-photo-e6dd2d.jpg\" alt=\"pic\" />.</p>\n','','draft',NULL,'2026-08-06 16:11:10','2026-08-06 16:11:10',64,'del'),(11,'post',NULL,9,NULL,'','auto-draft-614005366c123874','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:12:30','2026-09-02 09:12:30',122,'add'),(12,'page',NULL,1,NULL,'ZZ parent','zz-parent-moved','p','<p>p</p>\n','','draft',NULL,'2026-08-06 16:11:43','2026-08-06 16:11:43',65,'del'),(12,'post',NULL,8,NULL,'','auto-draft-dcc8a54b0c345004','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:12:53','2026-09-02 09:12:53',123,'add'),(13,'page',12,1,NULL,'ZZ child','zz-child','c','<p>c</p>\n','','draft',NULL,'2026-08-06 16:11:43','2026-08-06 16:11:43',65,'del'),(13,'post',NULL,8,NULL,'','auto-draft-fb53ccaeb948616e','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:13:09','2026-09-02 09:13:09',124,'add'),(14,'post',NULL,1,NULL,'ZZ post','zz-post','Deep link to [the child page](page#13).','<p>Deep link to <a href=\"http://localhost/dynart-dpress-app/public/zz-parent-moved/zz-child\">the child page</a>.</p>\n','','draft',NULL,'2026-08-06 16:11:43','2026-08-06 16:11:43',65,'del'),(14,'post',NULL,8,NULL,'','auto-draft-4bedd6f5ab1e8d42','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:13:20','2026-09-02 09:13:20',125,'add'),(15,'post',NULL,5,NULL,'ZZ bulk one','zz-bulk-one','','','','draft',NULL,'2026-08-06 16:53:47','2026-08-06 16:53:47',71,'add'),(15,'post',NULL,5,NULL,'ZZ bulk one','zz-bulk-one','','','','draft',NULL,'2026-08-06 16:53:47','2026-08-06 16:53:47',74,'del'),(15,'post',NULL,8,NULL,'','auto-draft-d1413a25d66d927c','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:13:20','2026-09-02 09:13:20',126,'add'),(16,'post',NULL,5,NULL,'ZZ bulk two','zz-bulk-two','','','','draft',NULL,'2026-08-06 16:53:47','2026-08-06 16:53:47',72,'add'),(16,'post',NULL,5,NULL,'ZZ bulk two','zz-bulk-two','','','','draft',NULL,'2026-08-06 16:53:47','2026-08-06 16:53:47',74,'del'),(16,'post',NULL,8,NULL,'','auto-draft-270f14f806d3b181','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:13:21','2026-09-02 09:13:21',127,'add'),(17,'post',NULL,5,NULL,'ZZ bulk three','zz-bulk-three','','','','draft',NULL,'2026-08-06 16:53:47','2026-08-06 16:53:47',73,'add'),(17,'post',NULL,5,NULL,'ZZ bulk three','zz-bulk-three','','','','draft',NULL,'2026-08-06 16:53:47','2026-08-06 16:53:47',75,'del'),(17,'post',NULL,8,NULL,'','auto-draft-8e3e432abbd74d59','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:13:21','2026-09-02 09:13:21',128,'add'),(18,'post',NULL,1,NULL,'test','test','test','<p>test</p>\n','','draft',NULL,'2026-08-06 17:03:42','2026-08-06 17:03:42',77,'add'),(18,'post',NULL,1,NULL,'test','test','test','<p>test</p>\n','','draft',NULL,'2026-08-06 17:03:42','2026-08-06 17:03:42',78,'del'),(18,'post',NULL,8,NULL,'','auto-draft-eade7df504e1282a','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:13:21','2026-09-02 09:13:21',129,'add'),(19,'post',NULL,1,NULL,'','auto-draft-4903deac48713ff0','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:17:45','2026-09-02 09:17:45',130,'add'),(20,'post',NULL,10,NULL,'','auto-draft-218336f73fe670b0','',NULL,NULL,'auto_draft',NULL,'2026-09-02 09:21:22','2026-09-02 09:21:22',132,'add'),(21,'post',NULL,1,NULL,'Throwaway for delete test','throwaway-for-delete-test','','','','draft',NULL,'2026-09-02 16:24:49','2026-09-02 16:24:49',196,'add'),(21,'post',NULL,1,NULL,'Throwaway for delete test','throwaway-for-delete-test','','','','draft',NULL,'2026-09-02 16:24:49','2026-09-02 16:24:49',197,'del'),(22,'post',NULL,1,NULL,'Shortcode test','shortcode-test','Before the video.\n\n{{ video(\'media#10\') }}\n\nAfter it. Documented inline: `{{ video(\'media#10\') }}` stays text.','<p>Before the video.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>After it. Documented inline: <code>{{ video(\'media#10\') }}</code> stays text.</p>\n','','draft',NULL,'2026-09-02 17:23:16','2026-09-02 17:23:16',203,'add'),(22,'post',NULL,1,NULL,'Shortcode test','shortcode-test','Before the video.\n\n{{ video(\'media#10\') }}\n\nAfter it. Documented inline: `{{ video(\'media#10\') }}` stays text.','<p>Before the video.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>After it. Documented inline: <code>{{ video(\'media#10\') }}</code> stays text.</p>\n','','published','2026-09-02 17:23:24','2026-09-02 17:23:16','2026-09-02 17:23:24',204,'mod'),(22,'post',NULL,1,NULL,'Shortcode test','shortcode-test','Before the video.\n\n{{ video(\'media#10\') }}\n\nAfter it. Documented inline: `{{ video(\'media#10\') }}` stays text.','<p>Before the video.</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n<p>After it. Documented inline: <code>{{ video(\'media#10\') }}</code> stays text.</p>\n','','published','2026-09-02 17:23:24','2026-09-02 17:23:16','2026-09-02 17:23:24',209,'del'),(23,'post',NULL,1,NULL,'Shortcode errors','shortcode-errors','A: {{ video(\'media#2\') }} (an svg)\n\nB: {{ nosuch() }}\n\nC: {{ video() }}\n\nD: {{ video(\'https://youtu.be/abc\') }}','<p>A: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzIiXX0=--> (an svg)</p>\n<p>B: {{ nosuch() }}</p>\n<p>C: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbXX0=--></p>\n<p>D: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC95b3V0dS5iZVwvYWJjIl19--></p>\n','','draft',NULL,'2026-09-02 17:23:48','2026-09-02 17:23:48',207,'add'),(23,'post',NULL,1,NULL,'Shortcode errors','shortcode-errors','A: {{ video(\'media#2\') }} (an svg)\n\nB: {{ nosuch() }}\n\nC: {{ video() }}\n\nD: {{ video(\'https://youtu.be/abc\') }}','<p>A: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzIiXX0=--> (an svg)</p>\n<p>B: {{ nosuch() }}</p>\n<p>C: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbXX0=--></p>\n<p>D: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC95b3V0dS5iZVwvYWJjIl19--></p>\n','','published','2026-09-02 17:23:48','2026-09-02 17:23:48','2026-09-02 17:23:48',208,'mod'),(23,'post',NULL,1,NULL,'Shortcode errors','shortcode-errors','A: {{ video(\'media#2\') }} (an svg)\n\nB: {{ nosuch() }}\n\nC: {{ video() }}\n\nD: {{ video(\'https://youtu.be/abc\') }}','<p>A: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzIiXX0=--> (an svg)</p>\n<p>B: {{ nosuch() }}</p>\n<p>C: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbXX0=--></p>\n<p>D: <!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC95b3V0dS5iZVwvYWJjIl19--></p>\n','','published','2026-09-02 17:23:48','2026-09-02 17:23:48','2026-09-02 17:23:48',210,'del'),(24,'post',NULL,1,NULL,'Video width check','video-width-check','{{ video(\'media#10\') }}','<!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n','','draft',NULL,'2026-09-02 17:30:20','2026-09-02 17:30:20',215,'add'),(24,'post',NULL,1,NULL,'Video width check','video-width-check','{{ video(\'media#10\') }}','<!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n','','published','2026-09-02 17:30:21','2026-09-02 17:30:20','2026-09-02 17:30:21',216,'mod'),(24,'post',NULL,1,NULL,'Video width check','video-width-check','{{ video(\'media#10\') }}','<!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbIm1lZGlhIzEwIl19-->\n','','published','2026-09-02 17:30:21','2026-09-02 17:30:20','2026-09-02 17:30:21',217,'del'),(25,'post',NULL,1,NULL,'YouTube check','youtube-check','A watch link:\n\n{{ video(\'https://www.youtube.com/watch?v=dQw4w9WgXcQ\') }}\n\nA short link with a start time:\n\n{{ video(\'https://youtu.be/dQw4w9WgXcQ?t=90\') }}\n\nVimeo:\n\n{{ video(\'https://vimeo.com/76979871\') }}\n\nA lookalike:\n\n{{ video(\'https://notyoutube.com/watch?v=dQw4w9WgXcQ\') }}','<p>A watch link:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC93d3cueW91dHViZS5jb21cL3dhdGNoP3Y9ZFF3NHc5V2dYY1EiXX0=-->\n<p>A short link with a start time:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC95b3V0dS5iZVwvZFF3NHc5V2dYY1E/dD05MCJdfQ==-->\n<p>Vimeo:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC92aW1lby5jb21cLzc2OTc5ODcxIl19-->\n<p>A lookalike:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC9ub3R5b3V0dWJlLmNvbVwvd2F0Y2g/dj1kUXc0dzlXZ1hjUSJdfQ==-->\n','','draft',NULL,'2026-09-02 17:36:30','2026-09-02 17:36:30',219,'add'),(25,'post',NULL,1,NULL,'YouTube check','youtube-check','A watch link:\n\n{{ video(\'https://www.youtube.com/watch?v=dQw4w9WgXcQ\') }}\n\nA short link with a start time:\n\n{{ video(\'https://youtu.be/dQw4w9WgXcQ?t=90\') }}\n\nVimeo:\n\n{{ video(\'https://vimeo.com/76979871\') }}\n\nA lookalike:\n\n{{ video(\'https://notyoutube.com/watch?v=dQw4w9WgXcQ\') }}','<p>A watch link:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC93d3cueW91dHViZS5jb21cL3dhdGNoP3Y9ZFF3NHc5V2dYY1EiXX0=-->\n<p>A short link with a start time:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC95b3V0dS5iZVwvZFF3NHc5V2dYY1E/dD05MCJdfQ==-->\n<p>Vimeo:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC92aW1lby5jb21cLzc2OTc5ODcxIl19-->\n<p>A lookalike:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC9ub3R5b3V0dWJlLmNvbVwvd2F0Y2g/dj1kUXc0dzlXZ1hjUSJdfQ==-->\n','','published','2026-09-02 17:36:31','2026-09-02 17:36:30','2026-09-02 17:36:31',220,'mod'),(25,'post',NULL,1,NULL,'YouTube check','youtube-check','A watch link:\n\n{{ video(\'https://www.youtube.com/watch?v=dQw4w9WgXcQ\') }}\n\nA short link with a start time:\n\n{{ video(\'https://youtu.be/dQw4w9WgXcQ?t=90\') }}\n\nVimeo:\n\n{{ video(\'https://vimeo.com/76979871\') }}\n\nA lookalike:\n\n{{ video(\'https://notyoutube.com/watch?v=dQw4w9WgXcQ\') }}','<p>A watch link:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC93d3cueW91dHViZS5jb21cL3dhdGNoP3Y9ZFF3NHc5V2dYY1EiXX0=-->\n<p>A short link with a start time:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC95b3V0dS5iZVwvZFF3NHc5V2dYY1E/dD05MCJdfQ==-->\n<p>Vimeo:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC92aW1lby5jb21cLzc2OTc5ODcxIl19-->\n<p>A lookalike:</p><!--dpress-sc eyJuIjoidmlkZW8iLCJhIjpbImh0dHBzOlwvXC9ub3R5b3V0dWJlLmNvbVwvd2F0Y2g/dj1kUXc0dzlXZ1hjUSJdfQ==-->\n','','published','2026-09-02 17:36:31','2026-09-02 17:36:30','2026-09-02 17:36:31',221,'del'),(26,'post',NULL,1,NULL,'Code test','code-test','Some PHP:\n\n```php\n<?php echo \"hi\"; ?>\n```\n\nSome Python:\n\n```py\ndef f(): return 1\n```\n\nNo language:\n\n```\nplain text\n```\n','<p>Some PHP:</p>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php echo &quot;hi&quot;; ?&gt;\n</code></pre>\n<p>Some Python:</p>\n<pre data-enlighter-language=\"python\"><code class=\"language-py\">def f(): return 1\n</code></pre>\n<p>No language:</p>\n<pre><code>plain text\n</code></pre>\n','','draft',NULL,'2026-09-02 18:01:15','2026-09-02 18:01:15',225,'add'),(26,'post',NULL,1,NULL,'Code test','code-test','Some PHP:\n\n```php\n<?php echo \"hi\"; ?>\n```\n\nSome Python:\n\n```py\ndef f(): return 1\n```\n\nNo language:\n\n```\nplain text\n```\n','<p>Some PHP:</p>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php echo &quot;hi&quot;; ?&gt;\n</code></pre>\n<p>Some Python:</p>\n<pre data-enlighter-language=\"python\"><code class=\"language-py\">def f(): return 1\n</code></pre>\n<p>No language:</p>\n<pre><code>plain text\n</code></pre>\n','','published','2026-09-02 18:01:15','2026-09-02 18:01:15','2026-09-02 18:01:15',226,'mod'),(26,'post',NULL,1,NULL,'Code test','code-test','Some PHP:\n\n```php\n<?php echo \"hi\"; ?>\n```\n\nSome Python:\n\n```py\ndef f(): return 1\n```\n\nNo language:\n\n```\nplain text\n```\n','<p>Some PHP:</p>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php echo &quot;hi&quot;; ?&gt;\n</code></pre>\n<p>Some Python:</p>\n<pre data-enlighter-language=\"python\"><code class=\"language-py\">def f(): return 1\n</code></pre>\n<p>No language:</p>\n<pre><code>plain text\n</code></pre>\n','','published','2026-09-02 18:01:15','2026-09-02 18:01:15','2026-09-02 18:01:15',238,'del'),(27,'post',NULL,1,NULL,'Escaping check','escaping-check','Dangerous:\n\n```html\n<script>alert(1)</script>\n```\n','<p>Dangerous:</p>\n<pre data-enlighter-language=\"xml\"><code class=\"language-html\">&lt;script&gt;alert(1)&lt;/script&gt;\n</code></pre>\n','','draft',NULL,'2026-09-02 18:03:23','2026-09-02 18:03:23',236,'add'),(27,'post',NULL,1,NULL,'Escaping check','escaping-check','Dangerous:\n\n```html\n<script>alert(1)</script>\n```\n','<p>Dangerous:</p>\n<pre data-enlighter-language=\"xml\"><code class=\"language-html\">&lt;script&gt;alert(1)&lt;/script&gt;\n</code></pre>\n','','published','2026-09-02 18:03:23','2026-09-02 18:03:23','2026-09-02 18:03:23',237,'mod'),(27,'post',NULL,1,NULL,'Escaping check','escaping-check','Dangerous:\n\n```html\n<script>alert(1)</script>\n```\n','<p>Dangerous:</p>\n<pre data-enlighter-language=\"xml\"><code class=\"language-html\">&lt;script&gt;alert(1)&lt;/script&gt;\n</code></pre>\n','','published','2026-09-02 18:03:23','2026-09-02 18:03:23','2026-09-02 18:03:23',239,'del'),(28,'post',NULL,1,NULL,'Padding check','padding-check','Text before.\n\n```php\n<?php\necho \"hello\";\n```\n\nText after.\n','<p>Text before.</p>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php\necho &quot;hello&quot;;\n</code></pre>\n<p>Text after.</p>\n','','draft',NULL,'2026-09-02 18:11:42','2026-09-02 18:11:42',242,'add'),(28,'post',NULL,1,NULL,'Padding check','padding-check','Text before.\n\n```php\n<?php\necho \"hello\";\n```\n\nText after.\n','<p>Text before.</p>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php\necho &quot;hello&quot;;\n</code></pre>\n<p>Text after.</p>\n','','published','2026-09-02 18:11:42','2026-09-02 18:11:42','2026-09-02 18:11:42',243,'mod'),(28,'post',NULL,1,NULL,'Padding check','padding-check','Text before.\n\n```php\n<?php\necho \"hello\";\n```\n\nText after.\n','<p>Text before.</p>\n<pre data-enlighter-language=\"php\"><code class=\"language-php\">&lt;?php\necho &quot;hello&quot;;\n</code></pre>\n<p>Text after.</p>\n','','published','2026-09-02 18:11:42','2026-09-02 18:11:42','2026-09-02 18:11:42',244,'del'),(29,'post',NULL,1,NULL,'Callout check','callout-check','Ordinary text.\n\n> A plain quote, which should be grey with a quote mark.\n\n> [!NOTE]\n> A note, which is **info** blue and may contain [a link](https://example.com).\n\n> [!WARNING]\n> A warning, orange.\n\n> [!CAUTION]\n> Danger, red.\n\n> [!TIP] On one line, so there is no newline to remove.\n\n> [!NOPE]\n> An unknown marker stays exactly as written.\n','<p>Ordinary text.</p>\n<blockquote class=\"callout callout-quote\">\n<p>A plain quote, which should be grey with a quote mark.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>A note, which is <strong>info</strong> blue and may contain <a href=\"https://example.com\">a link</a>.</p>\n</blockquote>\n<blockquote class=\"callout callout-warning\">\n<p>A warning, orange.</p>\n</blockquote>\n<blockquote class=\"callout callout-danger\">\n<p>Danger, red.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>On one line, so there is no newline to remove.</p>\n</blockquote>\n<blockquote class=\"callout callout-quote\">\n<p>[!NOPE]\nAn unknown marker stays exactly as written.</p>\n</blockquote>\n','','draft',NULL,'2026-09-02 18:53:22','2026-09-02 18:53:22',247,'add'),(29,'post',NULL,1,NULL,'Callout check','callout-check','Ordinary text.\n\n> A plain quote, which should be grey with a quote mark.\n\n> [!NOTE]\n> A note, which is **info** blue and may contain [a link](https://example.com).\n\n> [!WARNING]\n> A warning, orange.\n\n> [!CAUTION]\n> Danger, red.\n\n> [!TIP] On one line, so there is no newline to remove.\n\n> [!NOPE]\n> An unknown marker stays exactly as written.\n','<p>Ordinary text.</p>\n<blockquote class=\"callout callout-quote\">\n<p>A plain quote, which should be grey with a quote mark.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>A note, which is <strong>info</strong> blue and may contain <a href=\"https://example.com\">a link</a>.</p>\n</blockquote>\n<blockquote class=\"callout callout-warning\">\n<p>A warning, orange.</p>\n</blockquote>\n<blockquote class=\"callout callout-danger\">\n<p>Danger, red.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>On one line, so there is no newline to remove.</p>\n</blockquote>\n<blockquote class=\"callout callout-quote\">\n<p>[!NOPE]\nAn unknown marker stays exactly as written.</p>\n</blockquote>\n','','published','2026-09-02 18:53:22','2026-09-02 18:53:22','2026-09-02 18:53:22',248,'mod'),(29,'post',NULL,1,NULL,'Callout check','callout-check','Ordinary text.\n\n> A plain quote, which should be grey with a quote mark.\n\n> [!NOTE]\n> A note, which is **info** blue and may contain [a link](https://example.com).\n\n> [!WARNING]\n> A warning, orange.\n\n> [!CAUTION]\n> Danger, red.\n\n> [!TIP] On one line, so there is no newline to remove.\n\n> [!NOPE]\n> An unknown marker stays exactly as written.\n','<p>Ordinary text.</p>\n<blockquote class=\"callout callout-quote\">\n<p>A plain quote, which should be grey with a quote mark.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>A note, which is <strong>info</strong> blue and may contain <a href=\"https://example.com\">a link</a>.</p>\n</blockquote>\n<blockquote class=\"callout callout-warning\">\n<p>A warning, orange.</p>\n</blockquote>\n<blockquote class=\"callout callout-danger\">\n<p>Danger, red.</p>\n</blockquote>\n<blockquote class=\"callout callout-info\">\n<p>On one line, so there is no newline to remove.</p>\n</blockquote>\n<blockquote class=\"callout callout-quote\">\n<p>[!NOPE]\nAn unknown marker stays exactly as written.</p>\n</blockquote>\n','','published','2026-09-02 18:53:22','2026-09-02 18:53:22','2026-09-02 18:53:22',249,'del');
/*!40000 ALTER TABLE `dp_content_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_category`
--

DROP TABLE IF EXISTS `dp_content_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_category` (
  `content_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `dp_content_category_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `dp_content` (`id`),
  CONSTRAINT `dp_content_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `dp_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_category`
--

LOCK TABLES `dp_content_category` WRITE;
/*!40000 ALTER TABLE `dp_content_category` DISABLE KEYS */;
INSERT INTO `dp_content_category` VALUES (1,1),(2,3),(3,1);
/*!40000 ALTER TABLE `dp_content_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_category_aud`
--

DROP TABLE IF EXISTS `dp_content_category_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_category_aud` (
  `content_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`content_id`,`category_id`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_category_aud`
--

LOCK TABLES `dp_content_category_aud` WRITE;
/*!40000 ALTER TABLE `dp_content_category_aud` DISABLE KEYS */;
INSERT INTO `dp_content_category_aud` VALUES (1,1,2,'add'),(2,3,2,'add'),(3,1,2,'add');
/*!40000 ALTER TABLE `dp_content_category_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_tag`
--

DROP TABLE IF EXISTS `dp_content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_tag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `dp_content_tag_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `dp_content` (`id`),
  CONSTRAINT `dp_content_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `dp_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_tag`
--

LOCK TABLES `dp_content_tag` WRITE;
/*!40000 ALTER TABLE `dp_content_tag` DISABLE KEYS */;
INSERT INTO `dp_content_tag` VALUES (1,1),(1,2),(1,3),(2,2),(3,1);
/*!40000 ALTER TABLE `dp_content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_content_tag_aud`
--

DROP TABLE IF EXISTS `dp_content_tag_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_content_tag_aud` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`content_id`,`tag_id`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_content_tag_aud`
--

LOCK TABLES `dp_content_tag_aud` WRITE;
/*!40000 ALTER TABLE `dp_content_tag_aud` DISABLE KEYS */;
INSERT INTO `dp_content_tag_aud` VALUES (1,1,2,'add'),(1,2,2,'add'),(1,3,2,'add'),(2,2,2,'add'),(3,1,2,'add');
/*!40000 ALTER TABLE `dp_content_tag_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_media`
--

DROP TABLE IF EXISTS `dp_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL DEFAULT 'other',
  `size` int(11) NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `caption` longtext DEFAULT NULL,
  `uploaded_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_path` (`path`),
  KEY `idx_category` (`category`),
  KEY `idx_uploaded_by` (`uploaded_by`),
  KEY `idx_deleted_at` (`deleted_at`),
  CONSTRAINT `dp_media_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `dp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_media`
--

LOCK TABLES `dp_media` WRITE;
/*!40000 ALTER TABLE `dp_media` DISABLE KEYS */;
INSERT INTO `dp_media` VALUES (1,'2026/08/sunset-photo-e6dd2d.jpg','Sunset Photo.jpg','image/jpeg','image',24991,1200,800,'Example Sunset Photo',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-05 06:40:32',NULL),(2,'2026/08/icon-85e1b2.svg','icon.svg','image/svg+xml','image',113,NULL,NULL,'Example icon',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-04 17:13:38',NULL),(3,'2026/08/logo-a02c1d.png','logo.png','image/png','image',897,300,300,'Example logo',NULL,NULL,1,'2026-08-04 17:13:38','2026-09-02 12:25:19',NULL),(4,'2026/08/notes-312b3b.txt','notes.txt','text/plain','document',14,NULL,NULL,'Example notes',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-04 17:13:38',NULL),(6,'2026/08/vlcsnap-2026-01-12-13h03m01s605-8d29fe.png','vlcsnap-2026-01-12-13h03m01s605.png','image/png','image',985670,1176,784,NULL,NULL,NULL,1,'2026-08-05 11:56:19','2026-08-05 11:56:19',NULL),(7,'2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png','vlcsnap-2026-01-12-13h14m17s948.png','image/png','image',1155061,1176,784,NULL,NULL,NULL,1,'2026-08-05 11:56:28','2026-08-05 11:56:28',NULL),(9,'2026/09/22863-38768-800-465123.jpg','22863-38768-800.jpg','image/jpeg','image',30588,800,400,NULL,NULL,NULL,1,'2026-09-02 09:41:08','2026-09-02 09:41:38','2026-09-02 09:41:38'),(10,'2026/09/fox-6641fe.mp4','Fox.mp4','video/mp4','video',575872,NULL,NULL,'A fox','','',1,'2026-09-02 10:13:22','2026-09-02 17:23:37',NULL);
/*!40000 ALTER TABLE `dp_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_media_aud`
--

DROP TABLE IF EXISTS `dp_media_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_media_aud` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL DEFAULT 'other',
  `size` int(11) NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `caption` longtext DEFAULT NULL,
  `uploaded_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`id`,`rev_id`),
  KEY `idx_category` (`category`),
  KEY `idx_uploaded_by` (`uploaded_by`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_media_aud`
--

LOCK TABLES `dp_media_aud` WRITE;
/*!40000 ALTER TABLE `dp_media_aud` DISABLE KEYS */;
INSERT INTO `dp_media_aud` VALUES (1,'2026/08/sunset-photo-e6dd2d.jpg','Sunset Photo.jpg','image/jpeg','image',24991,1200,800,'Example Sunset Photo',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-04 17:13:38',NULL,2,'add'),(1,'2026/08/sunset-photo-e6dd2d.jpg','Sunset Photo.jpg','image/jpeg','image',24991,1200,800,'Example Sunset Photo',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-05 06:40:32','2026-08-05 06:40:32',7,'mod'),(1,'2026/08/sunset-photo-e6dd2d.jpg','Sunset Photo.jpg','image/jpeg','image',24991,1200,800,'Example Sunset Photo',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-05 06:40:32',NULL,8,'mod'),(2,'2026/08/icon-85e1b2.svg','icon.svg','image/svg+xml','image',113,NULL,NULL,'Example icon',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-04 17:13:38',NULL,2,'add'),(3,'2026/08/logo-a02c1d.png','logo.png','image/png','image',897,300,300,'Example logo',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-04 17:13:38',NULL,2,'add'),(3,'2026/08/logo-a02c1d.png','logo.png','image/png','image',897,300,300,'Example logo',NULL,NULL,1,'2026-08-04 17:13:38','2026-09-02 12:25:19','2026-09-02 12:25:19',165,'mod'),(3,'2026/08/logo-a02c1d.png','logo.png','image/png','image',897,300,300,'Example logo',NULL,NULL,1,'2026-08-04 17:13:38','2026-09-02 12:25:19',NULL,166,'mod'),(4,'2026/08/notes-312b3b.txt','notes.txt','text/plain','document',14,NULL,NULL,'Example notes',NULL,NULL,1,'2026-08-04 17:13:38','2026-08-04 17:13:38',NULL,2,'add'),(5,'2026/08/probe-1ac0d5.png','probe.png','image/png','image',89,8,8,NULL,NULL,NULL,1,'2026-08-05 11:04:33','2026-08-05 11:04:33',NULL,47,'add'),(5,'2026/08/probe-1ac0d5.png','probe.png','image/png','image',89,8,8,NULL,NULL,NULL,1,'2026-08-05 11:04:33','2026-08-05 11:05:05','2026-08-05 11:05:05',48,'mod'),(5,'2026/08/probe-1ac0d5.png','probe.png','image/png','image',89,8,8,NULL,NULL,NULL,1,'2026-08-05 11:04:33','2026-08-05 11:05:05','2026-08-05 11:05:05',49,'del'),(6,'2026/08/vlcsnap-2026-01-12-13h03m01s605-8d29fe.png','vlcsnap-2026-01-12-13h03m01s605.png','image/png','image',985670,1176,784,NULL,NULL,NULL,1,'2026-08-05 11:56:19','2026-08-05 11:56:19',NULL,50,'add'),(7,'2026/08/vlcsnap-2026-01-12-13h14m17s948-51b115.png','vlcsnap-2026-01-12-13h14m17s948.png','image/png','image',1155061,1176,784,NULL,NULL,NULL,1,'2026-08-05 11:56:28','2026-08-05 11:56:28',NULL,51,'add'),(8,'2026/08/probe2-0012da.png','probe2.png','image/png','image',89,8,8,NULL,NULL,NULL,1,'2026-08-05 12:00:44','2026-08-05 12:00:44',NULL,55,'add'),(8,'2026/08/probe2-0012da.png','probe2.png','image/png','image',89,8,8,NULL,NULL,NULL,1,'2026-08-05 12:00:44','2026-08-05 12:00:45','2026-08-05 12:00:45',57,'mod'),(8,'2026/08/probe2-0012da.png','probe2.png','image/png','image',89,8,8,NULL,NULL,NULL,1,'2026-08-05 12:00:44','2026-08-05 12:00:45','2026-08-05 12:00:45',58,'del'),(8,'2026/09/2-cc0201.mp4','2.mp4','video/mp4','video',575872,NULL,NULL,NULL,NULL,NULL,1,'2026-09-02 08:23:33','2026-09-02 08:23:33',NULL,103,'add'),(8,'2026/09/2-cc0201.mp4','2.mp4','video/mp4','video',575872,NULL,NULL,NULL,NULL,NULL,1,'2026-09-02 08:23:33','2026-09-02 10:14:02','2026-09-02 10:14:02',152,'mod'),(8,'2026/09/2-cc0201.mp4','2.mp4','video/mp4','video',575872,NULL,NULL,NULL,NULL,NULL,1,'2026-09-02 08:23:33','2026-09-02 10:14:02','2026-09-02 10:14:02',153,'del'),(9,'2026/09/22863-38768-800-465123.jpg','22863-38768-800.jpg','image/jpeg','image',30588,800,400,NULL,NULL,NULL,1,'2026-09-02 09:41:08','2026-09-02 09:41:08',NULL,137,'add'),(9,'2026/09/22863-38768-800-465123.jpg','22863-38768-800.jpg','image/jpeg','image',30588,800,400,NULL,NULL,NULL,1,'2026-09-02 09:41:08','2026-09-02 09:41:38','2026-09-02 09:41:38',139,'mod'),(10,'2026/09/fox-6641fe.mp4','Fox.mp4','video/mp4','video',575872,NULL,NULL,'A fox','','',1,'2026-09-02 10:13:22','2026-09-02 10:13:22',NULL,148,'add'),(10,'2026/09/fox-6641fe.mp4','Fox.mp4','video/mp4','video',575872,NULL,NULL,'A fox, generated','','',1,'2026-09-02 10:13:22','2026-09-02 17:23:37','2026-09-02 17:23:37',205,'mod'),(10,'2026/09/fox-6641fe.mp4','Fox.mp4','video/mp4','video',575872,NULL,NULL,'A fox, generated','','',1,'2026-09-02 10:13:22','2026-09-02 17:23:37',NULL,206,'mod');
/*!40000 ALTER TABLE `dp_media_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_menu`
--

DROP TABLE IF EXISTS `dp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_place` (`place`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_menu`
--

LOCK TABLES `dp_menu` WRITE;
/*!40000 ALTER TABLE `dp_menu` DISABLE KEYS */;
INSERT INTO `dp_menu` VALUES (1,'Main','main');
/*!40000 ALTER TABLE `dp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_menu_item`
--

DROP TABLE IF EXISTS `dp_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `target_type` varchar(20) NOT NULL DEFAULT 'content',
  `target_id` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_menu_id` (`menu_id`),
  KEY `idx_parent_id` (`parent_id`),
  CONSTRAINT `dp_menu_item_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `dp_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_menu_item`
--

LOCK TABLES `dp_menu_item` WRITE;
/*!40000 ALTER TABLE `dp_menu_item` DISABLE KEYS */;
INSERT INTO `dp_menu_item` VALUES (1,1,NULL,'Home','home',NULL,NULL,0),(2,1,NULL,'About','content',5,NULL,2),(3,1,NULL,'News','category',1,NULL,1);
/*!40000 ALTER TABLE `dp_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_migration_history`
--

DROP TABLE IF EXISTS `dp_migration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_migration_history` (
  `version` varchar(191) NOT NULL,
  `applied_at` datetime NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_migration_history`
--

LOCK TABLES `dp_migration_history` WRITE;
/*!40000 ALTER TABLE `dp_migration_history` DISABLE KEYS */;
INSERT INTO `dp_migration_history` VALUES ('0001_create_schema','2026-08-06 19:40:01'),('2026_08_06_001_create_reading_time_table','2026-08-06 19:51:16');
/*!40000 ALTER TABLE `dp_migration_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_reading_time`
--

DROP TABLE IF EXISTS `dp_reading_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_reading_time` (
  `content_id` int(11) NOT NULL,
  `minutes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_reading_time`
--

LOCK TABLES `dp_reading_time` WRITE;
/*!40000 ALTER TABLE `dp_reading_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `dp_reading_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_refresh_token`
--

DROP TABLE IF EXISTS `dp_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_token_hash` (`token_hash`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_expires_at` (`expires_at`),
  CONSTRAINT `dp_refresh_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_refresh_token`
--

LOCK TABLES `dp_refresh_token` WRITE;
/*!40000 ALTER TABLE `dp_refresh_token` DISABLE KEYS */;
INSERT INTO `dp_refresh_token` VALUES (1,1,'ced41c482ddfb6f3d7411aa937a1b52dce0c9dbbf50fde187ab6ed68fa9e823d','2026-09-04 06:39:45','2026-08-05 06:39:45','2026-09-02 08:22:50'),(2,1,'d74b95764feb3fec84bd4f0fc9bef0e8dd0f36fbebc297ef04876d0262069091','2026-09-04 06:52:58','2026-08-05 06:52:58','2026-08-05 07:09:26'),(3,1,'edbb3fb818a4ad5971f866fe035eb9ecce4f012386aeafdf0b3a108509c5ec8e','2026-09-04 07:07:13','2026-08-05 07:07:13','2026-09-02 08:22:50'),(4,1,'d03561248d441c86a9d5c603a842eb993b826b31e2abdb9dc656e7503bfe67b1','2026-09-04 07:09:26','2026-08-05 07:09:26','2026-09-02 08:22:50'),(5,1,'d0f0235e639be2cd5fa284fbe62fc03248b94246b994e3cb618baa1bcd7c2314','2026-09-04 07:11:36','2026-08-05 07:11:36','2026-09-02 08:22:50'),(6,1,'ba20c09b6891c5b360095d15b3d4fd7bb7fe40ebdca6ad449cc4af60816a4d49','2026-09-04 07:18:44','2026-08-05 07:18:44','2026-09-02 08:22:50'),(7,1,'a93b6769f2bf9ab3078b5c1bb1c991a6968d6e9ff4b1d1c6feaa561f1ccf742a','2026-09-04 07:23:17','2026-08-05 07:23:17','2026-08-05 10:05:48'),(8,2,'80430cca31886cb3dc78d5c95ce44a74db234822d27b0eeea18eaeb0e5786e0d','2026-09-04 07:26:17','2026-08-05 07:26:17',NULL),(9,1,'7afd958beec0f54b3b616f291f5140488e2a276a515916285a5c348462731a46','2026-09-04 07:29:44','2026-08-05 07:29:44','2026-09-02 08:22:50'),(10,1,'c57a4bec89f342dcdbe71c94646094ae18e0e5215d66cd42291dfe3d65ec1453','2026-09-04 08:26:23','2026-08-05 08:26:23','2026-09-02 08:22:50'),(11,1,'dfe24a901f3dad636bbbe0beb4e79da45e9d56c7a7c1a5d4dd51bb11ae3fb087','2026-09-04 09:46:11','2026-08-05 09:46:11','2026-08-05 10:26:21'),(12,1,'100403c8decd586370345ca5c0f91efec6c40f2a6f6c25e6e99157e9bba30187','2026-09-04 10:05:48','2026-08-05 10:05:48','2026-08-05 10:53:46'),(13,1,'3d050acf3c71414e74fd728be3419c5c4a0f8e15c9f25cd1682ee5e9d32615f4','2026-09-04 10:26:21','2026-08-05 10:26:21','2026-09-02 08:22:50'),(14,1,'a2e762e269d6023c5ec010516e7fd783d689f7b3fa772ce0fad3f17923fbb1c2','2026-09-04 10:26:49','2026-08-05 10:26:49','2026-08-05 10:56:24'),(15,1,'eab565d125c72f170e53cf32d20d8e0ebfba03519ea8c0e0d07d6f644243b834','2026-09-04 10:53:46','2026-08-05 10:53:46','2026-08-05 11:31:18'),(16,1,'ea5f504a71de8b52b3d648ade99a2a995bf4272204d2ff73841d530f849297c5','2026-09-04 10:56:24','2026-08-05 10:56:24','2026-09-02 08:22:50'),(17,1,'9a5b21518d33ffd0dca320aab3bb52f8ad33e7627b6af45fe92cb10866b9b05f','2026-09-04 10:57:40','2026-08-05 10:57:40','2026-08-05 11:58:32'),(18,1,'9b07fbb180c4c4e12323f61e9b96fb05136808d929dc8c25a1870dbd57a74bfe','2026-09-04 11:31:18','2026-08-05 11:31:18','2026-08-05 11:55:47'),(19,1,'004aa7844c49cc71822b81872e69c0f8d58f88c901498def333c0f826c0a2603','2026-09-04 11:55:47','2026-08-05 11:55:47','2026-08-05 12:22:43'),(20,1,'31a6336097ecd2f90beefd5bc661c731a52948c4478b7f78a885ef94af43c7dc','2026-09-04 11:58:32','2026-08-05 11:58:32','2026-08-05 17:54:56'),(21,1,'526fa54bd4c05e24f5b4eb8ca2c71d7a0c764c3dc28972a847fdd4a4b9ff6363','2026-09-04 12:22:43','2026-08-05 12:22:43','2026-08-05 12:58:28'),(22,1,'f656116b49a3a5bb2287eca971c817221286ffedcfebae5c963bcb01f2fbe5e3','2026-09-04 12:58:28','2026-08-05 12:58:28','2026-08-05 15:09:05'),(23,1,'6d5cda49e4bac3ebad6bf940a5fd63c6d1eeac690691ac03dd95860a400b8b85','2026-09-04 15:09:05','2026-08-05 15:09:05','2026-08-05 17:50:49'),(24,1,'0c63abb0e94053173f8e7fd731b3f7b3fc6c45a82ae40ad7135a0d0dcb7c978c','2026-09-04 17:50:49','2026-08-05 17:50:49','2026-08-05 18:06:17'),(25,1,'43889b5fba1b87763e6a56b0a825073ac75844b69ef09730e3440204629e489d','2026-09-04 17:54:56','2026-08-05 17:54:56','2026-09-02 08:22:50'),(26,1,'79897109651fb35139bd0fabfa7ccdc716e0db6ca7b46d2ae542ac5d20b949eb','2026-09-04 17:55:15','2026-08-05 17:55:15','2026-08-06 16:16:45'),(27,1,'f40be44c15f83fc74198ae2bcb8d945dacfde82ff139cb6966a31c927387fc06','2026-09-04 18:06:17','2026-08-05 18:06:17','2026-08-06 13:34:12'),(28,1,'31b03f258a45f1ab1999c8ccdf56d8b3dbf83062788d74f0cca929b2b051594d','2026-09-05 13:34:12','2026-08-06 13:34:12','2026-08-06 14:57:15'),(29,1,'904fd6ddc01c111ba5be3fa4464cdb0e2fe8df22ae77ef745651a1a69515a9fe','2026-09-05 14:57:15','2026-08-06 14:57:15','2026-08-06 15:33:57'),(30,1,'4f038c5ade78338e2588c0719bdaaa75c0bb83e037759dc8dd6a35f532ca8f71','2026-09-05 15:33:57','2026-08-06 15:33:57','2026-08-06 16:30:38'),(31,1,'32803e5d0ccb7c2578930c774e25d2f4e6a7738be9722e3598154b7e46cd5e2c','2026-09-05 16:16:45','2026-08-06 16:16:45','2026-09-02 08:22:50'),(32,1,'a54e801b89a6cea1c5ac0624f051ad4e720f4492aa91b177553abf35b542e478','2026-09-05 16:30:38','2026-08-06 16:30:38','2026-08-06 17:00:45'),(34,1,'ccab52dec54c4ffafe5e886754e2ee9965481f5fa968d828ce655a7ff0199078','2026-09-05 17:00:45','2026-08-06 17:00:45','2026-08-06 19:04:32'),(36,1,'52e3f0369665c430c8ef4c91d356912f5e2e32f5fa8b4ef6acb7e7f433a89cc6','2026-09-05 19:04:32','2026-08-06 19:04:32','2026-08-06 19:31:29'),(37,1,'28d0fdc5d1351b53e55408ea0bd975c8d057b36ec28d25f2b488ce750cf35da6','2026-09-05 19:31:29','2026-08-06 19:31:29','2026-08-06 20:06:30'),(39,1,'292e12afde33a29ad74b822be84c6ccb8d07bd58aee4991e51143145be4abe8d','2026-09-05 20:06:30','2026-08-06 20:06:30','2026-08-07 06:18:23'),(40,1,'42dfe40ac4aef65e4484987e3675ba57e924bde3a9943e75442ed94f012d5d5e','2026-09-06 06:18:23','2026-08-07 06:18:23','2026-08-07 06:18:54'),(41,1,'93b1bc0feacf4d335c80b9791a813b4a25223865b959d1c8e64360d357474078','2026-09-06 06:19:06','2026-08-07 06:19:06','2026-08-07 06:38:54'),(42,1,'aa3a78b6c7d01f33d65b27f020a8415c880026ea497abfecba2c3a713a2b7588','2026-09-06 06:38:54','2026-08-07 06:38:54','2026-09-02 08:22:50'),(43,1,'d52d3d06a9b7c6e9378795226425ee26d56c8112329bd39ecea125210831a7cd','2026-10-02 08:22:40','2026-09-02 08:22:40','2026-09-02 08:22:50'),(44,1,'f6288b7feedb949b3c838a566665fe0c7678616899c1b4a2471294f42128a79a','2026-10-02 08:22:50','2026-09-02 08:22:50','2026-09-02 08:22:52'),(45,1,'d682b4a397ee284bb634a67d4d9f6cb6590e493226f9e9d67ee6c741443c1cd0','2026-10-02 08:22:56','2026-09-02 08:22:56','2026-09-02 08:53:04'),(47,1,'c4bba0b3b147da14a657234c8af12607b0f235e00992df7627edaa6a657ecc2b','2026-10-02 08:53:04','2026-09-02 08:53:04','2026-09-02 09:17:44'),(54,1,'c30261eae0e9d1b511aa06a28d681c7064f72c4552113c3acf655db7bb9839de','2026-10-02 09:17:44','2026-09-02 09:17:44','2026-09-02 09:33:39'),(57,1,'8e8186f520f4fded98c020eaef481f9152308e7dcb293632e6344fc857d7a2f4','2026-10-02 09:33:39','2026-09-02 09:33:39','2026-09-02 09:46:47'),(60,1,'12344d2971cc7191135aac7b9b168ca33064f0aa844eac9e0c76502186900945','2026-10-02 09:46:54','2026-09-02 09:46:54','2026-09-02 10:03:16'),(64,1,'8f65b512d54ad6c6dd437efa3a5771fb1f57ca6f927e0733f3f948a2a90370c8','2026-10-02 10:03:16','2026-09-02 10:03:16','2026-09-02 11:54:39'),(67,1,'b42153e4968c16093ca5cdaa9d479ba08df8f4eb7139ffcb5055af30ffc829f9','2026-10-02 11:54:39','2026-09-02 11:54:39','2026-09-02 12:14:29'),(69,1,'d8be9498783687726dbc514c69c6ab05aeb993fc8e5312f06f705d5ad8cc6351','2026-10-02 12:14:29','2026-09-02 12:14:29','2026-09-02 12:29:12'),(71,1,'8e7fb3417b20edff52e970cbd2ab553dbfe071191a685dc2fa52f9aa0315c662','2026-10-02 12:29:12','2026-09-02 12:29:12','2026-09-02 13:23:47'),(74,1,'ea7968a156c17beb13a2251c9c2856c53bd283ff07f21a0e64a52d67a4a40e36','2026-10-02 13:23:47','2026-09-02 13:23:47','2026-09-02 14:14:10'),(75,1,'eae033f92b50709e5a0644d0fbc5daca15b1f5dbe00b744e6facfb78aba5bc99','2026-10-02 14:14:10','2026-09-02 14:14:10','2026-09-02 15:09:08'),(76,1,'b1bf823c6323af7457e758ef9803566663355b4338bfb9d99bd0eaa5f31a630b','2026-10-02 15:09:08','2026-09-02 15:09:08','2026-09-02 15:15:52'),(77,2,'bab6d29e787572b76555d055b3a6b22422c3238a86f55480e5f2a6b5b73368ee','2026-10-02 15:15:58','2026-09-02 15:15:58','2026-09-02 15:16:21'),(79,1,'c3e9b09dd17b6fd09228e7f1ecebd3240aca70fddcdd740b3707753af7904997','2026-10-02 15:16:27','2026-09-02 15:16:27','2026-09-02 15:16:43'),(80,2,'17f24465cc4f0e2d5be41534986a1b6a1f5e14db9961e55a15e81a19608ee102','2026-10-02 15:16:48','2026-09-02 15:16:48','2026-09-02 15:17:08'),(81,1,'349ccd8cb6fe598692a033c1a07a50aa0a5a24cd99c2ca418b08785dfd9c01cd','2026-10-02 15:17:12','2026-09-02 15:17:12','2026-09-02 15:32:06'),(82,1,'288c111317c3a500903db262cafc3376418c7a0ba18c3238da36e0864308d3c7','2026-10-02 15:32:06','2026-09-02 15:32:06','2026-09-02 15:46:55'),(85,1,'6d7df0b4d97362317d49483ae4ad924f18e2a82e141a8fee881df8f4a5a5972f','2026-10-02 15:46:55','2026-09-02 15:46:55','2026-09-02 16:06:41'),(88,1,'e7e0026b17df8b04d799173d188b5be8f681370ee7cb9591b19f0463d4457ea9','2026-10-02 16:06:41','2026-09-02 16:06:41','2026-09-02 16:21:16'),(91,1,'92c7211448bd763add40eb352759d8e5d9dfb24cbb0fdb36eca0323a216b63aa','2026-10-02 16:21:16','2026-09-02 16:21:16','2026-09-02 16:35:48'),(94,1,'970a8e33db9cab54559c016d782589b75e8e53ccc62295e5ad54ed130614fe3c','2026-10-02 16:35:48','2026-09-02 16:35:48','2026-09-02 16:50:40'),(97,1,'a1a7c111e45276d778c429d7bb3262dc256b2a75a7a717d4a64ae1d43d460cdd','2026-10-02 16:50:40','2026-09-02 16:50:40','2026-09-02 17:19:03'),(98,1,'ba392c5f034b4bd478645596df7ee59692b5e7d2752cd8dc7899039f97897186','2026-10-02 17:19:03','2026-09-02 17:19:03','2026-09-02 17:25:09'),(99,1,'ac18fdaf1dd49fd1cefa0cbc312c971d1320f256536499dd7b0b851a9b789ee9','2026-10-02 17:26:58','2026-09-02 17:26:58','2026-09-02 18:07:48'),(100,1,'e5a7c4894bd79d7880af22255eee3b4e6fc3a0485c68dfaa7a701933b02e5bd4','2026-10-02 18:07:48','2026-09-02 18:07:48','2026-09-02 18:22:52'),(101,1,'d61496e69b1d068cdb680c81003a01f30c7e0d38b718fb20e082cd8f3ea756bb','2026-10-02 18:22:52','2026-09-02 18:22:52','2026-09-02 18:37:36'),(102,1,'6db20708fd0548a3f5d4a245ecdaff84fe8de9b4bda083f9af8fedab9f2d8dc1','2026-10-02 18:37:36','2026-09-02 18:37:36','2026-09-02 18:56:18'),(103,1,'1d4fcc81aacce1a5a35a604e299663a17d9f40512e6b96cfca9cdd90cd7d01ae','2026-10-02 18:56:18','2026-09-02 18:56:18','2026-09-02 19:20:11'),(104,1,'7932f16fea725b630303e4073404c906b4dc582f06f8e0738bbd8d72acf20ac8','2026-10-02 19:20:11','2026-09-02 19:20:11','2026-09-02 19:34:41'),(105,1,'fac909181c0ea574a509234ef330a0213aeb08d33e93d0227b4ea1a3f443dc7f','2026-10-02 19:34:41','2026-09-02 19:34:41',NULL);
/*!40000 ALTER TABLE `dp_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_revision`
--

DROP TABLE IF EXISTS `dp_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_revision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_revision`
--

LOCK TABLES `dp_revision` WRITE;
/*!40000 ALTER TABLE `dp_revision` DISABLE KEYS */;
INSERT INTO `dp_revision` VALUES (1,'2026-08-04 17:13:37',NULL),(2,'2026-08-04 17:13:38',NULL),(3,'2026-08-04 17:13:38','2'),(4,'2026-08-05 06:40:13','1'),(5,'2026-08-05 06:40:31','1'),(6,'2026-08-05 06:40:32','1'),(7,'2026-08-05 06:40:32','1'),(8,'2026-08-05 06:40:32','1'),(9,'2026-08-05 06:40:32','1'),(10,'2026-08-05 06:40:32','1'),(11,'2026-08-05 07:23:30','1'),(12,'2026-08-05 07:23:53','1'),(13,'2026-08-05 07:25:44','1'),(14,'2026-08-05 07:25:45','1'),(15,'2026-08-05 07:25:45','1'),(16,'2026-08-05 07:26:32','2'),(17,'2026-08-05 07:29:44','1'),(18,'2026-08-05 08:26:37','1'),(19,'2026-08-05 08:26:53','1'),(20,'2026-08-05 08:27:12',NULL),(21,'2026-08-05 08:27:12',NULL),(22,'2026-08-05 08:27:12',NULL),(23,'2026-08-05 08:27:12',NULL),(24,'2026-08-05 08:27:12',NULL),(25,'2026-08-05 09:46:28','1'),(26,'2026-08-05 09:46:29','1'),(27,'2026-08-05 09:46:29','1'),(28,'2026-08-05 09:46:29','1'),(29,'2026-08-05 09:46:55','1'),(30,'2026-08-05 09:51:26','1'),(31,'2026-08-05 09:51:48','1'),(32,'2026-08-05 10:27:07','1'),(33,'2026-08-05 10:27:07','1'),(34,'2026-08-05 10:27:07','1'),(35,'2026-08-05 10:28:30','1'),(36,'2026-08-05 10:28:30','1'),(37,'2026-08-05 10:30:56','1'),(38,'2026-08-05 10:30:56','1'),(39,'2026-08-05 10:54:21','1'),(40,'2026-08-05 10:54:34','1'),(41,'2026-08-05 10:55:05','1'),(42,'2026-08-05 10:56:30','1'),(43,'2026-08-05 11:01:35','1'),(44,'2026-08-05 11:01:41','1'),(45,'2026-08-05 11:02:08','1'),(46,'2026-08-05 11:02:24','1'),(47,'2026-08-05 11:04:33','1'),(48,'2026-08-05 11:05:05',NULL),(49,'2026-08-05 11:05:05',NULL),(50,'2026-08-05 11:56:19','1'),(51,'2026-08-05 11:56:28','1'),(52,'2026-08-05 11:57:33','1'),(53,'2026-08-05 11:57:46','1'),(54,'2026-08-05 12:00:22','1'),(55,'2026-08-05 12:00:44','1'),(56,'2026-08-05 12:00:44','1'),(57,'2026-08-05 12:00:45',NULL),(58,'2026-08-05 12:00:45',NULL),(59,'2026-08-05 17:55:37',NULL),(60,'2026-08-05 17:55:54',NULL),(61,'2026-08-05 17:56:09',NULL),(62,'2026-08-05 17:56:09',NULL),(63,'2026-08-06 16:10:17',NULL),(64,'2026-08-06 16:11:10',NULL),(65,'2026-08-06 16:11:43',NULL),(66,'2026-08-06 16:30:56','1'),(67,'2026-08-06 16:31:19','1'),(68,'2026-08-06 16:31:44','1'),(69,'2026-08-06 16:33:00','1'),(70,'2026-08-06 16:51:45',NULL),(71,'2026-08-06 16:53:47',NULL),(72,'2026-08-06 16:53:47',NULL),(73,'2026-08-06 16:53:47',NULL),(74,'2026-08-06 16:54:06','5'),(75,'2026-08-06 16:58:10','5'),(76,'2026-08-06 16:58:59',NULL),(77,'2026-08-06 17:03:42','1'),(78,'2026-08-06 17:03:48','1'),(79,'2026-08-06 17:08:18',NULL),(80,'2026-08-06 17:09:00',NULL),(81,'2026-08-06 19:34:06',NULL),(82,'2026-08-06 19:34:36',NULL),(83,'2026-08-06 19:51:06',NULL),(84,'2026-08-06 19:52:35',NULL),(85,'2026-08-06 19:56:26','5'),(86,'2026-08-06 19:56:27','5'),(87,'2026-08-06 20:01:16',NULL),(88,'2026-08-06 20:01:18',NULL),(89,'2026-08-06 20:01:20',NULL),(90,'2026-08-06 20:01:45',NULL),(91,'2026-08-06 20:01:49',NULL),(92,'2026-08-06 20:01:53',NULL),(93,'2026-08-06 20:01:57',NULL),(94,'2026-08-06 20:02:02',NULL),(95,'2026-08-06 20:02:06',NULL),(96,'2026-08-06 20:04:04',NULL),(97,'2026-08-06 20:05:39',NULL),(98,'2026-08-06 20:06:55','1'),(99,'2026-08-06 20:07:26','1'),(100,'2026-08-07 06:27:31','1'),(101,'2026-09-02 08:22:19',NULL),(102,'2026-09-02 08:22:50','1'),(103,'2026-09-02 08:23:33','1'),(104,'2026-09-02 08:23:33','1'),(105,'2026-09-02 08:24:06','1'),(106,'2026-09-02 08:24:22','1'),(107,'2026-09-02 08:47:50',NULL),(108,'2026-09-02 08:49:26','6'),(109,'2026-09-02 08:49:35','6'),(110,'2026-09-02 08:53:14','1'),(111,'2026-09-02 08:53:24','1'),(112,'2026-09-02 09:06:07',NULL),(113,'2026-09-02 09:06:19','7'),(114,'2026-09-02 09:06:44','7'),(115,'2026-09-02 09:07:14','7'),(116,'2026-09-02 09:07:23','7'),(117,'2026-09-02 09:07:58',NULL),(118,'2026-09-02 09:08:07',NULL),(119,'2026-09-02 09:12:21',NULL),(120,'2026-09-02 09:12:21',NULL),(121,'2026-09-02 09:12:30','8'),(122,'2026-09-02 09:12:31','9'),(123,'2026-09-02 09:12:53','8'),(124,'2026-09-02 09:13:09','8'),(125,'2026-09-02 09:13:20','8'),(126,'2026-09-02 09:13:20','8'),(127,'2026-09-02 09:13:21','8'),(128,'2026-09-02 09:13:21','8'),(129,'2026-09-02 09:13:21','8'),(130,'2026-09-02 09:17:45','1'),(131,'2026-09-02 09:20:42',NULL),(132,'2026-09-02 09:21:22','10'),(133,'2026-09-02 09:31:35',NULL),(134,'2026-09-02 09:33:50','1'),(135,'2026-09-02 09:33:58','1'),(136,'2026-09-02 09:39:04',NULL),(137,'2026-09-02 09:41:08','1'),(138,'2026-09-02 09:41:33','1'),(139,'2026-09-02 09:41:38','1'),(140,'2026-09-02 09:46:42','1'),(141,'2026-09-02 09:46:50',NULL),(142,'2026-09-02 09:51:56',NULL),(143,'2026-09-02 09:57:14',NULL),(144,'2026-09-02 09:58:12','1'),(145,'2026-09-02 09:58:17',NULL),(146,'2026-09-02 10:03:37',NULL),(147,'2026-09-02 10:07:53','1'),(148,'2026-09-02 10:13:22',NULL),(149,'2026-09-02 10:13:53',NULL),(150,'2026-09-02 10:13:54','18'),(151,'2026-09-02 10:13:54','18'),(152,'2026-09-02 10:14:02',NULL),(153,'2026-09-02 10:14:02',NULL),(154,'2026-09-02 12:03:02',NULL),(155,'2026-09-02 12:03:51','19'),(156,'2026-09-02 12:04:01','19'),(157,'2026-09-02 12:06:46','1'),(158,'2026-09-02 12:15:21','1'),(159,'2026-09-02 12:16:22','1'),(160,'2026-09-02 12:16:43','1'),(161,'2026-09-02 12:24:48',NULL),(162,'2026-09-02 12:24:48',NULL),(163,'2026-09-02 12:25:03',NULL),(164,'2026-09-02 12:25:12','20'),(165,'2026-09-02 12:25:19',NULL),(166,'2026-09-02 12:25:19',NULL),(167,'2026-09-02 12:25:45',NULL),(168,'2026-09-02 12:26:36',NULL),(169,'2026-09-02 12:26:39',NULL),(170,'2026-09-02 12:26:39',NULL),(171,'2026-09-02 12:26:42',NULL),(172,'2026-09-02 12:26:42',NULL),(173,'2026-09-02 12:31:22',NULL),(174,'2026-09-02 12:35:02',NULL),(175,'2026-09-02 12:37:11','1'),(176,'2026-09-02 15:10:16','1'),(177,'2026-09-02 15:15:50','1'),(178,'2026-09-02 15:16:20',NULL),(179,'2026-09-02 15:16:42','1'),(180,'2026-09-02 15:32:47',NULL),(181,'2026-09-02 15:35:15','1'),(182,'2026-09-02 15:45:50',NULL),(183,'2026-09-02 15:54:45',NULL),(184,'2026-09-02 15:55:01','26'),(185,'2026-09-02 15:55:10','26'),(186,'2026-09-02 15:58:42','1'),(187,'2026-09-02 15:58:45','1'),(188,'2026-09-02 16:03:39',NULL),(189,'2026-09-02 16:07:13','1'),(190,'2026-09-02 16:09:19','1'),(191,'2026-09-02 16:12:03',NULL),(192,'2026-09-02 16:13:26','1'),(193,'2026-09-02 16:13:27','1'),(194,'2026-09-02 16:15:10',NULL),(195,'2026-09-02 16:24:25',NULL),(196,'2026-09-02 16:24:49',NULL),(197,'2026-09-02 16:24:59','30'),(198,'2026-09-02 16:33:42',NULL),(199,'2026-09-02 16:33:53','31'),(200,'2026-09-02 16:34:37','31'),(201,'2026-09-02 16:37:39',NULL),(202,'2026-09-02 16:41:59',NULL),(203,'2026-09-02 17:23:16',NULL),(204,'2026-09-02 17:23:24',NULL),(205,'2026-09-02 17:23:37',NULL),(206,'2026-09-02 17:23:37',NULL),(207,'2026-09-02 17:23:48',NULL),(208,'2026-09-02 17:23:48',NULL),(209,'2026-09-02 17:26:21',NULL),(210,'2026-09-02 17:26:21',NULL),(211,'2026-09-02 17:27:56','1'),(212,'2026-09-02 17:28:03','1'),(213,'2026-09-02 17:28:05','1'),(214,'2026-09-02 17:28:07','1'),(215,'2026-09-02 17:30:20',NULL),(216,'2026-09-02 17:30:21',NULL),(217,'2026-09-02 17:30:35',NULL),(218,'2026-09-02 17:32:05','1'),(219,'2026-09-02 17:36:31',NULL),(220,'2026-09-02 17:36:31',NULL),(221,'2026-09-02 17:36:47',NULL),(222,'2026-09-02 17:38:35','1'),(223,'2026-09-02 17:38:53','1'),(224,'2026-09-02 17:39:58','1'),(225,'2026-09-02 18:01:15',NULL),(226,'2026-09-02 18:01:15',NULL),(227,'2026-09-02 18:02:23',NULL),(228,'2026-09-02 18:02:23',NULL),(229,'2026-09-02 18:02:23',NULL),(230,'2026-09-02 18:02:34',NULL),(231,'2026-09-02 18:03:12',NULL),(232,'2026-09-02 18:03:12',NULL),(233,'2026-09-02 18:03:12',NULL),(234,'2026-09-02 18:03:12',NULL),(235,'2026-09-02 18:03:13',NULL),(236,'2026-09-02 18:03:23',NULL),(237,'2026-09-02 18:03:23',NULL),(238,'2026-09-02 18:03:31',NULL),(239,'2026-09-02 18:03:31',NULL),(240,'2026-09-02 18:08:44','1'),(241,'2026-09-02 18:09:05','1'),(242,'2026-09-02 18:11:42',NULL),(243,'2026-09-02 18:11:42',NULL),(244,'2026-09-02 18:12:26',NULL),(245,'2026-09-02 18:12:45','1'),(246,'2026-09-02 18:17:34',NULL),(247,'2026-09-02 18:53:22',NULL),(248,'2026-09-02 18:53:22',NULL),(249,'2026-09-02 18:54:12',NULL),(250,'2026-09-02 18:57:47','1'),(251,'2026-09-02 19:00:20','1'),(252,'2026-09-02 19:42:22',NULL),(253,'2026-09-02 19:45:48',NULL);
/*!40000 ALTER TABLE `dp_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_role`
--

DROP TABLE IF EXISTS `dp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `label` varchar(100) NOT NULL,
  `removable` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_role`
--

LOCK TABLES `dp_role` WRITE;
/*!40000 ALTER TABLE `dp_role` DISABLE KEYS */;
INSERT INTO `dp_role` VALUES (1,'admin','Administrator',0),(2,'editor','Editor',1),(3,'reader','Reader',1);
/*!40000 ALTER TABLE `dp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_role_aud`
--

DROP TABLE IF EXISTS `dp_role_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_role_aud` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `label` varchar(100) NOT NULL,
  `removable` tinyint(1) NOT NULL DEFAULT 1,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`id`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_role_aud`
--

LOCK TABLES `dp_role_aud` WRITE;
/*!40000 ALTER TABLE `dp_role_aud` DISABLE KEYS */;
INSERT INTO `dp_role_aud` VALUES (1,'admin','Administrator',0,1,'add'),(2,'editor','Editor',1,1,'add'),(3,'reader','Reader',1,1,'add'),(4,'strictmodetest','Strict mode test',1,4,'add'),(4,'strictmodetest','Strict mode test',1,9,'del');
/*!40000 ALTER TABLE `dp_role_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_role_permission`
--

DROP TABLE IF EXISTS `dp_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_role_permission` (
  `role_id` int(11) NOT NULL,
  `permission` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`,`permission`),
  CONSTRAINT `dp_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `dp_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_role_permission`
--

LOCK TABLES `dp_role_permission` WRITE;
/*!40000 ALTER TABLE `dp_role_permission` DISABLE KEYS */;
INSERT INTO `dp_role_permission` VALUES (2,'category.create'),(2,'category.update'),(2,'category.view'),(2,'content.history'),(2,'media.create'),(2,'media.delete'),(2,'media.purge'),(2,'media.update'),(2,'media.view'),(2,'menu.update'),(2,'menu.view'),(2,'page.update'),(2,'page.view'),(2,'post.create'),(2,'post.delete'),(2,'post.publish'),(2,'post.update'),(2,'post.view'),(2,'setting.view'),(2,'tag.create'),(2,'tag.delete'),(2,'tag.update'),(2,'tag.view');
/*!40000 ALTER TABLE `dp_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_role_permission_aud`
--

DROP TABLE IF EXISTS `dp_role_permission_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_role_permission_aud` (
  `role_id` int(11) NOT NULL,
  `permission` varchar(100) NOT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`role_id`,`permission`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_role_permission_aud`
--

LOCK TABLES `dp_role_permission_aud` WRITE;
/*!40000 ALTER TABLE `dp_role_permission_aud` DISABLE KEYS */;
INSERT INTO `dp_role_permission_aud` VALUES (2,'category.create',1,'add'),(2,'category.update',1,'add'),(2,'category.view',1,'add'),(2,'content.history',1,'add'),(2,'media.create',1,'add'),(2,'media.delete',1,'add'),(2,'media.purge',189,'add'),(2,'media.update',1,'add'),(2,'media.view',1,'add'),(2,'menu.update',1,'add'),(2,'menu.view',1,'add'),(2,'page.update',1,'add'),(2,'page.view',1,'add'),(2,'post.create',1,'add'),(2,'post.delete',1,'add'),(2,'post.publish',1,'add'),(2,'post.update',1,'add'),(2,'post.view',1,'add'),(2,'setting.view',1,'add'),(2,'tag.create',1,'add'),(2,'tag.delete',1,'add'),(2,'tag.update',1,'add'),(2,'tag.view',1,'add'),(2,'user.view',1,'add'),(2,'user.view',179,'del'),(4,'post.view',4,'add'),(4,'post.view',9,'del');
/*!40000 ALTER TABLE `dp_role_permission_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_setting`
--

DROP TABLE IF EXISTS `dp_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_setting` (
  `name` varchar(100) NOT NULL,
  `value` longtext DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_setting`
--

LOCK TABLES `dp_setting` WRITE;
/*!40000 ALTER TABLE `dp_setting` DISABLE KEYS */;
INSERT INTO `dp_setting` VALUES ('code_theme','dracula','2026-09-02 18:09:05'),('plugins','','2026-08-06 20:07:26'),('posts_per_page','10','2026-09-02 18:09:05'),('registration_open','1','2026-09-02 18:09:05'),('site_description','','2026-09-02 18:09:05'),('site_icon','','2026-09-02 18:09:05'),('site_logo','','2026-09-02 18:09:05'),('site_name','Test Site','2026-09-02 18:09:05'),('theme','','2026-08-05 17:56:09');
/*!40000 ALTER TABLE `dp_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_setting_aud`
--

DROP TABLE IF EXISTS `dp_setting_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_setting_aud` (
  `name` varchar(100) NOT NULL,
  `value` longtext DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`name`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_setting_aud`
--

LOCK TABLES `dp_setting_aud` WRITE;
/*!40000 ALTER TABLE `dp_setting_aud` DISABLE KEYS */;
INSERT INTO `dp_setting_aud` VALUES ('code_theme','','2026-09-02 18:02:23',227,'add'),('code_theme','dracula','2026-09-02 18:02:23',228,'mod'),('code_theme','enlighter','2026-09-02 18:02:23',229,'mod'),('code_theme','','2026-09-02 18:02:34',230,'mod'),('code_theme','none','2026-09-02 18:03:12',231,'mod'),('code_theme','enlighter','2026-09-02 18:03:12',232,'mod'),('code_theme','dracula','2026-09-02 18:03:12',233,'mod'),('code_theme','bogus','2026-09-02 18:03:12',234,'mod'),('code_theme','enlighter','2026-09-02 18:03:13',235,'mod'),('code_theme','dracula','2026-09-02 18:09:05',241,'mod'),('plugins','reading-time','2026-08-06 19:51:06',83,'add'),('plugins','','2026-08-06 19:56:26',85,'mod'),('plugins','reading-time','2026-08-06 19:56:27',86,'mod'),('plugins','','2026-08-06 20:01:16',87,'mod'),('plugins','reading-time','2026-08-06 20:01:18',88,'mod'),('plugins','','2026-08-06 20:01:20',89,'mod'),('plugins','reading-time','2026-08-06 20:01:45',90,'mod'),('plugins','','2026-08-06 20:01:49',91,'mod'),('plugins','reading-time','2026-08-06 20:01:53',92,'mod'),('plugins','','2026-08-06 20:01:57',93,'mod'),('plugins','reading-time','2026-08-06 20:02:02',94,'mod'),('plugins','','2026-08-06 20:02:06',95,'mod'),('plugins','reading-time','2026-08-06 20:04:04',96,'mod'),('plugins','','2026-08-06 20:07:26',99,'mod'),('posts_per_page','10','2026-08-05 06:40:32',10,'add'),('posts_per_page','10','2026-09-02 10:07:53',147,'mod'),('posts_per_page','10','2026-09-02 12:03:51',155,'mod'),('posts_per_page','10','2026-09-02 12:04:01',156,'mod'),('posts_per_page','10','2026-09-02 12:06:46',157,'mod'),('posts_per_page','10','2026-09-02 12:25:12',164,'mod'),('posts_per_page','10','2026-09-02 18:09:05',241,'mod'),('registration_open','1','2026-08-04 17:13:38',2,'add'),('registration_open','1','2026-08-05 06:40:32',10,'mod'),('registration_open','1','2026-09-02 10:07:53',147,'mod'),('registration_open','1','2026-09-02 12:03:51',155,'mod'),('registration_open','1','2026-09-02 12:04:01',156,'mod'),('registration_open','1','2026-09-02 12:06:46',157,'mod'),('registration_open','1','2026-09-02 12:25:12',164,'mod'),('registration_open','1','2026-09-02 18:09:05',241,'mod'),('site_description','','2026-08-05 06:40:32',10,'add'),('site_description','','2026-09-02 10:07:53',147,'mod'),('site_description','','2026-09-02 12:03:51',155,'mod'),('site_description','','2026-09-02 12:04:01',156,'mod'),('site_description','','2026-09-02 12:06:46',157,'mod'),('site_description','','2026-09-02 12:25:12',164,'mod'),('site_description','','2026-09-02 18:09:05',241,'mod'),('site_icon','/favicon.png','2026-08-05 06:40:32',10,'add'),('site_icon','/favicon.png','2026-09-02 10:07:53',147,'mod'),('site_icon','/favicon.png','2026-09-02 12:03:51',155,'mod'),('site_icon','/favicon.png','2026-09-02 12:04:01',156,'mod'),('site_icon','/favicon.png','2026-09-02 12:06:46',157,'mod'),('site_icon','','2026-09-02 12:24:48',162,'mod'),('site_icon','','2026-09-02 12:25:12',164,'mod'),('site_icon','2','2026-09-02 12:26:39',170,'mod'),('site_icon','','2026-09-02 12:26:42',172,'mod'),('site_icon','','2026-09-02 18:09:05',241,'mod'),('site_logo','/static/dpress-logo.svg','2026-08-05 06:40:32',10,'add'),('site_logo','/static/dpress-logo.svg','2026-09-02 10:07:53',147,'mod'),('site_logo','/uploads/2026/08/logo-a02c1d.png','2026-09-02 12:03:51',155,'mod'),('site_logo','/static/dpress-logo.svg','2026-09-02 12:04:01',156,'mod'),('site_logo','/static/dpress-logo.svg','2026-09-02 12:06:46',157,'mod'),('site_logo','','2026-09-02 12:24:48',161,'mod'),('site_logo','3','2026-09-02 12:25:12',164,'mod'),('site_logo','','2026-09-02 12:25:45',167,'mod'),('site_logo','','2026-09-02 12:26:36',168,'mod'),('site_logo','3','2026-09-02 12:26:39',169,'mod'),('site_logo','','2026-09-02 12:26:42',171,'mod'),('site_logo','','2026-09-02 18:09:05',241,'mod'),('site_name','dpress dev','2026-08-04 17:13:38',2,'add'),('site_name','dpress dev','2026-08-05 06:40:32',10,'mod'),('site_name','Test Site','2026-09-02 10:07:53',147,'mod'),('site_name','Test Site','2026-09-02 12:03:51',155,'mod'),('site_name','Test Site','2026-09-02 12:04:01',156,'mod'),('site_name','Test Site','2026-09-02 12:06:46',157,'mod'),('site_name','Test Site','2026-09-02 12:25:12',164,'mod'),('site_name','Test Site','2026-09-02 18:09:05',241,'mod'),('theme','plain','2026-08-05 17:55:37',59,'add'),('theme','','2026-08-05 17:55:54',60,'mod'),('theme','plain','2026-08-05 17:56:09',61,'mod'),('theme','','2026-08-05 17:56:09',62,'mod');
/*!40000 ALTER TABLE `dp_setting_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_tag`
--

DROP TABLE IF EXISTS `dp_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_tag`
--

LOCK TABLES `dp_tag` WRITE;
/*!40000 ALTER TABLE `dp_tag` DISABLE KEYS */;
INSERT INTO `dp_tag` VALUES (1,'dpress','dpress'),(2,'markdown','markdown'),(3,'getting started','getting-started');
/*!40000 ALTER TABLE `dp_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_tag_aud`
--

DROP TABLE IF EXISTS `dp_tag_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_tag_aud` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`id`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_tag_aud`
--

LOCK TABLES `dp_tag_aud` WRITE;
/*!40000 ALTER TABLE `dp_tag_aud` DISABLE KEYS */;
INSERT INTO `dp_tag_aud` VALUES (1,'dpress','dpress',2,'add'),(2,'markdown','markdown',2,'add'),(3,'getting started','getting-started',2,'add');
/*!40000 ALTER TABLE `dp_tag_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_user`
--

DROP TABLE IF EXISTS `dp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_user`
--

LOCK TABLES `dp_user` WRITE;
/*!40000 ALTER TABLE `dp_user` DISABLE KEYS */;
INSERT INTO `dp_user` VALUES (1,'admin@example.com','$2y$10$M/NN9skbr7V2pvQoTpwxteCQ4TJaiS3T5VSM2BPItYMo9MRjkB/Aq','Gabor','active','2026-08-04 17:13:38','2026-09-02 09:46:42'),(2,'editor@example.com','$2y$10$Firx/lqQIZUVktQM/Rl1x.bvh3SOl.BerzI5zBV/oBOHsRFir9O9K','Edit Everything','active','2026-08-04 17:13:38','2026-09-02 15:15:50'),(3,'reader@example.com','$2y$10$n9/4OcpBCvXduqznNOni/.YpXw20pTsixnPijMpXjjfUeKlL0opX6','Ray Reader','active','2026-08-04 17:13:38','2026-08-04 17:13:38'),(4,'pending@example.com','$2y$10$hSv5lt/rLed3T2SwpeyUBe9r8ZuT4K9a6IJsGH7mLLNLmHxO/pfme','Penny Pending','pending','2026-08-04 17:13:38','2026-08-04 17:13:38');
/*!40000 ALTER TABLE `dp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_user_aud`
--

DROP TABLE IF EXISTS `dp_user_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_user_aud` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`id`,`rev_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_user_aud`
--

LOCK TABLES `dp_user_aud` WRITE;
/*!40000 ALTER TABLE `dp_user_aud` DISABLE KEYS */;
INSERT INTO `dp_user_aud` VALUES (1,'admin@example.com','$2y$10$wuUVcdcqf4rKzR1zxw7Rlu0/iUxjV.FucsaOyIRjXcaOAZoIQMTpy','Site Admin','active','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(1,'admin@example.com','$2y$10$wuUVcdcqf4rKzR1zxw7Rlu0/iUxjV.FucsaOyIRjXcaOAZoIQMTpy','Site Admin','active','2026-08-04 17:13:38','2026-08-05 08:26:37',18,'mod'),(1,'admin@example.com','$2y$10$wuUVcdcqf4rKzR1zxw7Rlu0/iUxjV.FucsaOyIRjXcaOAZoIQMTpy','Site Admin','active','2026-08-04 17:13:38','2026-08-05 08:26:53',19,'mod'),(1,'admin@example.com','$2y$10$wuUVcdcqf4rKzR1zxw7Rlu0/iUxjV.FucsaOyIRjXcaOAZoIQMTpy','Site Admin','blocked','2026-08-04 17:13:38','2026-08-05 08:27:12',22,'mod'),(1,'admin@example.com','$2y$10$wuUVcdcqf4rKzR1zxw7Rlu0/iUxjV.FucsaOyIRjXcaOAZoIQMTpy','Site Admin','active','2026-08-04 17:13:38','2026-08-05 08:27:12',23,'mod'),(1,'admin@example.com','$2y$10$4KOD9Z0fKdf3tl1lQLB.XeVVbX2qhPXPy4.NgORecRVRZJrUOIAXq','Site Admin','active','2026-08-04 17:13:38','2026-09-02 08:22:19',101,'mod'),(1,'admin@example.com','$2y$10$M/NN9skbr7V2pvQoTpwxteCQ4TJaiS3T5VSM2BPItYMo9MRjkB/Aq','Site Admin','active','2026-08-04 17:13:38','2026-09-02 08:22:50',102,'mod'),(1,'admin@example.com','$2y$10$M/NN9skbr7V2pvQoTpwxteCQ4TJaiS3T5VSM2BPItYMo9MRjkB/Aq','Gabor','active','2026-08-04 17:13:38','2026-09-02 09:46:42',140,'mod'),(2,'editor@example.com','$2y$10$wEaJeXHCfPGM.UI6zmHrLu.jUE2.2qWnIWzHKprcukaiOEIpuLTrG','Edit Everything','active','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(2,'editor@example.com','$2y$10$Firx/lqQIZUVktQM/Rl1x.bvh3SOl.BerzI5zBV/oBOHsRFir9O9K','Edit Everything','active','2026-08-04 17:13:38','2026-09-02 15:15:50',177,'mod'),(3,'reader@example.com','$2y$10$n9/4OcpBCvXduqznNOni/.YpXw20pTsixnPijMpXjjfUeKlL0opX6','Ray Reader','active','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(4,'pending@example.com','$2y$10$hSv5lt/rLed3T2SwpeyUBe9r8ZuT4K9a6IJsGH7mLLNLmHxO/pfme','Penny Pending','pending','2026-08-04 17:13:38','2026-08-04 17:13:38',2,'add'),(5,'bulkcheck@example.invalid','$2y$10$4M8s.XRKf2TAWAgrY5FMaOgF8QC9M6EuKpFpsDZgtfi5v55FOJsUm','Bulk Check','active','2026-08-06 16:51:45','2026-08-06 16:51:45',70,'add'),(5,'bulkcheck@example.invalid','$2y$10$4M8s.XRKf2TAWAgrY5FMaOgF8QC9M6EuKpFpsDZgtfi5v55FOJsUm','Bulk Check','active','2026-08-06 16:51:45','2026-08-06 16:51:45',76,'del'),(5,'plugincheck@example.invalid','$2y$10$2KO1essFARRGZ5l3m/RJv.hHgkZQeDHMcSAuPoHwgvg0m.jf7oNBy','Plugin Check','active','2026-08-06 19:52:35','2026-08-06 19:52:35',84,'add'),(5,'plugincheck@example.invalid','$2y$10$2KO1essFARRGZ5l3m/RJv.hHgkZQeDHMcSAuPoHwgvg0m.jf7oNBy','Plugin Check','active','2026-08-06 19:52:35','2026-08-06 19:52:35',97,'del'),(34,'blocktest@example.com','$2y$10$ZlRSJ7M6/yX3qA.K4.3q5ejTtOmMy/GhLzX.SzHNRAeFWQBung3Kq','Block Test','active','2026-09-02 19:42:22','2026-09-02 19:42:22',252,'add'),(34,'blocktest@example.com','$2y$10$ZlRSJ7M6/yX3qA.K4.3q5ejTtOmMy/GhLzX.SzHNRAeFWQBung3Kq','Block Test','active','2026-09-02 19:42:22','2026-09-02 19:42:22',253,'del');
/*!40000 ALTER TABLE `dp_user_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_user_role`
--

DROP TABLE IF EXISTS `dp_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `dp_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dp_user` (`id`),
  CONSTRAINT `dp_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `dp_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_user_role`
--

LOCK TABLES `dp_user_role` WRITE;
/*!40000 ALTER TABLE `dp_user_role` DISABLE KEYS */;
INSERT INTO `dp_user_role` VALUES (1,1),(2,2),(3,3),(4,3);
/*!40000 ALTER TABLE `dp_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_user_role_aud`
--

DROP TABLE IF EXISTS `dp_user_role_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_user_role_aud` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rev_id` bigint(20) NOT NULL,
  `rev_type` char(3) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_user_role_aud`
--

LOCK TABLES `dp_user_role_aud` WRITE;
/*!40000 ALTER TABLE `dp_user_role_aud` DISABLE KEYS */;
INSERT INTO `dp_user_role_aud` VALUES (1,1,2,'add'),(1,2,19,'add'),(1,2,20,'del'),(2,1,21,'add'),(2,1,24,'del'),(2,2,2,'add'),(3,3,2,'add'),(4,3,2,'add'),(5,1,70,'add'),(5,1,76,'del'),(5,1,84,'add'),(5,1,97,'del'),(34,1,252,'add'),(34,1,253,'del');
/*!40000 ALTER TABLE `dp_user_role_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dp_user_token`
--

DROP TABLE IF EXISTS `dp_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_token_hash` (`token_hash`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_type` (`type`),
  CONSTRAINT `dp_user_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dp_user_token`
--

LOCK TABLES `dp_user_token` WRITE;
/*!40000 ALTER TABLE `dp_user_token` DISABLE KEYS */;
INSERT INTO `dp_user_token` VALUES (1,1,'password_reset','c874c02231f91894242e1c0a9df7eeeea7015be5170214f413ef374205d3e220','2026-09-02 09:20:52','2026-09-02 08:20:52',NULL);
/*!40000 ALTER TABLE `dp_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
