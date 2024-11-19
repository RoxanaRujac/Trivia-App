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


-- Dump completed on 2024-11-15 16:12:58