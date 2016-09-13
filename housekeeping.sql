-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: housekeeping_test
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE="+00:00" */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "ar_internal_metadata"
--

DROP TABLE IF EXISTS "ar_internal_metadata";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "ar_internal_metadata" (
  "key" varchar(255) NOT NULL,
  "value" varchar(255) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("key")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "ar_internal_metadata"
--

LOCK TABLES "ar_internal_metadata" WRITE;
/*!40000 ALTER TABLE "ar_internal_metadata" DISABLE KEYS */;
INSERT INTO "ar_internal_metadata" VALUES ("environment","development","2016-08-16 11:28:19","2016-08-16 11:28:19");
/*!40000 ALTER TABLE "ar_internal_metadata" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "clients"
--

DROP TABLE IF EXISTS "clients";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "clients" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "provider" varchar(255) DEFAULT NULL,
  "uid" varchar(255) DEFAULT NULL,
  "name" varchar(255) DEFAULT NULL,
  "oauth_token" varchar(255) DEFAULT NULL,
  "oauth_expires_at" datetime DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "email" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "clients"
--

LOCK TABLES "clients" WRITE;
/*!40000 ALTER TABLE "clients" DISABLE KEYS */;
/*!40000 ALTER TABLE "clients" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "hotels"
--

DROP TABLE IF EXISTS "hotels";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "hotels" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "no_of_rooms" int(11) DEFAULT NULL,
  "address" varchar(255) DEFAULT NULL,
  "image_id" varchar(255) DEFAULT NULL,
  "integer" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "hotels"
--

LOCK TABLES "hotels" WRITE;
/*!40000 ALTER TABLE "hotels" DISABLE KEYS */;
INSERT INTO "hotels" VALUES (7,"2016-08-18 08:48:38","2016-08-19 07:18:55","Hotel",20,"kcjgluulb383513684\r\n,yjbk","5",NULL),(8,"2016-08-18 09:09:22","2016-08-18 09:18:54","Royal",20,"Afjvt818","6",NULL),(9,"2016-08-18 09:21:48","2016-08-18 13:26:40","WWW",20,"wghg3rg1","7",NULL),(10,"2016-08-19 05:13:46","2016-08-19 05:13:47","Paris",20,"swlkvbmvwo","21",NULL),(11,"2016-08-23 09:34:37","2016-08-23 09:34:38","Super",20,"bnpune","28",NULL);
/*!40000 ALTER TABLE "hotels" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "images"
--

DROP TABLE IF EXISTS "images";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "images" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "imageable_type" varchar(255) DEFAULT NULL,
  "imageable_id" int(11) DEFAULT NULL,
  "image_file_name" varchar(255) DEFAULT NULL,
  "image_content_type" varchar(255) DEFAULT NULL,
  "image_file_size" int(11) DEFAULT NULL,
  "image_updated_at" datetime DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "index_images_on_imageable_type_and_imageable_id" ("imageable_type","imageable_id")
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "images"
--

LOCK TABLES "images" WRITE;
/*!40000 ALTER TABLE "images" DISABLE KEYS */;
INSERT INTO "images" VALUES (5,NULL,"2016-08-18 08:48:39","2016-08-18 08:48:39","Hotel",7,"croatia_oasis_wpo.jpg","image/jpeg",1231461,"2016-08-18 08:48:39"),(6,NULL,"2016-08-18 09:09:23","2016-08-18 11:20:13","Hotel",8,"norway_barn_wpo.jpg","image/jpeg",899806,"2016-08-18 11:20:12"),(7,NULL,"2016-08-18 09:21:49","2016-08-18 11:32:34","Hotel",9,"uk_fishing_wpo.jpg","image/jpeg",1410222,"2016-08-18 11:32:34"),(8,NULL,"2016-08-18 10:42:44","2016-08-22 08:45:32","User",19,"brazil_bus_wpo.jpg","image/jpeg",499563,"2016-08-22 08:45:31"),(9,NULL,"2016-08-18 11:09:35","2016-08-18 11:19:57","User",20,"brazil_bus_wpo.jpg","image/jpeg",499563,"2016-08-18 11:19:57"),(10,NULL,"2016-08-18 11:24:40","2016-08-19 11:13:49","User",21,"vietnam_boats_wpo.jpg","image/jpeg",884415,"2016-08-19 11:13:49"),(11,NULL,"2016-08-18 11:31:28","2016-08-18 11:31:28","User",22,"china_staircase_wpo.jpg","image/jpeg",510833,"2016-08-18 11:31:28"),(12,NULL,"2016-08-18 13:04:30","2016-08-18 13:04:30","User",25,"vietnam_boats_wpo.jpg","image/jpeg",884415,"2016-08-18 13:04:30"),(13,NULL,"2016-08-18 13:05:02","2016-08-18 13:05:02","User",26,"china_buildings_wpo.jpg","image/jpeg",1249821,"2016-08-18 13:05:02"),(14,NULL,"2016-08-18 13:05:39","2016-08-18 13:05:39","User",27,"norway_barn_wpo.jpg","image/jpeg",899806,"2016-08-18 13:05:38"),(15,NULL,"2016-08-18 13:06:13","2016-08-18 13:06:13","User",28,"indonesia_monkey_wpo.jpg","image/jpeg",1116935,"2016-08-18 13:06:13"),(16,NULL,"2016-08-18 13:25:30","2016-08-18 13:25:30","User",30,"france_field_wpo.jpg","image/jpeg",1630704,"2016-08-18 13:25:30"),(17,NULL,"2016-08-19 04:58:44","2016-08-19 04:58:44","User",31,"norway_barn_wpo.jpg","image/jpeg",899806,"2016-08-19 04:58:43"),(18,NULL,"2016-08-19 04:59:12","2016-08-19 04:59:12","User",32,"germany_colors_wpo.jpg","image/jpeg",875327,"2016-08-19 04:59:12"),(19,NULL,"2016-08-19 05:00:18","2016-08-23 04:58:26","User",33,"china_buildings_wpo.jpg","image/jpeg",1249821,"2016-08-23 04:58:25"),(20,NULL,"2016-08-19 05:04:22","2016-08-19 05:04:22","User",34,"china_buildings_wpo.jpg","image/jpeg",1249821,"2016-08-19 05:04:22"),(21,NULL,"2016-08-19 05:13:47","2016-08-19 05:13:47","Hotel",10,"brazil_bus_wpo.jpg","image/jpeg",499563,"2016-08-19 05:13:46"),(22,NULL,"2016-08-19 05:15:30","2016-08-19 05:15:30","User",35,"china_buildings_wpo.jpg","image/jpeg",1249821,"2016-08-19 05:15:30"),(23,NULL,"2016-08-19 05:17:16","2016-08-19 05:17:16","User",36,"croatia_oasis_wpo.jpg","image/jpeg",1231461,"2016-08-19 05:17:15"),(24,NULL,"2016-08-23 05:31:25","2016-08-23 05:31:25","User",37,"uk_fishing_wpo.jpg","image/jpeg",1410222,"2016-08-23 05:31:24"),(25,NULL,"2016-08-23 06:06:10","2016-08-23 06:06:10","User",38,"norway_barn_wpo.jpg","image/jpeg",899806,"2016-08-23 06:06:10"),(26,NULL,"2016-08-23 06:11:52","2016-08-23 06:52:07","User",39,"vietnam_boats_wpo.jpg","image/jpeg",884415,"2016-08-23 06:52:07"),(27,NULL,"2016-08-23 08:37:59","2016-08-23 08:37:59","User",40,"germany_colors_wpo.jpg","image/jpeg",875327,"2016-08-23 08:37:58"),(28,NULL,"2016-08-23 09:34:37","2016-08-23 09:34:37","Hotel",11,"uk_fishing_wpo.jpg","image/jpeg",1410222,"2016-08-23 09:34:37"),(29,NULL,"2016-08-23 11:20:29","2016-08-23 11:20:29","User",41,"china_staircase_wpo.jpg","image/jpeg",510833,"2016-08-23 11:20:29"),(30,NULL,"2016-08-23 11:21:06","2016-08-23 11:21:06","User",42,"france_field_wpo.jpg","image/jpeg",1630704,"2016-08-23 11:21:05"),(31,NULL,"2016-08-23 11:21:43","2016-08-23 11:21:43","User",43,"croatia_oasis_wpo.jpg","image/jpeg",1231461,"2016-08-23 11:21:43"),(32,NULL,"2016-08-23 11:22:41","2016-08-23 11:22:41","User",44,"china_staircase_wpo.jpg","image/jpeg",510833,"2016-08-23 11:22:41"),(33,NULL,"2016-08-23 11:47:45","2016-08-23 11:47:45","User",45,NULL,NULL,NULL,NULL),(34,NULL,"2016-08-23 11:48:43","2016-08-23 11:48:43","User",46,"china_buildings_wpo.jpg","image/jpeg",1249821,"2016-08-23 11:48:43");
/*!40000 ALTER TABLE "images" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "oauth_access_grants"
--

DROP TABLE IF EXISTS "oauth_access_grants";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "oauth_access_grants" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "resource_owner_id" int(11) NOT NULL,
  "application_id" int(11) NOT NULL,
  "token" varchar(255) NOT NULL,
  "expires_in" int(11) NOT NULL,
  "redirect_uri" text NOT NULL,
  "created_at" datetime NOT NULL,
  "revoked_at" datetime DEFAULT NULL,
  "scopes" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_oauth_access_grants_on_token" ("token") USING BTREE,
  KEY "fk_rails_b4b53e07b8" ("application_id") USING BTREE,
  CONSTRAINT "fk_rails_b4b53e07b8" FOREIGN KEY ("application_id") REFERENCES "oauth_applications" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "oauth_access_grants"
--

LOCK TABLES "oauth_access_grants" WRITE;
/*!40000 ALTER TABLE "oauth_access_grants" DISABLE KEYS */;
/*!40000 ALTER TABLE "oauth_access_grants" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "oauth_access_tokens"
--

DROP TABLE IF EXISTS "oauth_access_tokens";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "oauth_access_tokens" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "resource_owner_id" int(11) DEFAULT NULL,
  "application_id" int(11) DEFAULT NULL,
  "token" varchar(255) NOT NULL,
  "refresh_token" varchar(255) DEFAULT NULL,
  "expires_in" int(11) DEFAULT NULL,
  "revoked_at" datetime DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "scopes" varchar(255) DEFAULT NULL,
  "previous_refresh_token" varchar(255) NOT NULL DEFAULT "",
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_oauth_access_tokens_on_token" ("token") USING BTREE,
  UNIQUE KEY "index_oauth_access_tokens_on_refresh_token" ("refresh_token") USING BTREE,
  KEY "fk_rails_732cb83ab7" ("application_id") USING BTREE,
  KEY "index_oauth_access_tokens_on_resource_owner_id" ("resource_owner_id") USING BTREE,
  CONSTRAINT "fk_rails_732cb83ab7" FOREIGN KEY ("application_id") REFERENCES "oauth_applications" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "oauth_access_tokens"
--

LOCK TABLES "oauth_access_tokens" WRITE;
/*!40000 ALTER TABLE "oauth_access_tokens" DISABLE KEYS */;
/*!40000 ALTER TABLE "oauth_access_tokens" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "oauth_applications"
--

DROP TABLE IF EXISTS "oauth_applications";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "oauth_applications" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL,
  "uid" varchar(255) NOT NULL,
  "secret" varchar(255) NOT NULL,
  "redirect_uri" text NOT NULL,
  "scopes" varchar(255) NOT NULL DEFAULT "",
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_oauth_applications_on_uid" ("uid") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "oauth_applications"
--

LOCK TABLES "oauth_applications" WRITE;
/*!40000 ALTER TABLE "oauth_applications" DISABLE KEYS */;
/*!40000 ALTER TABLE "oauth_applications" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "roles"
--

DROP TABLE IF EXISTS "roles";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "roles" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "roles"
--

LOCK TABLES "roles" WRITE;
/*!40000 ALTER TABLE "roles" DISABLE KEYS */;
INSERT INTO "roles" VALUES (6,"0000-00-00 00:00:00","0000-00-00 00:00:00","Admin"),(7,"0000-00-00 00:00:00","0000-00-00 00:00:00","Staff"),(8,"0000-00-00 00:00:00","0000-00-00 00:00:00","Maid");
/*!40000 ALTER TABLE "roles" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "roles_users"
--

DROP TABLE IF EXISTS "roles_users";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "roles_users" (
  "role_id" int(11) DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "roles_users"
--

LOCK TABLES "roles_users" WRITE;
/*!40000 ALTER TABLE "roles_users" DISABLE KEYS */;
/*!40000 ALTER TABLE "roles_users" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "rooms"
--

DROP TABLE IF EXISTS "rooms";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "rooms" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "no" int(11) DEFAULT NULL,
  "hotel_id" int(11) DEFAULT NULL,
  "status" varchar(255) DEFAULT NULL,
  "estimated_time" time DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "rooms"
--

LOCK TABLES "rooms" WRITE;
/*!40000 ALTER TABLE "rooms" DISABLE KEYS */;
INSERT INTO "rooms" VALUES (101,"2016-08-18 08:48:39","2016-08-22 09:44:20",101,7,"clean","01:00:00"),(102,"2016-08-18 08:48:39","2016-08-22 09:52:38",102,7,"clean","01:00:00"),(103,"2016-08-18 08:48:39","2016-08-18 13:13:33",103,7,"dirty","01:00:00"),(104,"2016-08-18 08:48:39","2016-08-18 08:48:39",104,7,"dirty","01:00:00"),(105,"2016-08-18 08:48:39","2016-08-18 08:48:39",105,7,"dirty","01:00:00"),(106,"2016-08-18 08:48:39","2016-08-18 08:48:39",106,7,"dirty","01:00:00"),(107,"2016-08-18 08:48:39","2016-08-22 09:41:52",107,7,"dirty","01:00:00"),(108,"2016-08-18 08:48:39","2016-08-23 12:21:14",108,7,"clean","01:00:00"),(109,"2016-08-18 08:48:39","2016-08-18 08:48:39",109,7,"dirty","01:00:00"),(110,"2016-08-18 08:48:39","2016-08-18 08:48:39",110,7,"dirty","01:00:00"),(111,"2016-08-18 08:48:39","2016-08-18 08:48:39",111,7,"dirty","01:00:00"),(112,"2016-08-18 08:48:39","2016-08-18 08:48:39",112,7,"dirty","01:00:00"),(113,"2016-08-18 08:48:39","2016-08-18 08:48:39",113,7,"dirty","01:00:00"),(114,"2016-08-18 08:48:40","2016-08-18 08:48:40",114,7,"dirty","01:00:00"),(115,"2016-08-18 08:48:40","2016-08-19 09:53:30",115,7,"dirty","01:00:00"),(116,"2016-08-18 08:48:40","2016-08-18 08:48:40",116,7,"dirty","01:00:00"),(117,"2016-08-18 08:48:40","2016-08-18 08:48:40",117,7,"dirty","01:00:00"),(118,"2016-08-18 08:48:40","2016-08-18 08:48:40",118,7,"dirty","01:00:00"),(119,"2016-08-18 08:48:40","2016-08-18 08:48:40",119,7,"dirty","01:00:00"),(120,"2016-08-18 08:48:40","2016-08-18 08:48:40",120,7,"dirty","01:00:00"),(121,"2016-08-18 09:09:23","2016-08-18 09:09:23",101,8,"dirty","01:00:00"),(122,"2016-08-18 09:09:23","2016-08-18 09:09:23",102,8,"dirty","01:00:00"),(123,"2016-08-18 09:09:23","2016-08-18 09:09:23",103,8,"dirty","01:00:00"),(124,"2016-08-18 09:09:23","2016-08-18 09:09:23",104,8,"dirty","01:00:00"),(125,"2016-08-18 09:09:23","2016-08-18 09:09:23",105,8,"dirty","01:00:00"),(126,"2016-08-18 09:09:23","2016-08-18 09:09:23",106,8,"dirty","01:00:00"),(127,"2016-08-18 09:09:23","2016-08-18 09:09:23",107,8,"dirty","01:00:00"),(128,"2016-08-18 09:09:23","2016-08-18 09:09:23",108,8,"dirty","01:00:00"),(129,"2016-08-18 09:09:23","2016-08-18 09:09:23",109,8,"dirty","01:00:00"),(130,"2016-08-18 09:09:23","2016-08-18 09:09:23",110,8,"dirty","01:00:00"),(131,"2016-08-18 09:09:23","2016-08-18 09:09:23",111,8,"dirty","01:00:00"),(132,"2016-08-18 09:09:23","2016-08-18 09:09:23",112,8,"dirty","01:00:00"),(133,"2016-08-18 09:09:23","2016-08-18 09:09:23",113,8,"dirty","01:00:00"),(134,"2016-08-18 09:09:23","2016-08-18 09:09:23",114,8,"dirty","01:00:00"),(135,"2016-08-18 09:09:23","2016-08-18 09:09:23",115,8,"dirty","01:00:00"),(136,"2016-08-18 09:09:23","2016-08-18 09:09:23",116,8,"dirty","01:00:00"),(137,"2016-08-18 09:09:23","2016-08-18 09:09:23",117,8,"dirty","01:00:00"),(138,"2016-08-18 09:09:24","2016-08-18 09:09:24",118,8,"dirty","01:00:00"),(139,"2016-08-18 09:09:24","2016-08-18 09:09:24",119,8,"dirty","01:00:00"),(140,"2016-08-18 09:09:24","2016-08-18 09:09:24",120,8,"dirty","01:00:00"),(141,"2016-08-18 09:21:49","2016-08-18 09:21:49",101,9,"dirty","01:00:00"),(142,"2016-08-18 09:21:49","2016-08-18 09:21:49",102,9,"dirty","01:00:00"),(143,"2016-08-18 09:21:49","2016-08-18 09:21:49",103,9,"dirty","01:00:00"),(144,"2016-08-18 09:21:49","2016-08-18 09:21:49",104,9,"dirty","01:00:00"),(145,"2016-08-18 09:21:49","2016-08-18 09:21:49",105,9,"dirty","01:00:00"),(146,"2016-08-18 09:21:49","2016-08-18 09:21:49",106,9,"dirty","01:00:00"),(147,"2016-08-18 09:21:49","2016-08-18 09:21:49",107,9,"dirty","01:00:00"),(148,"2016-08-18 09:21:49","2016-08-18 09:21:49",108,9,"dirty","01:00:00"),(149,"2016-08-18 09:21:49","2016-08-18 09:21:49",109,9,"dirty","01:00:00"),(150,"2016-08-18 09:21:49","2016-08-18 09:21:49",110,9,"dirty","01:00:00"),(151,"2016-08-18 09:21:49","2016-08-18 09:21:49",111,9,"dirty","01:00:00"),(152,"2016-08-18 09:21:49","2016-08-18 09:21:49",112,9,"dirty","01:00:00"),(153,"2016-08-18 09:21:49","2016-08-18 09:21:49",113,9,"dirty","01:00:00"),(154,"2016-08-18 09:21:49","2016-08-18 09:21:49",114,9,"dirty","01:00:00"),(155,"2016-08-18 09:21:49","2016-08-18 09:21:49",115,9,"dirty","01:00:00"),(156,"2016-08-18 09:21:49","2016-08-18 09:21:49",116,9,"dirty","01:00:00"),(157,"2016-08-18 09:21:50","2016-08-18 09:21:50",117,9,"dirty","01:00:00"),(158,"2016-08-18 09:21:50","2016-08-18 09:21:50",118,9,"dirty","01:00:00"),(159,"2016-08-18 09:21:50","2016-08-18 09:21:50",119,9,"dirty","01:00:00"),(160,"2016-08-18 09:21:50","2016-08-18 09:21:50",120,9,"dirty","01:00:00"),(161,"2016-08-19 05:13:47","2016-08-19 05:13:47",101,10,"dirty","01:00:00"),(162,"2016-08-19 05:13:47","2016-08-19 05:13:47",102,10,"dirty","01:00:00"),(163,"2016-08-19 05:13:47","2016-08-19 05:13:47",103,10,"dirty","01:00:00"),(164,"2016-08-19 05:13:47","2016-08-19 05:13:47",104,10,"dirty","01:00:00"),(165,"2016-08-19 05:13:47","2016-08-19 05:13:47",105,10,"dirty","01:00:00"),(166,"2016-08-19 05:13:47","2016-08-19 05:13:47",106,10,"dirty","01:00:00"),(167,"2016-08-19 05:13:47","2016-08-19 05:13:47",107,10,"dirty","01:00:00"),(168,"2016-08-19 05:13:47","2016-08-19 05:13:47",108,10,"dirty","01:00:00"),(169,"2016-08-19 05:13:47","2016-08-19 05:13:47",109,10,"dirty","01:00:00"),(170,"2016-08-19 05:13:47","2016-08-19 05:13:47",110,10,"dirty","01:00:00"),(171,"2016-08-19 05:13:47","2016-08-19 05:13:47",111,10,"dirty","01:00:00"),(172,"2016-08-19 05:13:47","2016-08-19 05:13:47",112,10,"dirty","01:00:00"),(173,"2016-08-19 05:13:47","2016-08-19 05:13:47",113,10,"dirty","01:00:00"),(174,"2016-08-19 05:13:47","2016-08-19 05:13:47",114,10,"dirty","01:00:00"),(175,"2016-08-19 05:13:47","2016-08-19 05:13:47",115,10,"dirty","01:00:00"),(176,"2016-08-19 05:13:47","2016-08-19 05:13:47",116,10,"dirty","01:00:00"),(177,"2016-08-19 05:13:47","2016-08-19 05:13:47",117,10,"dirty","01:00:00"),(178,"2016-08-19 05:13:48","2016-08-19 05:13:48",118,10,"dirty","01:00:00"),(179,"2016-08-19 05:13:48","2016-08-19 05:13:48",119,10,"dirty","01:00:00"),(180,"2016-08-19 05:13:48","2016-08-19 05:13:48",120,10,"dirty","01:00:00"),(181,"2016-08-23 09:34:38","2016-08-23 09:34:38",101,11,"dirty","01:00:00"),(182,"2016-08-23 09:34:38","2016-08-23 09:34:38",102,11,"dirty","01:00:00"),(183,"2016-08-23 09:34:38","2016-08-23 09:34:38",103,11,"dirty","01:00:00"),(184,"2016-08-23 09:34:38","2016-08-23 09:34:38",104,11,"dirty","01:00:00"),(185,"2016-08-23 09:34:38","2016-08-23 09:34:38",105,11,"dirty","01:00:00"),(186,"2016-08-23 09:34:38","2016-08-23 09:34:38",106,11,"dirty","01:00:00"),(187,"2016-08-23 09:34:38","2016-08-23 09:34:38",107,11,"dirty","01:00:00"),(188,"2016-08-23 09:34:38","2016-08-23 09:34:38",108,11,"dirty","01:00:00"),(189,"2016-08-23 09:34:38","2016-08-23 09:34:38",109,11,"dirty","01:00:00"),(190,"2016-08-23 09:34:38","2016-08-23 09:34:38",110,11,"dirty","01:00:00"),(191,"2016-08-23 09:34:38","2016-08-23 09:34:38",111,11,"dirty","01:00:00"),(192,"2016-08-23 09:34:38","2016-08-23 09:34:38",112,11,"dirty","01:00:00"),(193,"2016-08-23 09:34:38","2016-08-23 09:34:38",113,11,"dirty","01:00:00"),(194,"2016-08-23 09:34:38","2016-08-23 09:34:38",114,11,"dirty","01:00:00"),(195,"2016-08-23 09:34:38","2016-08-23 09:34:38",115,11,"dirty","01:00:00"),(196,"2016-08-23 09:34:38","2016-08-23 09:34:38",116,11,"dirty","01:00:00"),(197,"2016-08-23 09:34:38","2016-08-23 09:34:38",117,11,"dirty","01:00:00"),(198,"2016-08-23 09:34:38","2016-08-23 09:34:38",118,11,"dirty","01:00:00"),(199,"2016-08-23 09:34:38","2016-08-23 09:34:38",119,11,"dirty","01:00:00"),(200,"2016-08-23 09:34:39","2016-08-23 09:34:39",120,11,"dirty","01:00:00");
/*!40000 ALTER TABLE "rooms" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "salaries"
--

DROP TABLE IF EXISTS "salaries";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "salaries" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "user_id" int(11) DEFAULT NULL,
  "total_hours" time DEFAULT NULL,
  "date" int(11) DEFAULT NULL,
  "deduction" int(11) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "salaries"
--

LOCK TABLES "salaries" WRITE;
/*!40000 ALTER TABLE "salaries" DISABLE KEYS */;
INSERT INTO "salaries" VALUES (1,"2016-08-18 10:42:44","2016-08-18 10:42:44",19,NULL,NULL,NULL),(2,"2016-08-18 11:09:35","2016-08-18 11:09:35",20,NULL,NULL,NULL),(3,"2016-08-18 11:24:40","2016-08-18 11:24:40",21,NULL,NULL,NULL),(4,"2016-08-18 11:31:28","2016-08-18 11:31:28",22,NULL,NULL,NULL),(5,"2016-08-18 13:04:30","2016-08-18 13:04:30",25,NULL,NULL,NULL),(6,"2016-08-18 13:05:02","2016-08-18 13:13:54",26,"00:00:14",0,NULL),(7,"2016-08-18 13:05:39","2016-08-22 09:52:38",27,"00:00:04",0,NULL),(8,"2016-08-18 13:06:13","2016-08-18 13:13:33",28,"00:00:03",0,NULL),(9,"2016-08-18 13:25:30","2016-08-18 13:25:30",30,NULL,NULL,NULL),(10,"2016-08-19 04:58:44","2016-08-19 04:58:44",31,NULL,NULL,NULL),(11,"2016-08-19 04:59:13","2016-08-19 04:59:13",32,NULL,NULL,NULL),(12,"2016-08-19 05:00:18","2016-08-23 12:21:14",33,"08:32:13",0,NULL),(13,"2016-08-19 05:04:22","2016-08-22 09:41:52",34,"00:00:02",0,NULL),(14,"2016-08-19 05:15:30","2016-08-19 05:15:30",35,NULL,NULL,NULL),(15,"2016-08-19 05:17:16","2016-08-19 05:17:16",36,NULL,NULL,NULL),(16,"2016-08-23 05:31:25","2016-08-23 05:31:25",37,NULL,NULL,NULL),(17,"2016-08-23 06:06:10","2016-08-23 06:06:10",38,NULL,NULL,NULL),(18,"2016-08-23 06:11:52","2016-08-23 06:11:52",39,NULL,NULL,NULL),(19,"2016-08-23 08:37:59","2016-08-23 08:37:59",40,NULL,NULL,NULL),(20,"2016-08-23 11:20:29","2016-08-23 11:20:29",41,NULL,NULL,NULL),(21,"2016-08-23 11:21:06","2016-08-23 11:21:06",42,NULL,NULL,NULL),(22,"2016-08-23 11:21:43","2016-08-23 11:21:43",43,NULL,NULL,NULL),(23,"2016-08-23 11:22:41","2016-08-23 11:22:41",44,NULL,NULL,NULL),(24,"2016-08-23 11:47:45","2016-08-23 11:47:45",45,NULL,NULL,NULL),(25,"2016-08-23 11:48:43","2016-08-23 11:48:43",46,NULL,NULL,NULL);
/*!40000 ALTER TABLE "salaries" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "schema_migrations"
--

DROP TABLE IF EXISTS "schema_migrations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "schema_migrations" (
  "version" varchar(255) NOT NULL,
  PRIMARY KEY ("version")
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "schema_migrations"
--

LOCK TABLES "schema_migrations" WRITE;
/*!40000 ALTER TABLE "schema_migrations" DISABLE KEYS */;
INSERT INTO "schema_migrations" VALUES ("20160722110019"),("20160722110233"),("20160722110322"),("20160722110339"),("20160722110409"),("20160722110431"),("20160722110809"),("20160722110823"),("20160722110952"),("20160722111012"),("20160722111053"),("20160722111425"),("20160722111443"),("20160722111630"),("20160722112245"),("20160722112701"),("20160722112732"),("20160722112846"),("20160722113011"),("20160722113042"),("20160722113112"),("20160722113141"),("20160722113209"),("20160722113245"),("20160722113332"),("20160722113353"),("20160722113426"),("20160722113457"),("20160722113509"),("20160722113523"),("20160722113610"),("20160722113633"),("20160722113646"),("20160722114940"),("20160722115006"),("20160722115032"),("20160722115101"),("20160722115228"),("20160727045627"),("20160727143242"),("20160728044028"),("20160728110941"),("20160801121500"),("20160808122633"),("20160808122650"),("20160808122833"),("20160808130103"),("20160808132923"),("20160809054910"),("20160818044737"),("20160818045609"),("20160818045654"),("20160818054951"),("20160818055001");
/*!40000 ALTER TABLE "schema_migrations" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "shifts"
--

DROP TABLE IF EXISTS "shifts";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "shifts" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "start_time" time DEFAULT NULL,
  "end_time" time DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "shifts"
--

LOCK TABLES "shifts" WRITE;
/*!40000 ALTER TABLE "shifts" DISABLE KEYS */;
INSERT INTO "shifts" VALUES (1,"0000-00-00 00:00:00","0000-00-00 00:00:00","morning","08:00:00","16:00:00"),(2,"0000-00-00 00:00:00","0000-00-00 00:00:00","evening","16:00:00","00:00:00"),(3,"0000-00-00 00:00:00","0000-00-00 00:00:00","night","00:00:00","08:00:00");
/*!40000 ALTER TABLE "shifts" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "task_assignments"
--

DROP TABLE IF EXISTS "task_assignments";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "task_assignments" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "start_time" time DEFAULT NULL,
  "stop_time" time DEFAULT NULL,
  "status" varchar(255) DEFAULT NULL,
  "task_id" int(11) DEFAULT NULL,
  "user_id" int(11) DEFAULT NULL,
  "room_id" int(11) DEFAULT NULL,
  "date" date DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "task_assignments"
--

LOCK TABLES "task_assignments" WRITE;
/*!40000 ALTER TABLE "task_assignments" DISABLE KEYS */;
INSERT INTO "task_assignments" VALUES (1,"2016-08-18 13:10:58","2016-08-18 13:11:56","13:11:49","13:11:56","done",1,26,101,"2016-08-18"),(2,"2016-08-18 13:10:58","2016-08-18 13:12:10","13:12:07","13:12:10","done",1,26,102,"2016-08-18"),(3,"2016-08-18 13:10:58","2016-08-18 13:12:13","13:12:12","13:12:13","done",1,26,103,"2016-08-18"),(4,"2016-08-18 13:11:23","2016-08-18 13:11:23",NULL,NULL,"assigned",1,28,104,NULL),(7,"2016-08-18 13:13:08","2016-08-18 13:13:54","13:13:51","13:13:54","done",1,26,101,"2016-08-18"),(8,"2016-08-18 13:13:09","2016-08-22 08:25:15","08:25:10","08:25:15","done",1,26,102,"2016-08-22"),(9,"2016-08-18 13:13:12","2016-08-18 13:13:33","13:13:30","13:13:33","done",1,28,103,"2016-08-18"),(12,"2016-08-19 05:07:31","2016-08-22 09:05:37","09:00:48","09:05:37","done",1,31,108,"2016-08-22"),(13,"2016-08-19 05:07:31","2016-08-22 09:15:52","09:15:48","09:15:52","done",1,31,109,"2016-08-22"),(17,"2016-08-19 05:07:50","2016-08-22 09:38:29","09:38:27","09:38:29","done",1,32,113,"2016-08-22"),(18,"2016-08-19 05:07:50","2016-08-22 09:40:32","09:40:30","09:40:32","done",1,32,114,"2016-08-22"),(19,"2016-08-19 05:07:56","2016-08-19 09:53:30","09:53:22","09:53:30","done",1,33,115,"2016-08-19"),(21,"2016-08-19 09:46:49","2016-08-22 09:23:48","09:21:54","09:23:48","done",1,33,111,"2016-08-22"),(22,"2016-08-19 09:46:49","2016-08-22 09:20:55","09:20:50","09:20:55","done",1,33,112,"2016-08-22"),(23,"2016-08-19 10:56:58","2016-08-22 09:41:51","09:41:49","09:41:51","done",1,34,107,"2016-08-22"),(25,"2016-08-19 11:31:18","2016-08-22 09:41:29","09:41:27","09:41:29","done",1,34,105,"2016-08-22"),(26,"2016-08-22 09:26:22","2016-08-22 09:26:39","09:26:37","09:26:39","done",1,32,102,"2016-08-22"),(27,"2016-08-22 09:26:22","2016-08-22 09:30:20","09:29:15","09:30:20","done",1,32,106,"2016-08-22"),(28,"2016-08-22 09:26:22","2016-08-22 09:36:31","09:36:26","09:36:31","done",1,32,108,"2016-08-22"),(29,"2016-08-22 09:43:16","2016-08-22 09:44:20","09:44:18","09:44:20","done",1,27,101,"2016-08-22"),(30,"2016-08-22 09:43:16","2016-08-22 09:52:38","09:52:36","09:52:38","done",1,27,102,"2016-08-22"),(31,"2016-08-22 09:43:21","2016-08-22 09:43:21",NULL,NULL,"assigned",1,31,103,NULL),(32,"2016-08-22 09:43:21","2016-08-22 09:43:21",NULL,NULL,"assigned",1,31,105,NULL),(34,"2016-08-22 09:43:26","2016-08-22 09:43:26",NULL,NULL,"assigned",1,32,107,NULL),(35,"2016-08-22 09:43:31","2016-08-23 12:21:14","04:49:09","12:21:14","done",1,33,108,"2016-08-23"),(36,"2016-08-22 09:43:31","2016-08-22 09:43:31",NULL,NULL,"assigned",1,33,109,NULL),(38,"2016-08-23 04:47:31","2016-08-23 04:47:31",NULL,NULL,"assigned",1,27,111,NULL),(39,"2016-08-23 04:47:31","2016-08-23 04:47:31",NULL,NULL,"assigned",1,27,112,NULL),(40,"2016-08-23 11:17:30","2016-08-23 11:17:30",NULL,NULL,"assigned",1,36,161,NULL),(41,"2016-08-23 11:17:31","2016-08-23 11:17:31",NULL,NULL,"assigned",1,36,162,NULL),(42,"2016-08-23 11:17:31","2016-08-23 11:17:31",NULL,NULL,"assigned",1,36,163,NULL),(44,"2016-08-23 11:17:40","2016-08-23 11:17:40",NULL,NULL,"assigned",1,38,165,NULL),(45,"2016-08-23 11:17:40","2016-08-23 11:17:40",NULL,NULL,"assigned",1,38,166,NULL),(47,"2016-08-23 11:19:32","2016-08-23 11:19:32",NULL,NULL,"assigned",1,38,164,NULL),(51,"2016-08-23 12:17:54","2016-08-23 12:17:54",NULL,NULL,"assigned",1,28,113,NULL),(53,"2016-08-23 12:17:58","2016-08-23 12:17:58",NULL,NULL,"assigned",1,34,115,NULL),(54,"2016-08-23 12:17:58","2016-08-23 12:17:58",NULL,NULL,"assigned",1,34,116,NULL),(55,"2016-08-23 12:33:06","2016-08-23 12:33:06",NULL,NULL,"assigned",1,26,106,NULL),(56,"2016-08-23 12:33:06","2016-08-23 12:33:06",NULL,NULL,"assigned",1,26,110,NULL);
/*!40000 ALTER TABLE "task_assignments" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "tasks"
--

DROP TABLE IF EXISTS "tasks";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "tasks" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "time" time DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "tasks"
--

LOCK TABLES "tasks" WRITE;
/*!40000 ALTER TABLE "tasks" DISABLE KEYS */;
INSERT INTO "tasks" VALUES (1,"0000-00-00 00:00:00","0000-00-00 00:00:00","cleaning","01:00:00");
/*!40000 ALTER TABLE "tasks" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "users"
--

DROP TABLE IF EXISTS "users";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "users" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "password" varchar(255) DEFAULT NULL,
  "email" varchar(255) DEFAULT NULL,
  "phone_no" varchar(255) DEFAULT NULL,
  "is_active" tinyint(4) DEFAULT NULL,
  "shift_id" int(11) DEFAULT NULL,
  "hotel_id" int(11) DEFAULT NULL,
  "role_id" int(11) DEFAULT NULL,
  "image_id" varchar(255) DEFAULT NULL,
  "integer" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "users"
--

LOCK TABLES "users" WRITE;
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" VALUES (15,"0000-00-00 00:00:00","0000-00-00 00:00:00","Admin","827ccb0eea8a706c4c34a16891f84e7b","dheeraj@qburst.com",NULL,1,NULL,NULL,6,NULL,NULL),(19,"2016-08-18 10:42:44","2016-08-22 08:45:40","staff_hotel_1","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","3991",1,2,7,7,"8",NULL),(20,"2016-08-18 11:09:35","2016-08-23 06:55:11","maid_www_1","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","648",1,2,9,8,"9",NULL),(21,"2016-08-18 11:24:40","2016-08-18 13:24:04","maid_royal_1","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","6268578",1,2,8,8,"10",NULL),(22,"2016-08-18 11:31:28","2016-08-23 09:58:52","staff_royal_1","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","813185",1,2,8,7,"11",NULL),(25,"2016-08-18 13:04:29","2016-08-23 08:29:31","maid_hotel_1","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","3684846",1,3,7,8,"12",NULL),(26,"2016-08-18 13:05:02","2016-08-23 07:23:05","maid_hotel_2","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","664",1,2,7,8,"13",NULL),(27,"2016-08-18 13:05:38","2016-08-23 07:23:09","maid_hotel_3","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","89948",1,1,7,8,"14",NULL),(28,"2016-08-18 13:06:12","2016-08-23 05:24:19","maid_hotel_4","827ccb0eea8a706c4c34a16891f84e7b","nxf@kbkub.com","543152",1,2,7,8,"15",NULL),(30,"2016-08-18 13:25:30","2016-08-23 06:43:28","staff_www_1","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","263848",1,2,9,7,"16",NULL),(31,"2016-08-19 04:58:43","2016-08-19 04:58:44","maid_hotel_5","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","1651",1,1,7,8,"17",NULL),(32,"2016-08-19 04:59:12","2016-08-19 04:59:13","maid_hotel_6","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","68884",1,1,7,8,"18",NULL),(33,"2016-08-19 05:00:17","2016-08-23 04:58:31","maid_hotel_7","827ccb0eea8a706c4c34a16891f84e7b","dk1563@gmail.com","13156",1,1,7,8,"19",NULL),(34,"2016-08-19 05:04:21","2016-08-23 07:22:50","maid_hotel_8","827ccb0eea8a706c4c34a16891f84e7b","cwce@cqace","3818681",1,2,7,8,"20",NULL),(35,"2016-08-19 05:15:29","2016-08-19 05:15:30","staff_paris_1","827ccb0eea8a706c4c34a16891f84e7b","vjk@vnn","96188",1,2,10,7,"22",NULL),(36,"2016-08-19 05:17:15","2016-08-19 05:17:16","maid_paris_1","827ccb0eea8a706c4c34a16891f84e7b","vjkn@vouiuim","41234",1,1,10,8,"23",NULL),(37,"2016-08-23 05:31:24","2016-08-23 05:31:25","maid_royal_2","827ccb0eea8a706c4c34a16891f84e7b","jtvccvt@hch","26316",1,1,8,8,"24",NULL),(38,"2016-08-23 06:06:10","2016-08-23 06:48:26","maid_paris_2","827ccb0eea8a706c4c34a16891f84e7b","femnlk@mikvlo","96488",1,1,10,8,"25",NULL),(39,"2016-08-23 06:11:52","2016-08-23 06:50:43","maid_www_2","827ccb0eea8a706c4c34a16891f84e7b","bkenb@vunfinv","68416",1,1,9,8,"26",NULL),(40,"2016-08-23 08:37:58","2016-08-23 08:42:38","maid_www_3","827ccb0eea8a706c4c34a16891f84e7b","vwbnuj@cev","4684",1,2,9,8,"27",NULL),(41,"2016-08-23 11:20:29","2016-08-23 11:20:29","maid_paris_3","827ccb0eea8a706c4c34a16891f84e7b","cfwb@vsvvr","6884",1,2,10,8,"29",NULL),(42,"2016-08-23 11:21:05","2016-08-23 11:21:06","maid_paris_4","827ccb0eea8a706c4c34a16891f84e7b","vfdv@dfevb","46656",1,1,10,8,"30",NULL),(43,"2016-08-23 11:21:42","2016-08-23 11:21:43","maid_paris_5","d68229f521316a03b517e42128c87060","rfvew@vedv","351",1,1,10,8,"31",NULL),(44,"2016-08-23 11:22:41","2016-08-23 11:22:41","maid_paris_6","827ccb0eea8a706c4c34a16891f84e7b","rvrwe@vwsr","5156",1,1,10,8,"32",NULL),(45,"2016-08-23 11:47:45","2016-08-23 11:47:45","maid_paris_7","827ccb0eea8a706c4c34a16891f84e7b","fdcu@dfhbk","1686",1,2,10,8,"33",NULL),(46,"2016-08-23 11:48:43","2016-08-23 11:48:43","maid_paris_8","827ccb0eea8a706c4c34a16891f84e7b","cjvb@cbui","36486",1,2,10,8,"34",NULL);
/*!40000 ALTER TABLE "users" ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-24 10:55:21
