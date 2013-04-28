-- MySQL dump 10.13  Distrib 5.1.67, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: CvlUserManagementAdmin3
-- ------------------------------------------------------
-- Server version	5.1.67

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
-- Table structure for table `Cvl_assets`
--

DROP TABLE IF EXISTS `Cvl_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_assets`
--

LOCK TABLES `Cvl_assets` WRITE;
/*!40000 ALTER TABLE `Cvl_assets` DISABLE KEYS */;
INSERT INTO `Cvl_assets` VALUES (1,0,1,89,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(8,1,17,28,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,29,30,1,'com_cpanel','com_cpanel','{}'),(10,1,31,32,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),(11,1,33,34,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,35,36,1,'com_login','com_login','{}'),(13,1,37,38,1,'com_mailto','com_mailto','{}'),(14,1,39,40,1,'com_massmail','com_massmail','{}'),(15,1,41,42,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,43,44,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,45,46,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,47,48,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,49,52,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,53,54,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,55,56,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(22,1,57,58,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,59,60,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,61,64,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(25,1,65,68,1,'com_weblinks','com_weblinks','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(26,1,69,70,1,'com_wrapper','com_wrapper','{}'),(27,8,18,25,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,50,51,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(31,25,66,67,2,'com_weblinks.category.6','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,24,62,63,1,'com_users.notes.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(33,1,71,72,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(34,1,73,74,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),(35,1,75,76,1,'com_helloworld','com_helloworld','{}'),(36,27,19,20,3,'com_content.article.1','What is CVL','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(37,27,21,22,3,'com_content.article.2','Work shop','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(38,8,26,27,2,'com_content.category.8','CVL News','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(41,1,77,78,1,'com_cvl_driver','com_cvl_driver','{}'),(42,1,79,80,1,'com_cvl_vm','com_cvl_vm','{}'),(43,1,81,82,1,'com_cvl_server','com_cvl_server','{}'),(44,27,23,24,3,'com_content.article.3','Create VM server instance','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(45,1,83,84,1,'com_cvl_vm_user','com_cvl_vm_user','{}'),(46,1,85,86,1,'com_cvl_project_group','com_cvl_project_group','{}'),(47,1,87,88,1,'com_cvl_nectar','com_cvl_nectar','{}');
/*!40000 ALTER TABLE `Cvl_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_associations`
--

DROP TABLE IF EXISTS `Cvl_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_associations`
--

LOCK TABLES `Cvl_associations` WRITE;
/*!40000 ALTER TABLE `Cvl_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_banner_clients`
--

DROP TABLE IF EXISTS `Cvl_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_banner_clients`
--

LOCK TABLES `Cvl_banner_clients` WRITE;
/*!40000 ALTER TABLE `Cvl_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_banner_tracks`
--

DROP TABLE IF EXISTS `Cvl_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_banner_tracks`
--

LOCK TABLES `Cvl_banner_tracks` WRITE;
/*!40000 ALTER TABLE `Cvl_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_banners`
--

DROP TABLE IF EXISTS `Cvl_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_banners`
--

LOCK TABLES `Cvl_banners` WRITE;
/*!40000 ALTER TABLE `Cvl_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_categories`
--

DROP TABLE IF EXISTS `Cvl_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_categories`
--

LOCK TABLES `Cvl_categories` WRITE;
/*!40000 ALTER TABLE `Cvl_categories` DISABLE KEYS */;
INSERT INTO `Cvl_categories` VALUES (1,0,0,0,15,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',0,'2009-10-18 16:07:09',0,'0000-00-00 00:00:00',0,'*'),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:26:37',0,'0000-00-00 00:00:00',0,'*'),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:35',0,'0000-00-00 00:00:00',0,'*'),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:57',0,'0000-00-00 00:00:00',0,'*'),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:15',0,'0000-00-00 00:00:00',0,'*'),(6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*'),(7,32,1,11,12,1,'uncategorised','com_users.notes','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*'),(8,38,1,13,14,1,'cvl-news','com_content','CVL News','cvl-news','','<p>The CVL all-hands workshop on the 7th of November in Monash University, Melbourne, Australia.</p>',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',661,'2012-10-29 21:55:30',0,'0000-00-00 00:00:00',0,'*');
/*!40000 ALTER TABLE `Cvl_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_contact_details`
--

DROP TABLE IF EXISTS `Cvl_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_contact_details`
--

LOCK TABLES `Cvl_contact_details` WRITE;
/*!40000 ALTER TABLE `Cvl_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_content`
--

DROP TABLE IF EXISTS `Cvl_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_content`
--

LOCK TABLES `Cvl_content` WRITE;
/*!40000 ALTER TABLE `Cvl_content` DISABLE KEYS */;
INSERT INTO `Cvl_content` VALUES (1,36,'What is CVL','what-is-cvl','','<p><strong>The Characterisation Virtual Laboratory (CVL)</strong> will integrate Australia\'s imaging equipment with specialized HPC capabilities provided by MASSIVE and NCI and with data collections provided by RDSI nodes. The CVL will provide scientists with a common environment for ayalysis and collaboration, the CVL desktop to produce three exemplar platforms for multi-modal or large-scale imaging in neuroscience, structural biology, and energy materials.</p>\r\n<p> </p>','',0,0,0,2,'2012-10-29 21:40:36',661,'','2012-10-29 21:47:32',661,0,'0000-00-00 00:00:00','2012-10-29 21:40:36','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',3,0,2,'','',1,2,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',1,'*',''),(2,37,'Work shop','work-shop','','<p>The CVL all-hands workshop on the 7th of November in Monash University, Melbourne, Australia.</p>','',0,0,0,2,'2012-10-29 21:52:18',661,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2012-10-29 21:52:18','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',1,0,1,'','',1,1,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*',''),(3,44,'Create VM server instance','create-vm-server-instance','','<p><a name=\"EditServerInstance.pyp\"></a></p>','',1,0,0,2,'2012-12-24 05:08:22',661,'','2012-12-24 05:20:51',661,0,'0000-00-00 00:00:00','2012-12-24 05:08:22','0000-00-00 00:00:00','{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}','{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}',4,0,0,'','',2,0,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}',0,'*','');
/*!40000 ALTER TABLE `Cvl_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_content_frontpage`
--

DROP TABLE IF EXISTS `Cvl_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_content_frontpage`
--

LOCK TABLES `Cvl_content_frontpage` WRITE;
/*!40000 ALTER TABLE `Cvl_content_frontpage` DISABLE KEYS */;
INSERT INTO `Cvl_content_frontpage` VALUES (1,1);
/*!40000 ALTER TABLE `Cvl_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_content_rating`
--

DROP TABLE IF EXISTS `Cvl_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_content_rating`
--

LOCK TABLES `Cvl_content_rating` WRITE;
/*!40000 ALTER TABLE `Cvl_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_core_log_searches`
--

DROP TABLE IF EXISTS `Cvl_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_core_log_searches`
--

LOCK TABLES `Cvl_core_log_searches` WRITE;
/*!40000 ALTER TABLE `Cvl_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_cvl_driver`
--

DROP TABLE IF EXISTS `Cvl_cvl_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_cvl_driver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `driver_id` tinyint(8) NOT NULL,
  `driver_description` varchar(128) NOT NULL,
  `image_id` varchar(64) NOT NULL,
  `ssh_key` varchar(64) NOT NULL,
  `security_group` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_cvl_driver`
--

LOCK TABLES `Cvl_cvl_driver` WRITE;
/*!40000 ALTER TABLE `Cvl_cvl_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_cvl_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_cvl_nectar`
--

DROP TABLE IF EXISTS `Cvl_cvl_nectar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_cvl_nectar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT '""',
  `tenant_id` int(11) NOT NULL,
  `tenant_name` varchar(50) NOT NULL DEFAULT '""',
  `username` varchar(50) NOT NULL DEFAULT '""',
  `password` varchar(50) NOT NULL DEFAULT '""',
  `provider_name` varchar(50) NOT NULL DEFAULT '""',
  `provider_id` tinyint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_cvl_nectar`
--

LOCK TABLES `Cvl_cvl_nectar` WRITE;
/*!40000 ALTER TABLE `Cvl_cvl_nectar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_cvl_nectar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_cvl_project_group`
--

DROP TABLE IF EXISTS `Cvl_cvl_project_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_cvl_project_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `project_group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_cvl_project_group`
--

LOCK TABLES `Cvl_cvl_project_group` WRITE;
/*!40000 ALTER TABLE `Cvl_cvl_project_group` DISABLE KEYS */;
INSERT INTO `Cvl_cvl_project_group` VALUES (1,0,0,1,0,'0000-00-00 00:00:00',0,'CVL super administrator'),(2,0,0,1,0,'0000-00-00 00:00:00',0,'CVL Monash'),(3,0,0,1,0,'0000-00-00 00:00:00',0,'Energy Materials Atom Probe Sydney University'),(4,0,0,1,0,'0000-00-00 00:00:00',0,'Neuroimaging Queensland University'),(5,0,0,1,0,'0000-00-00 00:00:00',0,'Structural Biology Monash University');
/*!40000 ALTER TABLE `Cvl_cvl_project_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_cvl_server_list`
--

DROP TABLE IF EXISTS `Cvl_cvl_server_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_cvl_server_list` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `vmid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`vmid`),
  KEY `vmid` (`vmid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_cvl_server_list`
--

LOCK TABLES `Cvl_cvl_server_list` WRITE;
/*!40000 ALTER TABLE `Cvl_cvl_server_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_cvl_server_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_cvl_vm`
--

DROP TABLE IF EXISTS `Cvl_cvl_vm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_cvl_vm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(8) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `driver_id` tinyint(8) NOT NULL,
  `vm_id` varchar(64) NOT NULL,
  `vm_server_name` varchar(128) NOT NULL,
  `vm_ip` varchar(16) NOT NULL,
  `vm_ram_size` int(32) NOT NULL,
  `vm_cpu_number` tinyint(8) NOT NULL,
  `vm_disk_size` int(32) NOT NULL,
  `project_group` int(11) DEFAULT NULL,
  `provider_id` tinyint(8) unsigned DEFAULT NULL,
  `has_gpu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_cvl_vm`
--

LOCK TABLES `Cvl_cvl_vm` WRITE;
/*!40000 ALTER TABLE `Cvl_cvl_vm` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_cvl_vm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_cvl_vm_user`
--

DROP TABLE IF EXISTS `Cvl_cvl_vm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_cvl_vm_user` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(8) DEFAULT '0',
  `created_by` varchar(100) DEFAULT NULL,
  `vm_password` varchar(64) DEFAULT NULL,
  `vnc_password` varchar(16) DEFAULT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  `driver_id` int(11) unsigned DEFAULT '0',
  `approved_by` varchar(100) DEFAULT NULL,
  `public_key` varchar(1000) DEFAULT NULL,
  `private_key` varchar(3000) DEFAULT NULL,
  `public_key_name` varchar(64) DEFAULT NULL,
  `private_key_name` varchar(64) DEFAULT NULL,
  `massive_account` varchar(100) DEFAULT NULL,
  `project_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_cvl_vm_user`
--

LOCK TABLES `Cvl_cvl_vm_user` WRITE;
/*!40000 ALTER TABLE `Cvl_cvl_vm_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_cvl_vm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_extensions`
--

DROP TABLE IF EXISTS `Cvl_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_extensions`
--

LOCK TABLES `Cvl_extensions` WRITE;
/*!40000 ALTER TABLE `Cvl_extensions` DISABLE KEYS */;
INSERT INTO `Cvl_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,1,1,1,'{\"legacy\":false,\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(2,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"legacy\":false,\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(3,'com_admin','component','com_admin','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(4,'com_banners','component','com_banners','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(5,'com_cache','component','com_cache','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(6,'com_categories','component','com_categories','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(7,'com_checkin','component','com_checkin','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(8,'com_contact','component','com_contact','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_contact_category\":\"hide\",\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(9,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10,'com_installer','component','com_installer','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(11,'com_languages','component','com_languages','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}','','',0,'0000-00-00 00:00:00',0,0),(12,'com_login','component','com_login','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(13,'com_media','component','com_media','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\",\"enable_flash\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(14,'com_menus','component','com_menus','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(15,'com_messages','component','com_messages','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(16,'com_modules','component','com_modules','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(18,'com_plugins','component','com_plugins','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(19,'com_search','component','com_search','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(20,'com_templates','component','com_templates','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(21,'com_weblinks','component','com_weblinks','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_comp_description\":\"1\",\"comp_description\":\"\",\"show_link_hits\":\"1\",\"show_link_description\":\"1\",\"show_other_cats\":\"0\",\"show_headings\":\"0\",\"show_numbers\":\"0\",\"show_report\":\"1\",\"count_clicks\":\"1\",\"target\":\"0\",\"link_icons\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(22,'com_content','component','com_content','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(23,'com_config','component','com_config','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,'com_redirect','component','com_redirect','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(25,'com_users','component','com_users','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"useractivation\":\"1\",\"frontend_userparams\":\"1\",\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(27,'com_finder','component','com_finder','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}','','',0,'0000-00-00 00:00:00',0,0),(28,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(100,'PHPMailer','library','phpmailer','',0,1,1,1,'{\"legacy\":false,\"name\":\"PHPMailer\",\"type\":\"library\",\"creationDate\":\"2001\",\"author\":\"PHPMailer\",\"copyright\":\"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.\",\"authorEmail\":\"jimjag@gmail.com\",\"authorUrl\":\"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/\",\"version\":\"5.2\",\"description\":\"LIB_PHPMAILER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(101,'SimplePie','library','simplepie','',0,1,1,1,'{\"legacy\":false,\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(102,'phputf8','library','phputf8','',0,1,1,1,'{\"legacy\":false,\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"11.4\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters.\\n\\t\\tAll rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(203,'mod_banners','module','mod_banners','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(205,'mod_custom','module','mod_custom','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(206,'mod_feed','module','mod_feed','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(207,'mod_footer','module','mod_footer','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(208,'mod_login','module','mod_login','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(209,'mod_menu','module','mod_menu','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(211,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(212,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(213,'mod_search','module','mod_search','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(214,'mod_stats','module','mod_stats','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(216,'mod_users_latest','module','mod_users_latest','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(217,'mod_weblinks','module','mod_weblinks','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(220,'mod_articles_category','module','mod_articles_category','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(222,'mod_languages','module','mod_languages','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(223,'mod_finder','module','mod_finder','',0,1,0,0,'{\"legacy\":false,\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(300,'mod_custom','module','mod_custom','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(301,'mod_feed','module','mod_feed','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(302,'mod_latest','module','mod_latest','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(303,'mod_logged','module','mod_logged','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(304,'mod_login','module','mod_login','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(305,'mod_menu','module','mod_menu','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(307,'mod_popular','module','mod_popular','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(309,'mod_status','module','mod_status','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(310,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(311,'mod_title','module','mod_title','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(314,'mod_version','module','mod_version','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0),(401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0),(404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(405,'plg_content_geshi','plugin','geshi','content',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0),(407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,'plg_content_vote','plugin','vote','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',6,0),(410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\"}','{\"linenumbers\":\"0\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"2.5.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2012\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\\/\",\"version\":\"3.5.4.1\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\",\"skin\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"true\",\"resize_horizontal\":\"false\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0),(413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',4,0),(417,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(419,'plg_search_content','plugin','content','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(421,'plg_search_weblinks','plugin','weblinks','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(423,'plg_system_p3p','plugin','p3p','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',2,0),(424,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',9,0),(425,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',4,0),(426,'plg_system_log','plugin','log','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',5,0),(427,'plg_system_redirect','plugin','redirect','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',6,0),(428,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',7,0),(429,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',8,0),(430,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(431,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2009 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{\"autoregister\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,'plg_user_profile','plugin','profile','user',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',10,0),(437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(439,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(440,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',7,0),(441,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(442,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(443,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(444,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(445,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',4,0),(446,'plg_finder_weblinks','plugin','weblinks','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',5,0),(500,'atomic','template','atomic','',0,1,1,0,'{\"legacy\":false,\"name\":\"atomic\",\"type\":\"template\",\"creationDate\":\"10\\/10\\/09\",\"author\":\"Ron Severdia\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"contact@kontentdesign.com\",\"authorUrl\":\"http:\\/\\/www.kontentdesign.com\",\"version\":\"2.5.0\",\"description\":\"TPL_ATOMIC_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(502,'bluestork','template','bluestork','',1,1,1,0,'{\"legacy\":false,\"name\":\"bluestork\",\"type\":\"template\",\"creationDate\":\"07\\/02\\/09\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"TPL_BLUESTORK_XML_DESCRIPTION\",\"group\":\"\"}','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\",\"textBig\":\"0\",\"highContrast\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(503,'beez_20','template','beez_20','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez_20\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ2_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(504,'hathor','template','hathor','',1,1,1,0,'{\"legacy\":false,\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"2.5.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(505,'beez5','template','beez5','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez5\",\"type\":\"template\",\"creationDate\":\"21 May 2010\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ5_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"html5\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(600,'English (United Kingdom)','language','en-GB','',0,1,1,1,'{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.5\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(601,'English (United Kingdom)','language','en-GB','',1,1,1,1,'{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.5\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(700,'files_joomla','file','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"September 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.7\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(800,'PKG_JOOMLA','package','pkg_joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"PKG_JOOMLA\",\"type\":\"package\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PKG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10000,'com_helloworld','component','com_helloworld','',1,1,0,0,'{\"legacy\":false,\"name\":\"COM_HELLOWORLD\",\"type\":\"component\",\"creationDate\":\"November 2009\",\"author\":\"John Doe\",\"copyright\":\"Copyright Info\",\"authorEmail\":\"john.doe@example.org\",\"authorUrl\":\"http:\\/\\/www.example.org\",\"version\":\"0.0.19\",\"description\":\"COM_HELLOWORLD_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10003,'com_cvl_driver','component','com_cvl_driver','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_cvl_driver\",\"type\":\"component\",\"creationDate\":\"2012-10-31\",\"author\":\"jupiter\",\"copyright\":\"Copyright (C) 2012. All rights reserved.\",\"authorEmail\":\"jupiter.hce@gmail.com\",\"authorUrl\":\"http:\\/\\/\",\"version\":\"1.0.1\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10004,'com_cvl_vm','component','com_cvl_vm','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_cvl_vm\",\"type\":\"component\",\"creationDate\":\"2012-10-31\",\"author\":\"jupiter\",\"copyright\":\"Copyright (C) 2012. All rights reserved.\",\"authorEmail\":\"jupiter.hce@gmail.com\",\"authorUrl\":\"http:\\/\\/\",\"version\":\"1.0.1\",\"description\":\"CVL vm list.\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10005,'Massive09','template','massive09','',0,1,1,0,'{\"legacy\":false,\"name\":\"Massive09\",\"type\":\"template\",\"creationDate\":\"2012-11-05\",\"author\":\"DNA Integrated Communications\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.dnacommunications.com.au\",\"version\":\"1.0\",\"description\":\"Created by DNA Integrated Communications\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10006,'com_cvl_server','component','com_cvl_server','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_cvl_server\",\"type\":\"component\",\"creationDate\":\"2012-12-24\",\"author\":\"jupiter\",\"copyright\":\"Copyright (C) 2012. All rights reserved.\",\"authorEmail\":\"jupiter.hce@gmail.com\",\"authorUrl\":\"http:\\/\\/\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10007,'com_cvl_vm_user','component','com_cvl_vm_user','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_cvl_vm_user\",\"type\":\"component\",\"creationDate\":\"2013-01-23\",\"author\":\"jupiter\",\"copyright\":\"Copyright (C) 2013. All rights reserved.\",\"authorEmail\":\"jupiter.hce@gmail.com\",\"authorUrl\":\"http:\\/\\/\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10008,'com_cvl_project_group','component','com_cvl_project_group','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_cvl_project_group\",\"type\":\"component\",\"creationDate\":\"2013-02-17\",\"author\":\"jupiter\",\"copyright\":\"Copyright (C) 2013. All rights reserved.\",\"authorEmail\":\"jupiter.hce@gmail.com\",\"authorUrl\":\"http:\\/\\/\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10009,'com_cvl_nectar','component','com_cvl_nectar','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_cvl_nectar\",\"type\":\"component\",\"creationDate\":\"2013-02-20\",\"author\":\"jupiter\",\"copyright\":\"Copyright (C) 2013. All rights reserved.\",\"authorEmail\":\"jupiter.hce@gmail.com\",\"authorUrl\":\"http:\\/\\/\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `Cvl_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_filters`
--

DROP TABLE IF EXISTS `Cvl_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_filters`
--

LOCK TABLES `Cvl_finder_filters` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links`
--

DROP TABLE IF EXISTS `Cvl_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links`
--

LOCK TABLES `Cvl_finder_links` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms0`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms0`
--

LOCK TABLES `Cvl_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms1`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms1`
--

LOCK TABLES `Cvl_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms2`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms2`
--

LOCK TABLES `Cvl_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms3`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms3`
--

LOCK TABLES `Cvl_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms4`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms4`
--

LOCK TABLES `Cvl_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms5`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms5`
--

LOCK TABLES `Cvl_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms6`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms6`
--

LOCK TABLES `Cvl_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms7`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms7`
--

LOCK TABLES `Cvl_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms8`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms8`
--

LOCK TABLES `Cvl_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_terms9`
--

DROP TABLE IF EXISTS `Cvl_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_terms9`
--

LOCK TABLES `Cvl_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_termsa`
--

DROP TABLE IF EXISTS `Cvl_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_termsa`
--

LOCK TABLES `Cvl_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_termsb`
--

DROP TABLE IF EXISTS `Cvl_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_termsb`
--

LOCK TABLES `Cvl_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_termsc`
--

DROP TABLE IF EXISTS `Cvl_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_termsc`
--

LOCK TABLES `Cvl_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_termsd`
--

DROP TABLE IF EXISTS `Cvl_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_termsd`
--

LOCK TABLES `Cvl_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_termse`
--

DROP TABLE IF EXISTS `Cvl_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_termse`
--

LOCK TABLES `Cvl_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_links_termsf`
--

DROP TABLE IF EXISTS `Cvl_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_links_termsf`
--

LOCK TABLES `Cvl_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_taxonomy`
--

DROP TABLE IF EXISTS `Cvl_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_taxonomy`
--

LOCK TABLES `Cvl_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `Cvl_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `Cvl_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `Cvl_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_taxonomy_map`
--

LOCK TABLES `Cvl_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_terms`
--

DROP TABLE IF EXISTS `Cvl_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_terms`
--

LOCK TABLES `Cvl_finder_terms` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_terms_common`
--

DROP TABLE IF EXISTS `Cvl_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_terms_common`
--

LOCK TABLES `Cvl_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_terms_common` DISABLE KEYS */;
INSERT INTO `Cvl_finder_terms_common` VALUES ('a','en'),('about','en'),('after','en'),('ago','en'),('all','en'),('am','en'),('an','en'),('and','en'),('ani','en'),('any','en'),('are','en'),('aren\'t','en'),('as','en'),('at','en'),('be','en'),('but','en'),('by','en'),('for','en'),('from','en'),('get','en'),('go','en'),('how','en'),('if','en'),('in','en'),('into','en'),('is','en'),('isn\'t','en'),('it','en'),('its','en'),('me','en'),('more','en'),('most','en'),('must','en'),('my','en'),('new','en'),('no','en'),('none','en'),('not','en'),('noth','en'),('nothing','en'),('of','en'),('off','en'),('often','en'),('old','en'),('on','en'),('onc','en'),('once','en'),('onli','en'),('only','en'),('or','en'),('other','en'),('our','en'),('ours','en'),('out','en'),('over','en'),('page','en'),('she','en'),('should','en'),('small','en'),('so','en'),('some','en'),('than','en'),('thank','en'),('that','en'),('the','en'),('their','en'),('theirs','en'),('them','en'),('then','en'),('there','en'),('these','en'),('they','en'),('this','en'),('those','en'),('thus','en'),('time','en'),('times','en'),('to','en'),('too','en'),('true','en'),('under','en'),('until','en'),('up','en'),('upon','en'),('use','en'),('user','en'),('users','en'),('veri','en'),('version','en'),('very','en'),('via','en'),('want','en'),('was','en'),('way','en'),('were','en'),('what','en'),('when','en'),('where','en'),('whi','en'),('which','en'),('who','en'),('whom','en'),('whose','en'),('why','en'),('wide','en'),('will','en'),('with','en'),('within','en'),('without','en'),('would','en'),('yes','en'),('yet','en'),('you','en'),('your','en'),('yours','en');
/*!40000 ALTER TABLE `Cvl_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_tokens`
--

DROP TABLE IF EXISTS `Cvl_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_tokens`
--

LOCK TABLES `Cvl_finder_tokens` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `Cvl_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_tokens_aggregate`
--

LOCK TABLES `Cvl_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_finder_types`
--

DROP TABLE IF EXISTS `Cvl_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_finder_types`
--

LOCK TABLES `Cvl_finder_types` WRITE;
/*!40000 ALTER TABLE `Cvl_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_helloworld`
--

DROP TABLE IF EXISTS `Cvl_helloworld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_helloworld` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `greeting` varchar(25) NOT NULL,
  `catid` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_helloworld`
--

LOCK TABLES `Cvl_helloworld` WRITE;
/*!40000 ALTER TABLE `Cvl_helloworld` DISABLE KEYS */;
INSERT INTO `Cvl_helloworld` VALUES (1,'happy new year',0,'{\"show_category\":\"\"}'),(2,'Good bye World!',0,'{\"show_category\":\"\"}');
/*!40000 ALTER TABLE `Cvl_helloworld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_languages`
--

DROP TABLE IF EXISTS `Cvl_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_languages`
--

LOCK TABLES `Cvl_languages` WRITE;
/*!40000 ALTER TABLE `Cvl_languages` DISABLE KEYS */;
INSERT INTO `Cvl_languages` VALUES (1,'en-GB','English (UK)','English (UK)','en','en','','','','',1,0,1);
/*!40000 ALTER TABLE `Cvl_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_menu`
--

DROP TABLE IF EXISTS `Cvl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_menu`
--

LOCK TABLES `Cvl_menu` WRITE;
/*!40000 ALTER TABLE `Cvl_menu` DISABLE KEYS */;
INSERT INTO `Cvl_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,109,0,'*',0),(2,'menu','com_banners','Banners','','Banners','index.php?option=com_banners','component',0,1,1,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1),(3,'menu','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1),(4,'menu','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',0,2,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1),(5,'menu','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1),(6,'menu','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1),(7,'menu','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',0,1,1,8,0,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',11,16,0,'*',1),(8,'menu','com_contact','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',0,7,2,8,0,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',12,13,0,'*',1),(9,'menu','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',0,7,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',14,15,0,'*',1),(10,'menu','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',0,1,1,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',17,22,0,'*',1),(11,'menu','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',0,10,2,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',18,19,0,'*',1),(12,'menu','com_messages_read','Read Private Message','','Messaging/Read Private Message','index.php?option=com_messages','component',0,10,2,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages-read',0,'',20,21,0,'*',1),(13,'menu','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',0,1,1,17,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',23,28,0,'*',1),(14,'menu','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',0,13,2,17,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',24,25,0,'*',1),(15,'menu','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',0,13,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',26,27,0,'*',1),(16,'menu','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',0,1,1,24,0,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',43,44,0,'*',1),(17,'menu','com_search','Basic Search','','Basic Search','index.php?option=com_search','component',0,1,1,19,0,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',33,34,0,'*',1),(18,'menu','com_weblinks','Weblinks','','Weblinks','index.php?option=com_weblinks','component',0,1,1,21,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',35,40,0,'*',1),(19,'menu','com_weblinks_links','Links','','Weblinks/Links','index.php?option=com_weblinks','component',0,18,2,21,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',36,37,0,'*',1),(20,'menu','com_weblinks_categories','Categories','','Weblinks/Categories','index.php?option=com_categories&extension=com_weblinks','component',0,18,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks-cat',0,'',38,39,0,'*',1),(21,'menu','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',0,1,1,27,0,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',31,32,0,'*',1),(22,'menu','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',0,1,1,28,0,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',41,42,0,'*',1),(101,'mainmenu','Home','home','','home','index.php?option=com_content&view=featured','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',29,30,1,'*',0),(102,'main','COM_HELLOWORLD_MENU','com-helloworld-menu','','com-helloworld-menu','index.php?option=com_helloworld','component',0,1,1,10000,0,0,'0000-00-00 00:00:00',0,1,'../media/com_helloworld/images/tux-16x16.png',0,'',45,46,0,'',1),(103,'mainmenu','Test','test','','test','index.php?option=com_helloworld&view=helloworld&id=1','component',0,1,1,10000,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',47,48,0,'*',0),(104,'mainmenu','Test2','test2','','test2','index.php?option=com_helloworld&view=updhelloworld','component',0,1,1,10000,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"headingtxtcolor\":\"#ff0000\",\"headingbgcolor\":\"#0000ff\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',49,50,0,'*',0),(105,'mainmenu','CVL User Guide','cvl-user-guide','','cvl-user-guide','index.php?option=com_content&view=category&id=2','component',0,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"page_subheading\":\"\",\"show_pagination_limit\":\"\",\"filter_field\":\"hide\",\"show_headings\":\"\",\"list_show_date\":\"\",\"date_format\":\"\",\"list_show_hits\":\"\",\"list_show_author\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"alpha\",\"order_date\":\"created\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"display_num\":\"5\",\"show_title\":\"\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"\",\"show_vote\":\"0\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',51,52,0,'*',0),(106,'mainmenu','CVL News','cvl-news','','cvl-news','index.php?option=com_newsfeeds&view=categories&id=0','component',0,1,1,17,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_base_description\":\"\",\"categories_description\":\"\",\"maxLevelcat\":\"\",\"show_empty_categories_cat\":\"\",\"show_subcat_desc_cat\":\"\",\"show_cat_items_cat\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_subcat_desc\":\"\",\"show_cat_items\":\"\",\"show_pagination_limit\":\"\",\"show_headings\":\"\",\"show_articles\":\"\",\"show_link\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_feed_image\":\"\",\"show_feed_description\":\"\",\"show_item_description\":\"\",\"feed_character_count\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',53,54,0,'*',0),(111,'main','COM_CVL_DRIVER','com-cvl-driver','','com-cvl-driver','index.php?option=com_cvl_driver','component',0,1,1,10003,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_driver/assets/images/s_com_cvl_driver.png',0,'',55,58,0,'',1),(112,'main','COM_CVL_DRIVER_DRIVERS','com-cvl-driver-drivers','','com-cvl-driver/com-cvl-driver-drivers','index.php?option=com_cvl_driver&view=drivers','component',0,111,2,10003,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_driver/assets/images/s_drivers.png',0,'',56,57,0,'',1),(113,'main','COM_CVL_VM','com-cvl-vm','','com-cvl-vm','index.php?option=com_cvl_vm','component',0,1,1,10004,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_vm/assets/images/s_com_cvl_vm.png',0,'',59,62,0,'',1),(114,'main','COM_CVL_VM_CVLVMLISTS','com-cvl-vm-cvlvmlists','','com-cvl-vm/com-cvl-vm-cvlvmlists','index.php?option=com_cvl_vm&view=cvlvmlists','component',0,113,2,10004,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_vm/assets/images/s_cvlvmlists.png',0,'',60,61,0,'',1),(115,'mainmenu','View VM','cvl-vm-list','','cvl-vm-list','index.php?option=com_cvl_vm&view=cvlvmlists','component',1,1,1,10004,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',63,64,0,'*',0),(116,'main','COM_CVL_SERVER','com-cvl-server','','com-cvl-server','index.php?option=com_cvl_server','component',0,1,1,10006,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_server/assets/images/s_com_cvl_server.png',0,'',65,68,0,'',1),(117,'main','COM_CVL_SERVER_TITLE_SERVERINSTANCESS','com-cvl-server-title-serverinstancess','','com-cvl-server/com-cvl-server-title-serverinstancess','index.php?option=com_cvl_server&view=serverinstancess','component',0,116,2,10006,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_server/assets/images/s_serverinstancess.png',0,'',66,67,0,'',1),(118,'mainmenu','Create VM','create-vm-instance','','create-vm-instance','index.php?option=com_cvl_server&view=serverinstances','component',1,1,1,10006,0,661,'2013-02-12 14:05:49',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',69,70,0,'*',0),(119,'mainmenu','Delete VM account (terminate VM)','cvl-create-instance','','cvl-create-instance','index.php?option=com_cvl_server&view=serverinstancess','component',1,1,1,10006,0,0,'0000-00-00 00:00:00',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',71,72,0,'*',0),(120,'mainmenu','Sample Web link submit','sample-web-link-submit','','sample-web-link-submit','index.php?option=com_weblinks&view=form&layout=edit','component',0,1,1,21,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',73,74,0,'*',0),(121,'mainmenu','Sample Web link list news','sample-web-link-list-news','','sample-web-link-list-news','index.php?option=com_newsfeeds&view=categories&id=0','component',0,1,1,17,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_base_description\":\"\",\"categories_description\":\"\",\"maxLevelcat\":\"\",\"show_empty_categories_cat\":\"\",\"show_subcat_desc_cat\":\"\",\"show_cat_items_cat\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_subcat_desc\":\"\",\"show_cat_items\":\"\",\"show_pagination_limit\":\"\",\"show_headings\":\"\",\"show_articles\":\"\",\"show_link\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_feed_image\":\"\",\"show_feed_description\":\"\",\"show_item_description\":\"\",\"feed_character_count\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',75,76,0,'*',0),(122,'mainmenu','Sample Web link category','sample-web-link-category','','sample-web-link-category','index.php?option=com_newsfeeds&view=category&id=5','component',0,1,1,17,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_subcat_desc\":\"\",\"show_cat_items\":\"\",\"show_pagination_limit\":\"\",\"show_headings\":\"\",\"show_articles\":\"\",\"show_link\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_feed_image\":\"\",\"show_feed_description\":\"\",\"show_item_description\":\"\",\"feed_character_count\":\"0\",\"feed_display_order\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',77,78,0,'*',0),(123,'mainmenu','sample hello world','sample-hello-world','','sample-hello-world','index.php?option=com_helloworld&view=helloworld&id=1','component',0,1,1,10000,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',79,80,0,'*',0),(124,'mainmenu','Sample update greeting','sample-update-greeting','','sample-update-greeting','index.php?option=com_helloworld&view=updhelloworld','component',0,1,1,10000,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"headingtxtcolor\":\"#ff0000\",\"headingbgcolor\":\"#0000ff\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',81,82,0,'*',0),(125,'mainmenu','Join VM','add-vm','','add-vm','index.php?option=com_cvl_vm&view=cvlvmlist','component',0,1,1,10004,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',83,84,0,'*',0),(126,'mainmenu','Join VM','join-server','','join-server','index.php?option=com_cvl_vm&view=cvlvmread','component',1,1,1,10004,0,0,'0000-00-00 00:00:00',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',85,86,0,'*',0),(127,'mainmenu','Change password','change-user-password','','change-user-password','index.php?option=com_cvl_driver&view=cvldriver','component',1,1,1,10003,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',87,88,0,'*',0),(128,'main','COM_CVL_VM_USER','com-cvl-vm-user','','com-cvl-vm-user','index.php?option=com_cvl_vm_user','component',0,1,1,10007,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_vm_user/assets/images/s_com_cvl_vm_user.png',0,'',89,92,0,'',1),(129,'main','COM_CVL_VM_USER_TITLE_VMUSERS','com-cvl-vm-user-title-vmusers','','com-cvl-vm-user/com-cvl-vm-user-title-vmusers','index.php?option=com_cvl_vm_user&view=vmusers','component',0,128,2,10007,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_vm_user/assets/images/s_vmusers.png',0,'',90,91,0,'',1),(130,'mainmenu','View user account','view-vm-users','','view-vm-users','index.php?option=com_cvl_vm_user&view=vmusers','component',1,1,1,10007,0,0,'0000-00-00 00:00:00',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',93,94,0,'*',0),(131,'mainmenu','Create user account','create-vm-user-account','','create-vm-user-account','index.php?option=com_cvl_vm_user&view=createvmuser','component',1,1,1,10007,0,0,'0000-00-00 00:00:00',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',95,96,0,'*',0),(132,'mainmenu','Delete user account','delete-vm-user','','delete-vm-user','index.php?option=com_cvl_vm_user&view=deletevmuser','component',1,1,1,10007,0,0,'0000-00-00 00:00:00',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',97,98,0,'*',0),(133,'main','COM_CVL_PROJECT_GROUP','com-cvl-project-group','','com-cvl-project-group','index.php?option=com_cvl_project_group','component',0,1,1,10008,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_project_group/assets/images/s_com_cvl_project_group.png',0,'',99,102,0,'',1),(134,'main','COM_CVL_PROJECT_GROUP_TITLE_PROJECTGROUPS','com-cvl-project-group-title-projectgroups','','com-cvl-project-group/com-cvl-project-group-title-projectgroups','index.php?option=com_cvl_project_group&view=projectgroups','component',0,133,2,10008,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_project_group/assets/images/s_projectgroups.png',0,'',100,101,0,'',1),(135,'main','COM_CVL_NECTAR','com-cvl-nectar','','com-cvl-nectar','index.php?option=com_cvl_nectar','component',0,1,1,10009,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_nectar/assets/images/s_com_cvl_nectar.png',0,'',103,106,0,'',1),(136,'main','COM_CVL_NECTAR_TITLE_CVLNECTARS','com-cvl-nectar-title-cvlnectars','','com-cvl-nectar/com-cvl-nectar-title-cvlnectars','index.php?option=com_cvl_nectar&view=cvlnectars','component',0,135,2,10009,0,0,'0000-00-00 00:00:00',0,1,'components/com_cvl_nectar/assets/images/s_cvlnectars.png',0,'',104,105,0,'',1),(137,'mainmenu','Add VM account','add-vm-account','','add-vm-account','index.php?option=com_cvl_vm&view=cvladdvm','component',1,1,1,10004,0,0,'0000-00-00 00:00:00',0,6,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',107,108,0,'*',0);
/*!40000 ALTER TABLE `Cvl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_menu_types`
--

DROP TABLE IF EXISTS `Cvl_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_menu_types`
--

LOCK TABLES `Cvl_menu_types` WRITE;
/*!40000 ALTER TABLE `Cvl_menu_types` DISABLE KEYS */;
INSERT INTO `Cvl_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site');
/*!40000 ALTER TABLE `Cvl_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_messages`
--

DROP TABLE IF EXISTS `Cvl_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_messages`
--

LOCK TABLES `Cvl_messages` WRITE;
/*!40000 ALTER TABLE `Cvl_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_messages_cfg`
--

DROP TABLE IF EXISTS `Cvl_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_messages_cfg`
--

LOCK TABLES `Cvl_messages_cfg` WRITE;
/*!40000 ALTER TABLE `Cvl_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_modules`
--

DROP TABLE IF EXISTS `Cvl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_modules`
--

LOCK TABLES `Cvl_modules` WRITE;
/*!40000 ALTER TABLE `Cvl_modules` DISABLE KEYS */;
INSERT INTO `Cvl_modules` VALUES (1,'Main Menu','','',1,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(2,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*'),(3,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(4,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(8,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*'),(10,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(12,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(14,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*'),(15,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(16,'Login Form','','',7,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"greeting\":\"1\",\"name\":\"0\"}',0,'*'),(17,'Breadcrumbs','','',1,'position-2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(79,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(86,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(87,'Header logo','','<p><img src=\"images/cvl-website-banner_2.jpg\" border=\"0\" alt=\"\" /></p>',0,'position-15',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*');
/*!40000 ALTER TABLE `Cvl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_modules_menu`
--

DROP TABLE IF EXISTS `Cvl_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_modules_menu`
--

LOCK TABLES `Cvl_modules_menu` WRITE;
/*!40000 ALTER TABLE `Cvl_modules_menu` DISABLE KEYS */;
INSERT INTO `Cvl_modules_menu` VALUES (1,0),(2,0),(3,0),(4,0),(6,0),(7,0),(8,0),(9,0),(10,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(79,0),(86,0),(87,0);
/*!40000 ALTER TABLE `Cvl_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_newsfeeds`
--

DROP TABLE IF EXISTS `Cvl_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_newsfeeds`
--

LOCK TABLES `Cvl_newsfeeds` WRITE;
/*!40000 ALTER TABLE `Cvl_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_overrider`
--

DROP TABLE IF EXISTS `Cvl_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_overrider`
--

LOCK TABLES `Cvl_overrider` WRITE;
/*!40000 ALTER TABLE `Cvl_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_redirect_links`
--

DROP TABLE IF EXISTS `Cvl_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_redirect_links`
--

LOCK TABLES `Cvl_redirect_links` WRITE;
/*!40000 ALTER TABLE `Cvl_redirect_links` DISABLE KEYS */;
INSERT INTO `Cvl_redirect_links` VALUES (1,'http://127.0.0.1/dev3/index.php/cvl-vm-list','','http://127.0.0.1/dev3/','',3,0,'2012-10-31 01:21:22','0000-00-00 00:00:00'),(2,'http://127.0.0.1/UserManagement/index.php/user','','','',1,0,'2012-12-25 02:51:33','0000-00-00 00:00:00'),(3,'http://127.0.0.1/UserManagement/index.php/component','','','',1,0,'2012-12-25 02:51:51','0000-00-00 00:00:00'),(4,'http://127.0.0.1/UserManagement/index.php/component/','','','',2,0,'2012-12-25 02:52:07','0000-00-00 00:00:00'),(5,'http://127.0.0.1/UserManagement/index.php/component/ss/?view=serverinstance','','','',1,0,'2012-12-25 04:25:44','0000-00-00 00:00:00'),(6,'http://127.0.0.1/UserManagement/index.php/component/serverinstances','','','',1,0,'2012-12-25 04:26:00','0000-00-00 00:00:00'),(7,'http://127.0.0.1/UserManagement/index.php/createvm.php?cpu=2','','http://127.0.0.1/UserManagement/index.php/create-vm-instance','',5,0,'2012-12-26 10:52:24','0000-00-00 00:00:00'),(8,'http://127.0.0.1/UserManagement/index.php/createvm.php?cpu=3','','http://127.0.0.1/UserManagement/index.php/create-vm-instance','',1,0,'2012-12-26 10:53:38','0000-00-00 00:00:00'),(9,'http://127.0.0.1/UserManagement/index.php/createvm.php','','','',3,0,'2012-12-26 10:54:33','0000-00-00 00:00:00'),(10,'http://127.0.0.1/UserManagement/index.php/createvm.php?cpu=1','','http://127.0.0.1/UserManagement/index.php/create-vm-instance','',1,0,'2012-12-26 10:54:47','0000-00-00 00:00:00'),(11,'http://127.0.0.1/UserManagement/index.php/add-vm','','http://127.0.0.1/UserManagement/','',13,0,'2013-01-04 21:40:45','0000-00-00 00:00:00'),(12,'http://127.0.0.1/UserManagement/index.php/cvl-vm-lists','','','',1,0,'2013-01-04 21:59:30','0000-00-00 00:00:00'),(13,'http://127.0.0.1/UserManagement/index.php/change-user-password','','http://127.0.0.1/UserManagement/index.php/component/users/?view=login','',1,0,'2013-01-08 23:13:47','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `Cvl_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_schemas`
--

DROP TABLE IF EXISTS `Cvl_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_schemas`
--

LOCK TABLES `Cvl_schemas` WRITE;
/*!40000 ALTER TABLE `Cvl_schemas` DISABLE KEYS */;
INSERT INTO `Cvl_schemas` VALUES (700,'2.5.7'),(10000,'0.0.13');
/*!40000 ALTER TABLE `Cvl_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_session`
--

DROP TABLE IF EXISTS `Cvl_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_session`
--

LOCK TABLES `Cvl_session` WRITE;
/*!40000 ALTER TABLE `Cvl_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_template_styles`
--

DROP TABLE IF EXISTS `Cvl_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_template_styles`
--

LOCK TABLES `Cvl_template_styles` WRITE;
/*!40000 ALTER TABLE `Cvl_template_styles` DISABLE KEYS */;
INSERT INTO `Cvl_template_styles` VALUES (2,'bluestork',1,'1','Bluestork - Default','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\"}'),(3,'atomic',0,'0','Atomic - Default','{}'),(4,'beez_20',0,'0','Beez2 - Default','{\"wrapperSmall\":20,\"wrapperLarge\":10,\"logo\":\"\",\"sitetitle\":\"Characterisation Virtual Laboratory\",\"sitedescription\":\"CVL User Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\"}'),(5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),(6,'beez5',0,'0','Beez5 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/sampledata\\/fruitshop\\/fruits.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"html5\":\"0\"}'),(7,'massive09',0,'1','Massive09 - Default','{}');
/*!40000 ALTER TABLE `Cvl_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_update_categories`
--

DROP TABLE IF EXISTS `Cvl_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_update_categories`
--

LOCK TABLES `Cvl_update_categories` WRITE;
/*!40000 ALTER TABLE `Cvl_update_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_update_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_update_sites`
--

DROP TABLE IF EXISTS `Cvl_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_update_sites`
--

LOCK TABLES `Cvl_update_sites` WRITE;
/*!40000 ALTER TABLE `Cvl_update_sites` DISABLE KEYS */;
INSERT INTO `Cvl_update_sites` VALUES (1,'Joomla Core','collection','http://update.joomla.org/core/list.xml',1,1362959254),(2,'Joomla Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,1362959254),(3,'Accredited Joomla! Translations','collection','http://update.joomla.org/language/translationlist.xml',1,1362959256),(4,'HelloWorld Update Site','extension','http://yourdomain.com/update/helloworld-update.xml',0,1351398757);
/*!40000 ALTER TABLE `Cvl_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_update_sites_extensions`
--

DROP TABLE IF EXISTS `Cvl_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_update_sites_extensions`
--

LOCK TABLES `Cvl_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `Cvl_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `Cvl_update_sites_extensions` VALUES (1,700),(2,700),(3,600),(4,10000);
/*!40000 ALTER TABLE `Cvl_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_updates`
--

DROP TABLE IF EXISTS `Cvl_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1845 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_updates`
--

LOCK TABLES `Cvl_updates` WRITE;
/*!40000 ALTER TABLE `Cvl_updates` DISABLE KEYS */;
INSERT INTO `Cvl_updates` VALUES (1,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.7.3','','http://update.joomla.org/language/details/da-DK_details.xml',''),(2,3,0,0,'Khmer','','pkg_km-KH','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/km-KH_details.xml',''),(3,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(4,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(5,3,0,0,'Bulgarian','','pkg_bg-BG','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/bg-BG_details.xml',''),(6,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(7,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(8,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(9,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(10,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(11,3,0,0,'Ukrainian','','pkg_uk-UA','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/uk-UA_details.xml',''),(12,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(13,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(14,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(15,3,0,0,'Estonian','','pkg_et-EE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/et-EE_details.xml',''),(16,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.1','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(17,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(18,3,0,0,'Macedonian','','pkg_mk-MK','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/mk-MK_details.xml',''),(19,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(20,3,0,0,'Serbian Latin','','pkg_sr-YU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sr-YU_details.xml',''),(21,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(22,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(23,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(24,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(25,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/en-US_details.xml',''),(26,3,0,0,'Serbian Cyrillic','','pkg_sr-RS','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sr-RS_details.xml',''),(27,3,0,0,'Lithuanian','','pkg_lt-LT','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/lt-LT_details.xml',''),(28,3,0,0,'Albanian','','pkg_sq-AL','package','',0,'2.5.1.5','','http://update.joomla.org/language/details/sq-AL_details.xml',''),(29,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(30,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(31,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(32,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(33,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(34,3,0,0,'Hebrew','','pkg_he-IL','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/he-IL_details.xml',''),(35,3,0,0,'Laotian','','pkg_lo-LA','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/lo-LA_details.xml',''),(36,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.6.2','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(37,3,0,0,'Chinese Simplified','','pkg_zh-CN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/zh-CN_details.xml',''),(38,3,0,0,'Greek','','pkg_el-GR','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/el-GR_details.xml',''),(39,3,0,0,'Esperanto','','pkg_eo-XX','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/eo-XX_details.xml',''),(40,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(41,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(42,3,0,0,'Chinese Traditional','','pkg_zh-TW','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/zh-TW_details.xml',''),(43,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(44,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(45,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(46,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(47,3,0,0,'Azeri','','pkg_az-AZ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/az-AZ_details.xml',''),(48,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(49,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(50,3,0,0,'Scottish Gaelic','','pkg_gd-GB','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/gd-GB_details.xml',''),(51,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(52,3,0,0,'Basque','','pkg_eu-ES','package','',0,'1.7.0.1','','http://update.joomla.org/language/details/eu-ES_details.xml',''),(53,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(54,3,0,0,'Korean','','pkg_ko-KR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ko-KR_details.xml',''),(55,3,0,0,'Hindi','','pkg_hi-IN','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/hi-IN_details.xml',''),(56,3,0,0,'Welsh','','pkg_cy-GB','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/cy-GB_details.xml',''),(57,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(58,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(59,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(60,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(61,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(62,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(63,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(64,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(65,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(66,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(67,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(68,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(69,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(70,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(71,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(72,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(73,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(74,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(75,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(76,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(77,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(78,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(79,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(80,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(81,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(82,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(83,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(84,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(85,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(86,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(87,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(88,1,700,0,'Joomla','','joomla','file','',0,'2.5.8','','http://update.joomla.org/core/extension.xml',''),(89,1,700,0,'Joomla','','joomla','file','',0,'2.5.8','','http://update.joomla.org/core/extension.xml',''),(90,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(91,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(92,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(93,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(94,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(95,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(96,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(97,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(98,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(99,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(100,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(101,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(102,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(103,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(104,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(105,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(106,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(107,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(108,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(109,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(110,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(111,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(112,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(113,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(114,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(115,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(116,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(117,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(118,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(119,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(120,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(121,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(122,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(123,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(124,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(125,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(126,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(127,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(128,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(129,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(130,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(131,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(132,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(133,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(134,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(135,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(136,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(137,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(138,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(139,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(140,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(141,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(142,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(143,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(144,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(145,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(146,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(147,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(148,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(149,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(150,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(151,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(152,3,0,0,'Indonesian','','pkg_id-ID','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/id-ID_details.xml',''),(153,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(154,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(155,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(156,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(157,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(158,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(159,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(160,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(161,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(162,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(163,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(164,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(165,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(166,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(167,3,0,0,'Portuguese','','pkg_pt-PT','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-PT_details.xml',''),(168,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(169,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(170,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(171,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(172,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(173,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(174,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(175,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(176,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(177,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(178,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(179,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(180,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(181,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(182,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(183,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(184,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(185,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(186,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(187,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(188,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(189,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(190,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(191,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(192,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(193,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(194,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(195,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(196,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(197,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(198,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(199,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(200,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(201,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(202,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(203,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(204,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(205,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(206,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(207,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(208,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(209,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(210,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(211,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(212,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(213,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(214,3,0,0,'Armenian','','pkg_hy-AM','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hy-AM_details.xml',''),(215,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(216,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(217,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(218,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(219,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(220,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(221,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(222,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(223,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(224,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(225,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(226,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(227,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(228,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(229,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(230,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(231,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(232,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(233,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(234,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(235,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(236,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(237,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(238,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(239,3,0,0,'Catalan','','pkg_ca-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ca-ES_details.xml',''),(240,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(241,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(242,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(243,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(244,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(245,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(246,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(247,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(248,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(249,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(250,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(251,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(252,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(253,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(254,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(255,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(256,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(257,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(258,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(259,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(260,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(261,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(262,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(263,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(264,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(265,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(266,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(267,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(268,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(269,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(270,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(271,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(272,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(273,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(274,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(275,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(276,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(277,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(278,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(279,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(280,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(281,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(282,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(283,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(284,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(285,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(286,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(287,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(288,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(289,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(290,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(291,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(292,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(293,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(294,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(295,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(296,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(297,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(298,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(299,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(300,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(301,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(302,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(303,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(304,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(305,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(306,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(307,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(308,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(309,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(310,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(311,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(312,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(313,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(314,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(315,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(316,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(317,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(318,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(319,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(320,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(321,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(322,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(323,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(324,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(325,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(326,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(327,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(328,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(329,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(330,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(331,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(332,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(333,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(334,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(335,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(336,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(337,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(338,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(339,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(340,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(341,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(342,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(343,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(344,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(345,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(346,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(347,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(348,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(349,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(350,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(351,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(352,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(353,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(354,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(355,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(356,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(357,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(358,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(359,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(360,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(361,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(362,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(363,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(364,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(365,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(366,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(367,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(368,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(369,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(370,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(371,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(372,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(373,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(374,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(375,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(376,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(377,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(378,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(379,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(380,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(381,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(382,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(383,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(384,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(385,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(386,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(387,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(388,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(389,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(390,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(391,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(392,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(393,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(394,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(395,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(396,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(397,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(398,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(399,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(400,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(401,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(402,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(403,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(404,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(405,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(406,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(407,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(408,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(409,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(410,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(411,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(412,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(413,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(414,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(415,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(416,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(417,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(418,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(419,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(420,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(421,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(422,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(423,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(424,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(425,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(426,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(427,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(428,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(429,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(430,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(431,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(432,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(433,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(434,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(435,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(436,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(437,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(438,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(439,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(440,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(441,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(442,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(443,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(444,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(445,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(446,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(447,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(448,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(449,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(450,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(451,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(452,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(453,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(454,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(455,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(456,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(457,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(458,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(459,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(460,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(461,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(462,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(463,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(464,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(465,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(466,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(467,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(468,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(469,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(470,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(471,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(472,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(473,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(474,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(475,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(476,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(477,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(478,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(479,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(480,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(481,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(482,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(483,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(484,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(485,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(486,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(487,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(488,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(489,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(490,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(491,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(492,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(493,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(494,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(495,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(496,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(497,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(498,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(499,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(500,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(501,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(502,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(503,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(504,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(505,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(506,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(507,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(508,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(509,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(510,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(511,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(512,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(513,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(514,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(515,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(516,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(517,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(518,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(519,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(520,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(521,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(522,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(523,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(524,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(525,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(526,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(527,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(528,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(529,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(530,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(531,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(532,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(533,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(534,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(535,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(536,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(537,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(538,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(539,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(540,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(541,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(542,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(543,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(544,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(545,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(546,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(547,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(548,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(549,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(550,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(551,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(552,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(553,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(554,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(555,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(556,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(557,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(558,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(559,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(560,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(561,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(562,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(563,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(564,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(565,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(566,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(567,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(568,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(569,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(570,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(571,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(572,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(573,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(574,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(575,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(576,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(577,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(578,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(579,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(580,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(581,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(582,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(583,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(584,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(585,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(586,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(587,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(588,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(589,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(590,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(591,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(592,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(593,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(594,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(595,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(596,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(597,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(598,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(599,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(600,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(601,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(602,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(603,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(604,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(605,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(606,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(607,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(608,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(609,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(610,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(611,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(612,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(613,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(614,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(615,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(616,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(617,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(618,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(619,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(620,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(621,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(622,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(623,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(624,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(625,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(626,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(627,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(628,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(629,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(630,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(631,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(632,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(633,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(634,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(635,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(636,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(637,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(638,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(639,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(640,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(641,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(642,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(643,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(644,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(645,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(646,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(647,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(648,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(649,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(650,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(651,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(652,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(653,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(654,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(655,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(656,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(657,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(658,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(659,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(660,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(661,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(662,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(663,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(664,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(665,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(666,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(667,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(668,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(669,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(670,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(671,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(672,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(673,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(674,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(675,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(676,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(677,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(678,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(679,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(680,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(681,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(682,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(683,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(684,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(685,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(686,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(687,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(688,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(689,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(690,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(691,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(692,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(693,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(694,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(695,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(696,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(697,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(698,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(699,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(700,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(701,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(702,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(703,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(704,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(705,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(706,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(707,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(708,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(709,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(710,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(711,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(712,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(713,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(714,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(715,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(716,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(717,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(718,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(719,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(720,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(721,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(722,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(723,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(724,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(725,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(726,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(727,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(728,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(729,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(730,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(731,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(732,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(733,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(734,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(735,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(736,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(737,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(738,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(739,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(740,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(741,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(742,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(743,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(744,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(745,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(746,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(747,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(748,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(749,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(750,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(751,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(752,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(753,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(754,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(755,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(756,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(757,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(758,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(759,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(760,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(761,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(762,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(763,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(764,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(765,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(766,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(767,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(768,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(769,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(770,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(771,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(772,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(773,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(774,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(775,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(776,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(777,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(778,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(779,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(780,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(781,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(782,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(783,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(784,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(785,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(786,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(787,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(788,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(789,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(790,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(791,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(792,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(793,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(794,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(795,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(796,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(797,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(798,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(799,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(800,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(801,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(802,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(803,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(804,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(805,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(806,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(807,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(808,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(809,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(810,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(811,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(812,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(813,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(814,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(815,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(816,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(817,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(818,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(819,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(820,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(821,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(822,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(823,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(824,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(825,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(826,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(827,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(828,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(829,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(830,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(831,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(832,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(833,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(834,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(835,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(836,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(837,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(838,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(839,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(840,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(841,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(842,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(843,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(844,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(845,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(846,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(847,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(848,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(849,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(850,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(851,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(852,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(853,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(854,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(855,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(856,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(857,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(858,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(859,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(860,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(861,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(862,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(863,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(864,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(865,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(866,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(867,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(868,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(869,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(870,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(871,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(872,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(873,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(874,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(875,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(876,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(877,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(878,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(879,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(880,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(881,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(882,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(883,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(884,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(885,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(886,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(887,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(888,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(889,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(890,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(891,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(892,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(893,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(894,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(895,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(896,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(897,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(898,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(899,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(900,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(901,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(902,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(903,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(904,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(905,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(906,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(907,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(908,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(909,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(910,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(911,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(912,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(913,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(914,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(915,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(916,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(917,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(918,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(919,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(920,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(921,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(922,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(923,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(924,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(925,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(926,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(927,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(928,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(929,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(930,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(931,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(932,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(933,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(934,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(935,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(936,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(937,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(938,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(939,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(940,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(941,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(942,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(943,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(944,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(945,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(946,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(947,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(948,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(949,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(950,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(951,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(952,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(953,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(954,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(955,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(956,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(957,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(958,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(959,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(960,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(961,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(962,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(963,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(964,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(965,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(966,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(967,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(968,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(969,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(970,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(971,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(972,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(973,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(974,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(975,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(976,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(977,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(978,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(979,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(980,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(981,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(982,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(983,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(984,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(985,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(986,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(987,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(988,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(989,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(990,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(991,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(992,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(993,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(994,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(995,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(996,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(997,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(998,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(999,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1000,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1001,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1002,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1003,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1004,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1005,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1006,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1007,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1008,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1009,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1010,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1011,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1012,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1013,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1014,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1015,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1016,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1017,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1018,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1019,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1020,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1021,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1022,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1023,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1024,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1025,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1026,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1027,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1028,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1029,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1030,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1031,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1032,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1033,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1034,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1035,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1036,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1037,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1038,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1039,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1040,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1041,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1042,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1043,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1044,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1045,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1046,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1047,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1048,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1049,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1050,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1051,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1052,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1053,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1054,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1055,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1056,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1057,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1058,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1059,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1060,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1061,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1062,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1063,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1064,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1065,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1066,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1067,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1068,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1069,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1070,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1071,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1072,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1073,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1074,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1075,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1076,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1077,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1078,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1079,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1080,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1081,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1082,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1083,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1084,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1085,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1086,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1087,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1088,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1089,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1090,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1091,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1092,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1093,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1094,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1095,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1096,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1097,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1098,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1099,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1100,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1101,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1102,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1103,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1104,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1105,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1106,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1107,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1108,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1109,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1110,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1111,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1112,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1113,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1114,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1115,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1116,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1117,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1118,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1119,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1120,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1121,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1122,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1123,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1124,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1125,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1126,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1127,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1128,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1129,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1130,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1131,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1132,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1133,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1134,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1135,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1136,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1137,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1138,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1139,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1140,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1141,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1142,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1143,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1144,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1145,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1146,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1147,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1148,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1149,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1150,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1151,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1152,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1153,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1154,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1155,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1156,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1157,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1158,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1159,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1160,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1161,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1162,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1163,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1164,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1165,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1166,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1167,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1168,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1169,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1170,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1171,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1172,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1173,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1174,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1175,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1176,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1177,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1178,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1179,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1180,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1181,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1182,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1183,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1184,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1185,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1186,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1187,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1188,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1189,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1190,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1191,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1192,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1193,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1194,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1195,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1196,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1197,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1198,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1199,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1200,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1201,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1202,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1203,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1204,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1205,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1206,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1207,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1208,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1209,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1210,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1211,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1212,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1213,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1214,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1215,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1216,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1217,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1218,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1219,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1220,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.8.2','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1221,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1222,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1223,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1224,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1225,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1226,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1227,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1228,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1229,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1230,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1231,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1232,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1233,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1234,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1235,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1236,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1237,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1238,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1239,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1240,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1241,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1242,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1243,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1244,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1245,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1246,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1247,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1248,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1249,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1250,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1251,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1252,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1253,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1254,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1255,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1256,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1257,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1258,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1259,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1260,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1261,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1262,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1263,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1264,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1265,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1266,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1267,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1268,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1269,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1270,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1271,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1272,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1273,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1274,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1275,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1276,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1277,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1278,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1279,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1280,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1281,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1282,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1283,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1284,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1285,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1286,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1287,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1288,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1289,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1290,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1291,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1292,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1293,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1294,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1295,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1296,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1297,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1298,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1299,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1300,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1301,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1302,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1303,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1304,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1305,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1306,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1307,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1308,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1309,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1310,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1311,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1312,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1313,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1314,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1315,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1316,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1317,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1318,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1319,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1320,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1321,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1322,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1323,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1324,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1325,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1326,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1327,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1328,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1329,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1330,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1331,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1332,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1333,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1334,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1335,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1336,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1337,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1338,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1339,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1340,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1341,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1342,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1343,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1344,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1345,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1346,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1347,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1348,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1349,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1350,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1351,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1352,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1353,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1354,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1355,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1356,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1357,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1358,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1359,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1360,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1361,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1362,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1363,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1364,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1365,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1366,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1367,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1368,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1369,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1370,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1371,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1372,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1373,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1374,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1375,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1376,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1377,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1378,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1379,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1380,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1381,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1382,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1383,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1384,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1385,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1386,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1387,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1388,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1389,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1390,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1391,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1392,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1393,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1394,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1395,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1396,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1397,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1398,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1399,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1400,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1401,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1402,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1403,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1404,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1405,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1406,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1407,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1408,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1409,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1410,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1411,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1412,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1413,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1414,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1415,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1416,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1417,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1418,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1419,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1420,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1421,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1422,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1423,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1424,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1425,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1426,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1427,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1428,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1429,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1430,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1431,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1432,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1433,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1434,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1435,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1436,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1437,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1438,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1439,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1440,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1441,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1442,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1443,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1444,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1445,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1446,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1447,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1448,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1449,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1450,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1451,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1452,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1453,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1454,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1455,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1456,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1457,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1458,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1459,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1460,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1461,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1462,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1463,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1464,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1465,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1466,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1467,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1468,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1469,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1470,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1471,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1472,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1473,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1474,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1475,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1476,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1477,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1478,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1479,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1480,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1481,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1482,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1483,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1484,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1485,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1486,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1487,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1488,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1489,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1490,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1491,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1492,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1493,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1494,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1495,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1496,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1497,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1498,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1499,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1500,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1501,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1502,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1503,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1504,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1505,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1506,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1507,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1508,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1509,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1510,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1511,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1512,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1513,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1514,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1515,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1516,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1517,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1518,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1519,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1520,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1521,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1522,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1523,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1524,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1525,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1526,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1527,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1528,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1529,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1530,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1531,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1532,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1533,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1534,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1535,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1536,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1537,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1538,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1539,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1540,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1541,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1542,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1543,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1544,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1545,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1546,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1547,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1548,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1549,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1550,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1551,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1552,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1553,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1554,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1555,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1556,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1557,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1558,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1559,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1560,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1561,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1562,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1563,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1564,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1565,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1566,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1567,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1568,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1569,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1570,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1571,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1572,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1573,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1574,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1575,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1576,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1577,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1578,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1579,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1580,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1581,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1582,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1583,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1584,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1585,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1586,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1587,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.8.3','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1588,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1589,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1590,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1591,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1592,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1593,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1594,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1595,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1596,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1597,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1598,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1599,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1600,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1601,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1602,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1603,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1604,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1605,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1606,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1607,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1608,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1609,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1610,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1611,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1612,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1613,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1614,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1615,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1616,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1617,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1618,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1619,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1620,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1621,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1622,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1623,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1624,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1625,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1626,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1627,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1628,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1629,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1630,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1631,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1632,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1633,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1634,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1635,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1636,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1637,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1638,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1639,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1640,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1641,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1642,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1643,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1644,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1645,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1646,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1647,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1648,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1649,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1650,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1651,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1652,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1653,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1654,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1655,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1656,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1657,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1658,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1659,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1660,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1661,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1662,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1663,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1664,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1665,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1666,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1667,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1668,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1669,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1670,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1671,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1672,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1673,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1674,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1675,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1676,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1677,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1678,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1679,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1680,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1681,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1682,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1683,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1684,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1685,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1686,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1687,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1688,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1689,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1690,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1691,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1692,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1693,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1694,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1695,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1696,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1697,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1698,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1699,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1700,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1701,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1702,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1703,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1704,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1705,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1706,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1707,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1708,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1709,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1710,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1711,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1712,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1713,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1714,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1715,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1716,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1717,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1718,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1719,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1720,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1721,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1722,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1723,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1724,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1725,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1726,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1727,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1728,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1729,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1730,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1731,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1732,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1733,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1734,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1735,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1736,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1737,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1738,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1739,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1740,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1741,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1742,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1743,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1744,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1745,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1746,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1747,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1748,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1749,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1750,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1751,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1752,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1753,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1754,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1755,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1756,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1757,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1758,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1759,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1760,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1761,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1762,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1763,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1764,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1765,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1766,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1767,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1768,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1769,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1770,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1771,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1772,1,0,0,'Joomla','','joomla','file','',0,'2.5.9','','http://update.joomla.org/core/extension.xml',''),(1773,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1774,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1775,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1776,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1777,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1778,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1779,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1780,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1781,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1782,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1783,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1784,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1785,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1786,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1787,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1788,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1789,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1790,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1791,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/da-DK_details.xml',''),(1792,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1793,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(1794,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1795,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(1796,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(1797,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1798,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(1799,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1800,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1801,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1802,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(1803,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(1804,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1805,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(1806,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(1807,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1808,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(1809,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1810,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(1811,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1812,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.3','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(1813,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1814,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1815,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(1816,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1817,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(1818,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1819,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1820,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(1821,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1822,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(1823,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.9.2','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(1824,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1825,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(1826,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/en-US_details.xml',''),(1827,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml',''),(1828,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(1829,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.4','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(1830,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(1831,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(1832,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.8.4','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(1833,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(1834,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(1835,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(1836,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(1837,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(1838,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(1839,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(1840,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(1841,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(1842,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.8.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(1843,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(1844,3,0,0,'Swahili','','pkg_sw-KE','package','',0,'2.5.9.1','','http://update.joomla.org/language/details/sw-KE_details.xml','');
/*!40000 ALTER TABLE `Cvl_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_user_notes`
--

DROP TABLE IF EXISTS `Cvl_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_user_notes`
--

LOCK TABLES `Cvl_user_notes` WRITE;
/*!40000 ALTER TABLE `Cvl_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_user_profiles`
--

DROP TABLE IF EXISTS `Cvl_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_user_profiles`
--

LOCK TABLES `Cvl_user_profiles` WRITE;
/*!40000 ALTER TABLE `Cvl_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_user_usergroup_map`
--

DROP TABLE IF EXISTS `Cvl_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_user_usergroup_map` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_user_usergroup_map`
--

LOCK TABLES `Cvl_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `Cvl_user_usergroup_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_usergroups`
--

DROP TABLE IF EXISTS `Cvl_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_usergroups`
--

LOCK TABLES `Cvl_usergroups` WRITE;
/*!40000 ALTER TABLE `Cvl_usergroups` DISABLE KEYS */;
INSERT INTO `Cvl_usergroups` VALUES (1,0,1,20,'Public'),(2,1,6,17,'Registered'),(3,2,9,10,'Author'),(4,2,11,14,'Editor'),(5,4,12,13,'Publisher'),(6,1,2,5,'Manager'),(7,6,3,4,'Administrator'),(8,1,18,19,'Super Users'),(9,2,7,8,'Administrator'),(10,2,15,16,'User');
/*!40000 ALTER TABLE `Cvl_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_users`
--

DROP TABLE IF EXISTS `Cvl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `cvlVmType` tinyint(8) DEFAULT NULL,
  `cvlDriver` tinyint(8) DEFAULT NULL,
  `cvlVmUseDays` int(32) DEFAULT NULL,
  `vmId` int(11) unsigned DEFAULT NULL,
  `serverPassword` varchar(64) DEFAULT NULL,
  `vncPassword` varchar(16) DEFAULT NULL,
  `userGroup` tinyint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_users`
--

LOCK TABLES `Cvl_users` WRITE;
/*!40000 ALTER TABLE `Cvl_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_viewlevels`
--

DROP TABLE IF EXISTS `Cvl_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_viewlevels`
--

LOCK TABLES `Cvl_viewlevels` WRITE;
/*!40000 ALTER TABLE `Cvl_viewlevels` DISABLE KEYS */;
INSERT INTO `Cvl_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',1,'[6,2,8]'),(3,'Special',2,'[6,3,8]'),(4,'Administrator',0,'[9,8]'),(5,'User',0,'[10]'),(6,'Super Users',0,'[9,8]');
/*!40000 ALTER TABLE `Cvl_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cvl_weblinks`
--

DROP TABLE IF EXISTS `Cvl_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cvl_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cvl_weblinks`
--

LOCK TABLES `Cvl_weblinks` WRITE;
/*!40000 ALTER TABLE `Cvl_weblinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cvl_weblinks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-20 11:02:45
