-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (7);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog` (
  `id` bigint NOT NULL,
  `appreciation` bit(1) NOT NULL,
  `comment` bit(1) NOT NULL,
  `content` longtext,
  `cover_page` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `views` int DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK292449gwg5yf7ocdlmswv9w4j` (`type_id`),
  KEY `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`),
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog`
--

LOCK TABLES `t_blog` WRITE;
/*!40000 ALTER TABLE `t_blog` DISABLE KEYS */;
INSERT INTO `t_blog` VALUES (2,_binary '\0',_binary '','Trying to add CorsFilter on my SpringBoot application using @Bean:\r\n`@Bean\r\n    public FilterRegistrationBean<CorsFilter> corsFilter() {\r\n        FilterRegistrationBean<CorsFilter> registrationBean = new FilterRegistrationBean<>();\r\n        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();\r\n        CorsConfiguration config = new CorsConfiguration();\r\n        config.addAllowedOrigin(\"*\");\r\n        config.addAllowedHeader(\"*\");\r\n        source.registerCorsConfiguration(\"/**\", config);\r\n        registrationBean.setFilter(new CorsFilter(source));\r\n        registrationBean.setOrder(0);\r\n        return registrationBean;\r\n    }`\r\n	Get this error: this error:\r\n**CorsFilter in class org.apache.catalina.filters.CorsFilter cannot be applied to given types; required: no arguments**\r\n\r\nSloved by importing CorsFilter from\r\n\r\n**import org.apache.catalina.filters.CorsFilter;**\r\nto import the one of spring with\r\n\r\n**import org.springframework.web.filter.CorsFilter;**','https://getkt.com/wp-content/uploads/2019/02/Cross-Origin-Resource-Sharing.jpg',NULL,'Cross-Origin Resource Sharing','',_binary '\0',_binary '',_binary '','CorsFilter cannot be applied to UrlBasedCorsConfigurationSource','2021-02-14 17:53:00.606000',32,6,0),(3,_binary '\0',_binary '','Both annotations @RequestParam and @PathVariable in Spring MVC are used for fetching the values of request parameters. These annotations have similar purpose but some differences in use. The key difference between @RequestParam and @PathVariable is that @RequestParam used for accessing the values of the query parameters where as @PathVariable used for accessing the values from the URI template.\r\n\r\n@RequestParam\r\n \r\nIt is used to get the request parameters. @RequestParam automatically binds the request parameters to the arguments of your handler method. It also provides auto type conversion for some standard type like int, long, float, string, date etc.\r\n\r\nLook at the following request URL:\r\n\r\nhttp://localhost:8080/tutorials/bookmark/?site=dineshonjava&id=200\r\n\r\nIn the above URL request, the values for site and id can be accessed as below:\r\n`@RequestMapping(value = \"/tutorials/bookmark\")\r\npublic String bookmark(\r\n    @RequestParam(value=\"site\", required=true) String site,\r\n    @RequestParam(value=\"id\", required=false) String id){\r\n...\r\n}`\r\ndefaultValue– It is String type attribute and the default value to use as a fallback when the request parameter is not provided or has an empty value.\r\nname– It is String type attribute and name of the request parameter to bind to.\r\nrequired– It is Boolean type attribute whether the parameter is required.\r\nvalue– It is String type attribute and it is alias for name attribute.\r\n\r\n@PathVariable\r\nIt is used to pass parameter along with the url, sometimes we need to pass parameters along with the url to get the data. Spring MVC provides support for customizing the URL in order to get data. To achieving this purpose @PathVariable annotation is used in Spring mvc framework.\r\n\r\nLook at the following request URL:\r\n\r\nhttp://localhost:8080/tutorials/bookmark/100?site=dineshonjava&id=200\r\n\r\nIn the above URL request, the values for site and id can be accessed as below:`@RequestMapping(value = \"/tutorials/bookmark/{siteId}\")\r\npublic String bookmark(\r\n    @PathVariable(value=\"siteId\") String siteId\r\n    @RequestParam(value=\"site\", required=true) String site,\r\n    @RequestParam(value=\"id\", required=false) String id){\r\n...\r\n}`\r\n\r\nvalue– It is String type attribute amd it is only one attribute of the @PathVariable annotation. It is allowed to use the multiple @PathVariable annotation in the single method. But, ensure that no more than one method has the same pattern.\r\n\r\nExample of @PathVariable and @RequestParam\r\nIn this example we demonstrate the key difference between @PathVariable and @RequestParam annotations.\r\n','https://i0.wp.com/www.dineshonjava.com/wp-content/uploads/2017/02/spring-requestparam-pathvariable.png?w=728&ssl=1','2022-02-14 17:59:29.457000','Differences between @RequestParam and @PathVariable','forward',_binary '',_binary '',_binary '','Differences between @RequestParam and @PathVariable in Spring MVC','2020-02-14 17:59:29.463000',12,1,0),(14,_binary '\0',_binary '','从2019年开始接触美股开始，算下来到现在有3年多了。经历过中美贸易战，美国总统大选，2020年新冠疫情...也算有些感悟，在这里想和大家分享一下：- 从2019年开始接触美股开始，算下来到现在有3年多了。经历过中美贸易战，美国总统大选，2020年新冠疫情...也算有些感悟，在这里想和大家分享一下：  从2019年开始接触美股开始，算下来到现在有3年多了。经历过中美贸易战，美国总统大选，2020年新冠疫情...也算有些感悟，在这里想和大家分享一下：- 从2019年开始接触美股开始，算下来到现在有3年多了。经历过中美贸易战，美国总统大选，2020年新冠疫情...也算有些感悟，在这里想和大家分享一下：\r\n                      \r\n          \r\n[========]\r\n                 \r\n1. 永远不要投资自己不了解的东西。\r\n2. 永远不要投资自己不能全部失去的东西。\r\n3. 永远不要被别人的话影响投资。\r\n \r\n  \r\n[========]\r\n\r\n- 好多人炒股就是为了单纯的赚钱，投机。但是投资不等于投机。你买了A公司的股票就好比是买了A公司的一部分，你是要伴随A公司一起\"成长\"的。该公司的\"成长\"会一定形式的反映在股票的价格上。所以选一家自己了解的，容易理解经营逻辑的公司显得多么重要。这也说明了盲目跟风别人，投资一家连是做什么都不知道的企业有多恐怖。\r\n\r\n- 在挑股票的过程要切记不要掺杂个人情感，因为资本是无情的。我们投出去的都是真金白银，资本市场里永远不缺亏钱的人。过分对一直股票有感情是很容易在冲动下做出不理智的投资决定的。毕竟人在金钱面前都是贪婪的。\r\n无论在什么样的市场环境下，做好仓位管理，冷静思考方能独善其身。','https://investmentu.com/wp-content/uploads/2020/07/Financial-Independence.jpg',NULL,'我的一点美股投资经验','',_binary '',_binary '',_binary '','我的一点美股投资经验','2022-01-18 18:15:58.458000',20,0,0);
/*!40000 ALTER TABLE `t_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog_tags`
--

DROP TABLE IF EXISTS `t_blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog_tags` (
  `blogs_id` bigint NOT NULL,
  `tags_id` bigint NOT NULL,
  KEY `FK5feau0gb4lq47fdb03uboswm8` (`tags_id`),
  KEY `FKh4pacwjwofrugxa9hpwaxg6mr` (`blogs_id`),
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`),
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog_tags`
--

LOCK TABLES `t_blog_tags` WRITE;
/*!40000 ALTER TABLE `t_blog_tags` DISABLE KEYS */;
INSERT INTO `t_blog_tags` VALUES (14,4),(2,1),(2,2),(2,3),(3,1),(3,2);
/*!40000 ALTER TABLE `t_blog_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_comment` (
  `id` bigint NOT NULL,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `blog_id` bigint DEFAULT NULL,
  `son_comment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKke3uogd04j4jx316m1p51e05u` (`blog_id`),
  KEY `FK6i5gu79q8xahrfgla6m6508g2` (`son_comment_id`),
  CONSTRAINT `FK6i5gu79q8xahrfgla6m6508g2` FOREIGN KEY (`son_comment_id`) REFERENCES `t_comment` (`id`),
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES (4,_binary '',NULL,'Hope you guys like it and comments are welcome','2022-02-14 18:01:21.995000','zacharyxs0414@gmail.com','zachary',3,NULL),(5,_binary '',NULL,'I like this article!','2022-02-14 18:01:50.263000','Nick1996@gmail.com','Nick',3,NULL),(6,_binary '',NULL,'I like it too!','2022-02-14 18:02:21.036000','Frank1996@gmail.com','Frank',3,5),(17,_binary '\0','/images/Gloria.jpg','Like this article so much!','2022-01-17 21:34:43.038000','warrenbuffett0221@gmail.com','Tom',14,NULL),(18,_binary '\0','/images/Gloria.jpg','Thank you!','2022-01-17 21:35:55.945000','zacharyxs0414@gmail.com','Zachary',14,17),(19,_binary '\0','/images/Gloria.jpg','Hope everyone like it and Welcome to leave a message！','2022-01-17 21:36:40.221000','zacharyxs0414@gmail.com','Zachary',14,NULL),(20,_binary '\0','/images/Gloria.jpg','Hope everyone like it and Welcome to leave a message！','2022-01-17 21:37:08.979000','zacharyxs0414@gmail.com','zachary',14,NULL);
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tag`
--

DROP TABLE IF EXISTS `t_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tag` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tag`
--

LOCK TABLES `t_tag` WRITE;
/*!40000 ALTER TABLE `t_tag` DISABLE KEYS */;
INSERT INTO `t_tag` VALUES (0,'HTML'),(1,'Java'),(2,'Springboot'),(3,'Angular'),(4,'Stock');
/*!40000 ALTER TABLE `t_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_type`
--

LOCK TABLES `t_type` WRITE;
/*!40000 ALTER TABLE `t_type` DISABLE KEYS */;
INSERT INTO `t_type` VALUES (0,'Investment'),(1,'Study'),(2,'Fitness'),(3,'Read'),(5,'Work'),(6,'Error');
/*!40000 ALTER TABLE `t_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `creat_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (0,NULL,NULL,'zacharyxs0414@gmail.com',NULL,'root',NULL,NULL,'zachary');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 15:09:33
