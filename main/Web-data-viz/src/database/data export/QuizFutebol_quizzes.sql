-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: QuizFutebol
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `idQuizzes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `total_perguntas` int DEFAULT NULL,
  `fkCategoria` int NOT NULL,
  PRIMARY KEY (`idQuizzes`),
  KEY `fkCategoria` (`fkCategoria`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`fkCategoria`) REFERENCES `categorias` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,'Quiz sobre o Brasileirão',10,1),(2,'Quiz sobre a Copa do Brasil',10,1),(3,'Quiz sobre o Corinthians',10,1),(4,'Quiz sobre o Flamengo',10,1),(5,'Quiz sobre o São Paulo',10,1),(6,'Quiz sobre o Palmeiras',10,1),(7,'Quiz sobre o Santos',10,1),(8,'Quiz sobre o Vasco',10,1),(9,'Quiz sobre o Botafogo',10,1),(10,'Quiz sobre o Fluminense',10,1),(11,'Quiz sobre o Atlético-MG',10,1),(12,'Quiz sobre o Cruzeiro',10,1),(13,'Quiz sobre o Internacional',10,1),(14,'Quiz sobre o Grêmio',10,1),(15,'Quiz sobre o Athletico Paranaense',10,1),(16,'Quiz sobre o Coritiba',10,1),(17,'Quiz sobre a Libertadores',10,2),(18,'Quiz sobre a Copa Sul-Americana',10,2),(19,'Quiz sobre o Campeonato Argentino',10,2),(20,'Quiz sobre o Campeonato Chileno',10,2),(21,'Quiz sobre o Campeonato Colombiano',10,2),(22,'Quiz sobre o Campeonato Uruguaio',10,2),(23,'Quiz sobre a Champions League',10,3),(24,'Quiz sobre a Europa League',10,3),(25,'Quiz sobre a Conference League',10,3),(26,'Quiz sobre a Premier League',10,4),(27,'Quiz sobre a FA Cup',10,4),(28,'Quiz sobre o Liverpool',10,4),(29,'Quiz sobre o Manchester United',10,4),(30,'Quiz sobre o Chelsea',10,4),(31,'Quiz sobre o Arsenal',10,4),(32,'Quiz sobre o Manchester City',10,4),(33,'Quiz sobre o Tottenham',10,4),(34,'Quiz sobre a LaLiga',10,5),(35,'Quiz sobre a Copa Del Rey',10,5),(36,'Quiz sobre o Barcelona',10,5),(37,'Quiz sobre o Real Madrid',10,5),(38,'Quiz sobre o Atlético de Madrid',10,5),(39,'Quiz sobre a Serie A Italiana',10,6),(40,'Quiz sobre a Coppa Italia',10,6),(41,'Quiz sobre a Juventus',10,6),(42,'Quiz sobre a Internazionale',10,6),(43,'Quiz sobre o Milan',10,6),(44,'Quiz sobre o Napoli',10,6),(45,'Quiz sobre a Roma',10,6),(46,'Quiz sobre a Lazio',10,6),(47,'Quiz sobre a Bundesliga',10,7),(48,'Quiz sobre a DFB-Pokal',10,7),(49,'Quiz sobre o Bayern de Munique',10,7),(50,'Quiz sobre o Borussia Dortmund',10,7),(51,'Quiz sobre a Ligue One',10,8),(52,'Quiz sobre a Coupe de France',10,8),(53,'Quiz sobre o PSG',10,8),(54,'Quiz sobre o Olympique de Marseille',10,8);
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10  9:47:44
