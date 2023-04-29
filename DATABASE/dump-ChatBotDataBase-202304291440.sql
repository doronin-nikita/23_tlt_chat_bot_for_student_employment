-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ChatBotDataBase
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `вакансии`
--

DROP TABLE IF EXISTS `вакансии`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `вакансии` (
  `id` int(11) NOT NULL,
  `институт` varchar(100) DEFAULT NULL,
  `название организации` varchar(100) DEFAULT NULL,
  `почта` varchar(100) DEFAULT NULL,
  `телефон` varchar(100) DEFAULT NULL,
  `соц_сети` varchar(100) DEFAULT NULL,
  `адрес` varchar(100) DEFAULT NULL,
  `график_работы` varchar(100) DEFAULT NULL,
  `начало работы` time DEFAULT NULL,
  `конец работы` time DEFAULT NULL,
  `зарплата` varchar(100) DEFAULT NULL,
  `специальность` varchar(100) DEFAULT NULL,
  `приоритет` int(11) DEFAULT 1000,
  `Добавлено` datetime DEFAULT current_timestamp(),
  `адресс` varchar(50) DEFAULT NULL,
  `график работы` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `вакансии`
--

LOCK TABLES `вакансии` WRITE;
/*!40000 ALTER TABLE `вакансии` DISABLE KEYS */;
INSERT INTO `вакансии` VALUES (1,'АСИ','ооо реко','info@recorus.ru','79276117328','','','','09:00:00','18:00:00','','Специалист по продажам и по работе с проектными институтами',1000,'2023-04-29 14:36:12','',''),(2,'ИнМаш','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2023-04-29 14:36:12','',''),(3,'ИнП','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2023-04-29 14:36:12','',''),(4,'ИФЭиУ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(5,'АСИ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(6,'ГумПИ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(7,'ИЗОиДПИ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(8,'ИМФИТ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(9,'ИФКиС','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(10,'ИХиЭ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(11,'ИИиЭБ','филка','','','https://vk.com/salut_imtimur','','',NULL,NULL,'','Бизнес-ассистент',1000,'2029-04-20 23:00:00','',''),(12,'ИФЭиУ','тд-холдинг','','79613918157','','Ставропольский район, с. Васильевка, ул. Мира 80','',NULL,NULL,'','Бухгалтер',1000,'2029-04-20 23:00:00','',''),(13,'ИХиЭ','зао росинка','','78482956470','','г. Тольятти, улица Коммунальная, 42','','08:00:00','17:00:00','','Инженер?химик (лаборант)',1000,'2029-04-20 23:00:00','','5/2'),(14,'ИХиЭ','ооо автоволгастрой','','','','','','07:30:00','16:30:00','','Инженер?энергетик',1000,'2029-04-20 23:00:00','','5/2'),(15,'АСИ','ооо автоволгастрой','','','','','','07:30:00','16:30:00','','Специалист по документообороту в отдел строительства и эксплуатации объектов газоснабжения',1000,'2029-04-20 23:00:00','','5/2'),(16,'ИнМаш','ао автоваз','Darya.Gurina@vaz.ru','79397030883','','','','08:30:00','17:15:00','','Специалист по закупкам',1000,'2029-04-20 23:00:00','','5/2'),(17,'ИФЭиУ','ао автоваз','Darya.Gurina@vaz.ru','79397030883','','','','08:30:00','17:15:00','','Специалист по закупкам',1000,'2029-04-20 23:00:00','','5/2'),(18,'ИФЭиУ','ооо авангард сэйфети тольятти','https://togliatti.avangard-sp.ru/','78482249484','','','','08:00:00','16:00:00','','Менеджер по продажам',1000,'2029-04-20 23:00:00','',''),(19,'ИнМаш','ооо авангард','hr@avangard-tlt.ru','78482516522','','','','08:00:00','16:30:00','','Технолог',1000,'2029-04-20 23:00:00','',''),(20,'ИХиЭ','ооо авангард','hr@avangard-tlt.ru','78482516522','','','','08:00:00','16:30:00','','Технолог',1000,'2029-04-20 23:00:00','',''),(21,'ИХиЭ','ооо волжский светотехнический завод луч','','79277727202','','','',NULL,NULL,'','Инженер-технолог',1000,'2029-04-20 23:00:00','',''),(22,'ИФЭиУ','ооо волжский светотехнический завод луч','','79277727202','','','',NULL,NULL,'','Менеджер по продажам',1000,'2029-04-20 23:00:00','',''),(23,'ИнМаш','ооо волжский светотехнический завод луч','','79277727202','','','',NULL,NULL,'','Менеджер по техническому сопровождению',1000,'2029-04-20 23:00:00','',''),(24,'ИнМаш','ооо волжский светотехнический завод луч','','79277727202','','','',NULL,NULL,'','Лаборант',1000,'2029-04-20 23:00:00','',''),(25,'ИФЭиУ','ооо волжский светотехнический завод луч','','79277727202','','','',NULL,NULL,'','Экономист',1000,'2029-04-20 23:00:00','',''),(26,'ИнМаш','ооо волжский светотехнический завод луч','','79277727202','','г. Тольятти, Вокзальная улица, 44с3','',NULL,NULL,'','Инженер?конструктор',1000,'2029-04-20 23:00:00','','52'),(27,'ИФЭиУ','ооо сормакс','','79967218585','','г. Тольятти, ул.Коммунальная, 37','','09:00:00','18:00:00','','Менеджер по продажам',1000,'2029-04-20 23:00:00','',''),(28,'ИнМаш',' ао газэнергосервис завод турбодеталь','','74963439002','','','',NULL,NULL,'от 50 тыс.','Технолог литейного производства',1000,'2029-04-20 23:00:00','','52'),(29,'ИнМаш',' ао газэнергосервис завод турбодеталь','','74963439002','','','',NULL,NULL,'от 50 тыс.','Инженер - технолог по механической обработке ',1000,'2029-04-20 23:00:00','','52');
/*!40000 ALTER TABLE `вакансии` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `институты`
--

DROP TABLE IF EXISTS `институты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `институты` (
  `название` varchar(45) NOT NULL,
  PRIMARY KEY (`название`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `институты`
--

LOCK TABLES `институты` WRITE;
/*!40000 ALTER TABLE `институты` DISABLE KEYS */;
INSERT INTO `институты` VALUES ('АСИ'),('ГумПи'),('ИЗОиДПИ'),('ИИиЭБ'),('ИМФиИТ'),('ИнМаш'),('ИнП'),('ИФКиС'),('ИФЭиУ'),('ИХиЭ');
/*!40000 ALTER TABLE `институты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `специальности`
--

DROP TABLE IF EXISTS `специальности`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `специальности` (
  `название` varchar(50) NOT NULL,
  `институт` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`название`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `специальности`
--

LOCK TABLES `специальности` WRITE;
/*!40000 ALTER TABLE `специальности` DISABLE KEYS */;
/*!40000 ALTER TABLE `специальности` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `студенты`
--

DROP TABLE IF EXISTS `студенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `студенты` (
  `id` int(10) NOT NULL,
  `институт` varchar(100) DEFAULT NULL,
  `специальность` varchar(100) DEFAULT NULL,
  `рассматриваемая вакансия` int(11) DEFAULT NULL,
  `активная панель кнопок` int(11) DEFAULT 0,
  `предыдуща панель кнопок` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `студенты`
--

LOCK TABLES `студенты` WRITE;
/*!40000 ALTER TABLE `студенты` DISABLE KEYS */;
INSERT INTO `студенты` VALUES (165270271,'имфиит',NULL,1,3,1),(324169971,'имфиит',NULL,NULL,2,1);
/*!40000 ALTER TABLE `студенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ChatBotDataBase'
--

--
-- Dumping routines for database 'ChatBotDataBase'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `AddInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` FUNCTION `AddInfo`(mID INT, MSG char(45)) RETURNS text CHARSET utf8 COLLATE utf8_general_ci
    READS SQL DATA
BEGIN	
	
IF mID not in (select id from студенты) THEN
		insert студенты(id,`активная панель кнопок`) values (mID,0);
        RETURN "Приветствую, укажите ваш институт если вы являетесь студентом, если вы не студент рекамендуем отключть бота, т.к. функций для других пользователей, добавлено небыло.";
    END IF;


		IF MSG in (select институты.название from институты) THEN
			update студенты set
				студенты.`предыдуща панель кнопок` = студенты.`активная панель кнопок`,
				студенты.`активная панель кнопок` = 1,
				студенты.институт = MSG where студенты.id = mID;
          return "Вы указали институт. Введите 'вакансии' для получения списка вакансий";
      END IF;
        
RETURN "ALL OK";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `Test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` FUNCTION `Test`(mID INT, MSG char(45)) RETURNS text CHARSET utf8 COLLATE utf8_general_ci
    READS SQL DATA
BEGIN
RETURN "ALL OK";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Bot_ON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `Bot_ON`(mID INT, msg char(45))
BEGIN
	update студенты set студенты.`активная панель кнопок` = 0 where студенты.id = mID;
	select 'Бот был включен' as ' ';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Companys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `Companys`(mID INT, msg char(45))
BEGIN
    select DISTINCT `название организации` as " " from вакансии;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DelUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `DelUser`(mID INT, msg char(45))
BEGIN
    select "запись удалена" as `значение`;
    DELETE FROM `ChatBotDataBase`.`студенты` WHERE (`id` = mID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetByCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `GetByCompany`(mID INT, msg char(45))
BEGIN
	IF
		EXISTS(select `название организации` from вакансии where вакансии.`название организации` = msg)
	THEN
		select DISTINCT 
		`название организации`,
		concat(`начало работы`,"-",`конец работы`) as время,
		адресс,
		почта,
		телефон,
		соц_сети as "соц. сети"
    	from вакансии where 
		вакансии.`название организации` = msg;
	ELSE
		select "null";
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetKeyBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `GetKeyBoard`(mID INT, msg char(45))
BEGIN
    select `активная панель кнопок` as 'key_board' from студенты where студенты.id = mID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVakansi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `GetVakansi`(mID INT, msg char(45))
BEGIN
    select count(id) as `Найдено вакансий:` from вакансии 
    where вакансии.институт = (select институт from студенты where студенты.id = mID);
 
update студенты 
    set 
    	студенты.`предыдуща панель кнопок` = студенты.`активная панель кнопок`,
		студенты.`активная панель кнопок` = 2,
    студенты.`рассматриваемая вакансия` = (select id from вакансии 
    where вакансии.институт = (select институт from (select институт from студенты where студенты.id = mID) as t1) limit 1)
    where студенты.id = mID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `Insts`(mID INT, msg char(45))
BEGIN
	update студенты set студенты.`активная панель кнопок` = 3 where студенты.id = mID;
	select 'Выберите 1 из предложенных институтов, если выбор вас не устрои можете использовать комманду сброс' as ' ';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MainKeyBoard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `MainKeyBoard`(mID INT, msg char(45))
BEGIN
	update студенты set студенты.`активная панель кнопок` = 1  where студенты.id = mID;
	SELECT 'Вы вернулись на основную панель кнопок' as ' ';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NextVakansi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `NextVakansi`(mID INT, msg char(45))
BEGIN
    select `название организации`,
concat(`начало работы`,"-",`конец работы`) as время,
адресс,
почта,
телефон,
соц_сети as "соц. сети"
    from вакансии where 
вакансии.институт = (select институт from студенты where студенты.id = mID) AND
    id >= (select `рассматриваемая вакансия` from студенты where студенты.id = mID limit 1)
    limit 1;
    
    update студенты 
    set 
    	студенты.`рассматриваемая вакансия` = (select t1.id from (select вакансии.id from студенты left join вакансии on `рассматриваемая вакансия` < вакансии.id AND вакансии.институт = студенты.институт
where студенты.id = mId limit 1) as t1)
where студенты.id = mId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OFF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`nikita`@`localhost` PROCEDURE `OFF`(mID INT, msg char(45))
BEGIN
	update студенты set студенты.`активная панель кнопок` = -1 where студенты.id = mID;
	select 'Бот был отключен' as ' ';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-29 14:40:42
