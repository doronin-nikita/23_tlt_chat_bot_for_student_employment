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
  `адресс` varchar(100) DEFAULT NULL,
  `график_работы` varchar(100) DEFAULT NULL,
  `начало работы` time DEFAULT NULL,
  `конец работы` time DEFAULT NULL,
  `зарплата` varchar(100) DEFAULT NULL,
  `специальность` varchar(100) DEFAULT NULL,
  `приоритет` int(11) DEFAULT 1000,
  `Добавлено` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `вакансии`
--

LOCK TABLES `вакансии` WRITE;
/*!40000 ALTER TABLE `вакансии` DISABLE KEYS */;
INSERT INTO `вакансии` VALUES (1,'ИМФиИТ','ООО ТЕСТ','пошта@ru','788833',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'2023-04-01 13:00:04'),(2,'ИМФиИТ','ООО ТЕСТ2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'2023-04-01 13:00:04'),(3,'ИМФиИТ','ООО ТЕСТ','пошта@ru','84477',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'2023-04-01 13:00:04'),(4,'АСИ','ООО ТЕСТ','пошта@ru','788833',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'2023-04-01 13:00:04'),(5,'АСИ','ООО ТЕСТ','пошта@ru','84477',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'2023-04-01 13:00:04'),(6,'АСИ','ООО ТЕСТ2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1000,'2023-04-01 13:00:04');
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
INSERT INTO `институты` VALUES ('АСИ'),('ИМФиИТ'),('ИнМаш'),('ИХиЭ');
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
INSERT INTO `студенты` VALUES (324169971,'ИМФиИТ',NULL,2,1,0);
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
CREATE DEFINER=`nikita`@`%` FUNCTION `AddInfo`(mID INT, MSG char(45)) RETURNS text CHARSET utf8 COLLATE utf8_general_ci
    READS SQL DATA
BEGIN	
	
IF mID not in (select id from студенты) THEN
		insert студенты(id,`активная панель кнопок`) values (mID,2);
        RETURN "Приветствую, укажите ваш институт или специальность";
    END IF;

	IF (select студенты.институт from студенты where студенты.id = mID) is null THEN
		IF MSG in (select институты.название from институты) THEN
			update студенты set
				студенты.`предыдуща панель кнопок` = студенты.`активная панель кнопок`,
				студенты.`активная панель кнопок` = 0,
				студенты.институт = MSG where студенты.id = mID;
            return "Введите 'вакансии' для получения списка вакансий";
        END IF;
        Return "Укажите ваш институт или специальность";
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
CREATE DEFINER=`nikita`@`%` FUNCTION `Test`(mID INT, MSG char(45)) RETURNS text CHARSET utf8 COLLATE utf8_general_ci
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
    select count(id) as `Найдено вакансий` from вакансии 
    where вакансии.институт = (select институт from студенты where студенты.id = mID);
 
update студенты 
    set 
    	студенты.`предыдуща панель кнопок` = студенты.`активная панель кнопок`,
		студенты.`активная панель кнопок` = 1,
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
	update студенты set студенты.`активная панель кнопок` = 0  where студенты.id = mID;
	SELECT 'вы вернулись на основную понель кнопок' as ' ';
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-15  8:33:51
