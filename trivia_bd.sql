CREATE DATABASE  IF NOT EXISTS `trivia_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trivia_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: trivia_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `text` text,
  `is_correct` tinyint DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `answer_id_UNIQUE` (`answer_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='all answers, correct and incorrect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (456,1,'Apollo 11',0),(457,1,'Sputnik 1',1),(458,1,'Voyager 1',0),(459,1,'Hubble Space Telescope',0),(460,2,'Venus',0),(461,2,'Mars',1),(462,2,'Jupiter',0),(463,2,'Saturn',0),(464,3,'Earth',0),(465,3,'Saturn',0),(466,3,'Jupiter',1),(467,3,'Neptune',0),(468,4,'Buzz Aldrin',0),(469,4,'John Glenn',0),(470,4,'Neil Armstrong',1),(471,4,'Alan Shepard',0),(472,5,'Sirius',0),(473,5,'Proxima Centauri',1),(474,5,'Alpha Centauri A',0),(475,5,'Betelgeuse',0),(476,6,'Voyager 1',1),(477,6,'Pioneer 10',0),(478,6,'New Horizons',0),(479,6,'Hubble',0),(480,7,'Mercury',0),(481,7,'Venus',1),(482,7,'Mars',0),(483,7,'Earth',0),(484,8,'53',0),(485,8,'79',1),(486,8,'67',0),(487,8,'92',0),(488,9,'Ganymede',0),(489,9,'Titan',1),(490,9,'Callisto',0),(491,9,'Io',0),(492,10,'Andromeda Galaxy',1),(493,10,'Triangulum Galaxy',0),(494,10,'Whirlpool Galaxy',0),(495,10,'Sombrero Galaxy',0),(496,11,'Spirit',0),(497,11,'Perseverance',1),(498,11,'Opportunity',0),(499,11,'Curiosity',0),(500,12,'Helium',0),(501,12,'Hydrogen',1),(502,12,'Oxygen',0),(503,12,'Nitrogen',0),(504,13,'Jupiter',0),(505,13,'Saturn',1),(506,13,'Uranus',0),(507,13,'Neptune',0),(508,14,'Apollo 11 Lunar Module',0),(509,14,'Luna 2',1),(510,14,'Surveyor 1',0),(511,14,'Hubble Telescope',0),(512,15,'Kepler Space Telescope',0),(513,15,'James Webb Space Telescope',0),(514,15,'Hubble Space Telescope',1),(515,15,'Spitzer Space Telescope',0),(516,16,'Venus',1),(517,16,'Jupiter',0),(518,16,'Mars',0),(519,16,'Neptune',0),(520,17,'Mount Everest',0),(521,17,'Olympus Mons',1),(522,17,'Mount Fuji',0),(523,17,'Vesuvius',0),(524,18,'Venus',1),(525,18,'Mars',0),(526,18,'Mercury',0),(527,18,'Neptune',0),(528,19,'Neil Armstrong',0),(529,19,'Yuri Gagarin',1),(530,19,'Alan Shepard',0),(531,19,'John Glenn',0),(532,20,'Rosetta',1),(533,20,'Venera 7',0),(534,20,'Opportunity',0),(535,20,'Curiosity',0),(536,21,'Earth',0),(537,21,'Mercury',1),(538,21,'Venus',0),(539,21,'Mars',0),(540,22,'Sally Ride',0),(541,22,'Valentina Tereshkova',1),(542,22,'Mae Jemison',0),(543,22,'Peggy Whitson',0),(544,23,'Alpha Centauri A',0),(545,23,'Betelgeuse',0),(546,23,'VY Canis Majoris',1),(547,23,'Sirius A',0),(548,24,'Earth',0),(549,24,'Mars',0),(550,24,'Jupiter',1),(551,24,'All of the above',0),(552,25,'Laika the Dog',1),(553,25,'Ham the Chimpanzee',0),(554,25,'Sally the Cat',0),(555,25,'Albert the Mouse',0),(556,26,'Neptune',0),(557,26,'Mars',0),(558,26,'Saturn',0),(559,26,'Jupiter',1),(560,27,'Venusian Cycle',0),(561,27,'Solar Day',0),(562,27,'Sidereal Day',0),(563,27,'Venusian Day',1),(564,28,'Apollo 13',0),(565,28,'Apollo 11',1),(566,28,'Gemini 6',0),(567,28,'Apollo 15',0),(568,29,'Uranus',1),(569,29,'Saturn',0),(570,29,'Neptune',0),(571,29,'Mars',0),(572,30,'Voyager 1',0),(573,30,'Hubble Space Telescope',0),(574,30,'New Horizons',1),(575,30,'Pioneer 10',0),(576,31,'Neptune',1),(577,31,'Saturn',0),(578,31,'Uranus',0),(579,31,'Pluto',0),(580,32,'Mars Spot',0),(581,32,'The Great Red Spot',1),(582,32,'Jupiter\'s Eye',0),(583,32,'The Red Moon',0),(584,33,'100',0),(585,33,'1000',0),(586,33,'1300',1),(587,33,'5000',0),(588,34,'Andromeda',0),(589,34,'Milky Way',1),(590,34,'Whirlpool',0),(591,34,'Triangulum',0),(592,35,'1 minute',0),(593,35,'8 minutes',1),(594,35,'10 minutes',0),(595,35,'20 minutes',0),(596,36,'Spirit',0),(597,36,'Curiosity',1),(598,36,'Opportunity',0),(599,36,'Perseverance',0),(600,37,'Voyager 1',0),(601,37,'New Horizons',0),(602,37,'The Speed of Light',1),(603,37,'The Sun',0),(604,38,'Mercury',1),(605,38,'Venus',0),(606,38,'Uranus',0),(607,38,'Mars',0),(608,39,'Volcanic activity',0),(609,39,'It has no atmosphere to burn up meteors',1),(610,39,'The Moon\'s gravity pulls them in',0),(611,39,'Alien activity',0),(612,40,'Red',0),(613,40,'Yellow',0),(614,40,'White',1),(615,40,'Blue',0),(616,41,'Venus',1),(617,41,'Mars',0),(618,41,'Mercury',0),(619,41,'Neptune',0),(620,42,'The Grand Canyon',1),(621,42,'The Eiffel Tower',0),(622,42,'The Great Barrier Reef',0),(623,42,'The Moai Statues',0),(624,43,'Blue Origin',0),(625,43,'SpaceX',1),(626,43,'Virgin Galactic',0),(627,43,'Boeing',0),(628,44,'NASA',1),(629,44,'ESA',0),(630,44,'Roscosmos',0),(631,44,'ISRO',0),(632,45,'Galaxy',0),(633,45,'Cluster',1),(634,45,'Nebula',0),(635,45,'Star System',0),(636,46,'Neptune',0),(637,46,'Uranus',0),(638,46,'Saturn',0),(639,46,'Pluto',1),(640,47,'Scintillation',1),(641,47,'Refraction',0),(642,47,'Distortion',0),(643,47,'Flickering',0),(644,48,'Solar Eclipse',1),(645,48,'Lunar Eclipse',0),(646,48,'Supermoon',0),(647,48,'Blue Moon',0),(648,49,'2',0),(649,49,'4',1),(650,49,'3',0),(651,49,'5',0),(652,50,'Voyager 2',0),(653,50,'Mars Exploration Rover',0),(654,50,'Perseverance Rover',1),(655,50,'James Webb Space Telescope',0),(656,51,'Pluto',1),(657,51,'Mars',0),(658,51,'Neptune',0),(659,51,'Venus',0),(660,52,'Goofy',0),(661,52,'Pluto',1),(662,52,'Mickey',0),(663,52,'Donald',0),(664,53,'A constellation',1),(665,53,'A comet',0),(666,53,'A planet',0),(667,53,'A black hole',0),(668,54,'Europa',0),(669,54,'Titan',1),(670,54,'Ganymede',0),(671,54,'Io',0),(672,55,'Venus',0),(673,55,'Mars',0),(674,55,'Mercury',1),(675,55,'Earth',0),(676,56,'Square',0),(677,56,'Triangular',0),(678,56,'Flat',0),(679,56,'Spherical',1),(680,57,'Saturn',0),(681,57,'Jupiter',1),(682,57,'Mars',0),(683,57,'Earth',0),(684,58,'Uranus',0),(685,58,'Mars',0),(686,58,'Neptune',0),(687,58,'Saturn',1),(688,59,'An asteroid',0),(689,59,'A satellite',1),(690,59,'A comet',0),(691,59,'A nebula',0),(692,60,'Venus',1),(693,60,'Earth',0),(694,60,'Mars',0),(695,60,'Mercury',0),(696,61,'Curiosity Rover',1),(697,61,'Opportunity Rover',0),(698,61,'Spirit Rover',0),(699,61,'Perseverance Rover',0),(700,62,'24 hours',0),(701,62,'365 days',1),(702,62,'30 days',0),(703,62,'2 years',0),(704,63,'Hubble',1),(705,63,'Kepler',0),(706,63,'Webb',0),(707,63,'Spitzer',0),(708,64,'Lunar Rover',0),(709,64,'Apollo 11',0),(710,64,'Luna 2',1),(711,64,'Sputnik',0),(712,65,'3 minutes',0),(713,65,'8 minutes',1),(714,65,'12 minutes',0),(715,65,'24 minutes',0),(716,66,'Neptune',0),(717,66,'Jupiter',1),(718,66,'Saturn',0),(719,66,'Venus',0),(720,67,'Laika the dog',1),(721,67,'Sally the cat',0),(722,67,'Timmy the hamster',0),(723,67,'Albert the monkey',0),(724,68,'1',1),(725,68,'2',0),(726,68,'3',0),(727,68,'4',0),(728,69,'A meteor',1),(729,69,'A comet',0),(730,69,'A satellite',0),(731,69,'A galaxy',0),(732,70,'Alpha Centauri',0),(733,70,'The Sun',1),(734,70,'Proxima Centauri',0),(735,70,'Sirius',0),(736,71,'Venus',0),(737,71,'Mars',1),(738,71,'Jupiter',0),(739,71,'Saturn',0),(740,72,'Sputnik 1',1),(741,72,'Apollo 1',0),(742,72,'Voyager 1',0),(743,72,'Luna 1',0),(744,73,'Mars',0),(745,73,'Earth',0),(746,73,'Saturn',1),(747,73,'Neptune',0),(748,74,'Neptune',0),(749,74,'Mars',0),(750,74,'Jupiter',1),(751,74,'Venus',0),(752,75,'Mars',1),(753,75,'Venus',0),(754,75,'Earth',0),(755,75,'Jupiter',0),(756,76,'Guardians of the Galaxy',0),(757,76,'Star Wars',1),(758,76,'Avatar',0),(759,76,'Star Trek',0),(760,77,'3',0),(761,77,'4',1),(762,77,'5',0),(763,77,'6',0),(764,78,'Ice and dust',1),(765,78,'Flames',0),(766,78,'Gases from a volcano',0),(767,78,'Stars',0),(768,79,'NASA',1),(769,79,'ESA',0),(770,79,'ISRO',0),(771,79,'Roscosmos',0),(772,80,'Earth',0),(773,80,'Jupiter',1),(774,80,'Saturn',0),(775,80,'Neptune',0),(776,81,'Neptune',1),(777,81,'Venus',0),(778,81,'Earth',0),(779,81,'Jupiter',0),(780,82,'You’d float away',0),(781,82,'You’d bounce really high',1),(782,82,'You’d just fall really slowly',0),(783,82,'You’d be instantly stuck to the ground',0),(784,83,'Earth',0),(785,83,'Venus',1),(786,83,'Mercury',0),(787,83,'Neptune',0),(788,84,'5 hours',0),(789,84,'10 hours',1),(790,84,'24 hours',0),(791,84,'48 hours',0),(792,85,'Venus',0),(793,85,'Mars',0),(794,85,'Saturn',0),(795,85,'Neptune',1),(796,86,'A giant green blob',0),(797,86,'A blue and white marble',1),(798,86,'A glowing ball of fire',0),(799,86,'A dark void',0),(800,87,'It’s full of giant potatoes',0),(801,87,'It’s made of cheese',0),(802,87,'It’s a desert with no air',1),(803,87,'It’s home to Martians',0),(804,88,'Mount Huge',0),(805,88,'Big Boomer',0),(806,88,'Olympus Mons',1),(807,88,'Mount Pancake',0),(808,89,'Sirius',0),(809,89,'Polaris',1),(810,89,'Sun',0),(811,89,'Alpha Centauri',0),(812,90,'Too much ice cream',0),(813,90,'It rains acid',1),(814,90,'Too many space pirates',0),(815,90,'No Wi-Fi',0),(816,91,'Mars',0),(817,91,'Venus',0),(818,91,'Jupiter',1),(819,91,'Uranus',0),(820,92,'Asteroid 456',0),(821,92,'Eris',1),(822,92,'Ceres',0),(823,92,'Titan',0),(824,93,'Neptune',1),(825,93,'Saturn',0),(826,93,'Pluto',0),(827,93,'Mars',0),(828,94,'They’re made of pizza',0),(829,94,'They’re made of ice and rock',1),(830,94,'They glow in the dark',0),(831,94,'They have their own music',0),(832,95,'Finding gas stations',0),(833,95,'The roads are too bumpy',0),(834,95,'There’s no atmosphere to hear the radio',1),(835,95,'You’d get lost and never find a map',0),(836,96,'A space suit',0),(837,96,'A winter coat',0),(838,96,'A pair of sunglasses',0),(839,96,'A beach towel',1),(840,97,'Mars',0),(841,97,'Earth',1),(842,97,'Venus',0),(843,97,'Neptune',0),(844,98,'Mars',0),(845,98,'Uranus',0),(846,98,'Venus',1),(847,98,'Earth',0),(848,99,'Earth',0),(849,99,'Jupiter',1),(850,99,'Saturn',0),(851,99,'Neptune',0),(852,100,'The grocery store',0),(853,100,'The center of our galaxy',1),(854,100,'The Moon',0),(855,100,'Your friend\'s house',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='info abut all the categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'space','planets, starts and other cool stuff');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `text` text,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_id_UNIQUE` (`question_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='questions associated with each category';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What is the name of the first artificial Earth satellite?',1),(2,'Which planet is known as the \"Red Planet\"?',1),(3,'What is the largest planet in our solar system?',1),(4,'Who was the first person to walk on the Moon?',1),(5,'What is the closest star to Earth?',1),(6,'What is the name of the first spacecraft to leave the solar system?',1),(7,'Which planet is the hottest in the solar system?',1),(8,'How many moons does Jupiter have?',1),(9,'What is the name of Saturn\'s largest moon?',1),(10,'Which galaxy is closest to the Milky Way?',1),(11,'What is the name of the rover that landed on Mars in 2021?',1),(12,'What is the main component of the Sun?',1),(13,'Which planet has the most moons in our solar system?',1),(14,'What is the name of the first human-made object to land on the Moon?',1),(15,'Which space telescope was launched in 1990 and has provided some of the most detailed images of distant galaxies?',1),(16,'Which planet has the longest day?',1),(17,'What is the largest volcano in the solar system?',1),(18,'Which planet is closest in size to Earth?',1),(19,'What is the name of the first human to orbit Earth?',1),(20,'Which spacecraft was the first to land on a comet?',1),(21,'Which planet has the shortest year in the solar system?',1),(22,'What is the name of the first woman in space?',1),(23,'What is the largest known star by volume?',1),(24,'Which of these planets has rings?',1),(25,'What is the name of the first animal to be sent into space?',1),(26,'Which planet is known for having a giant storm that has been raging for centuries?',1),(27,'What is the term for a day on Venus, which is longer than its year?',1),(28,'What is the name of the first manned mission to land on the Moon?',1),(29,'Which planet is tilted at an extreme angle, making it rotate on its side?',1),(30,'What is the name of the NASA space probe that visited Pluto in 2015?',1),(31,'Which of these is the most distant planet from the Sun?',1),(32,'What is the name of the giant red spot on Jupiter?',1),(33,'How many Earths could fit inside Jupiter?',1),(34,'What is the name of the galaxy in which Earth resides?',1),(35,'How long does it take for light from the Sun to reach Earth?',1),(36,'What is the name of the rover that landed on Mars in 2012?',1),(37,'What is the fastest known object in space?',1),(38,'Which planet has the most extreme temperatures in our solar system?',1),(39,'What is the main reason that the Moon has so many craters?',1),(40,'What color does the Sun appear to be from space?',1),(41,'Which planet is sometimes called the \"Earth\'s twin\"?',1),(42,'What famous landmark on Earth is often compared to the formation of Saturn’s rings?',1),(43,'What is the name of the first private company to send humans to space?',1),(44,'Which space agency is responsible for the Hubble Space Telescope?',1),(45,'What is the term for a group of stars that are bound together by gravity?',1),(46,'Which planet has the longest known \"year\" (orbital period)?',1),(47,'What is the term for the \"twinkling\" effect of stars as seen from Earth?',1),(48,'What is the name of the phenomenon when the moon passes between the Earth and the Sun?',1),(49,'How many planets in our solar system have rings?',1),(50,'Which NASA mission is currently searching for signs of past life on Mars?',1),(51,'Which planet used to be considered the ninth planet but isn’t anymore?',1),(52,'What is the name of Mickey Mouse\'s friend who shares a name with a moon of Pluto?',1),(53,'What do we call the \"big dipper\" in the sky?',1),(54,'What is the name of the largest moon of Saturn?',1),(55,'Which planet is closest to the Sun?',1),(56,'What shape is the Earth, according to scientists?',1),(57,'Which planet has a \"Great Red Spot,\" a giant storm that has lasted for centuries?',1),(58,'Which planet has the most beautiful and brightest rings?',1),(59,'What do you call a moon that orbits a planet?',1),(60,'What’s the hottest planet in our solar system?',1),(61,'What is the name of the spacecraft that landed on Mars in 2012 and took selfies?',1),(62,'How long does it take the Earth to orbit around the Sun?',1),(63,'What’s the name of the famous space telescope that gives us pictures of faraway galaxies?',1),(64,'What was the first man-made object to reach the Moon?',1),(65,'How long does it take for light from the Sun to reach Earth?',1),(66,'Which planet has a day that lasts only about 10 hours?',1),(67,'What’s the name of the first living creature sent into space?',1),(68,'How many moons does Earth have?',1),(69,'What do we call a \"shooting star\"?',1),(70,'What’s the name of the closest star to Earth?',1),(71,'Which planet is known as the \"Red Planet\"?',1),(72,'What is the name of the first artificial satellite sent into space?',1),(73,'What planet has a moon called \"Titan,\" which is bigger than Mercury?',1),(74,'Which planet has the shortest day?',1),(75,'Which planet has the largest volcano in the solar system?',1),(76,'What famous space movie features a planet named Tatooine?',1),(77,'How many planets in our solar system have rings?',1),(78,'What does a comet’s \"tail\" actually consist of?',1),(79,'What is the name of the space agency that landed the first man on the Moon?',1),(80,'What is the largest planet in the solar system?',1),(81,'Which planet is known for its extremely strong winds and violent storms, but also its very chill vibe?',1),(82,'What would happen if you tried to jump on Mars?',1),(83,'If you could visit any planet, which one would make the best vacation spot because of its constant sunshine?',1),(84,'If you lived on Jupiter, how long would a day be?',1),(85,'Which planet would be the worst to visit if you don\'t like the cold?',1),(86,'What would you see if you were standing on the Moon and looked at Earth?',1),(87,'What’s the biggest misconception about Mars?',1),(88,'What’s the nickname of the largest volcano in the solar system, located on Mars?',1),(89,'Which of these stars is often called the \"North Star\"?',1),(90,'If you went to Venus, what would be your biggest complaint?',1),(91,'Which planet has a storm so big, you could fit three Earths in it?',1),(92,'What’s the name of the famous dwarf planet that\'s basically Pluto\'s cousin?',1),(93,'Which planet is so far from the Sun, it’s basically always taking a nap?',1),(94,'What’s the most fun fact about Saturn’s rings?',1),(95,'If you could drive a car on Mars, what would your biggest challenge be?',1),(96,'If you visited Neptune, which of these would you not need?',1),(97,'If the Moon were a giant cookie, which planet would make the best glass of milk to go with it?',1),(98,'What planet smells like rotten eggs?',1),(99,'Which planet could you \"surf\" on if it wasn’t made of gas?',1),(100,'If you wanted to catch a glimpse of a black hole, where would you go?',1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) UNIQUE DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `profile_pic` tinyint DEFAULT NULL,
  `badges` text,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='info about users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

 LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'eu','eu@gmail.com','$2a$10$7j5UQacDyDekeqbcaxyWj.eTMLdC0vqfmqF2mlVcrFwSYdGmscqPy','2024-11-10 19:41:01',NULL,NULL),(7,'buna','buna@gmail.com','$2a$10$utj4Azy/.3MDoPSL7kWes.1RCUjUytE1KI8wBRHoaHQPxVILFlYl.','2024-11-11 16:36:25',NULL,NULL),(8,'roxi','roxi@gmail.com','$2a$10$GCBXZMXINQMs.aWKmHYa6uPp/PMfLe.rtS13De6MpJ8rG2ZdfyZ1e','2024-11-15 15:56:43',NULL,NULL);
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

