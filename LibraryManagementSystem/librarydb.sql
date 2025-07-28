-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(20) DEFAULT 'staff',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin123','admin'),('staff','staff123','staff');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `available` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Alchemist','Paulo Coelho',8,8),(2,'Pride and Prejudice','Jane Austen',17,15),(3,'Moby-Dick','Herman Melville',13,12),(4,'The Great Gatsby','F. Scott Fitzgerald',12,11),(5,'Pride and Prejudice','Jane Austen',8,8),(6,'1984','George Orwell',12,12),(7,'Animal Farm','George Orwell',20,20),(8,'Gone Girl','Gillian Flynn',8,8),(9,'To Kill a Mockingbird','Harper Lee',3,3),(10,'The Fault in Our Stars','John Green',16,15),(11,'The Girl on the Train','Paula Hawkins',9,8),(12,'The Alchemist','Paulo Coelho',10,9),(13,'The Great Gatsby','F. Scott Fitzgerald',4,4),(14,'Moby-Dick','Herman Melville',17,17),(15,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',3,2),(16,'The Fault in Our Stars','John Green',12,12),(17,'Pride and Prejudice','Jane Austen',1,0),(18,'Pride and Prejudice','Jane Austen',7,5),(19,'The Hobbit','J.R.R. Tolkien',15,15),(20,'The Hobbit','J.R.R. Tolkien',12,12),(21,'Moby-Dick','Herman Melville',6,6),(22,'Animal Farm','George Orwell',9,9),(23,'The Lord of the Rings','J.R.R. Tolkien',6,5),(24,'The Fault in Our Stars','John Green',16,16),(25,'The Da Vinci Code','Dan Brown',20,20),(26,'Gone Girl','Gillian Flynn',18,18),(27,'Moby-Dick','Herman Melville',16,16),(28,'The Da Vinci Code','Dan Brown',14,13),(29,'Pride and Prejudice','Jane Austen',13,13),(30,'Gone Girl','Gillian Flynn',9,9),(31,'The Da Vinci Code','Dan Brown',18,18),(32,'The Catcher in the Rye','J.D. Salinger',12,11),(33,'Jane Eyre','Charlotte BrontÃ«',14,14),(34,'To Kill a Mockingbird','Harper Lee',8,7),(35,'The Shining','Stephen King',16,16),(36,'The Alchemist','Paulo Coelho',1,0),(37,'1984','George Orwell',5,5),(38,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',13,13),(39,'Jane Eyre','Charlotte BrontÃ«',11,10),(40,'Moby-Dick','Herman Melville',13,11),(41,'Pride and Prejudice','Jane Austen',18,18),(42,'The Alchemist','Paulo Coelho',9,9),(43,'The Hobbit','J.R.R. Tolkien',10,10),(44,'The Catcher in the Rye','J.D. Salinger',10,9),(45,'1984','George Orwell',15,15),(46,'The Hunger Games','Suzanne Collins',12,11),(47,'The Alchemist','Paulo Coelho',3,2),(48,'Animal Farm','George Orwell',19,18),(49,'The Great Gatsby','F. Scott Fitzgerald',5,5),(50,'The Hobbit','J.R.R. Tolkien',16,16),(51,'Jane Eyre','Charlotte BrontÃ«',12,12),(52,'1984','George Orwell',2,2),(53,'1984','George Orwell',15,15),(54,'The Girl on the Train','Paula Hawkins',10,10),(55,'The Da Vinci Code','Dan Brown',17,17),(56,'To Kill a Mockingbird','Harper Lee',19,19),(57,'To Kill a Mockingbird','Harper Lee',2,1),(58,'The Hunger Games','Suzanne Collins',17,17),(59,'The Kite Runner','Khaled Hosseini',20,20),(60,'Brave New World','Aldous Huxley',7,6),(61,'Brave New World','Aldous Huxley',10,9),(62,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',12,12),(63,'Animal Farm','George Orwell',18,16),(64,'The Da Vinci Code','Dan Brown',8,8),(65,'Animal Farm','George Orwell',16,16),(66,'Jane Eyre','Charlotte BrontÃ«',18,17),(67,'Pride and Prejudice','Jane Austen',15,14),(68,'The Alchemist','Paulo Coelho',16,16),(69,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',1,0),(70,'Animal Farm','George Orwell',7,7),(71,'Moby-Dick','Herman Melville',20,19),(72,'The Kite Runner','Khaled Hosseini',11,9),(73,'1984','George Orwell',11,11),(74,'The Lord of the Rings','J.R.R. Tolkien',4,3),(75,'The Girl on the Train','Paula Hawkins',17,17),(76,'Animal Farm','George Orwell',2,2),(77,'The Alchemist','Paulo Coelho',3,3),(78,'The Alchemist','Paulo Coelho',13,13),(79,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',20,19),(80,'The Fault in Our Stars','John Green',11,11),(81,'The Shining','Stephen King',12,10),(82,'The Kite Runner','Khaled Hosseini',3,2),(83,'The Shining','Stephen King',2,2),(84,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',13,13),(85,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',15,14),(86,'The Shining','Stephen King',12,12),(87,'The Girl on the Train','Paula Hawkins',4,4),(88,'To Kill a Mockingbird','Harper Lee',20,20),(89,'1984','George Orwell',4,4),(90,'The Shining','Stephen King',5,4),(91,'Moby-Dick','Herman Melville',8,8),(92,'The Girl on the Train','Paula Hawkins',9,9),(93,'1984','George Orwell',13,13),(94,'The Fault in Our Stars','John Green',13,13),(95,'The Kite Runner','Khaled Hosseini',8,8),(96,'The Catcher in the Rye','J.D. Salinger',13,12),(97,'The Girl on the Train','Paula Hawkins',4,4),(98,'The Alchemist','Paulo Coelho',19,18),(99,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',15,15),(100,'The Da Vinci Code','Dan Brown',1,1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Jose Small','kelly61@green-conner.com','1316481936'),(2,'Nathan Miller','tiffanymcdaniel@hotmail.com','3075465824'),(3,'George Fletcher','thompsonjoshua@yahoo.com','2178431035'),(4,'David Smith','cisneroslori@hotmail.com','0850729273'),(5,'John Rodriguez','ihuff@olson.org','2683985872'),(6,'Justin Anderson','pconner@gmail.com','5758686342'),(7,'Charles Wade','mtran@mays.org','2172273510'),(8,'Emily Hunter','rbrown@gmail.com','7281462350'),(9,'David Sawyer','justin37@wong-hendrix.net','8040435693'),(10,'Linda Castillo','smithchristopher@hotmail.com','8320192066'),(11,'Mariah Green','erin24@martinez.com','4191428594'),(12,'Dr. Heather Burgess','obrienjohn@aguilar.net','3033244899'),(13,'Kristi Garrett','ricardolewis@rice.com','9239459260'),(14,'Jerry White','nancy90@clark-miller.com','1921478116'),(15,'Jeffrey Hanson','michelle96@yahoo.com','1643513970'),(16,'Travis Green','ashley91@gmail.com','9993979571'),(17,'Joshua Gonzalez','fitzpatrickrichard@gmail.com','6226046288'),(18,'Traci Cooper','michelleklein@andrade.info','4108244562'),(19,'Cheryl Mason','jamesbailey@holmes-wright.info','3552560616'),(20,'Brian Lewis','yrobinson@young.com','0779125553'),(21,'Lauren Patterson','jimenezrachael@wilcox-oneill.info','2509504775'),(22,'Joseph Little','knightrichard@hotmail.com','8900413169'),(23,'Alicia Shelton','troy72@williams.com','9584081083'),(24,'Benjamin Cooper','smithrobert@navarro-harris.net','1711452816'),(25,'Jessica Mitchell','elizabethmoore@hotmail.com','4686385593'),(26,'Melissa Arnold','upierce@price-figueroa.biz','3478212549'),(27,'Jennifer Herman','lambmarie@campbell.com','0583170580'),(28,'Deanna Anderson','brendawebster@jarvis-smith.biz','9282282235'),(29,'Ashley King','timothymerritt@robertson-thomas.net','6754167972'),(30,'Nicole Huang','tmartinez@hotmail.com','1235198337'),(31,'Christopher Francis','jwhitaker@mason.com','9043717648'),(32,'Julia Silva','claudiahill@armstrong-newton.com','9504768699'),(33,'Benjamin Santiago','nparrish@york.info','3947549405'),(34,'John Howard','hsullivan@gmail.com','7446777823'),(35,'Erika Jacobs','carolware@bradley.com','7179918908'),(36,'Amy Hill','lawrence15@johnson.org','9111288831'),(37,'Cynthia Graves DDS','regina59@gmail.com','4594573956'),(38,'Peter Rodgers','ashleyfoster@hotmail.com','4256830194'),(39,'Angela Mercer','jimenezsherry@hotmail.com','9297997032'),(40,'Kirsten Jones','melissa46@mason-cooper.org','6918571649'),(41,'Mrs. Jacqueline Gamble','hsmith@gmail.com','6353422358'),(42,'Mrs. Kathleen Gonzalez','orobbins@gmail.com','7706518854'),(43,'Ryan Sanchez','tammyjohnson@johnson.com','2693482664'),(44,'Amanda Williams','bradshawthomas@yahoo.com','2803912888'),(45,'Latasha Mason MD','markpetty@larson-burton.com','8942117773'),(46,'Andrew Briggs','longheather@reynolds-davis.com','0920205467'),(47,'Patrick Wyatt','jamesharris@gmail.com','1375463599'),(48,'Karen Rosario','jamie33@gmail.com','8161934484'),(49,'Haley Jones','kimcastillo@gmail.com','6722717327'),(50,'Ashley Hudson','jason24@hotmail.com','6073371075'),(51,'Jordan Doyle','nellis@henderson.com','1944000266'),(52,'David Ray','zpayne@hotmail.com','8301167726'),(53,'Daniel Wilson','douglasgeorge@yahoo.com','6134933146'),(54,'Thomas Elliott','nelsonzachary@ponce.info','6160637640'),(55,'Mark Dean','ddodson@morrison.org','3455854504'),(56,'Wesley Lee','millertony@hotmail.com','2103867191'),(57,'Anna Bates','ashley51@stephenson-jones.com','3990447172'),(58,'Gregg Johnson','seanrodriguez@hotmail.com','2960393470'),(59,'Donna Hamilton','qsmall@hotmail.com','8544836571'),(60,'Anna Scott','krista09@mcdowell-bass.com','5117556341'),(61,'Jason Leonard DDS','uhorne@stephenson.org','4635703161'),(62,'Denise Patterson','heather11@gmail.com','2829339858'),(63,'Paul Andrews','dyerrobert@roth-hall.info','9040807368'),(64,'Aaron Baker III','ewalter@stevens.com','2816935319'),(65,'James Odom','ikerr@gomez.com','9684007303'),(66,'Derek Evans','sandersanna@hotmail.com','5885091642'),(67,'John Mcdonald','brandon00@conway.biz','2160325682'),(68,'Elizabeth Moon','tammy04@hotmail.com','7009406997'),(69,'Mark Hall','nicole08@short-roach.com','0533213819'),(70,'Scott Lee','michelle13@russell.com','4937541114'),(71,'Robert Miller','william77@gmail.com','3266975202'),(72,'Alison Harrison','websterjamie@buckley.com','5245953736'),(73,'Sylvia Caldwell','jasonsummers@hotmail.com','8472606113'),(74,'Johnathan Lucas','usloan@flowers.com','0469946878'),(75,'Jessica James','garzasusan@gmail.com','8131797493'),(76,'Anthony Evans','carolyn46@smith.com','3670800485'),(77,'Gregg Ross','blake15@lynch.com','4845481795'),(78,'James Schultz','sara62@payne.org','7117882898'),(79,'Connie Hayes','cstanton@nichols-west.com','4471863638'),(80,'Robert Simpson','smithkelly@yahoo.com','9180156408'),(81,'Mackenzie Keith','stephanie40@ellis.com','1276760104'),(82,'Cameron Fisher','shanerogers@phillips.com','4110972510'),(83,'Lauren Adams','kjackson@yahoo.com','7151720969'),(84,'Robert Collins','cowens@hotmail.com','7253791746'),(85,'Rebecca Johnson','zhenderson@perez.com','1360565568'),(86,'Ryan Caldwell','gentryian@johnson-taylor.com','7007065067'),(87,'Lauren Green','sarah66@rodriguez-smith.com','8336469484'),(88,'Stephanie Foster','james39@gmail.com','8229334125'),(89,'Renee Fox','chelseymurray@gmail.com','0050642688'),(90,'Heather Holder','robinday@gmail.com','0513097851'),(91,'Sydney Greer','elizabeth87@alvarado.com','3641729269'),(92,'Jacqueline Gonzalez','deannaellis@yahoo.com','4463545144'),(93,'Tracy Watkins','taylortimothy@velasquez-parks.info','8878794842'),(94,'Chad Le','alan48@lane.biz','2863890037'),(95,'Nicole Davis','grobinson@velasquez.net','3288828172'),(96,'Adam Marks','morrisheather@miller-daniel.com','1433887299'),(97,'Victoria Brooks','hintonchristine@gmail.com','4468299198'),(98,'Renee Williams','therrera@gmail.com','2267846899'),(99,'Katie Jenkins','prodriguez@hotmail.com','3432215177'),(100,'Joshua Cooper','hgordon@hotmail.com','1684767566');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'issued',
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,19,62,'2025-06-10','2025-06-17','Returned'),(2,90,5,'2025-07-24','2025-07-27','returned'),(3,4,9,'2025-06-02',NULL,'Issued'),(4,72,17,'2025-06-06',NULL,'Issued'),(5,98,92,'2025-07-17',NULL,'Issued'),(6,8,98,'2025-05-27','2025-06-03','Returned'),(7,2,6,'2025-07-17',NULL,'Issued'),(8,63,17,'2025-07-20',NULL,'Issued'),(9,39,90,'2025-06-17','2025-06-30','Returned'),(10,31,78,'2025-06-11','2025-06-14','Returned'),(11,40,8,'2025-06-26',NULL,'Issued'),(12,46,96,'2025-07-14',NULL,'Issued'),(13,34,63,'2025-06-14','2025-06-24','Returned'),(14,12,74,'2025-07-20',NULL,'Issued'),(15,38,91,'2025-06-26','2025-07-28','returned'),(16,11,92,'2025-06-21',NULL,'Issued'),(17,36,42,'2025-06-16',NULL,'Issued'),(18,36,94,'2025-07-06',NULL,'Issued'),(19,65,95,'2025-06-22','2025-07-14','Returned'),(20,94,40,'2025-06-02','2025-06-20','Returned'),(21,85,75,'2025-07-14',NULL,'Issued'),(22,4,8,'2025-07-16','2025-07-28','Returned'),(23,52,31,'2025-06-12','2025-06-14','Returned'),(24,95,34,'2025-06-11','2025-06-15','Returned'),(25,42,75,'2025-06-10','2025-06-19','Returned'),(26,89,90,'2025-07-23','2025-07-27','returned'),(27,20,45,'2025-05-29','2025-05-30','Returned'),(28,69,89,'2025-07-01',NULL,'Issued'),(29,23,11,'2025-06-15',NULL,'Issued'),(30,81,48,'2025-07-02',NULL,'Issued'),(31,15,23,'2025-07-12',NULL,'Issued'),(32,28,42,'2025-05-30',NULL,'Issued'),(33,67,14,'2025-07-09',NULL,'Issued'),(34,3,95,'2025-06-09',NULL,'Issued'),(35,74,25,'2025-06-12','2025-06-20','Returned'),(36,50,27,'2025-06-28','2025-07-25','Returned'),(37,61,38,'2025-07-03',NULL,'Issued'),(38,35,70,'2025-05-27','2025-06-19','Returned'),(39,90,56,'2025-05-29',NULL,'Issued'),(40,23,87,'2025-06-12','2025-07-04','Returned'),(41,98,35,'2025-07-03','2025-07-10','Returned'),(42,36,89,'2025-06-24',NULL,'Issued'),(43,64,57,'2025-07-05','2025-07-30','Returned'),(44,63,1,'2025-06-27',NULL,'Issued'),(45,79,11,'2025-06-14',NULL,'Issued'),(46,33,66,'2025-06-20','2025-06-29','Returned'),(47,3,33,'2025-06-15','2025-06-29','Returned'),(48,66,21,'2025-07-22',NULL,'Issued'),(49,44,20,'2025-06-21',NULL,'Issued'),(50,82,65,'2025-06-14',NULL,'Issued'),(51,96,65,'2025-06-01',NULL,'Issued'),(52,12,25,'2025-06-21','2025-07-05','Returned'),(53,18,57,'2025-06-11',NULL,'Issued'),(54,2,53,'2025-07-10',NULL,'Issued'),(55,41,54,'2025-07-23','2025-08-04','Returned'),(56,53,59,'2025-07-06','2025-07-26','Returned'),(57,52,80,'2025-07-03','2025-07-27','returned'),(58,72,25,'2025-06-26',NULL,'Issued'),(59,32,85,'2025-06-24',NULL,'Issued'),(60,74,31,'2025-06-20',NULL,'Issued'),(61,71,87,'2025-07-20',NULL,'Issued'),(62,8,68,'2025-07-03','2025-07-15','Returned'),(63,44,80,'2025-06-10','2025-07-08','Returned'),(64,38,23,'2025-06-15','2025-07-04','Returned'),(65,16,24,'2025-06-20','2025-07-17','Returned'),(66,69,50,'2025-06-12','2025-06-19','Returned'),(67,39,71,'2025-05-29',NULL,'Issued'),(68,13,92,'2025-07-03','2025-08-02','Returned'),(69,10,39,'2025-06-20',NULL,'Issued'),(70,17,7,'2025-07-01',NULL,'Issued'),(71,69,36,'2025-07-21',NULL,'Issued'),(72,32,73,'2025-06-09','2025-07-03','Returned'),(73,97,34,'2025-07-03','2025-07-07','Returned'),(74,60,5,'2025-06-29',NULL,'Issued'),(75,65,98,'2025-06-06','2025-06-22','Returned'),(76,70,89,'2025-07-01','2025-07-09','Returned'),(77,33,87,'2025-06-14','2025-06-17','Returned'),(78,81,92,'2025-06-16',NULL,'Issued'),(79,28,88,'2025-06-20','2025-06-30','Returned'),(80,73,81,'2025-07-05','2025-07-27','returned'),(81,27,94,'2025-06-03','2025-06-17','Returned'),(82,91,67,'2025-06-07','2025-06-08','Returned'),(83,40,13,'2025-06-20',NULL,'Issued'),(84,42,29,'2025-06-30','2025-07-18','Returned'),(85,48,13,'2025-07-21',NULL,'Issued'),(86,77,73,'2025-06-25','2025-07-24','Returned'),(87,74,43,'2025-05-27','2025-05-31','Returned'),(88,58,37,'2025-07-11','2025-08-08','Returned'),(89,34,3,'2025-06-04',NULL,'Issued'),(90,63,58,'2025-06-22','2025-07-04','Returned'),(91,31,73,'2025-06-23','2025-07-06','Returned'),(92,12,49,'2025-07-01','2025-07-02','Returned'),(93,38,1,'2025-05-30','2025-06-16','Returned'),(94,47,71,'2025-06-03',NULL,'Issued'),(95,99,39,'2025-07-06','2025-07-09','Returned'),(96,57,44,'2025-07-04',NULL,'Issued'),(97,36,51,'2025-07-10',NULL,'Issued'),(98,24,91,'2025-05-30','2025-06-23','Returned'),(99,18,52,'2025-07-23',NULL,'Issued'),(100,10,49,'2025-06-30','2025-07-01','Returned'),(101,1,1,'2025-07-28','2025-07-28','returned');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28 15:27:00
