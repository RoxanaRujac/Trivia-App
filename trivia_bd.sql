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
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `profile_pic` tinyint DEFAULT NULL,
  `achievements` text,
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
INSERT INTO `user` VALUES (6,'eu','eu@gmail.com','$2a$10$7j5UQacDyDekeqbcaxyWj.eTMLdC0vqfmqF2mlVcrFwSYdGmscqPy','2024-11-10 19:41:01',NULL,NULL,NULL),(7,'buna','buna@gmail.com','$2a$10$utj4Azy/.3MDoPSL7kWes.1RCUjUytE1KI8wBRHoaHQPxVILFlYl.','2024-11-11 16:36:25',NULL,NULL,NULL),(8,'roxi','roxi@gmail.com','$2a$10$GCBXZMXINQMs.aWKmHYa6uPp/PMfLe.rtS13De6MpJ8rG2ZdfyZ1e','2024-11-15 15:56:43',NULL,NULL,NULL);
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


LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES 
(2, 'General Knowledge', 'Various topics and general trivia'),
(3, 'Sports', 'All about games, players, and sports history'),
(4, 'History', 'Events, milestones, and historical figures'),
(5, 'UTCN is a lifestyle', 'Everything related to UTCN culture and experiences'),
(6, 'Movies & TV Shows', 'Films, series, and the entertainment industry'),
(7, 'Music', 'Genres, artists, and musical instruments'),
(8, 'Technology', 'Gadgets, software, and advancements in tech'),
(9, 'Art & Literature', 'Books, paintings, and cultural masterpieces'),
(10, 'Mythology', 'Myths, gods, and ancient beliefs'),
(11, 'Famous Personalities', 'Well-known individuals and their stories'),
(12, 'Travel Destinations', 'Exotic places and travel tips'),
(13, 'Psychology', 'The human mind and behavior studies'),
(14, 'Hobbies', 'Pastimes and skills people love to do');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`text`, `category_id`) VALUES
('What is the capital city of France?', 2),
('Who wrote the novel "1984"?', 2),
('What is the largest ocean on Earth?', 2),
('Which planet is known as the Red Planet?', 2),
('Who painted the Mona Lisa?', 2),
('What is the chemical symbol for water?', 2),
('In what year did the Titanic sink?', 2),
('What is the smallest country in the world?', 2),
('Who developed the theory of relativity?', 2),
('What is the longest river in the world?', 2),
('What is the hardest natural substance on Earth?', 2),
('What is the currency of Japan?', 2),
('Who discovered penicillin?', 2),
('What is the tallest mountain in the world?', 2),
('What is the largest desert in the world?', 2),
('Which country is known as the Land of the Rising Sun?', 2),
('Who is known as the Father of Computers?', 2),
('What is the main ingredient in guacamole?', 2),
('What is the most populous country in the world?', 2),
('How many continents are there?', 2),
('What is the freezing point of water in Celsius?', 2),
('What is the speed of light?', 2),
('Which is the largest mammal?', 2),
('What is the capital city of Canada?', 2),
('Which element has the atomic number 1?', 2),
('What is the most spoken language in the world?', 2),
('Who was the first man to step on the moon?', 2),
('What is the primary ingredient of bread?', 2),
('Which continent is the Sahara Desert located on?', 2),
('Who was the first President of the United States?', 2),
('What is the chemical formula for table salt?', 2),
('Which country gifted the Statue of Liberty to the USA?', 2),
('What is the smallest bone in the human body?', 2),
('Which planet has the most moons in the solar system?', 2),
('What is the national animal of Scotland?', 2),
('In which year did World War II end?', 2),
('Who invented the telephone?', 2),
('What is the square root of 144?', 2),
('Which natural wonder is found in Australia and is visible from space?', 2),
('How many days are in a leap year?', 2),
('What is the process by which plants make their food?', 2),
('Which metal is the best conductor of electricity?', 2),
('Who was the first woman to win a Nobel Prize?', 2),
('What is the official language of Brazil?', 2),
('What is the name of the ship that Charles Darwin used during his expedition?', 2),
('Which blood type is known as the universal donor?', 2),
('What is the fastest land animal?', 2),
('Who was the Greek god of the sea?', 2),
('What is the currency of the United Kingdom?', 2),
('What is the main ingredient in traditional Japanese sushi?', 2),
('What is the most widely eaten food in the world?', 2),
('Which organ in the human body is responsible for filtering blood?', 2),
('Who discovered gravity when observing a falling apple?', 2),
('What is the capital city of Australia?', 2),
('Which continent is the Amazon Rainforest located on?', 2),
('What is the primary gas found in the Earth’s atmosphere?', 2),
('Who is known as the author of "The Origin of Species"?', 2),
('How many planets are in our solar system?', 2),
('What does the acronym "WWW" stand for in a website browser?', 2),
('What is the largest island in the world?', 2),
('What is the official residence of the President of the United States?', 2),
('How many rings are on the Olympic flag?', 2),
('What is the hardest rock known to humans?', 2),
('What is the name of the galaxy we live in?', 2),
('What is the boiling point of water in Fahrenheit?', 2),
('What is the capital of Italy?', 2),
('Who painted "The Starry Night"?', 2),
('What is the heaviest naturally occurring element?', 2),
('What is the name of the first artificial satellite sent into space?', 2),
('Which ocean is the deepest in the world?', 2),
('What is the main ingredient of hummus?', 2),
('Who is known as the King of Pop?', 2),
('What year did the first manned moon landing occur?', 2),
('Which sport is known as "the beautiful game"?', 2),
('What is the national flower of Japan?', 2),
('Which scientist is famous for his laws of motion?', 2),
('Which bird is known for its ability to mimic human speech?', 2),
('What is the name of the longest reigning British monarch?', 2),
('Which chemical element is represented by the symbol "Au"?', 2),
('In which year did the Berlin Wall fall?', 2),
('What is the capital of South Africa?', 2),
('Which country is known for inventing pizza?', 2),
('What is the name of the first human to orbit Earth?', 2),
('What is the smallest planet in our solar system?', 2),
('What is the main language spoken in Argentina?', 2),
('Which ancient civilization built the pyramids of Giza?', 2),
('What is the name of the largest land carnivore?', 2),
('Who was the first woman to fly solo across the Atlantic Ocean?', 2),
('What is the primary ingredient in tofu?', 2),
('Which country has the most UNESCO World Heritage Sites?', 2),
('What is the capital city of Portugal?', 2),
('What is the largest organ in the human body?', 2),
('Who is the author of the "Harry Potter" series?', 2),
('What is the name of the process by which water cycles through the Earth’s atmosphere?', 2),
('Which is the only mammal capable of true flight?', 2),
('What is the name of the deepest point in the Earth’s oceans?', 2),
('Who is known as the inventor of the light bulb?', 2),
('What is the national dish of Spain?', 2),
('What is the official language of Egypt?', 2),
('Which planet in our solar system has the strongest gravitational pull?', 2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(201, 'Which country won the first FIFA World Cup in 1930?', 3),
(202, 'What is the national sport of Japan?', 3),
(203, 'In which year were the first modern Olympic Games held?', 3),
(204, 'Who holds the record for the most home runs in MLB history?', 3),
(205, 'What is the highest possible break in snooker?', 3),
(206, 'How many players are there in a standard soccer team?', 3),
(207, 'Which country is known for the sport of cricket?', 3),
(208, 'Who was the first basketball player to score 100 points in a single game?', 3),
(209, 'In which country did the sport of rugby originate?', 3),
(210, 'What is the length of a marathon in kilometers?', 3),
(211, 'Which tennis player has the most Grand Slam titles in history?', 3),
(212, 'What is the name of the trophy awarded in the NHL?', 3),
(213, 'Which team has won the most NBA championships?', 3),
(214, 'Who is known as "The King of Football"?', 3),
(215, 'What is the weight of a standard bowling ball?', 3),
(216, 'Which country has won the most Olympic gold medals in swimming?', 3),
(217, 'In which sport would you perform a "slam dunk"?', 3),
(218, 'What is the national sport of Canada?', 3),
(219, 'How many sets are played in a standard volleyball match?', 3),
(220, 'Who is the fastest man in the world, holding the 100m sprint record?', 3),
(221, 'What is the duration of a standard football (soccer) match?', 3),
(222, 'Which country hosted the 2008 Summer Olympics?', 3),
(223, 'What is the term for a score of zero in tennis?', 3),
(224, 'Which golfer has won the most Masters Tournaments?', 3),
(225, 'What is the diameter of a basketball hoop in inches?', 3),
(226, 'Who is considered the greatest boxer of all time?', 3),
(227, 'What is the name of the championship series in Major League Baseball?', 3),
(228, 'Which country has won the most FIFA World Cups?', 3),
(229, 'Who is the all-time top scorer in the UEFA Champions League?', 3),
(230, 'What is the name of the position in baseball responsible for pitching?', 3),
(231, 'How many points is a touchdown worth in American football?', 3),
(232, 'What is the term for three strikes in a row in bowling?', 3),
(233, 'In which sport would you find a pommel horse?', 3),
(234, 'Who was the first woman to win an Olympic gold medal?', 3),
(235, 'What is the maximum score in a single game of ten-pin bowling?', 3),
(236, 'Which country invented the sport of badminton?', 3),
(237, 'How many players are on the field during a rugby match?', 3),
(238, 'Who won the FIFA Women’s World Cup in 2019?', 3),
(239, 'What is the highest governing body of cricket?', 3),
(240, 'In which sport would you use a shuttlecock?', 3),
(241, 'Who is the most decorated Olympian of all time?', 3),
(242, 'What is the name of the area where a goalkeeper can handle the ball in soccer?', 3),
(243, 'Which country is famous for bullfighting?', 3),
(244, 'In baseball, how many strikes make an out?', 3),
(245, 'Which athlete lit the Olympic flame in Barcelona 1992?', 3),
(246, 'What is the nickname of New Zealand’s national rugby team?', 3),
(247, 'What is the term for a perfect score in gymnastics?', 3),
(248, 'What does FIFA stand for?', 3),
(249, 'Which country won the most medals in the 2020 Tokyo Olympics?', 3),
(250, 'How many periods are there in an ice hockey game?', 3),
(251, 'Who is the youngest player to win a Grand Slam title?', 3),
(252, 'What is the size of a standard soccer field in meters?', 3),
(253, 'Which city hosted the 2016 Summer Olympics?', 3),
(254, 'What is the name of the competition for the top European soccer clubs?', 3),
(255, 'In cricket, how many runs is a century?', 3),
(256, 'Who was the first athlete to run a sub-4-minute mile?', 3),
(257, 'What is the name of the championship series in the NFL?', 3),
(258, 'Which team won the first Super Bowl?', 3),
(259, 'What is the term for hitting the ball over the boundary without bouncing in cricket?', 3),
(260, 'Which country is known for the sport of sumo wrestling?', 3),
(261, 'Who has won the most Tour de France titles?', 3),
(262, 'What is the regulation height of a basketball hoop?', 3),
(263, 'Which sport uses a "scrum"?', 3),
(264, 'What is the term for a hole-in-one in golf?', 3),
(265, 'Who was the first African-American to win a Grand Slam title?', 3),
(266, 'Which country is known for inventing ice hockey?', 3),
(267, 'How many players are on a water polo team?', 3),
(268, 'What is the term for a "zero score" in golf?', 3),
(269, 'Who holds the record for the most goals in a single FIFA World Cup?', 3),
(270, 'What is the name of the major basketball league in the United States?', 3),
(271, 'Which country has the most Formula 1 Grand Prix wins?', 3),
(272, 'What is the name of the venue for the Wimbledon tennis tournament?', 3),
(273, 'How many gold medals did Michael Phelps win in a single Olympics?', 3),
(274, 'Who won the FIFA World Cup in 2014?', 3),
(275, 'Which country is known for the "All Blacks"?', 3),
(276, 'What is the term for a score of one over par in golf?', 3),
(277, 'Which country hosted the 2010 FIFA World Cup?', 3),
(278, 'Who is the all-time leading scorer in NBA history?', 3),
(279, 'What is the name of the award given to the NBA Finals MVP?', 3),
(280, 'What is the term for a point in fencing?', 3),
(281, 'How many sets are in a standard tennis match for men?', 3),
(282, 'What is the diameter of a soccer ball in centimeters?', 3),
(283, 'What is the name of the Japanese martial art using wooden swords?', 3),
(284, 'Who won the first Wimbledon tournament?', 3),
(285, 'What is the name of the arena where the Chicago Bulls play?', 3),
(286, 'How many laps are in a standard NASCAR race?', 3),
(287, 'Which athlete has won the most medals in Winter Olympics history?', 3),
(288, 'Which team won the UEFA Euro 2020 tournament?', 3),
(289, 'What is the nickname of Brazil’s national soccer team?', 3),
(290, 'Who holds the record for the fastest hat-trick in Premier League history?', 3),
(291, 'What is the term for a basketball shot made while being fouled?', 3),
(292, 'Which country has the most cricket World Cup wins?', 3),
(293, 'Who won the FIFA Golden Boot in 2018?', 3),
(294, 'What is the standard length of a cricket pitch?', 3),
(295, 'Which city will host the 2024 Summer Olympics?', 3),
(296, 'Who won the Ballon d’Or in 2022?', 3),
(297, 'What is the highest score in a single frame of darts?', 3),
(298, 'Which sport is played on the largest field?', 3),
(299, 'Who won the first-ever Formula 1 World Championship?', 3),
(300, 'Which player has the most wins in tennis history?', 3);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(301, 'Who was the first President of the United States?', 5),
(302, 'In which year did World War II begin?', 5),
(303, 'What was the name of the ship that transported the Pilgrims to America in 1620?', 5),
(304, 'Who was the first emperor of Rome?', 5),
(305, 'Which civilization built the pyramids of Egypt?', 5),
(306, 'What year did the Titanic sink?', 5),
(307, 'Who was the British Prime Minister during World War II?', 5),
(308, 'What is the name of the treaty that ended World War I?', 5),
(309, 'In what year did the Berlin Wall fall?', 5),
(310, 'Who discovered America in 1492?', 5),
(311, 'What was the name of the last queen of France before the French Revolution?', 5),
(312, 'Which ancient civilization invented democracy?', 5),
(313, 'Who wrote the Declaration of Independence?', 5),
(314, 'What was the name of the first man to step on the moon?', 5),
(315, 'Which war was fought between the North and South regions of the United States?', 5),
(316, 'Who was the first female Prime Minister of the United Kingdom?', 5),
(317, 'What was the name of the Mongol leader who created one of the largest empires in history?', 5),
(318, 'Which empire was known for its gladiatorial games and the Colosseum?', 5),
(319, 'What year was the United Nations founded?', 5),
(320, 'Who painted the Sistine Chapel ceiling?', 5),
(321, 'What was the name of the fortress prison stormed during the French Revolution?', 5),
(322, 'What year did the Soviet Union collapse?', 5),
(323, 'Who was the leader of Germany during World War II?', 5),
(324, 'What is the name of the document signed in 1215 that limited the powers of the English king?', 5),
(325, 'Who was the first ruler of the Ottoman Empire?', 5),
(326, 'Which war is known as "The Great War"?', 5),
(327, 'Who was the president of the United States during the Great Depression and World War II?', 5),
(328, 'What is the name of the historical trade route connecting China to the Mediterranean?', 5),
(329, 'Who was the first emperor of China?', 5),
(330, 'What was the name of the ship that Charles Darwin traveled on to study evolution?', 5),
(331, 'Which country was responsible for the attack on Pearl Harbor in 1941?', 5),
(332, 'Who was the longest reigning monarch of the United Kingdom before Queen Elizabeth II?', 5),
(333, 'What year did the American Civil War end?', 5),
(334, 'Which explorer was the first to sail around the world?', 5),
(335, 'What was the name of the battle where Napoleon was finally defeated?', 5),
(336, 'What was the name of the US program to land a man on the moon?', 5),
(337, 'Who was the first woman to win a Nobel Prize?', 5),
(338, 'What was the name of the ancient Greek city known for its military prowess?', 5),
(339, 'Who was the first president of South Africa after apartheid ended?', 5),
(340, 'In which year did India gain independence from British rule?', 5),
(341, 'What was the name of the war between England and France that lasted over a century?', 5),
(342, 'Who was the famous Egyptian queen known for her alliance with Julius Caesar?', 5),
(343, 'What year did the Korean War begin?', 5),
(344, 'What was the name of the palace built by Louis XIV in France?', 5),
(345, 'Who was the leader of the Soviet Union during the Cuban Missile Crisis?', 5),
(346, 'What is the name of the period in European history known for the rebirth of art and learning?', 5),
(347, 'What year did the United States declare independence?', 5),
(348, 'Who was the military leader of the Confederate Army during the American Civil War?', 5),
(349, 'What was the name of the pandemic that killed millions in the 14th century?', 5),
(350, 'Which country was known as Persia until 1935?', 5),
(351, 'Who led the Haitian Revolution?', 5),
(352, 'What year did women gain the right to vote in the United States?', 5),
(353, 'What was the name of the German airship that exploded in 1937?', 5),
(354, 'Who was the Spanish explorer that conquered the Aztec Empire?', 5),
(355, 'Which civilization is known for its cuneiform writing system?', 5),
(356, 'What year was the Berlin Wall built?', 5),
(357, 'Who was the leader of the Soviet Union during World War II?', 5),
(358, 'What was the name of the war between the Allies and Axis powers?', 5),
(359, 'Who was the first Roman Catholic President of the United States?', 5),
(360, 'What was the name of the city destroyed by Mount Vesuvius in AD 79?', 5),
(361, 'What was the name of the treaty that ended the American Revolutionary War?', 5),
(362, 'Who was the philosopher known as the father of modern philosophy?', 5),
(363, 'What year was the Magna Carta signed?', 5),
(364, 'Who was the Aztec emperor at the time of the Spanish conquest?', 5),
(365, 'Which country was divided by the 38th parallel after World War II?', 5),
(366, 'What year did the Russian Revolution take place?', 5),
(367, 'What was the name of the U.S. operation to develop the atomic bomb?', 5),
(368, 'Who was the French military leader who crowned himself emperor?', 5),
(369, 'Which Chinese dynasty built most of the Great Wall?', 5),
(370, 'Who discovered penicillin?', 5),
(371, 'What year did World War I end?', 5),
(372, 'What was the capital of the Byzantine Empire?', 5),
(373, 'Who was the ruler of England during the Spanish Armada?', 5),
(374, 'What was the name of the South American empire conquered by Francisco Pizarro?', 5),
(375, 'What year was the League of Nations formed?', 5),
(376, 'Who was the first black President of the United States?', 5),
(377, 'What year did the Cuban Revolution end?', 5),
(378, 'What was the capital city of ancient Egypt?', 5),
(379, 'Who was the first prime minister of independent India?', 5),
(380, 'What was the name of the ship used by the Vikings?', 5),
(381, 'Which empire was ruled by Charlemagne?', 5),
(382, 'Who was the leader of the Indian independence movement?', 5),
(383, 'What year was the Treaty of Versailles signed?', 5),
(384, 'Who was the first European to reach India by sea?', 5),
(385, 'What was the name of the agreement that split the world between Spain and Portugal?', 5),
(386, 'What was the name of the German government after World War I?', 5),
(387, 'Who was the English king during the American Revolution?', 5),
(388, 'What year did the French Revolution begin?', 5),
(389, 'Who was the leader of the Bolsheviks during the Russian Revolution?', 5),
(390, 'What year was the Battle of Hastings fought?', 5),
(391, 'What was the name of the U.S. ship attacked in Havana Harbor in 1898?', 5),
(392, 'Who led the March on Washington in 1963?', 5),
(393, 'What year did Nelson Mandela become president of South Africa?', 5),
(394, 'Who was the leader of the Nazi Party?', 5),
(395, 'What was the ancient name of Istanbul?', 5),
(396, 'What was the primary goal of the Crusades?', 5),
(397, 'Which dynasty was the last to rule Imperial China?', 5),
(398, 'Who was the first emperor of the Holy Roman Empire?', 5),
(399, 'What was the name of the project to map the human genome?', 5),
(400, 'Which year marked the start of the Industrial Revolution?', 5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(401, 'Which actor played the character of Harry Potter in the film series?', 6),
(402, 'What is the name of the spaceship in the movie "Star Wars"?', 6),
(403, 'Who directed the movie "Titanic"?', 6),
(404, 'In which year was the first "Avengers" movie released?', 6),
(405, 'What is the name of the fictional African country in the movie "Black Panther"?', 6),
(406, 'Which movie features the famous line, "I\'ll be back"?', 6),
(407, 'Who played the character of Tony Stark in the Marvel Cinematic Universe?', 6),
(408, 'What is the name of the TV show featuring a chemistry teacher turned methamphetamine producer?', 6),
(409, 'Who voiced the character of Woody in the "Toy Story" movies?', 6),
(410, 'Which actress played Katniss Everdeen in "The Hunger Games"?', 6),
(411, 'What is the name of the coffee shop in the TV show "Friends"?', 6),
(412, 'Which movie won the first Academy Award for Best Picture?', 6),
(413, 'What is the name of the villain in "The Lion King"?', 6),
(414, 'Who played the Joker in the 2008 movie "The Dark Knight"?', 6),
(415, 'What is the longest-running animated TV series?', 6),
(416, 'In the movie "The Matrix", what color is the pill Neo takes?', 6),
(417, 'Who directed the "Lord of the Rings" trilogy?', 6),
(418, 'What is the name of the character played by Leonardo DiCaprio in "Inception"?', 6),
(419, 'Which actress starred opposite Ryan Gosling in "La La Land"?', 6),
(420, 'What is the name of the kingdom in "Frozen"?', 6),
(421, 'Which TV show is known for the phrase "Winter is Coming"?', 6),
(422, 'Who played Forrest Gump in the movie of the same name?', 6),
(423, 'What is the name of the school in the TV series "Stranger Things"?', 6),
(424, 'Which movie features a boxing match and the line, "Adrian!"?', 6),
(425, 'Who voiced the character of Simba in the 1994 movie "The Lion King"?', 6),
(426, 'What is the name of the director of "Pulp Fiction"?', 6),
(427, 'What year was the first "Jurassic Park" movie released?', 6),
(428, 'Which actor plays Deadpool in the Marvel movies?', 6),
(429, 'What is the name of the TV show about a group of stranded survivors on a mysterious island?', 6),
(430, 'What is the highest-grossing movie of all time?', 6),
(431, 'Which actress starred in the lead role of the movie "Pretty Woman"?', 6),
(432, 'In which movie does the character Jack Dawson appear?', 6),
(433, 'What is the name of the boy who befriends E.T. in the movie "E.T."?', 6),
(434, 'Which actor plays John Wick in the movie series of the same name?', 6),
(435, 'What is the title of the theme song for the movie "Titanic"?', 6),
(436, 'What is the name of the wizarding bank in the "Harry Potter" series?', 6),
(437, 'Which movie features the character of Tyler Durden?', 6),
(438, 'What is the name of the dog in the movie "Marley & Me"?', 6),
(439, 'Who played the character of Jack Sparrow in the "Pirates of the Caribbean" series?', 6),
(440, 'What is the name of the theme park in "Jurassic Park"?', 6),
(441, 'Which actor played the main character in the movie "Cast Away"?', 6),
(442, 'What is the title of the final "Harry Potter" movie?', 6),
(443, 'Which movie features a group of superheroes called the X-Men?', 6),
(444, 'Who directed the movie "Schindler’s List"?', 6),
(445, 'What is the name of the fictional city where "The Simpsons" live?', 6),
(446, 'Which actress played the lead role in the movie "Wonder Woman"?', 6),
(447, 'What is the name of the kingdom in "The Little Mermaid"?', 6),
(448, 'Which movie features a magical nanny named Mary Poppins?', 6),
(449, 'Who played the character of James Bond in "Skyfall"?', 6),
(450, 'What is the name of the TV show about a paper company in Scranton, Pennsylvania?', 6),
(451, 'Who directed the movie "The Godfather"?', 6),
(452, 'Which animated movie features a rat named Remy who dreams of becoming a chef?', 6),
(453, 'What is the name of the character played by Matt Damon in "The Bourne Identity"?', 6),
(454, 'Which TV show features the characters Sheldon, Leonard, and Penny?', 6),
(455, 'Who won the Academy Award for Best Actor for the movie "Joker" (2019)?', 6),
(456, 'What is the name of the princess in the movie "Sleeping Beauty"?', 6),
(457, 'Which movie features the line, "You can’t handle the truth!"?', 6),
(458, 'What is the name of the dragon in "The Hobbit" movies?', 6),
(459, 'Who played the character of Kat Stratford in "10 Things I Hate About You"?', 6),
(460, 'Which TV show features the character Walter White?', 6),
(461, 'What is the name of the robot in the movie "Wall-E"?', 6),
(462, 'Who played the role of Indiana Jones?', 6),
(463, 'What is the name of the clown in the movie "It"?', 6),
(464, 'What year was the first "Iron Man" movie released?', 6),
(465, 'Which TV show follows the lives of a mother-daughter duo in Stars Hollow?', 6),
(466, 'Who played the character of Rose in "Titanic"?', 6),
(467, 'What is the name of the housemaid in the TV show "Downton Abbey"?', 6),
(468, 'Which actor played Batman in the "Dark Knight" trilogy?', 6),
(469, 'What is the name of the main character in the movie "The Terminator"?', 6),
(470, 'Who directed the animated movie "Spirited Away"?', 6),
(471, 'What is the name of the TV series based on George R.R. Martin\'s books?', 6),
(472, 'Who starred in the lead role in the movie "The Wolf of Wall Street"?', 6),
(473, 'What is the name of the superhero team in the movie "Guardians of the Galaxy"?', 6),
(474, 'Which TV show features a serial killer working as a blood spatter analyst?', 6),
(475, 'Who played the lead role in the movie "Gladiator"?', 6),
(476, 'What is the name of the castle in the "Harry Potter" series?', 6),
(477, 'What is the name of the fictional island in "Moana"?', 6),
(478, 'Which actor played the role of Spider-Man in the "Homecoming" series?', 6),
(479, 'What is the name of the TV show about a detective with obsessive-compulsive disorder?', 6),
(480, 'Who played the main character in the movie "The Revenant"?', 6),
(481, 'What is the name of the cat in the movie "The Aristocats"?', 6),
(482, 'Which movie features a singing group called The Bellas?', 6),
(483, 'What is the name of the house where the Cullens live in "Twilight"?', 6),
(484, 'Who directed the movie "Avatar"?', 6),
(485, 'What is the name of the hotel in the movie "The Shining"?', 6),
(486, 'Who played the role of Elle Woods in "Legally Blonde"?', 6),
(487, 'What is the name of the villain in the movie "Aladdin"?', 6),
(488, 'Which actor played the role of Thor in the Marvel movies?', 6),
(489, 'What is the name of the futuristic city in "Blade Runner"?', 6),
(490, 'Who played the character of Hermione Granger in the "Harry Potter" series?', 6),
(491, 'What is the name of the lead character in the movie "The Notebook"?', 6),
(492, 'Which TV show features a woman who can kill demons using martial arts?', 6),
(493, 'Who played the role of Wolverine in the "X-Men" movies?', 6),
(494, 'What is the name of the TV show about a high school glee club?', 6),
(495, 'Which movie features a magical suitcase owned by Newt Scamander?', 6),
(496, 'Who played the character of Mia Thermopolis in "The Princess Diaries"?', 6),
(497, 'What is the name of the TV show where contestants survive on a deserted island?', 6),
(498, 'What year was the first "Star Wars" movie released?', 6),
(499, 'Which movie features a shark and the tagline "Just when you thought it was safe to go back in the water"?', 6),
(500, 'What is the name of the planet where "Avatar" is set?', 6);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(501, 'Which band released the album "Abbey Road"?', 7),
(502, 'Who is known as the "King of Pop"?', 7),
(503, 'Which artist is known for the hit song "Like a Rolling Stone"?', 7),
(504, 'What year did Elvis Presley pass away?', 7),
(505, 'Which country is the singer Shakira originally from?', 7),
(506, 'Who performed the song "Rolling in the Deep"?', 7),
(507, 'Which famous music festival is held annually in the desert of California?', 7),
(508, 'What was the first music video played on MTV?', 7),
(509, 'Which Beatles member was known as the "Quiet Beatle"?', 7),
(510, 'Who was the lead singer of Queen?', 7),
(511, 'What is the best-selling album of all time?', 7),
(512, 'Which band is famous for the song "Bohemian Rhapsody"?', 7),
(513, 'Who is the best-selling female artist of all time?', 7),
(514, 'What genre of music is the band Metallica known for?', 7),
(515, 'Which artist is known for the song "Shape of You"?', 7),
(516, 'Which music legend is famous for his dance move, the moonwalk?', 7),
(517, 'Who released the hit song "Someone Like You"?', 7),
(518, 'Which musical genre is Bob Marley most associated with?', 7),
(519, 'What was the name of Beyoncé’s 2016 visual album?', 7),
(520, 'Who is the "Queen of Soul"?', 7),
(521, 'Which band is known for the hit "Stairway to Heaven"?', 7),
(522, 'What is the name of Taylor Swift’s debut album?', 7),
(523, 'Who was the lead singer of Nirvana?', 7),
(524, 'Which artist sang "I Will Always Love You"?', 7),
(525, 'Who is the famous singer of the song "Purple Rain"?', 7),
(526, 'Which rock band released the album "Dark Side of the Moon"?', 7),
(527, 'What music genre is Katy Perry most famous for?', 7),
(528, 'Who was the first woman to be inducted into the Rock and Roll Hall of Fame?', 7),
(529, 'Which popular music artist was born in Barbados?', 7),
(530, 'Who is known as the "Godfather of Soul"?', 7),
(531, 'Which song by Adele was a huge hit in 2011?', 7),
(532, 'What musical instrument does Billy Joel play?', 7),
(533, 'Which 1980s pop star’s album is titled "Thriller"?', 7),
(534, 'What is the name of the song by the Beatles that begins with "Help!"?', 7),
(535, 'Which artist is known for the song "Viva La Vida"?', 7),
(536, 'Which legendary music producer is known for working with Michael Jackson?', 7),
(537, 'Who is the lead singer of the band Coldplay?', 7),
(538, 'Which pop star performed the song "Toxic"?', 7),
(539, 'What is the name of the famous music festival held in Glastonbury, England?', 7),
(540, 'Who wrote the song "Imagine"?', 7),
(541, 'What is the name of Lady Gaga’s first album?', 7),
(542, 'Which band is known for the song "Sweet Child O’ Mine"?', 7),
(543, 'Which artist released the album "1989"?', 7),
(544, 'Who is the "Piano Man" of popular music?', 7),
(545, 'Which singer is known for the hit song "Uptown Funk"?', 7),
(546, 'What year did The Beatles officially break up?', 7),
(547, 'Who was the first African-American woman to win a Grammy for Album of the Year?', 7),
(548, 'Which song did Whitney Houston famously perform at the 1991 Super Bowl? ', 7),
(549, 'Who is the famous guitarist from the band The Rolling Stones?', 7),
(550, 'Which band performed the song "Smells Like Teen Spirit"?', 7),
(551, 'Which famous music icon was known as "The Material Girl"?', 7),
(552, 'What is the name of the song that became a global hit for Justin Bieber in 2010?', 7),
(553, 'What song by Adele won the Grammy Award for Record of the Year in 2012?', 7),
(554, 'What band was Freddie Mercury a part of?', 7),
(555, 'Which artist is known for the hit single "Bad Romance"?', 7),
(556, 'Who recorded the song "I Want It That Way"?', 7),
(557, 'What is the title of the famous song by Elton John from the movie "The Lion King"?', 7),
(558, 'Who is known for the song "All of Me"?', 7),
(559, 'Which music artist is famous for wearing a meat dress at the 2010 MTV Video Music Awards?', 7),
(560, 'Who sang the iconic song "Bohemian Rhapsody"?', 7),
(561, 'What is the stage name of the artist born Stefani Joanne Angelina Germanotta?', 7),
(562, 'Which famous band is known for the song "Hotel California"?', 7),
(563, 'Which singer’s album "Lover" was released in 2019?', 7),
(564, 'Who is the lead singer of the band Imagine Dragons?', 7),
(565, 'Who was the first artist to have a music video played on MTV?', 7),
(566, 'Which country did the artist Enya come from?', 7),
(567, 'Which music artist was known for the hit "Wrecking Ball"?', 7),
(568, 'Who wrote the hit song "I Will Survive"?', 7),
(569, 'Which legendary musician is known for his "No Woman, No Cry" song?', 7),
(570, 'Which musical genre is Taylor Swift primarily known for?', 7),
(571, 'What song by The Weeknd was a chart-topper in 2020?', 7),
(572, 'Who recorded the song "My Heart Will Go On"?', 7),
(573, 'Which music legend was known as the "King of Reggae"?', 7),
(574, 'What year did Nirvana release their famous album "Nevermind"?', 7),
(575, 'Which artist had a hit with the song "Roar" in 2013?', 7),
(576, 'Which famous musician is the lead vocalist of Aerosmith?', 7),
(577, 'What year was Madonna’s album "Like a Virgin" released?', 7),
(578, 'Which famous music icon was also known as "The Boss"?', 7),
(579, 'Which artist famously declared, "I am the walrus"?', 7),
(580, 'What is the title of the famous rock opera by The Who?', 7),
(581, 'Who performed the famous song "I Wanna Dance with Somebody"?', 7),
(582, 'Which singer was known as "The Queen of Country"?', 7),
(583, 'Which artist had a 2017 hit with the song "Shape of You"?', 7),
(584, 'What was the title of the first studio album by The Beatles?', 7),
(585, 'Who is the lead singer of the band Green Day?', 7),
(586, 'Which artist is known for the song "Hips Don’t Lie"?', 7),
(587, 'What year did Michael Jackson release the album "Bad"?', 7),
(588, 'Which music icon was called the "King of Rock"?', 7),
(589, 'Which band’s album "A Night at the Opera" features the song "Bohemian Rhapsody"?', 7),
(590, 'Which artist had a hit with the song "All About That Bass"?', 7),
(591, 'Who released the album "Born to Run"?', 7),
(592, 'What is the title of the album by the Rolling Stones that includes "Paint It Black"?', 7),
(593, 'Which song by Britney Spears became a worldwide hit in 1999?', 7),
(594, 'Who was the lead guitarist of The Beatles?', 7),
(595, 'What was the first song to be played on the radio?', 7),
(596, 'Which famous rapper is known for his album "The Marshall Mathers LP"?', 7),
(597, 'Which song by Aretha Franklin is considered a feminist anthem?', 7),
(598, 'Who performed "Bohemian Rhapsody" at the 2018 Academy Awards?', 7),
(599, 'Who is the best-selling jazz artist of all time?', 7),
(600, 'What was the title of Prince’s famous album released in 1984?', 7);

UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(701, 'Who is the founder of Microsoft?', 8),
(702, 'What does the acronym "HTTP" stand for?', 8),
(703, 'Which company developed the iPhone?', 8),
(704, 'What is the name of the first computer programmer?', 8),
(705, 'What does "CPU" stand for in computing?', 8),
(706, 'What year was the first iPhone released?', 8),
(707, 'Which programming language is known as the "mother of all languages"?', 8),
(708, 'What does the acronym "URL" stand for?', 8),
(709, 'Which company developed the first personal computer?', 8),
(710, 'What was the first video game ever created?', 8),
(711, 'Who invented the World Wide Web?', 8),
(712, 'Which programming language was created by James Gosling in 1995?', 8),
(713, 'What is the name of Google’s mobile operating system?', 8),
(714, 'Who created the first successful computer mouse?', 8),
(715, 'Which technology company is known for its search engine?', 8),
(716, 'What does the acronym "Wi-Fi" stand for?', 8),
(717, 'Which company was originally known as "Blue Ribbon Sports"?', 8),
(718, 'Who is considered the "father of the computer"?', 8),
(719, 'What was the first widely used computer operating system?', 8),
(720, 'Which company introduced the first portable computer?', 8),
(721, 'What does the term "cloud computing" refer to?', 8),
(722, 'What does "RAM" stand for?', 8),
(723, 'Which company created the video game series "Halo"?', 8),
(724, 'Which company is known for its “ThinkPad” laptops?', 8),
(725, 'What was the first commercially successful video game console?', 8),
(726, 'What does the acronym "USB" stand for?', 8),
(727, 'Which technology company is known for the Windows operating system?', 8),
(728, 'What is the name of the first artificial satellite sent into space?', 8),
(729, 'Who invented the first practical telephone?', 8),
(730, 'What is the name of Amazon’s voice assistant?', 8),
(731, 'What does "HTML" stand for in web development?', 8),
(732, 'Which company developed the Android operating system?', 8),
(733, 'What does the acronym "VPN" stand for?', 8),
(734, 'Who invented the computer mouse?', 8),
(735, 'Which programming language was created by Bjarne Stroustrup?', 8),
(736, 'What is the first computer virus called?', 8),
(737, 'Which company created the first laptop computer?', 8),
(738, 'What is the main purpose of an operating system?', 8),
(739, 'What does the term "big data" refer to?', 8),
(740, 'Which company owns the video streaming service YouTube?', 8),
(741, 'What does "AI" stand for in technology?', 8),
(742, 'Who invented the first computer?', 8),
(743, 'What is the most widely used web browser?', 8),
(744, 'Which company is behind the creation of the Linux operating system?', 8),
(745, 'What does "SSD" stand for in computing?', 8),
(746, 'What is the name of the first email system?', 8),
(747, 'Who is the CEO of Tesla and SpaceX?', 8),
(748, 'What is the largest social media platform by users?', 8),
(749, 'Which company created the Xbox console?', 8),
(750, 'What does the acronym "GPS" stand for?', 8),
(751, 'What is the name of the first successful graphical web browser?', 8),
(752, 'What is the primary function of a motherboard in a computer?', 8),
(753, 'Which company created the first smart speaker, the Amazon Echo?', 8),
(754, 'What does the acronym "IoT" stand for?', 8),
(755, 'What does "SEO" stand for in digital marketing?', 8),
(756, 'What is the name of the most popular open-source web server software?', 8),
(757, 'Who invented the transistor?', 8),
(758, 'What was the first web search engine?', 8),
(759, 'What does the term "blockchain" refer to?', 8),
(760, 'Which company developed the first smartphone with a touch screen?', 8),
(761, 'What is the name of the world’s first computer game?', 8),
(762, 'What does "URL" stand for?', 8),
(763, 'Which company developed the first touchscreen smartphone?', 8),
(764, 'What does "BIOS" stand for in computer systems?', 8),
(765, 'What is the world’s largest e-commerce company?', 8),
(766, 'What does the acronym "NFC" stand for?', 8),
(767, 'Which company created the PlayStation console?', 8),
(768, 'What is the term for a self-replicating program that spreads across computers?', 8),
(769, 'Which social media platform was originally called "TheFacebook"?', 8),
(770, 'What is the term used to describe an error in computer software?', 8),
(771, 'Who developed the first commercial graphical operating system?', 8),
(772, 'Which company developed the first virtual reality headset for gaming?', 8),
(773, 'What does "API" stand for?', 8),
(774, 'Who was the co-founder of Apple alongside Steve Jobs?', 8),
(775, 'Which company created the first digital camera?', 8),
(776, 'What does the term "Augmented Reality" refer to?', 8),
(777, 'Which company developed the video game "Minecraft"?', 8),
(778, 'Who is considered the father of artificial intelligence?', 8),
(779, 'What does the term "machine learning" refer to?', 8),
(780, 'Which company developed the first commercial smartphone with a QWERTY keyboard?', 8),
(781, 'What does "VPN" stand for?', 8),
(782, 'What was the first commercially available operating system?', 8),
(783, 'Which company created the first web browser?', 8),
(784, 'What is the main purpose of a router in a network?', 8),
(785, 'Who invented the first personal computer?', 8),
(786, 'What does "Wi-Fi" stand for?', 8),
(787, 'What is the name of Apple’s mobile payment system?', 8),
(788, 'Who developed the first computer virus?', 8),
(789, 'What does the acronym "XML" stand for?', 8),
(790, 'Which company developed the first commercially successful graphical user interface?', 8),
(791, 'What was the first social media platform to reach 1 billion users?', 8),
(792, 'What does the acronym "SSH" stand for?', 8),
(793, 'What is the name of the first website to offer free web hosting?', 8),
(794, 'Who is credited with the invention of the first computer keyboard?', 8),
(795, 'What does the term "encryption" refer to?', 8),
(796, 'Which company developed the first tablet computer?', 8),
(797, 'What is the name of the first widely used video conference software?', 8),
(798, 'What does the term "deep learning" refer to?', 8),
(799, 'What is the name of the world’s first personal assistant software?', 8),
(800, 'What is the primary function of a GPU in computing?', 8);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(801, 'Who wrote "Romeo and Juliet"?', 9),
(802, 'What is the title of the famous painting by Leonardo da Vinci that features a woman with a mysterious smile?', 9),
(803, 'Who painted the "Starry Night"?', 9),
(804, 'Which author wrote "The Catcher in the Rye"?', 9),
(805, 'What is the name of the artist famous for his "Blue Period"?', 9),
(806, 'Which English poet is known for writing "Paradise Lost"?', 9),
(807, 'What is the name of the fictional detective created by Sir Arthur Conan Doyle?', 9),
(808, 'Which author wrote "Moby-Dick"?', 9),
(809, 'Who painted the "Mona Lisa"?', 9),
(810, 'Which writer is known for the phrase "All animals are equal, but some animals are more equal than others"?', 9),
(811, 'Who wrote the novel "1984"?', 9),
(812, 'What is the title of the book by J.R.R. Tolkien that is set in Middle-earth?', 9),
(813, 'Which famous artist cut off his own ear?', 9),
(814, 'What is the name of the famous artist who painted "The Persistence of Memory"?', 9),
(815, 'Who wrote "Pride and Prejudice"?', 9),
(816, 'What is the name of the Shakespearean play about the Danish prince?', 9),
(817, 'Which author wrote "Harry Potter and the Sorcerer’s Stone"?', 9),
(818, 'Which famous artist is known for creating the "Sistine Chapel" ceiling?', 9),
(819, 'Who wrote "The Great Gatsby"?', 9),
(820, 'Who wrote the novel "Brave New World"?', 9),
(821, 'What is the title of the famous painting of a woman holding a child by Michelangelo?', 9),
(822, 'Which book begins with the line "Call me Ishmael"?', 9),
(823, 'Who is known as the "father of modern philosophy"?', 9),
(824, 'Which poet wrote "The Raven"?', 9),
(825, 'Which famous novel was set during the French Revolution and written by Charles Dickens?', 9),
(826, 'Which artist painted the "School of Athens"?', 9),
(827, 'Who wrote "The Lord of the Rings"?', 9),
(828, 'Which poet is known for the work "I Wandered Lonely as a Cloud"?', 9),
(829, 'Which writer created the character of Frankenstein?', 9),
(830, 'Who painted the "Guernica"?', 9),
(831, 'What is the name of the longest epic poem ever written in English?', 9),
(832, 'Who painted "The Birth of Venus"?', 9),
(833, 'What type of painting style is Jackson Pollock known for?', 9),
(834, 'Who wrote "The Odyssey"?', 9),
(835, 'Which author created the detective character Hercule Poirot?', 9),
(836, 'Which artist is famous for his works featuring Campbell’s soup cans?', 9),
(837, 'Which novel begins with the line, "It was the best of times, it was the worst of times"?', 9),
(838, 'Who is the author of "Frankenstein"?', 9),
(839, 'Which artist created the "David" sculpture?', 9),
(840, 'Who painted the "Girl with a Pearl Earring"?', 9),
(841, 'What is the name of the 20th-century artist who painted "Water Lilies"?', 9),
(842, 'Who wrote "The Divine Comedy"?', 9),
(843, 'Which artist is known for his "Campbell’s Soup Cans" artwork?', 9),
(844, 'Which famous poet wrote the poem "The Waste Land"?', 9),
(845, 'Who wrote "To Kill a Mockingbird"?', 9),
(846, 'Which author created the character Sherlock Holmes?', 9),
(847, 'Who painted "The Night Watch"?', 9),
(848, 'What famous painting is located in the Louvre Museum?', 9),
(849, 'Which poet wrote "Howl"?', 9),
(850, 'Which author is known for "The Picture of Dorian Gray"?', 9),
(851, 'Which artist is famous for his "Water Lilies" series?', 9),
(852, 'Who wrote the book "Dracula"?', 9),
(853, 'Which artist is best known for his surrealist works like "The Persistence of Memory"?', 9),
(854, 'Who wrote "The Jungle Book"?', 9),
(855, 'Which artist painted "The Kiss"?', 9),
(856, 'What is the title of the famous work by William Blake that includes the line "Tyger Tyger, burning bright"?', 9),
(857, 'Which painter is known for his "The Last Supper"?', 9),
(858, 'Who wrote the novel "Jane Eyre"?', 9),
(859, 'Which novel was written by Aldous Huxley?', 9),
(860, 'Who wrote "The Hobbit"?', 9),
(861, 'Which painter is famous for the "Water Lilies" series?', 9),
(862, 'What is the name of the famous poem by Robert Frost about a snowy evening?', 9),
(863, 'Which author wrote "The Road"?', 9),
(864, 'Who wrote "The Bell Jar"?', 9),
(865, 'Which artist is known for painting "The Garden of Earthly Delights"?', 9),
(866, 'Who wrote the novel "The Shining"?', 9),
(867, 'Which 19th-century poet is known for the work "Ode to a Nightingale"?', 9),
(868, 'Who is known for creating the comic strip "Peanuts"?', 9),
(869, 'Who painted the "Creation of Adam"?', 9),
(870, 'Which artist is famous for painting the "Mona Lisa"?', 9),
(871, 'Which writer is known for the "Chronicles of Narnia"?', 9),
(872, 'Who wrote "Les Misérables"?', 9),
(873, 'Which artist painted "The School of Athens"?', 9),
(874, 'What book is considered the first modern science fiction novel?', 9),
(875, 'Which painter is known for his "Guernica" painting? ', 9),
(876, 'Which author wrote the book "Wuthering Heights"?', 9),
(877, 'Who is the author of "The Hunger Games"?', 9),
(878, 'Who created the fictional universe of "Middle Earth"?', 9),
(879, 'Which novel was written by George Orwell?', 9),
(880, 'Who painted "The Starry Night"?', 9),
 (881, 'Who wrote "The Brothers Karamazov"?', 9),
(882, 'Which artist is known for the "The Persistence of Memory"?', 9),
(883, 'Who wrote "The Trial"?', 9),
(884, 'Which artist is famous for his "Campbell’s Soup Cans"?', 9),
(885, 'Who painted "The Arnolfini Portrait"?', 9),
(886, 'Which famous author wrote "Crime and Punishment"?', 9),
(887, 'Who wrote "The Color Purple"?', 9),
(888, 'Which painter is known for his works in Cubism?', 9),
(889, 'Who wrote "Brave New World"?', 9),
(890, 'Which artist is known for his work "The Scream"?', 9),
(891, 'Who wrote "The Catcher in the Rye"?', 9),
(892, 'Which artist created "The Night Cafe"?', 9),
(893, 'Who wrote "The Grapes of Wrath"?', 9),
(894, 'Which artist is known for the "Sunflowers" painting?', 9),
(895, 'Who wrote "The Great Expectations"?', 9),
(896, 'Which famous poet wrote "The Canterbury Tales"?', 9),
(897, 'Who painted the "The Girl with a Pearl Earring"?', 9),
(898, 'Which writer is famous for his novel "On the Road"?', 9),
(899, 'Who wrote "The Picture of Dorian Gray"?', 9),
(900, 'Which artist painted "The Last Supper"?', 9);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(901, 'Who is the Greek god of the sea?', 10),
(902, 'In Norse mythology, who is the god of thunder?', 10),
(903, 'Which Greek hero fought the Trojan War and killed Hector?', 10),
(904, 'In Egyptian mythology, who is the god of the sun?', 10),
(905, 'Which Roman god is equivalent to the Greek god Zeus?', 10),
(906, 'In Greek mythology, who turned into a spider after being defeated by Athena?', 10),
(907, 'Which Norse god is known for his mischief and trickery?', 10),
(908, 'Who is the ruler of the Greek underworld?', 10),
(909, 'In Egyptian mythology, who is the goddess of love and beauty?', 10),
(910, 'Which hero from Greek mythology performed 12 labors?', 10),
(911, 'In Norse mythology, what is the name of the great hall of the slain warriors?', 10),
(912, 'Who is the Norse god of wisdom?', 10),
(913, 'In Greek mythology, which monster has snakes for hair?', 10),
(914, 'Who was the first woman in Greek mythology, created by the gods?', 10),
(915, 'In Egyptian mythology, who is the god of the afterlife and mummification?', 10),
(916, 'Who is the god of war in Roman mythology?', 10),
(917, 'In Greek mythology, who is the goddess of wisdom and warfare?', 10),
(918, 'Who is the king of the gods in Norse mythology?', 10),
(919, 'In Greek mythology, which god gave fire to humanity?', 10),
(920, 'What animal did the Greek hero Perseus slay?', 10),
(921, 'Which Greek goddess was born from the foam of the sea?', 10),
(922, 'In Norse mythology, who is the god of the sun?', 10),
(923, 'Which Greek god is the god of love?', 10),
(924, 'In Greek mythology, who was turned into a laurel tree?', 10),
(925, 'Who is the god of war in Greek mythology?', 10),
(926, 'Which mythological creature has the body of a lion and the head of a human?', 10),
(927, 'In Roman mythology, who is the goddess of the hunt?', 10),
(928, 'Who was the mother of the Greek hero Achilles?', 10),
(929, 'In Egyptian mythology, who is the god of the sky?', 10),
(930, 'Which Greek goddess is associated with the moon?', 10),
(931, 'Who is the father of the Greek god of war, Ares?', 10),
(932, 'Which god is associated with the underworld in both Roman and Greek mythology?', 10),
(933, 'In Greek mythology, who was punished by being turned into a stone?', 10),
(934, 'In Norse mythology, what is the name of the tree that connects all the realms?', 10),
(935, 'Who is the Roman equivalent of the Greek god Hermes?', 10),
(936, 'In Greek mythology, which hero went on an adventure to retrieve the Golden Fleece?', 10),
(937, 'In Norse mythology, what event will cause the end of the world?', 10),
(938, 'Who is the Greek goddess of the harvest?', 10),
(939, 'Which Greek hero killed the Minotaur?', 10),
(940, 'In Roman mythology, who is the god of wine and revelry?', 10),
(941, 'Who is the goddess of the hearth in Greek mythology?', 10),
(942, 'In Norse mythology, who is the wolf that will kill Odin during Ragnarok?', 10),
(943, 'Who was the Greek goddess of the hunt and wilderness?', 10),
(944, 'In Greek mythology, which titan was condemned to hold up the sky?', 10),
(945, 'Who is the Greek goddess of love and beauty?', 10),
(946, 'In Egyptian mythology, which goddess was associated with childbirth and fertility?', 10),
(947, 'Who is the Greek god of medicine?', 10),
(948, 'In Norse mythology, who is the mother of the god Balder?', 10),
(949, 'Who was the Greek hero that fought against the Trojans and killed Hector?', 10),
(950, 'Who was the Roman god of agriculture and father of Romulus and Remus?', 10),
(951, 'In Greek mythology, who was the father of Persephone?', 10),
(952, 'Which mythological creature is a half-man, half-horse in Greek mythology?', 10),
(953, 'In Norse mythology, what creature is associated with Loki?', 10),
(954, 'In Greek mythology, who turned into a tree to escape the god Apollo?', 10),
(955, 'Who was the Roman god of the sea?', 10),
(956, 'In Greek mythology, which hero used a bow and arrow to kill Medusa?', 10),
(957, 'Who was the wife of Zeus in Greek mythology?', 10),
(958, 'Which Greek god is associated with wine and drunkenness?', 10),
(959, 'In Norse mythology, who is the god of the dead?', 10),
(960, 'Which god in Greek mythology is known for his ability to turn people into animals?', 10),
(961, 'Who was the Titan god of time in Greek mythology?', 10),
(962, 'In Roman mythology, who is the god of the underworld?', 10),
(963, 'Who was the leader of the Greek gods?', 10),
(964, 'In Norse mythology, which god is associated with the moon?', 10),
(965, 'Who was the mother of Hercules in Greek mythology?', 10),
(966, 'In Greek mythology, who is the god of fire and blacksmithing?', 10),
(967, 'In Egyptian mythology, which god is known for his association with death and the afterlife?', 10),
(968, 'Which Greek hero fought the Hydra and slayed it?', 10),
(969, 'In Norse mythology, what creature is said to survive Ragnarok?', 10),
(970, 'Who is the father of the Greek god Apollo?', 10),
(971, 'In Greek mythology, who was punished to turn to stone for looking at Medusa?', 10),
(972, 'In Roman mythology, who is the goddess of love?', 10),
(973, 'Who was the Greek goddess of wisdom and knowledge?', 10),
(974, 'In Norse mythology, who is the giant wolf that will bring about the end of the world?', 10),
(975, 'Who is the goddess of discord in Greek mythology?', 10),
(976, 'Which Greek hero performed the Twelve Labors?', 10),
(977, 'In Greek mythology, who was the first woman created by the gods?', 10),
(978, 'Who is the father of Athena in Greek mythology?', 10),
(979, 'Who is the Greek god of sleep?', 10),
(980, 'In Roman mythology, who is the god of war?', 10),
(981, 'Which god did the Greeks associate with the harvest?', 10),
(982, 'In Egyptian mythology, who is the god of the moon?', 10),
(983, 'Who was the Greek god of love?', 10),
(984, 'Who killed the Minotaur in Greek mythology?', 10),
(985, 'Who is the goddess of love and beauty in Greek mythology?', 10),
(986, 'In Norse mythology, who is the father of Thor?', 10),
(987, 'In Greek mythology, who was cursed to turn into a statue of stone?', 10),
(988, 'Who was the Greek hero who fought in the Trojan War?', 10),
(989, 'In Egyptian mythology, who is the god of the underworld?', 10),
(990, 'Which Greek god is associated with archery?', 10),
(991, 'In Norse mythology, who is the trickster god?', 10),
(992, 'Who is the god of dreams in Greek mythology?', 10),
(993, 'In Greek mythology, who is the god of music and poetry?', 10),
(994, 'Who was the first god created in Norse mythology?', 10),
(995, 'In Roman mythology, who is the goddess of the hunt?', 10),
(996, 'In Greek mythology, who was the hero that killed Medusa?', 10),
(997, 'Who is the Greek god of war and battle strategy?', 10),
(998, 'In Norse mythology, who is the god of fertility?', 10),
(999, 'In Greek mythology, who was turned into a stag and hunted by his own hounds?', 10),
(1000, 'Who was the god of wealth and the ruler of the dead in Greek mythology?', 10);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(1001, 'Who is known as the "Father of the Nation" in India?', 11),
(1002, 'Which scientist developed the theory of relativity?', 11),
(1003, 'Who is the famous Italian artist known for painting the Mona Lisa?', 11),
(1004, 'Which American civil rights leader delivered the "I Have a Dream" speech?', 11),
(1005, 'Who was the first female prime minister of the United Kingdom?', 11),
(1006, 'Which famous physicist is known for his work on quantum mechanics and the uncertainty principle?', 11),
(1007, 'Who was the first president of the United States?', 11),
(1008, 'Which famous actor starred in "The Godfather" and "Scarface"?', 11),
(1009, 'Which British author wrote the "Harry Potter" series?', 11),
(1010, 'Who was the famous 19th-century poet and writer of "The Raven" and "The Tell-Tale Heart"?', 11),
(1011, 'Which famous artist is known for his surrealist paintings such as "The Persistence of Memory"?', 11),
(1012, 'Which American author wrote "Moby-Dick"?', 11),
(1013, 'Who was the first woman to fly solo across the Atlantic Ocean?', 11),
(1014, 'Which scientist is famous for discovering the structure of DNA?', 11),
(1015, 'Who was the leader of the civil rights movement and the first African American to receive the Nobel Peace Prize?', 11),
(1016, 'Which actor is known for playing the role of Captain Jack Sparrow in the "Pirates of the Caribbean" series?', 11),
(1017, 'Who was the first African American president of the United States?', 11),
(1018, 'Which famous musician is known for hits like "Imagine" and "Let It Be" as a member of The Beatles?', 11),
(1019, 'Who was the first person to walk on the moon?', 11),
(1020, 'Which French philosopher is known for his works on existentialism, including "Being and Nothingness"?', 11),
(1021, 'Who is known for his theory of evolution and wrote "On the Origin of Species"?', 11),
(1022, 'Which famous mathematician developed the principles of calculus?', 11),
(1023, 'Who is known as the "Queen of Soul" and is famous for songs like "Respect"?', 11),
(1024, 'Who was the first woman to win a Nobel Prize?', 11),
(1025, 'Which famous inventor is credited with creating the telephone?', 11),
(1026, 'Who was the first woman to win the Fields Medal in mathematics?', 11),
(1027, 'Which famous artist is known for his "Guernica" painting?', 11),
(1028, 'Who was the "Iron Lady" and served as the first female Prime Minister of the United Kingdom?', 11),
(1029, 'Which British author is known for writing "Pride and Prejudice"?', 11),
(1030, 'Which famous musician is known for composing "The Four Seasons"?', 11),
(1031, 'Which scientist is known for his contributions to electricity and magnetism, including the invention of the electric motor?', 11),
(1032, 'Who was the first woman to serve as the Prime Minister of India?', 11),
(1033, 'Which famous scientist developed the laws of motion and gravitation?', 11),
(1034, 'Which actor is famous for his role in "Titanic" and "Inception"?', 11),
(1035, 'Who was the famous leader of the Nazi party in Germany?', 11),
(1036, 'Which Indian leader was known for his role in India’s independence movement and his philosophy of nonviolent resistance?', 11),
(1037, 'Which famous writer is known for creating the detective Sherlock Holmes?', 11),
(1038, 'Which world leader is famous for his "New Deal" policies during the Great Depression?', 11),
(1039, 'Which famous musician is known for his "Thriller" album?', 11),
(1040, 'Who was the famous French military leader who became emperor of France?', 11),
(1041, 'Which famous philosopher wrote "The Republic" and is known as one of the founders of Western philosophy?', 11),
(1042, 'Which American actress is famous for her role in "Breakfast at Tiffany\'s" and "Roman Holiday"?', 11),
(1043, 'Who was the famous Russian author of "War and Peace" and "Anna Karenina"?', 11),
(1044, 'Which famous civil rights leader is known for the Montgomery Bus Boycott and the Selma March?', 11),
(1045, 'Who is the famous mathematician and physicist known for his work on the theory of relativity and quantum mechanics?', 11),
(1046, 'Which famous painter is known for his "Starry Night" painting?', 11),
(1047, 'Who is the famous activist known for her advocacy for education for girls and women’s rights in Pakistan?', 11),
(1048, 'Which Nobel-winning author wrote "One Hundred Years of Solitude"?', 11),
(1049, 'Which famous football player is known for his "Hand of God" goal?', 11),
(1050, 'Who is the famous physicist who contributed to the development of quantum mechanics and won the Nobel Prize?', 11),
(1051, 'Which famous scientist is known for his theory of electromagnetism and the invention of the light bulb?', 11),
(1052, 'Which American actress is known for her role in "The Hunger Games" series?', 11),
(1053, 'Which philosopher is known for his theory of the "social contract" in political philosophy?', 11),
(1054, 'Which famous painter is known for his surrealistic works, including "The Elephants"?', 11),
(1055, 'Who was the famous British leader during World War II?', 11),
(1056, 'Which famous American singer is known for the songs "Hound Dog" and "Jailhouse Rock"?', 11),
(1057, 'Who was the famous author of "The Catcher in the Rye"?', 11),
(1058, 'Which famous American singer-songwriter is known for songs like "Blowin\' in the Wind" and "The Times They Are A-Changin\'"?', 11),
(1059, 'Who is known as the "Father of Modern Chemistry" and is credited with discovering oxygen?', 11),
(1060, 'Who was the famous Russian ballerina known for her incredible performances and technical prowess?', 11),
(1061, 'Which actress played Hermione Granger in the "Harry Potter" film series?', 11),
(1062, 'Who is the famous Chinese revolutionary leader who founded the People\'s Republic of China?', 11),
(1063, 'Which famous American playwright wrote "A Streetcar Named Desire" and "The Glass Menagerie"?', 11),
(1064, 'Which famous Greek philosopher was known for his Socratic method of teaching?', 11),
(1065, 'Which famous English scientist is known for discovering the laws of inheritance?', 11),
(1066, 'Who was the famous founder of the social media platform Facebook?', 11),
(1067, 'Which famous actress is known for her role in "The Devil Wears Prada" and "Les Misérables"?', 11),
(1068, 'Which famous English author is known for his works "1984" and "Animal Farm"?', 11),
(1069, 'Which leader is known for being the first president of South Africa after the apartheid era?', 11),
(1070, 'Who was the famous French resistance leader during World War II?', 11),
(1071, 'Which famous American actor starred in "The Pursuit of Happyness" and "Men in Black"?', 11),
(1072, 'Which famous composer is known for his "Symphony No. 9" and "Moonlight Sonata"?', 11),
(1073, 'Who is the famous Swiss psychiatrist known for his theory of archetypes and the collective unconscious?', 11),
(1074, 'Which famous poet is known for his work "The Divine Comedy"?', 11),
(1075, 'Which famous American activist is known for her leadership in the Women\'s Suffrage movement?', 11),
(1076, 'Which famous British author is known for creating the fantasy world of "Narnia"?', 11),
(1077, 'Which famous French author is known for writing "Les Misérables" and "The Hunchback of Notre-Dame"?', 11),
(1078, 'Which famous artist is known for his abstract expressionist works, including "No. 5, 1948"?', 11),
(1079, 'Which famous Mexican artist is known for her self-portraits and surrealist paintings?', 11),
(1080, 'Who was the famous English playwright known for writing "Romeo and Juliet" and "Hamlet"?', 11),
(1081, 'Which famous physicist is known for his work on the theory of magnetism and the development of quantum electrodynamics?', 11),
(1082, 'Who was the famous American civil rights leader known for the slogan "Black Power"?', 11),
(1083, 'Which famous British author is known for writing "The Hobbit" and "The Lord of the Rings"?', 11),
(1084, 'Who was the famous German composer known for his "Symphony No. 5" and "Für Elise"?', 11),
(1085, 'Which famous American politician served as president from 1961 to 1963?', 11),
(1086, 'Which famous French artist is known for his paintings of ballerinas?', 11),
(1087, 'Who was the famous founder of Microsoft?', 11),
(1088, 'Which famous Russian leader was the first president of the Russian Federation?', 11),
(1089, 'Who is the famous artist known for his "Campbell\'s Soup Cans" series?', 11),
(1090, 'Which famous physicist is known for his contributions to the understanding of radioactivity and nuclear physics?', 11),
(1091, 'Who is the famous British actor known for his role in "Harry Potter" as Professor Dumbledore?', 11),
(1092, 'Which famous civil rights leader was assassinated in 1968 in Memphis, Tennessee?', 11),
(1093, 'Which famous scientist is known for his work in the development of the periodic table?', 11),
(1094, 'Who was the first woman to fly in space?', 11),
(1095, 'Which famous American writer is known for "The Grapes of Wrath" and "Of Mice and Men"?', 11),
(1096, 'Which American actress starred in "Reese Witherspoon" and "Legally Blonde"?', 11),
(1097, 'Which famous Greek philosopher is known for his works on ethics and virtue?', 11),
(1098, 'Which French author wrote "The Stranger" and is known for his philosophy of absurdism?', 11),
(1099, 'Which famous actor played the role of Tony Stark in the "Iron Man" and "Avengers" series?', 11),
(1100, 'Which famous British author is known for creating the detective Sherlock Holmes?', 11);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(1101, 'Which country is home to the iconic Sydney Opera House?', 12),
(1102, 'What is the tallest mountain in the world?', 12),
(1103, 'Which European city is known as the "City of Light"?', 12),
(1104, 'What famous landmark can be found in Paris, France?', 12),
(1105, 'Which country is home to the Great Wall?', 12),
(1106, 'What is the largest country by land area?', 12),
(1107, 'Which famous city is known for its canals and gondolas?', 12),
(1108, 'What is the official language of Brazil?', 12),
(1109, 'Which island nation is known for its unique wildlife and beaches?', 12),
(1110, 'What is the name of the famous temple complex in Cambodia?', 12),
(1111, 'Which country is home to the ancient ruins of Machu Picchu?', 12),
(1112, 'What city is known as the capital of Turkey?', 12),
(1113, 'Which famous archipelago is known as the "Pearl of the Indian Ocean"?', 12),
(1114, 'What famous lake can be found in Canada?', 12),
(1115, 'Which island nation is known for its breathtaking fjords and Northern Lights?', 12),
(1116, 'What is the name of the famous glacier in Argentina?', 12),
(1117, 'Which city is known as the cultural capital of Japan?', 12),
(1118, 'What is the tallest building in the world located?', 12),
(1119, 'Which famous ancient city can be found in Egypt?', 12),
(1120, 'What is the name of the famous mountain range that spans across several countries in South Asia?', 12),
(1121, 'Which island nation is home to the Great Barrier Reef?', 12),
(1122, 'What city is known as the "Big Apple"?', 12),
(1123, 'Which country is home to the Great Pyramids?', 12),
(1124, 'What is the name of the famous waterfall located on the border between the United States and Canada?', 12),
(1125, 'Which island is known as the "Island of Gods"?', 12),
(1126, 'What is the capital city of Thailand?', 12),
(1127, 'Which ancient city is known for its well-preserved Colosseum?', 12),
(1128, 'What is the name of the famous desert located in Egypt?', 12),
(1129, 'Which island nation is known for its beaches and surf culture?', 12),
(1130, 'What is the name of the famous national park in Kenya?', 12),
(1131, 'Which country is home to the Golden Gate Bridge?', 12),
(1132, 'What is the name of the famous national park located in the United States, home to the Grand Canyon?', 12),
(1133, 'Which city is home to the famous landmark, the Eiffel Tower?', 12),
(1134, 'What is the capital city of Australia?', 12),
(1135, 'Which country is known for the Taj Mahal?', 12),
(1136, 'What city is known for its historic Acropolis?', 12),
(1137, 'Which famous island in the Mediterranean is known for its ancient ruins and mythological significance?', 12),
(1138, 'What is the name of the large bay surrounded by the city of Rio de Janeiro?', 12),
(1139, 'Which African country is known for its safaris and wildlife, especially in the Serengeti?', 12),
(1140, 'What is the famous national park in the United States known for its geysers, including Old Faithful?', 12),
(1141, 'Which country is famous for its tulips and windmills?', 12),
(1142, 'What is the name of the famous archaeological site in Italy, once destroyed by the eruption of Mount Vesuvius?', 12),
(1143, 'Which Asian city is known for its skyline, featuring the Marina Bay Sands and the Singapore Flyer?', 12),
(1144, 'What is the name of the famous bridge that connects San Francisco to Marin County?', 12),
(1145, 'Which city is famous for its canals, bicycles, and museums, including the Van Gogh Museum?', 12),
(1146, 'What is the name of the famous mountain located in Japan, known for its iconic symmetrical shape?', 12),
(1147, 'Which island is famous for its unique wildlife, including giant tortoises and marine iguanas?', 12),
(1148, 'What city is home to the famous landmark, the Statue of Liberty?', 12),
(1149, 'Which country is known for the historic city of Petra, a UNESCO World Heritage site?', 12),
(1150, 'What is the name of the famous tower located in Pisa, Italy?', 12),
(1151, 'Which country is home to the famous Victoria Falls?', 12),
(1152, 'What city is known for the historic Kremlin and Red Square?', 12),
(1153, 'Which country is famous for its ancient city of Babylon?', 12),
(1154, 'What is the name of the famous canyon located in Arizona, United States?', 12),
(1155, 'Which country is home to the famous Machu Picchu ruins?', 12),
(1156, 'What is the name of the famous island located in the South Pacific, known for its moai statues?', 12),
(1157, 'Which country is home to the Galápagos Islands?', 12),
(1158, 'What is the name of the famous theme park located in Orlando, Florida?', 12),
(1159, 'Which country is home to the famous city of Venice?', 12),
(1160, 'What city is known for its iconic Hollywood sign?', 12),
(1161, 'Which country is home to the famous city of Marrakech, known for its souks and palaces?', 12),
(1162, 'What is the name of the famous statue in Rio de Janeiro, Brazil?', 12),
(1163, 'Which Asian country is home to the ancient city of Angkor Wat?', 12),
(1164, 'What is the name of the famous temple complex located in India, known for its massive stone carvings?', 12),
(1165, 'Which country is known for the historic city of Dubrovnik, a UNESCO World Heritage site?', 12),
(1166, 'What is the name of the famous natural rock formation in Arizona, known as the Monument Valley?', 12),
(1167, 'Which famous city is home to the historic Big Ben clock tower?', 12),
(1168, 'What is the name of the famous tropical island destination in the Philippines?', 12),
(1169, 'Which island is famous for its unique volcanic landscapes and the Blue Lagoon?', 12),
(1170, 'What city is known for its medieval castle and the famous Charles Bridge?', 12),
(1171, 'Which country is known for its historic city of Prague and its impressive Old Town?', 12),
(1172, 'What is the name of the famous national park in Tanzania known for its annual wildebeest migration?', 12),
(1173, 'Which country is home to the famous city of Cairo, with its pyramids and Sphinx?', 12),
(1174, 'What city is famous for the Christ the Redeemer statue overlooking the bay?', 12),
(1175, 'Which island is famous for its crystal-clear waters and luxury resorts, located in the Maldives?', 12),
(1176, 'What country is home to the famous ruins of Chichen Itza?', 12),
(1177, 'What is the name of the famous palace in Versailles, France?', 12),
(1178, 'Which famous city is known for the Alhambra palace and the historic Moorish architecture?', 12),
(1179, 'What country is home to the historic city of Kyoto, known for its temples and gardens?', 12),
(1180, 'Which country is home to the famous Andes Mountains?', 12),
(1181, 'What is the name of the famous tropical island located in Hawaii?', 12),
(1182, 'Which city is known for its historic Parthenon and Acropolis?', 12),
(1183, 'What country is home to the famous city of Cape Town and Table Mountain?', 12),
(1184, 'What is the name of the famous beach in Thailand known for its clear waters and limestone cliffs?', 12),
(1185, 'Which country is known for its famous Blue Mosque in Istanbul?', 12),
(1186, 'What is the name of the famous desert located in southern California, USA?', 12),
(1187, 'Which island nation is known for its tea plantations and the ancient Sigiriya rock fortress?', 12),
(1188, 'Which country is home to the famous Mount Kilimanjaro?', 12),
(1189, 'What city is known for its historic Brandenburg Gate?', 12),
(1190, 'What is the name of the famous resort city in Nevada known for its casinos and entertainment?', 12),
(1191, 'Which country is home to the famous Iguazu Falls?', 12),
(1192, 'What is the name of the famous desert located in Northern Africa?', 12),
(1193, 'Which country is home to the famous Monteverde Cloud Forest?', 12),
(1194, 'What is the name of the famous vineyard region in France known for its wine production?', 12),
(1195, 'Which country is known for its ancient city of Petra and the Dead Sea?', 12),
(1196, 'What city is famous for its Burj Khalifa skyscraper?', 12),
(1197, 'Which country is home to the famous Mont-Saint-Michel?', 12),
(1198, 'What is the name of the famous national park in the Canadian Rockies?', 12),
(1199, 'Which country is known for the stunning city of Queenstown, surrounded by lakes and mountains?', 12),
(1200, 'What city is famous for the historic Colosseum and Roman Forum?', 12);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(1201, 'What is the term for the process of learning through observation and imitation?', 13),
(1202, 'Which psychological concept refers to the ability to adapt to new situations and learn from experience?', 13),
(1203, 'Who is known as the father of modern psychology?', 13),
(1204, 'What does the acronym "IQ" stand for in psychology?', 13),
(1205, 'Which psychological disorder is characterized by persistent feelings of sadness and loss of interest?', 13),
(1206, 'What is the term for the process by which people change their attitudes or behavior in response to social influence?', 13),
(1207, 'Which part of the brain is primarily involved in decision-making and problem-solving?', 13),
(1208, 'What is the term for the tendency to attribute personal success to internal factors and failures to external factors?', 13),
(1209, 'In psychology, what is the "fight or flight" response?', 13),
(1210, 'Which famous psychologist is known for his work on classical conditioning?', 13),
(1211, 'What is the psychological term for a fear of social situations?', 13),
(1212, 'Which psychological theory emphasizes the role of unconscious desires and conflicts in human behavior?', 13),
(1213, 'What is the term for the mental process of organizing, interpreting, and understanding sensory information?', 13),
(1214, 'What is the term for a psychological phenomenon where people remember the first and last items best in a list?', 13),
(1215, 'Which mental health disorder is characterized by excessive worry and fear about everyday situations?', 13),
(1216, 'What is the name of the psychological test developed to measure intelligence?', 13),
(1217, 'What term describes a defense mechanism where a person shifts emotional feelings from the original source to a safer target?', 13),
(1218, 'Which psychological theory focuses on the stages of moral development?', 13),
(1219, 'What is the concept of “cognitive dissonance” in psychology?', 13),
(1220, 'Who developed the hierarchy of needs theory in psychology?', 13),
(1221, 'What is the term for a mental disorder characterized by difficulty in maintaining attention and hyperactivity?', 13),
(1222, 'Which type of learning involves associations between stimuli and responses?', 13),
(1223, 'What is the term for a psychological test that measures knowledge, skills, and ability in a particular area?', 13),
(1224, 'Which psychological disorder is characterized by alternating episodes of depression and mania?', 13),
(1225, 'What is the term for the ability to understand and share the feelings of others?', 13),
(1226, 'Which part of the brain is responsible for regulating emotions and memory?', 13),
(1227, 'What is the term for a memory bias in which individuals recall events as being more consistent with their current beliefs than they were at the time?', 13),
(1228, 'What is the term for the process of remembering information by breaking it into smaller, more manageable parts?', 13),
(1229, 'Which psychological theory suggests that people are motivated by the need to achieve their full potential?', 13),
(1230, 'What is the psychological phenomenon where individuals conform to group norms in a social setting?', 13),
(1231, 'Which type of memory involves the ability to recall information about facts and events?', 13),
(1232, 'What is the term for the fear of being in places where escape might be difficult?', 13),
(1233, 'What is the name of the psychological test that assesses an individual’s emotional state and well-being?', 13),
(1234, 'Which term refers to the loss of memory, often related to stress or trauma?', 13),
(1235, 'What is the term for a mental disorder where a person experiences delusions, hallucinations, and disorganized thinking?', 13),
(1236, 'Which psychological term describes a type of learning where an individual observes and imitates others?', 13),
(1237, 'What is the process by which one person influences the attitudes or behaviors of others?', 13),
(1238, 'What is the term for a person’s enduring pattern of thinking, feeling, and behaving?', 13),
(1239, 'Which psychological term refers to the reduction in the response to a stimulus after repeated exposure?', 13),
(1240, 'What is the term for a psychological condition where an individual experiences excessive fear of a specific object or situation?', 13),
(1241, 'Which famous psychologist developed the concept of the "collective unconscious"?', 13),
(1242, 'What is the term for a state of mental or physical relaxation and rest?', 13),
(1243, 'What is the term for the mental process of creating a mental image or representation of a situation?', 13),
(1244, 'What is the term for the study of how individuals develop and change over time?', 13),
(1245, 'Which psychological disorder is characterized by persistent intrusive thoughts and compulsive behaviors?', 13),
(1246, 'What is the term for the tendency to remember only the positive aspects of a situation and forget the negative?', 13),
(1247, 'Which term describes the behavior where people seek out and take on roles in response to societal expectations?', 13),
(1248, 'What is the name of the process by which people make judgments about others based on limited information?', 13),
(1249, 'What is the term for the ability to manage and regulate one’s emotions?', 13),
(1250, 'What is the psychological phenomenon where an individual experiences a sudden realization or insight?', 13),
(1251, 'Which psychological condition involves a loss of touch with reality, resulting in delusions and hallucinations?', 13),
(1252, 'What is the name of the theory that explains the cognitive processes involved in decision-making?', 13),
(1253, 'What is the term for an emotional attachment to a particular place or experience?', 13),
(1254, 'Which psychological approach emphasizes the role of unconscious motives and early childhood experiences in shaping behavior?', 13),
(1255, 'What is the name of the psychological test used to evaluate a person’s personality traits and characteristics?', 13),
(1256, 'What is the term for the mental process of problem-solving or thinking about something in a new way?', 13),
(1257, 'What is the name of the psychological phenomenon where a person believes that everyone else shares their views or experiences?', 13),
(1258, 'Which psychological condition is characterized by prolonged feelings of sadness, hopelessness, and a lack of interest in life?', 13),
(1259, 'What is the name of the disorder characterized by a loss of interest in everyday activities, changes in appetite, and sleep disturbances?', 13),
(1260, 'Which psychological theory explains how individuals acquire behaviors through reinforcement and punishment?', 13),
(1261, 'What is the term for the psychological process of adjusting one s perceptions or behavior to meet the demands of a situation?', 13),
(1262, 'What is the psychological phenomenon where people feel a sense of achievement from helping others?', 13),
(1263, 'What is the name of the condition where individuals feel a persistent sense of unease or worry?', 13),
(1264, 'What is the psychological theory that focuses on the role of cognitive development in children?', 13),
(1265, 'Which psychological term refers to a strategy of coping with stress that involves direct action to solve the problem?', 13),
(1266, 'What is the term for the mental process of concentrating on one specific task or thought?', 13),
(1267, 'Which famous psychologist is known for his research on cognitive development in children?', 13),
(1268, 'What is the term for a type of learning in which an individual learns by associating a neutral stimulus with a response?', 13),
(1269, 'What is the name of the process by which humans interpret and make sense of the world around them?', 13),
(1270, 'Which type of memory involves the ability to remember personal experiences and events?', 13),
(1271, 'What is the psychological term for the brain’s ability to change and adapt after injury or damage?', 13),
(1272, 'Which type of psychological therapy is based on changing negative thought patterns?', 13),
(1273, 'What is the term for the psychological process of maintaining emotional balance during challenging situations?', 13),
(1274, 'What is the name of the theory that states human beings are motivated by a desire for self-fulfillment?', 13),
(1275, 'What is the psychological term for a highly focused state of concentration and immersion in an activity?', 13),
(1276, 'Which psychological theory describes how unconscious desires influence behavior?', 13),
(1277, 'What is the term for the phenomenon where individuals believe they are better than average at certain tasks?', 13),
(1278, 'What is the psychological term for the mental discomfort that arises from holding conflicting beliefs or attitudes?', 13),
(1279, 'What is the psychological concept that refers to our ability to perform actions automatically after repetition?', 13),
(1280, 'What is the term for a method of resolving conflicts through peaceful discussions and negotiations?', 13),
(1281, 'What is the term for the psychological bias where people see their own behaviors as more justified than those of others?', 13),
(1282, 'What is the name of the psychological approach that focuses on understanding emotions and relationships?', 13),
(1283, 'What is the term for the mental tendency to focus on one aspect of a situation while ignoring others?', 13),
(1284, 'Which psychological phenomenon refers to the tendency of individuals to seek approval and acceptance from others?', 13),
(1285, 'What is the psychological term for the tendency to act in ways that reflect a group’s norms and values?', 13),
(1286, 'What is the name of the process by which people assess their abilities and self-worth in relation to others?', 13),
(1287, 'What is the term for the psychological condition where individuals have a distorted view of their body size or shape?', 13),
(1288, 'What is the psychological concept that explains the process of forgetting information over time?', 13),
(1289, 'What is the term for a defense mechanism that involves denying unpleasant aspects of reality?', 13),
(1290, 'What is the term for the mental process of anticipating and planning for future challenges or opportunities?', 13),
(1291, 'What is the psychological concept that suggests people behave in ways that are consistent with their self-image?', 13),
(1292, 'What is the name of the psychological theory that suggests all humans are motivated by a need to fulfill basic needs?', 13),
(1293, 'What is the psychological condition in which individuals experience overwhelming anxiety and worry about specific issues?', 13),
(1294, 'What is the term for the process of changing one’s thinking and actions in response to new information?', 13),
(1295, 'What is the psychological phenomenon where people experience relief after expressing their emotions or feelings?', 13),
(1296, 'What is the term for the practice of focusing attention and relaxing the body through deep breathing and visualization?', 13),
(1297, 'What is the psychological term for the desire to achieve self-actualization and personal growth?', 13),
(1298, 'What is the term for the mental process of managing and understanding one’s thoughts and feelings?', 13),
(1299, 'Which psychologist is best known for his work on classical conditioning?', 13),
(1300, 'What is the name of the defense mechanism where individuals refuse to accept reality or facts?', 13);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `text`, `category_id`) VALUES
(1301, 'What is the term for the hobby of collecting stamps?', 14),
(1302, 'Which hobby involves creating miniature models from wood, metal, or plastic?', 14),
(1303, 'What is the practice of growing plants for ornamental purposes called?', 14),
(1304, 'Which hobby involves knitting yarn into fabric or items like scarves and hats?', 14),
(1305, 'What is the name for the hobby of collecting postcards from different places?', 14),
(1306, 'Which hobby involves creating art by applying paint to a surface, often canvas?', 14),
(1307, 'What is the term for the hobby of solving puzzles, typically with interlocking pieces?', 14),
(1308, 'Which hobby involves playing a musical instrument?', 14),
(1309, 'What is the name for the hobby of collecting coins?', 14),
(1310, 'Which hobby involves taking photographs, typically with a camera or smartphone?', 14),
(1311, 'What is the term for the hobby of making and designing clothes?', 14),
(1312, 'What is the name of the hobby where individuals go fishing for recreational purposes?', 14),
(1313, 'Which hobby involves building and flying model airplanes?', 14),
(1314, 'What is the name of the hobby where people decorate pottery or ceramics?', 14),
(1315, 'Which hobby involves creating and playing with miniature train sets?', 14),
(1316, 'What is the term for the hobby of hiking and exploring nature on foot?', 14),
(1317, 'Which hobby involves arranging flowers to create decorative displays?', 14),
(1318, 'What is the name of the hobby that involves collecting comic books?', 14),
(1319, 'Which hobby involves playing chess or other strategy games?', 14),
(1320, 'What is the term for the hobby of collecting action figures or figurines?', 14),
(1321, 'Which hobby involves assembling and flying model rockets?', 14),
(1322, 'What is the term for the hobby of carving or shaping wood?', 14),
(1323, 'Which hobby involves growing a collection of bonsai trees?', 14),
(1324, 'What is the name of the hobby of bird watching?', 14),
(1325, 'Which hobby involves collecting antiques?', 14),
(1326, 'What is the hobby of making jewelry from beads, metals, or other materials?', 14),
(1327, 'Which hobby involves creating and maintaining aquariums with fish and aquatic plants?', 14),
(1328, 'What is the term for the hobby of creating sculptures or art from clay?', 14),
(1329, 'Which hobby involves performing magic tricks for entertainment?', 14),
(1330, 'What is the hobby of creating and collecting models of buildings or structures?', 14),
(1331, 'Which hobby involves doing DIY (do-it-yourself) projects around the home?', 14),
(1332, 'What is the term for the hobby of collecting dolls?', 14),
(1333, 'Which hobby involves studying the stars, planets, and other celestial bodies?', 14),
(1334, 'What is the term for the hobby of making soap or candles?', 14),
(1335, 'Which hobby involves creating and solving crosswords or word puzzles?', 14),
(1336, 'What is the hobby of knitting or crocheting to create handmade items?', 14),
(1337, 'Which hobby involves making and flying kites?', 14),
(1338, 'What is the term for the hobby of collecting vinyl records or CDs?', 14),
(1339, 'Which hobby involves engaging in amateur radio activities?', 14),
(1340, 'What is the hobby of performing or watching live theater or drama productions?', 14),
(1341, 'Which hobby involves crafting items from leather?', 14),
(1342, 'What is the term for the hobby of collecting rare or vintage books?', 14),
(1343, 'Which hobby involves creating mosaics with tiles, glass, or other materials?', 14),
(1344, 'What is the name of the hobby that involves creating and designing websites?', 14),
(1345, 'Which hobby involves playing board games with friends or family?', 14),
(1346, 'What is the term for the hobby of making and designing greeting cards?', 14),
(1347, 'Which hobby involves creating and solving riddles or brainteasers?', 14),
(1348, 'What is the name of the hobby of engaging in martial arts?', 14),
(1349, 'Which hobby involves creating and flying drones?', 14),
(1350, 'What is the term for the hobby of creating digital art or illustrations on a computer?', 14),
(1351, 'Which hobby involves creating paper sculptures or models?', 14),
(1352, 'What is the name of the hobby of collecting rare plants or flowers?', 14),
(1353, 'Which hobby involves collecting and studying rocks or minerals?', 14),
(1354, 'What is the term for the hobby of collecting and sorting postcards from different places?', 14),
(1355, 'Which hobby involves the collection and study of fossils?', 14),
(1356, 'What is the name of the hobby that involves creating and playing board games?', 14),
(1357, 'Which hobby involves creating detailed miniature figures or landscapes?', 14),
(1358, 'What is the hobby of learning new languages or studying linguistics?', 14),
(1359, 'What is the term for the hobby of writing short stories, novels, or poetry?', 14),
(1360, 'Which hobby involves creating art or sculptures from recycled materials?', 14),
(1361, 'What is the name of the hobby of bird feeding and maintaining birdhouses?', 14),
(1362, 'Which hobby involves creating artwork using charcoal or pastels?', 14),
(1363, 'What is the hobby of building model ships?', 14),
(1364, 'Which hobby involves attending or watching live music concerts or performances?', 14),
(1365, 'What is the name of the hobby of collecting postcards from different countries?', 14),
(1366, 'Which hobby involves creating jewelry from wire, beads, and gemstones?', 14),
(1367, 'What is the term for the hobby of creating and collecting paper art?', 14),
(1368, 'Which hobby involves making and designing puzzles?', 14),
(1369, 'What is the name of the hobby that involves collecting action figures or toys?', 14),
(1370, 'Which hobby involves learning about and identifying different species of insects?', 14),
(1371, 'What is the term for the hobby of performing DIY repairs around the house?', 14),
(1372, 'Which hobby involves learning about and experimenting with photography techniques?', 14),
(1373, 'What is the term for the hobby of creating elaborate model train layouts?', 14),
(1374, 'Which hobby involves the collection and identification of seashells?', 14),
(1375, 'What is the name of the hobby that involves restoring vintage furniture?', 14),
(1376, 'Which hobby involves creating and managing a personal blog or online content?', 14),
(1377, 'What is the term for the hobby of collecting various types of postcards?', 14),
(1378, 'Which hobby involves learning about and studying human anatomy or medical history?', 14),
(1379, 'What is the name of the hobby of collecting different types of hats?', 14),
(1380, 'Which hobby involves the study and practice of herbal medicine?', 14),
(1381, 'What is the term for the hobby of making and collecting origami?', 14),
(1382, 'Which hobby involves restoring classic cars or motorcycles?', 14),
(1383, 'What is the name of the hobby that involves organizing and hosting themed parties?', 14),
(1384, 'Which hobby involves working with leather to create handmade items?', 14),
(1385, 'What is the term for the hobby of engaging in geocaching or treasure hunting?', 14),
(1386, 'Which hobby involves the collection and study of old currency?', 14),
(1387, 'What is the hobby of creating and collecting decorative magnets?', 14),
(1388, 'What is the name of the hobby of collecting and trading action figures?', 14),
(1389, 'Which hobby involves the art of brewing beer at home?', 14),
(1390, 'What is the term for the hobby of growing mushrooms or other fungi?', 14),
(1391, 'Which hobby involves the art of creating and decorating cakes?', 14),
(1392, 'What is the term for the hobby of making and collecting beadwork?', 14),
(1393, 'Which hobby involves painting or drawing with watercolor?', 14),
(1394, 'What is the name of the hobby of learning about and practicing astrology?', 14),
(1395, 'Which hobby involves designing and creating model landscapes for hobby trains?', 14),
(1396, 'What is the term for the hobby of creating and maintaining terrariums or indoor gardens?', 14),
(1397, 'Which hobby involves collecting or growing rare or exotic plants?', 14),
(1398, 'What is the name of the hobby that involves making pottery or ceramics?', 14),
(1399, 'Which hobby involves the practice of juggling or performing tricks with balls?', 14),
(1400, 'What is the term for the hobby of collecting postcards from different cities?', 14);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO answers (question_id, text, is_correct) VALUES
(101, 'Paris', 1), -- Răspuns corect
(101, 'London', 0),
(101, 'Berlin', 0),
(101, 'Madrid', 0),

(102, 'George Orwell', 1), -- Răspuns corect
(102, 'Aldous Huxley', 0),
(102, 'Ray Bradbury', 0),
(102, 'J.D. Salinger', 0),

(103, 'Pacific Ocean', 1), -- Răspuns corect
(103, 'Atlantic Ocean', 0),
(103, 'Indian Ocean', 0),
(103, 'Arctic Ocean', 0),

(104, 'Mars', 1), -- Răspuns corect
(104, 'Jupiter', 0),
(104, 'Venus', 0),
(104, 'Mercury', 0),

(105, 'Leonardo da Vinci', 1), -- Răspuns corect
(105, 'Michelangelo', 0),
(105, 'Raphael', 0),
(105, 'Donatello', 0),

(106, 'H2O', 1), -- Răspuns corect
(106, 'O2', 0),
(106, 'CO2', 0),
(106, 'NaCl', 0),

(107, '1912', 1), -- Răspuns corect
(107, '1905', 0),
(107, '1920', 0),
(107, '1931', 0),

(108, 'Vatican City', 1), -- Răspuns corect
(108, 'Monaco', 0),
(108, 'San Marino', 0),
(108, 'Liechtenstein', 0),

(109, 'Albert Einstein', 1), -- Răspuns corect
(109, 'Isaac Newton', 0),
(109, 'Niels Bohr', 0),
(109, 'Galileo Galilei', 0),

(110, 'Nile', 1), -- Răspuns corect
(110, 'Amazon', 0),
(110, 'Yangtze', 0),
(110, 'Mississippi', 0),

(111, 'Diamond', 1), -- Răspuns corect
(111, 'Gold', 0),
(111, 'Platinum', 0),
(111, 'Graphite', 0),

(112, 'Yen', 1), -- Răspuns corect
(112, 'Won', 0),
(112, 'Dollar', 0),
(112, 'Euro', 0),

(113, 'Alexander Fleming', 1), -- Răspuns corect
(113, 'Marie Curie', 0),
(113, 'Louis Pasteur', 0),
(113, 'Joseph Lister', 0),

(114, 'Mount Everest', 1), -- Răspuns corect
(114, 'K2', 0),
(114, 'Kangchenjunga', 0),
(114, 'Makalu', 0),

(115, 'Sahara Desert', 1), -- Răspuns corect
(115, 'Gobi Desert', 0),
(115, 'Arabian Desert', 0),
(115, 'Kalahari Desert', 0),

(116, 'Japan', 1), -- Răspuns corect
(116, 'China', 0),
(116, 'Korea', 0),
(116, 'Thailand', 0),

(117, 'Charles Babbage', 1), -- Răspuns corect
(117, 'Alan Turing', 0),
(117, 'John von Neumann', 0),
(117, 'Steve Jobs', 0),

(118, 'Avocado', 1), -- Răspuns corect
(118, 'Tomato', 0),
(118, 'Cucumber', 0),
(118, 'Pepper', 0),

(119, 'China', 1), -- Răspuns corect
(119, 'India', 0),
(119, 'USA', 0),
(119, 'Indonesia', 0),

(120, '7', 1), -- Răspuns corect
(120, '6', 0),
(120, '8', 0),
(120, '5', 0),

(121, '0°C', 1), -- Răspuns corect
(121, '32°C', 0),
(121, '-1°C', 0),
(121, '100°C', 0),

(122, '299,792 km/s', 1), -- Răspuns corect
(122, '150,000 km/s', 0),
(122, '400,000 km/s', 0),
(122, '1,080 km/s', 0),

(123, 'Blue whale', 1), -- Răspuns corect
(123, 'Elephant', 0),
(123, 'Giraffe', 0),
(123, 'Hippopotamus', 0),

(124, 'Ottawa', 1), -- Răspuns corect
(124, 'Toronto', 0),
(124, 'Vancouver', 0),
(124, 'Montreal', 0),

(125, 'Hydrogen', 1), -- Răspuns corect
(125, 'Helium', 0),
(125, 'Carbon', 0),
(125, 'Oxygen', 0),

(126, 'Mandarin Chinese', 1), -- Răspuns corect
(126, 'English', 0),
(126, 'Spanish', 0),
(126, 'Hindi', 0),

(127, 'Neil Armstrong', 1), -- Răspuns corect
(127, 'Buzz Aldrin', 0),
(127, 'Yuri Gagarin', 0),
(127, 'Michael Collins', 0),

(128, 'Flour', 1), -- Răspuns corect
(128, 'Sugar', 0),
(128, 'Yeast', 0),
(128, 'Butter', 0),

(129, 'Africa', 1), -- Răspuns corect
(129, 'Asia', 0),
(129, 'Australia', 0),
(129, 'South America', 0),

(130, 'George Washington', 1), -- Răspuns corect
(130, 'Thomas Jefferson', 0),
(130, 'Abraham Lincoln', 0),
(130, 'John Adams', 0),

(131, 'NaCl', 1), -- Răspuns corect
(131, 'KCl', 0),
(131, 'CaCl2', 0),
(131, 'NaCO3', 0),

(132, 'France', 1), -- Răspuns corect
(132, 'Germany', 0),
(132, 'Italy', 0),
(132, 'Spain', 0),

(133, 'Stapes', 1), -- Răspuns corect
(133, 'Femur', 0),
(133, 'Humerus', 0),
(133, 'Ulna', 0),

(134, 'Saturn', 1), -- Răspuns corect
(134, 'Jupiter', 0),
(134, 'Mars', 0),
(134, 'Neptune', 0),

(135, 'Unicorn', 1), -- Răspuns corect
(135, 'Thistle', 0),
(135, 'Lion', 0),
(135, 'Eagle', 0),

(136, '1945', 1), -- Răspuns corect
(136, '1941', 0),
(136, '1939', 0),
(136, '1950', 0),

(137, 'Alexander Graham Bell', 1), -- Răspuns corect
(137, 'Thomas Edison', 0),
(137, 'Nikola Tesla', 0),
(137, 'Samuel Morse', 0),

(138, '12', 1), -- Răspuns corect
(138, '10', 0),
(138, '14', 0),
(138, '16', 0),

(139, 'Great Barrier Reef', 1), -- Răspuns corect
(139, 'Uluru', 0),
(139, 'Sydney Harbour', 0),
(139, 'Kakadu', 0),

(140, '366', 1), -- Răspuns corect
(140, '365', 0),
(140, '364', 0),
(140, '368', 0),

(141, 'Photosynthesis', 1), -- Răspuns corect
(141, 'Respiration', 0),
(141, 'Fermentation', 0),
(141, 'Digestion', 0),

(142, 'Silver', 1), -- Răspuns corect
(142, 'Gold', 0),
(142, 'Copper', 0),
(142, 'Aluminum', 0),

(143, 'Marie Curie', 1), -- Răspuns corect
(143, 'Rosalind Franklin', 0),
(143, 'Ada Lovelace', 0),
(143, 'Jane Goodall', 0),

(144, 'Portuguese', 1), -- Răspuns corect
(144, 'Spanish', 0),
(144, 'English', 0),
(144, 'French', 0),

(145, 'HMS Beagle', 1), -- Răspuns corect
(145, 'Endeavour', 0),
(145, 'Mayflower', 0),
(145, 'Santa Maria', 0),

(146, 'O-', 1), -- Răspuns corect
(146, 'A+', 0),
(146, 'B-', 0),
(146, 'AB+', 0),

(147, 'Cheetah', 1), -- Răspuns corect
(147, 'Leopard', 0),
(147, 'Lion', 0),
(147, 'Jaguar', 0),

(148, 'Poseidon', 1), -- Răspuns corect
(148, 'Zeus', 0),
(148, 'Apollo', 0),
(148, 'Hades', 0),

(149, 'Pound Sterling', 1), -- Răspuns corect
(149, 'Euro', 0),
(149, 'Dollar', 0),
(149, 'Franc', 0),

(150, 'Rice', 1), -- Răspuns corect
(150, 'Fish', 0),
(150, 'Seaweed', 0),
(150, 'Shrimp', 0),

(151, 'Rice', 1), -- Răspuns corect
(151, 'Potato', 0),
(151, 'Corn', 0),
(151, 'Wheat', 0),

(152, 'Kidney', 1), -- Răspuns corect
(152, 'Liver', 0),
(152, 'Heart', 0),
(152, 'Lungs', 0),

(153, 'Isaac Newton', 1), -- Răspuns corect
(153, 'Galileo Galilei', 0),
(153, 'Albert Einstein', 0),
(153, 'Stephen Hawking', 0),

(154, 'Canberra', 1), -- Răspuns corect
(154, 'Sydney', 0),
(154, 'Melbourne', 0),
(154, 'Brisbane', 0),

(155, 'South America', 1), -- Răspuns corect
(155, 'Africa', 0),
(155, 'Asia', 0),
(155, 'Australia', 0),

(156, 'Nitrogen', 1), -- Răspuns corect
(156, 'Oxygen', 0),
(156, 'Carbon Dioxide', 0),
(156, 'Hydrogen', 0),

(157, 'Charles Darwin', 1), -- Răspuns corect
(157, 'Gregor Mendel', 0),
(157, 'Carl Linnaeus', 0),
(157, 'Alfred Russel Wallace', 0),

(158, '8', 1), -- Răspuns corect
(158, '9', 0),
(158, '7', 0),
(158, '10', 0),

(159, 'World Wide Web', 1), -- Răspuns corect
(159, 'Wireless Wide Web', 0),
(159, 'Wide Web World', 0),
(159, 'Web Wide World', 0),

(160, 'Greenland', 1), -- Răspuns corect
(160, 'Madagascar', 0),
(160, 'New Guinea', 0),
(160, 'Borneo', 0),

(161, 'The White House', 1), -- Răspuns corect
(161, 'Buckingham Palace', 0),
(161, 'Elysee Palace', 0),
(161, 'Kremlin', 0),

(162, '5', 1), -- Răspuns corect
(162, '4', 0),
(162, '6', 0),
(162, '7', 0),

(163, 'Diamond', 1), -- Răspuns corect
(163, 'Granite', 0),
(163, 'Quartz', 0),
(163, 'Obsidian', 0),

(164, 'The Milky Way', 1), -- Răspuns corect
(164, 'Andromeda', 0),
(164, 'Sombrero', 0),
(164, 'Black Eye', 0),

(165, '212°F', 1), -- Răspuns corect
(165, '100°F', 0),
(165, '32°F', 0),
(165, '180°F', 0),

(166, 'Rome', 1), -- Răspuns corect
(166, 'Milan', 0),
(166, 'Venice', 0),
(166, 'Naples', 0),

(167, 'Vincent van Gogh', 1), -- Răspuns corect
(167, 'Claude Monet', 0),
(167, 'Pablo Picasso', 0),
(167, 'Salvador Dalí', 0),

(168, 'Uranium', 1), -- Răspuns corect
(168, 'Gold', 0),
(168, 'Platinum', 0),
(168, 'Iron', 0),

(169, 'Sputnik 1', 1), -- Răspuns corect
(169, 'Explorer 1', 0),
(169, 'Voyager 1', 0),
(169, 'Apollo 11', 0),

(170, 'Pacific Ocean', 1), -- Răspuns corect
(170, 'Atlantic Ocean', 0),
(170, 'Indian Ocean', 0),
(170, 'Southern Ocean', 0),

(171, 'Chickpeas', 1), -- Răspuns corect
(171, 'Lentils', 0),
(171, 'Beans', 0),
(171, 'Peas', 0),

(172, 'Michael Jackson', 1), -- Răspuns corect
(172, 'Elvis Presley', 0),
(172, 'Prince', 0),
(172, 'Freddie Mercury', 0),

(173, '1969', 1), -- Răspuns corect
(173, '1965', 0),
(173, '1971', 0),
(173, '1975', 0),

(174, 'Soccer', 1), -- Răspuns corect
(174, 'Basketball', 0),
(174, 'Tennis', 0),
(174, 'Rugby', 0),

(175, 'Cherry Blossom', 1), -- Răspuns corect
(175, 'Lotus', 0),
(175, 'Rose', 0),
(175, 'Orchid', 0),

(176, 'Isaac Newton', 1), -- Răspuns corect
(176, 'Galileo Galilei', 0),
(176, 'Albert Einstein', 0),
(176, 'Stephen Hawking', 0),

(177, 'Parrot', 1), -- Răspuns corect
(177, 'Crow', 0),
(177, 'Owl', 0),
(177, 'Pigeon', 0),

(178, 'Queen Elizabeth II', 1), -- Răspuns corect
(178, 'Queen Victoria', 0),
(178, 'King George V', 0),
(178, 'King Edward VII', 0),

(179, 'Gold', 1), -- Răspuns corect
(179, 'Silver', 0),
(179, 'Platinum', 0),
(179, 'Iron', 0),

(180, '1989', 1), -- Răspuns corect
(180, '1991', 0),
(180, '1987', 0),
(180, '1993', 0),

(181, 'Pretoria', 1), -- Răspuns corect
(181, 'Cape Town', 0),
(181, 'Johannesburg', 0),
(181, 'Durban', 0),

(182, 'Italy', 1), -- Răspuns corect
(182, 'Greece', 0),
(182, 'Spain', 0),
(182, 'France', 0),

(183, 'Bacteria', 1), -- Răspuns corect
(183, 'Virus', 0),
(183, 'Fungus', 0),
(183, 'Protozoa', 0),

(184, 'Giraffe', 1), -- Răspuns corect
(184, 'Elephant', 0),
(184, 'Zebra', 0),
(184, 'Lion', 0),

(185, 'Amazon Rainforest', 1), -- Răspuns corect
(185, 'Congo Rainforest', 0),
(185, 'Sundarbans', 0),
(185, 'Daintree Rainforest', 0),

(186, 'Moscow', 1), -- Răspuns corect
(186, 'Saint Petersburg', 0),
(186, 'Kazan', 0),
(186, 'Sochi', 0),

(187, 'Celsius', 1), -- Răspuns corect
(187, 'Fahrenheit', 0),
(187, 'Kelvin', 0),
(187, 'Rankine', 0),

(188, 'Crocodile', 1), -- Răspuns corect
(188, 'Alligator', 0),
(188, 'Komodo Dragon', 0),
(188, 'Iguana', 0),

(189, 'Venus', 1), -- Răspuns corect
(189, 'Earth', 0),
(189, 'Mars', 0),
(189, 'Mercury', 0),

(190, '1923', 1), -- Răspuns corect
(190, '1919', 0),
(190, '1931', 0),
(190, '1935', 0),

(191, 'Africa', 1), -- Răspuns corect
(191, 'Asia', 0),
(191, 'Australia', 0),
(191, 'South America', 0),

(192, 'C++', 1), -- Răspuns corect
(192, 'Java', 0),
(192, 'Python', 0),
(192, 'HTML', 0),

(193, 'Eagle', 1), -- Răspuns corect
(193, 'Hawk', 0),
(193, 'Falcon', 0),
(193, 'Vulture', 0),

(194, 'Fossil Fuels', 1), -- Răspuns corect
(194, 'Solar Power', 0),
(194, 'Wind Power', 0),
(194, 'Nuclear Power', 0),

(195, 'Blue', 1), -- Răspuns corect
(195, 'Red', 0),
(195, 'Yellow', 0),
(195, 'Green', 0),

(196, '12', 1), -- Răspuns corect
(196, '10', 0),
(196, '14', 0),
(196, '16', 0),

(197, 'Canada', 1), -- Răspuns corect
(197, 'USA', 0),
(197, 'Russia', 0),
(197, 'China', 0),

(198, '5', 1), -- Răspuns corect
(198, '4', 0),
(198, '6', 0),
(198, '7', 0),

(199, 'Switzerland', 1), -- Răspuns corect
(199, 'Germany', 0),
(199, 'France', 0),
(199, 'Italy', 0),

(200, 'Louvre Museum', 1), -- Răspuns corect
(200, 'British Museum', 0),
(200, 'Vatican Museums', 0),
(200, 'Metropolitan Museum of Art', 0);

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2024-11-15 16:12:58