-- Dump completed on 2024-11-15 16:12:58

--
-- Table structure for table `achievements`
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `achievements`;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `achievements` (
  `achievement_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT,
  PRIMARY KEY (`achievement_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `user_achievments`
--
DROP TABLE IF EXISTS `user_achievements`;
CREATE TABLE `user_achievements` (
  `email` varchar(45) NOT NULL,
  `achievement_id` INT NOT NULL,
  PRIMARY KEY (`email`, `achievement_id`),
  FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`achievement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO achievements (name, description) VALUES 
('Rookie Scorer', 'Reach 1000 highscore'), ('Master Scorer', 'Reach 2500 highscore'), ('Legendary Scorer', 'Reach 5000 highscore'), ('First Quiz Conqueror', 'Complete 1 quiz'), ('Quiz Enthusiast', 'Complete 5 quizzes'), ('Quiz Master', 'Complete 10 quizzes'), ('Quiz Marathoner', 'Complete 50 quizzes'), ('Challenge Initiator', 'You won 1 challenge'), ('Challenge Hero', 'You won 5 challenges'), ('Challenge Champion', 'You won 10 challenges'), ('Welcome Aboard!', 'User logged in for the first time');

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO user_achievements (email, achievement_id)
VALUES ('buna@gmail.com', 1), ('buna@gmail.com', 2), ('eu@gmail.com', 3), ('eu@gmail.com', 1);
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `challenges`;
CREATE TABLE challenges (
  id INT AUTO_INCREMENT PRIMARY KEY,  -- ID unic pentru fiecare provocare
  challenger_email VARCHAR(255) NOT NULL,
  challenged_username VARCHAR(255) NOT NULL,
  number_of_questions INT NOT NULL,   -- Numărul de întrebări din provocare
  time_limit INT NOT NULL,            -- Limita de timp (în minute)
  category VARCHAR(50) NOT NULL,      -- Categoria provocării
  status ENUM('pending', 'accepted') DEFAULT 'pending',  -- Statusul provocării
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Data creării provocării
  FOREIGN KEY (challenger_email) REFERENCES user(email),
  FOREIGN KEY (challenged_username) REFERENCES user(username)
);

CREATE TABLE user_quiz_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email varchar(45) NOT NULL,
    category_id INT NOT NULL,
    completed_quizzes INT DEFAULT 0,
    FOREIGN KEY (user_email) REFERENCES user(email),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);



