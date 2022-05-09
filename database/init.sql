CREATE DATABASE  IF NOT EXISTS `community` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `community`;
-- MariaDB dump 10.17  Distrib 10.5.6-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: community
-- ------------------------------------------------------
-- Server version	10.5.6-MariaDB

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `publication` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_comment_publication_idx` (`publication`),
  KEY `fk_comment_author_idx` (`author`),
  CONSTRAINT `fk_comment_author` FOREIGN KEY (`author`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_publication` FOREIGN KEY (`publication`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `password` text DEFAULT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `avatar` blob DEFAULT NULL,
  `role` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (4,'Mugiwaranojo','$2b$10$mihsO/xq9zv2WN18IxYpLuSddcvCCnRwgErBwFKNtu44iacHn2D6q',NULL,NULL,'joan.g.francois@gmail.com',NULL,1,'2021-10-06 22:42:00','2021-10-06 22:42:00'),(5,'admin','$2b$10$Ho41FGpVHGF3EI4oSLYMxux2ocdtc4B1Vwu03ZaKn1Yxwxdy4fZ7q',NULL,NULL,'admin@merryservices.net',NULL,2,'2021-10-07 11:46:19','2021-10-07 11:47:18');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_page_author_idx` (`author`),
  CONSTRAINT `fk_page_author` FOREIGN KEY (`author`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `ispublish` tinyint(1) NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_publication_author_idx` (`author`),
  CONSTRAINT `fk_publication_author` FOREIGN KEY (`author`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,'Post test','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4,'2021-10-07 10:21:40','2021-10-07 10:21:40'),(2,'Post again','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4,'2021-10-07 10:21:40','2021-10-07 10:21:40'),(3,'Post last','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4,'2021-10-07 10:21:40','2021-10-07 10:21:40');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refresh_token` (
  `id` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `refresh_token_ibfk_1` FOREIGN KEY (`user`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES ('_ka0VV6lcb6CkYWDhf_9LFsY29Ry4YnrN4lmG_Ff7GdMcHX4rahbNkMZA4qpZdLZrVH_Fb3L-ynel7ZkeriCrrmU79Xtq_eWWTNorUmJYV3gDELg9URn6g5ukcE39d74GeXvcYghRGdmm5y90aIAFqmMmOwERP5lKZ0ZvG9vtKWfTHnRDwixNJ90O0gM8j2XC3DEdw3rIzh_PjdikRcCAzYZ_1gH_2O1IvE9htfSjod93sOWnZw0ZLFpM8MhNAEm',4),('_VZPxLLRJdTnmyw8NL-y2PHsB9JEDTXRduA6HFhsGG20f-L8d2btXyxyBknzwADC3QpMIjlrZ1prr8RuzvXMTBEJs7evicttjrZnuzleXZqwHjAXWi_Uv1vzdv-MwX_LoIg1FVWts6EUgtWHjj-hzfy4KKrpcuS0N4ohD1Jdgo1Xm1jgzsJe9fmR70jTYmKvqoZacERRb1TPxFsvhJX05V3hUn_EhLB6rR034XEitcZFTNZwr5F86GV3eyNHQt8V',4),('-1Lap4XGsf3iK1rloNRLxu-8Q7HvnfLfTX4SaGnbi7Zg9zBNaD2UJUnVYELS09jaX5voiIwPCjtnDgQg7BSnJL7dmHVNjYzIwDJuI2hTdLT0a_aiEgWfHsOjzjQueYca9ki5dUimrxdsxQmB9z6Sx-cuFpFpAOGk8v8iPeu0BabJ1XjBuJvPz0HgiXtBrHNvXjH-JFx-oToGSaQamMsoc_iMGDrX7WFpVX2jrSGiZYxMeSVuPbtpnEs8A-ncrMWS',4),('0CdkUbNTSZU5W4qW0CvTOXmSo_HKdHeHq_YLjhZ7hWQwXqI8chfOEHX88kpJULtoUb3z1qDtZcLuWzShHD6kJiwPgMPvjw1kUzjMZXJ7itcAXggEjrawcxaw2Hw7bcrAaf_aTXkhO3XSx1KbNXfzVexKB7MEtSDx4mTofRgpC253AqiP1mOOG5pAVLY-metkP10NNoaNl2-1Nkm61X-6WkcnKEFAT1NarHv7tOG__Pm4PLyPeFZgRH8P4bRW0jE3',4),('3DjNh-wtrBQIY3mFU-7DvEAoVO008WLUmyb37GXjr6hosu89xZdvTds1MFgm9OAF2qZcoDfBbwME71ejvfxe67RGT8J644EBwZUZEn88oZIS8UjU2j_Lm0ER0Gh7emvhA5iWN-grMU6E_yx-6Edn_M31bVPJKas8I-f-epvizUssTJPekZNsvjgoJ7d6VYGaTUt5_wrwyx8EqGPdXfQUHM8Cimrne8ABq9ULfoh4-sHihIgstuX_uXbpsnZo9BKQ',4),('42f7RxFDSXN17A9gyGUcEPqk-U-D70HJXtYXnSNoX4TvGyIrvSUKZ8nnrTJEejyKKEmwXFNPY-v3GSkEOgARle2ng7Qkbv-Sw-BfxSRGLNI2IIhTFcRgK9P8TVM68qbVf5_0Azv669cYC3dtBgnl-t9eJ8NKIGXwTVrui7OgiqfhnaqTQkR00A-O_U11eEWgZbbz_bjcsFz-ZN4x1D_sxhtDcKV87TyjPZhl_VQyUjnkIz7OUvvYH0CK_7qkQvL-',4),('5Uz6Urx0iT5DnkX4BXGD4z945edd-2pfhZ44IeKgoxKKhDopLAxG375NJtpyFBih3fPYc_4PFUyXG8wbtTJ31NDK4e4h-6wGnD9gwNMdkl5fDzKvzdJuObkC1292tLxmXN0zfSgw81Q1MtzN7EadS1zlc1TOV0Oi8Nfo85AVMJIqyBAE4AZqqJJ7GxX-X0eIwClqJe404osbbsrg8w_eiNQgY92tM08r-e8T7RxrWPG_0pmSfYHUSvNv183vPh4W',4),('5vAvOuQYexHGmevnKxAcQ-k77m5S3lnuElVAYovFRNBUFKQC3Gp5KQq9MUY4sXdA_nt_oPodeJH9pqHXqMrk5RtxFdWGMfy7h_LqTrSVA11DxGbmzLfFBuSHywaLQztBavCUPLAYAZdLtoYDORdr6zolCRo9pxDU8BEEDgnaA3SLvytvYvlkEo3LgtrzN9-1hJsyelU3TrmHv_Kh8GKeLsoDscsaPe0RUj8kV0HmVkVL5ly7CuZ9G8t9R-PT_6pw',4),('8kS7U-yhmC7c6ORMRe7U1PIsfbuvfOomzshfTzrm4Xy6aiCaAyLQsWFTqEgqJHDfTfDEBNf1dJk2m0MnCCK3K9K8XpXI-yI99VERJRnJlOhwXqeHvYv8a9SRVk316J8ptzYYAFhE0KL9g1SCZVJoKkdj0h5Bypfs1F71B-Cj_psS_aXHn_elYgZ0lWIMWULNmIJ-C28GBdc8bXostszqZaV6ZWc_bRRM8GOy0M1YpRzXpsl4JhCjjrGUPTJUEFWz',4),('A_SCJrXUKHgWznVa5VzHAniLC08OGBYBVEhPblPZbkMqyV5u7gY_WvbQPytwZCRH0P9ifIstJF4TxIGcwU03VQSTlACV3PPKRdNI9JBQdjZL5BkQSP3QNFfLLqZ5S7FP9Vn6QWyO7JhFR6-dhG3c-2gfLXlXMmchT9kUrYlDWaTcpddq5It3vIBPJv0jhly_Edhk_bYWoklG-PnRPTXSYqmlf3nb94mO9Jqk6m2LRohyMEqJrZgvN1GCA-kkvJmJ',4),('ABu9__5Lg_kr3VUTCaBTtqNgTTWGY40pIbcrM5OwB2deHBaCgYnsZuritqEAtMmnoDGlrwvGr1SlwhkkSYLRsBylBQOU98DiNdSfAocmJK1HDErT_m3XqwFrm_1Ge1a3RjCJFaaN-0bOtlI2oRDVc0_WujEbgwTh0tv_ekMJ1HVo9yKNDYD29vagl0uAye6fbvsSWFyzpG5zgs2AGXi9mNQH2qUO24HFjnFXgeFEAfaAyzfgHfzcv-RYQ__FgXDo',4),('AJm3WHrI4iCXigRncP_4nBNzkoGF0l807Jpxo8qKSJ4pw7IsgvLQ3zEeE2TuYQIImX46mRKVVHsjZsHTrRq5YYkfdbJWhkMls-R9zgzYeG7UuWodrFnCq6dZHr7MTV0WnxXki-G_Cqw1FQ-ZLWYB7NWTRaBixm4yXbU-xS5pCx5ZPjIczVFN-P2ALlNCmgdS58k0bvon4tNyFF4lFUQcFC83wjgdmRJbazeNqulGnxW2qaD3h4l8BdRTP8GNIjNy',4),('AlQO3UFpgsRCS9AEv5is67i7Gpfms7oMY8gaO28_Xy2zEKNTjrwAD4_-qUDAeQ2njm5448gFPJN5-lGTGtnbblCoIr_6HBTnygztltgijmse7H6eaNgSjUJ5x9-8LiuObe4Qe-La0HK6I-ptNZqyzTJQlHkbp4EZheapx7frwZBv9lNpGiFkB6HuSq2fYhxuiHf5qB9CRAhJE41-FK0OcRFjrlnCtIKqT1Ko0t-xzwrJU8AeOvk2IQ8SBCnwrmv2',4),('bakMIEDLLwHAbZu9tUYscixt_VLn5DGOZVu6bMBAtjUiFnY4BENzgCw7MOwBTINOMyRxH_h_Rb2zzRNQ7R5KCl4SNKC3rD87nsb37KzscK1ZqY338cxQgAZcoNm6P5XxWuHKMzKevpEu6cMSqAsgzMu8rjW4ZL-KFoXtZhAKhuh47pe7R1H2e0btfyT4bXc551uOo9aPyYBdP7FzxgTywUdhJCE60PQlmiTrA1fg2T3oA1NCEvYD6pFixvZap6aA',4),('bLAmAsxd25bbbnXL4ttN7mOYY6boEzV-AjppIEjztj13REVAM4-ZS3MmLMBj-YdPSeGLPLCM9UYde0KisGInR6bcvcuJAUoBBfSg9tsE9qaud_2lzm924r2A6BR6WsktQr5ask9c-J7kjK3LKCQWdZmluc6Pm2IIkmiUgrRcE8OQX29rBCs1iQJg06-bV-f7Q8BbkW6tY0ry82DEKX-wHK-TEuYy1OXPlyYxfRMiz9mH7LMI2M1j5PcnDwOFy5WL',4),('bXSZrFJBZArClEjrBYUVFRoFBZS45s5OSebbwxo5-RqBA3akY4G81Z_MHSF1OEnZx4Y60FNP0mRokm_kmGdsW7sdj7wmtue6OvYxBa0SQQDhFz_pa8Cwv1MHGbRCcAOhJY8AAI4McVjAEYhJrzbr_d5bZh7f439-Bgr-ZED3Ltk6jotdziJjgsSZmv5qIdOu4TrWcel9o9q2RIRLsKGRQuRPl8RoODTzHALrf6YyaCy8EM1HU2Y69J0ceecOJXgB',4),('cf2EOKa4eajcOW-BzMBEJ4UehdNfGfotk3TgieMDFOaPTsbZZk4XPn974lF6FwYDwkD8kP6rXONZsjeR-MSH6a8Ajp72I0hHrdsT0L2g0T0bbMnMtVznerasP_0rv38_zl0EOsQHC_eFMgi1N7VBeXh--5rk0_7C4VRdrskc_G4rGbcN11215twtm8HqPXpHfjjgE0FJTjBaPTyRvF8t3ybVGVQxo52_gC7icoEDPOs8QmDIAnPiAmidL5SRZVUO',4),('dDZGpKEDdpMw06vRzSandDu45zq8QcpfbQUcJr8oy7zlf2S_muu2Cb6dmehSY9JsSt1JVdgdl6pDuHeN7kP0SujPKYYoAge4RncoXAatE9AAo9hVXFehnvS2rEnRwHOHZkAWgYs8ahtE0_Ut55ANIqdgDsv4Q9XVWIT9_RwPh0YfYQJeMFEKXtXB8hNf7qFtr7ff_derq7GXBh4CeKp-3hKtUeqQdyt5fE5mhanyFcbRkFaW9PuwGumzqLSd6v9q',4),('eDqg7q218__RtfgJV9k9pdzQVAd5_MR1feVsyHAeJX0FXLAsFP2zHDYDk3Mqff_gf2pTdEHusfWeHOAGXnlEcwV37czqbSJ6mk7udK2uzv9EIoRlRywxGJcISATSHv1fsm-LBWj2ascibRip2AOXOrcYwbNi5dDfjghk3DBa6TXq9kSq34rDTLkNhoCqf9euQxIezArfNj0PbUPhaKpv8iWhi7Pn-_CkMNyJgxLLRRNxaqTrcXB7UVcbTog2NeKU',4),('eGziisPN8bijtrRkxJCcerLE-7JC9Rm9ep-fPfMmKJ0yb1Dwx3UjxF21KArQMKFy_y_nYN6fpaC05TkTXs9gIOKyFz_QE9vGP9Y2QRsAEZd_OktFxZa2P0uanfWJmPIel1y2rL22TUNk9L5N3B8mvAbabijBCLjluMtd2bd350CES9LiDY3AtW-MG9bwAusouLDCIp2PbFwoJOrRO9hrH_KXG1yNImCiPUqDxzNO9DCqJAtM71TBCvS6DslX1fdy',4),('g8Mp5t8x8Ec92NZi1wdTZsI2RhMBFy0wGoU-zAoG_yjTjMhw0m6q4PahUCjzVfuYkx28g_zLKRM8zWYzPFjgrA1iOnw8uQLGsg-KXdj6CGcakDeMVQwgzFcTD9IHMsbIr9k-yLmFWD_37NCn2Z8LEm9K9ImQcp8mqsi7GkkdSDE9PF1g9fA4oim3f44mv2kizaZdx4cQcgPXMXwtNitwEpK246_jnFc9BSIgNNC_pmrd6X-w4SOZGo2eTCXDs7NR',4),('hLYh-rVEWNLd2eHUBhpev65_JiWMr2kRYrU-OitIioh2669uzumUjxm0_SQGp7lm3N1zvdOPN53_db9_Bv8So_KUP4WoG0RziqdRSGoAKyn15H_bYukDlMmZtNUkxZqUm4mN5KIR5-AAXfU-A9j8E9iF3Uk4PiO-Ayg7xh7lL2rLDyiBpYuKukA3-OMIn-dHlboVsFax5WC_p8i7ytPSv1hjM1PSpG1ykQIxdJJKWUhaywli0JjeRtQCxREABjpR',4),('iNiO-j1SDoxqH-LCFteIDZuYVzvvqJIXSqFq0QX00kvuFV-sx0rhjWpqRnTxghl9BAiZCxy2UuNbgdAwyEPqPFQf4a5LTVt0aQ4DIuJgWxb2m34KZ4v_UDrylULDZfacV1RdXfQJMEKCRF7KAyg4xmxAQ5Tsp6eSs--z7hjAqMLCo8cz_JUDDzQMiSJjEcDqSvLU2XgbNWTKYsHOJDy1BeANSuGVG3xPEX0MqKP5Uo0b97EaLBC5DlZlNq_33Ogp',4),('iRXOGvvdtoUNn-Fcjvrc8Jx1zjnqzyyPevipnHVvAsWTPt26N0nyg3UPS-y3GF4dygev9Bfkk3sQJ869VXndUTp5H5ENEOcPVqAoXteLYiQAW58nBqo1IJc5HS3zV7XNroIr6ORem1h5nz-R8uX-fzPPXt1ssjFHOxagwemQOvQz2qq9zoJh51AAnwGjiMe8LfREyIp6ubmCqAMiqjxnp8q4F-rNz7gh7yhTn6zlrfvEjk263T5RefhLGPj8Pwn-',4),('iwb6GwbadOb0Uaq3d20cig-2ff6fhHtKiXYBsFPnA14FR-2SopnhUADdJGfbdoPfhEuZXxsQCrftI7yTsUpL0h6n9xkTsmzJSwN-7jncWQJqnkMirX_Q2QxGfmPDi84Rt3qBYb3R9Ll5pMhYiCZfMIeKU9j5Tbi3irw013u1GR-ecJ9iukXb7VmBa-3VbBZPCySVOfCAtW4awP-h_rr_m5qGeVJn_50So9Sb2LtclSXGvMfOoVqCEOm2pLk5uLH7',4),('iYCpMHiWrzH9z3Foq5lsh4FqHerhO11ZKbaUdjzK_BYSVcr2C1nxUGynE34A9MGAz1cpofLhcTiq3lp4Udh6Vh59onnShzrVqeIjgT6NMl2r0RxtYZbj2IOf4adi7m_L1qK06jhMa2mFNslG6uAe6ameGXWh9ywIZERPIE2kQpH-mEqy9S8UIbYEHzxattbZjRH38EB42Kb_0wEU6ggEjCl734M1h3CS1CDKo23dIkrtLhPQpmjg3iacnHGKGH4b',4),('JCciDx18DsnWtIKCY2zlS6TjN-3NlmnCALDGoUe1GbPuRDMi67c9VUlm7UjoazpFcarIvO4S4BDI1jSXJsSS8uKaWB0O3uoYyUfKVyELNasbrkQH7ae6ebzxVCSwlRPgy3QbfriDkTfeKz2ETf4j67hlUQj-piyiAQKmcqVbG9YBOvns11IuDjPSnFdUOWnM9-IpLq6eO7HZXcgxtJCQoWZZBjWN3zT6RiYOZwxi17LVyERWQWUHq4OB8C2N94rB',4),('JsgKMpDuUSoZZYB_veh6QxzgUcOri7q2dVfcbos1a0MJ94LDU66-P7HFkS-Vn6vgPaBfF0mywkoNtNn1HaDtlajc6mowOw9NqzZio_ptCO1QVApm_EOB-FS_FP0yFxvqTPQLytcMmH5m02xJoA7LRJtPrNaXpZxJoYiI1ZEcUqAHPN0eO7aLwkyyFL3ZWUeFMg8-dClDrKD3vZi0kNIt93z9usOaJF1eVvoDi8devaBpojzCDtcx1O5_qnFemYSa',4),('Ke4-PWt77IYijTF-H1gpqY0kjyQpOyThDD8tDAUGBqUjiueHacgxAsXuIC82YR8_sJRR3Z1ftR18epcF5rYN1sGVNChAMtebiOSiqB8rHsuYgAmILVpGvzIHGWSZaxRL8kYuJOChXYSzfU8Xhj3EXUo9Jy62z8adjgnCqYi5tynWlzWPVU5dBXhfH8qhyXSmJb69-wfQzwV-a7jpFsxRlR8pMqRea2RJe4QI_xA8_yks8na2ZEwVX0ujP23p5o_l',4),('KJpKOGns-wVgRXBA9PXKhLVTZvC40HWvjqoxhCkQcT3xbHPSgLhkOak3mgiFvkb8Bz3liqS79Gsb2pLLppGKTRxtbRwPPOTJdGTpuJdRwZlbH885XUwqJAS_JaBzkgWGsEhp2NpIzb9ld7yOuZxDrS7P7VzURze82ldrI9a-6RE4L7oTX0wFo03dkq9vx5eKpDjJZG6qZSskb5uyHHOL-cSYbU0EGwK3aGL0048fnkdpQAv4POnSBqPUK0fO0g2W',4),('kOiNYToksdO-SXOCWqkMIUea3pBRC1uDNGC_5NtNq0sIS1_HmmWZslB82aepTeWIdgGTAtmcMOwZo4SiaJQXQQnRr9_i_ijP7IWHxwcKx2VSCF1Yoc-hjLR8AZyx4HXG40y8FVeqFRUIlvIanCOqc1oEurbCfgt6Nc4Yf4WSyNyL5hZ905nmS2gkr1XbAc2dNuL8EfaywbuKtWkl5TbxX9S9PkuDAJgpnCMeGR6rYT1tPC_sDLKB3B0dbWH9dQDX',4),('kW5nCH3Ml-ZcLrocSm6k0JUWKNyhyamPgDmwfJ_L47HljTTXtvy5G9BV1fYsDulKL45N4WwQG9gLPUwyqAxz3VmgD51eYq6MlU3JA1iIpEExohQvdDZsm3-UzfzhmyEKynp5K0z4fwMO8i6b4RCT9wOZrbYJIWeU9bNzK_8cjUgcEon6oyI4KR4EGY82CJXglDySZrNBPVr2nJJ4cteHFKd2EneKHT4Vac3qx0tTpv-zgk7Q_CFyKlx_CRYKcoEU',4),('l0xa6VY9ODd-hkK0DbpiV8CpvaeqdbDbngJIpdHumSbpP3yddcqweYy85OL2OTRni22VPBOQ8ffTW0BS6mb2RxOOVlNCSSUD1E20GVcOY3eY85oNB6pQon6W8nvrRpMH16GAKVxKWNkGhKFFurmSKa02sLaALuElycIz-4_8o-UsduN97LIXswNX0iFkpS7eusMNzYoZcfNvWxOFCD_PYQZNlnzLkZf8sfV0POP_mNDktRxsgFvkgFbqz4x5OP5Z',4),('lgBMXedaWR6Cn_ft2NuO5FKs-aGoX3uRodigswQErxESTMplKoi8U_fatP7uwthSWZCE-5unLM4ExdY76_uiOXIHBFu2duuiCY9WUbtYJf80EGlVMAY2XP7zcHa46fjPnEgJweO9aHZPNeu3S-piuQnlgem0R3bJ_vdbAqKbvqg1o4dew8CDGJykM2q8s69AZ62kT4yLkgwrGepAgG-LtcBkO6__DuoRUPXCiSMC2LnisC-kU53vqYZ6phxzYYu4',4),('LnIohSQkpqIIJTa9DoZG0HfQszqYTkgHdpo_eWaLMKMVuXYLRPptEimcBu-RtSSyxWvvvTrm-312_zvyC7bIRGvTf5A1u8km_tYwtaQXxyIvYTQm5ohEZoK-Dt-0GggLrcM_6yGOgdMyfAAGaI4VKmYIopiDcn6cvQ_IyaJb-3Gs0ZEi082HaoFC9pqTTLco043CIODq4O0S86Il1sQhIga3Z8gRZ45z0fKpunwf6nlHWxxXGsMPH6iKas8zBcIR',4),('N_jDV0Szvl4RdTCblYEiQiREDbG2jBrKlihLWJwYGzc-agGddUO9EnBiL93taXBY3ck4NjqOaUlfS__aUHqVEmQoha5wB8hsFH1D65_DP5IrdShfG6Ycc4uuv86_Kr7PiMxL3bfjJfrUxb5Lhe3rn0P9oshEfRY_OOHEfabJu-fpGVjmrVG79PMqoS0wlaB3ANba7w1g1rkYq-UHaUZs1S8_qYL_AW7y2awAtmI4VHzvWVULqmQjqck9PwMINJO_',4),('NfcY3ACVtYW_RW7HuXjBlxPdbRgMiFTmSOTNH7-WaXXHjHOziaVLroIXEg5NSDfy-7d1ebMuy9Jjch8_pZ8HtrccmvnvsRD1qknJ0XjG-KCqVkUb-0J9lZ5Bv9BinOKOLYFUIG6OdgEdqs0lCjhlR1HmmWZb5yEAuqc1l7AO8SZRZNbimPCCuRffnNyr-dUtl_JYB7xbxqaiE0ym7kJplaYyD6pl-8QXTrXQsGMDVPYlta-C9qLJFtHHSIWqxI6u',4),('o7ERJ3SCTne-VJPewSxZWsrU91l4gRYPxkc8d9vzmDHw5kIIrmgRgS4_WqlkcwL-BzbJXVyUXqUBQBjOfC2zgcAQgeVuGDXjlKLPi9mLgNjMiUdISxolI0sSX-z2NDi85uMYJ8nEineYkO_J2cOB7OlHuWcO2-6Od6DC9705tmo6KlfDE_RsqyVkCi1Ea4E-LR1d9zraHFcpR7wNKNttSxd-RKq-TwOijy3v1qA0p9V2xBY8wc3005GfNtBGqOwy',4),('pEpCNRQBgs2qKuY6rN-LOamlhiRiTL8n8JE3tT8eqChI02uwNW-1aNN1PtyHAu9jbGNOsN5o_bIlIYod7CmFTtpAF06ehsSw_umS5IlJl3eciCkZXshc2DfFMqxAAh2SxnMo7lAf3D3YHruvUdUfPGbwRitR77P22hg9pzb036S31cs_jIb4-FkwMUWn4h93LAU-HAfO_xtjirQvXcd6e2yxhzLUVTPldZ1mOBkvitNDfivP2iHGW9sXS8khdx-s',4),('Pl8GB0A3gWthkVPyVTuQ0SkrqRPal_CjiFr2WaKqRxsjEGjCGf9_-GoDMFjofSr48y2j9hLEbItAETQv-oMixXe3dWt6FvxZlP07gmP2vr2A9PSGlbFd7QCMpWWz1cKjfCOaj16hxPVPqN8E3CnfQz7Bjryr_43fhxUEsQ6i3R0EeVLzTiMv7Hi3zloWHWH4ihHNGwX3R16ZPwwjA8NZqBNnWJZu9mPmxk_gCdfDP-ogLk3kahN-_DpPodskxwrO',4),('PLRvL1TLAmCK3rYdvznW3tlj9RI17L67O11_kbEMK5WxCoCIuAccMon9IMOGlRw7qMwRcxf0z7J7bz6Ew_09wTtrlutm7rMAlNc08U2UrsZCs_0WrgedwKthvU2F-P0WlCNxDdFlIDed6maFYLRLnDO7ge0gjjQfSKq0PMlLj2doXUWA026aNFu-KKietUsITJVpFHSoahmuh_qG6dJqRP-771oJrpfmtyQhY-Wj-u32ogtaPeX_oGeAZAZIbvrE',4),('pxH5Uwyy0Q0y6s8gxCKSJKsXqSMJDDF3F_fjbu4h47bui-HBGWx92BOWKwyez2X-i2WUxoulePxJkwCt03yCULzLcJyaFu1iK_fdWH4xT00Pdi5iZ5uVLeAfyyMzJ0Ltn4v2359ZycyUCGNJ-ULd24qp3mUvr7NwaquSbds4kyh7xP_5aq-7nlkgz9sq7nG02wmrFR4SMJhvHpjIY6p58GNqrMOEaLonvqw_YwODMu-1ttyhsnijhf_yZhziJV-V',4),('rwddA1rMqJRMak20h-ezTRI6ONGDo0D6kU6M_f2DeMH6Frj5ycXHX55GkjIgFnatjpEsZUhOiy8sKRQ8IOmMMsNk9jiXkAy_M9NOSpq50o3mKRSAVmzS1Yu9UoiQNoiwKrM5YfS7saQkgAiTYei1w4j7Hl3mNXuXat8L8jZlYIK37sPUUO4REwJB7pYLh_MCm3dfrML0nH-EhMA8-Q_Vc48Ppjz0KqSR2B7NvkQmCZOP6L1HyXuNghDf8fWznmJe',4),('TBROePtRSLlxQHNbqaH4LlVhFnHxgmM2amj9N2-xjQ5HjtQfRR-UHz3YcNhJiOIvYHtgyZkEcGXDfgrIRPGU6MIqlgeAIyAUbjuStuQ4CDAeQYmO-D4ueyMl-IZOQmWiDldT0vmIC30J7o3NfU-tVed0CQ4U9H6INz277pe3hKAoZy16JgGci3A-2EqkVjqCAfo89v7KjbweYBQc5Otf4bwnNjKzAb9IYKyjV3NTjpj10p0GrsPO5X35oAmiT2oj',4),('TLTdy5SmfgMzzNR7Qes9isW6sXCf_u2t0Nk0Cf95hy6SQMwpPHiomoWUwCVFh11v0oM989qn9sCQ9uBwstnllllkKeU9VH_mI6V6nkxsl44ExLtCOM-rLtY_x-Ao1Vo3Z4n47f4HTHViV3FJIMlUQa1nvLSswJD6BkvvBDOhLnbwj54AlAAh72dGLDwmX29XS7pvwvc5a9RVDaP8cfqECrGIKn3ldTFbvoKA9VlvxrgyWxo1eznN7zLgZ7CXpO_1',4),('tQtZ9s68eLj7EwAgLUB4QILwkP9b452aA3TzMV0qy8BiJTFnDhmoH54iwpy2ZaIcqQfWgnXZzMdeobvlDKvRpRix3wyLg1CG4uUIgsIlLV0dwAN9ezqu37Ns89nmQ6d8bEH3lF1mxtupfiwqaU8dDbcwAEJ7MRlu6CPpK2HMekcoJPs_Dkb-S1NaV2VM3b6hj9F85VZgqnXCKFFPNbIp5s9arTv6v6IrjVLTTm2Ns9dYyn7p5KgBjfYn6gR9Rd6O',4),('TtGZFFtSpmAvpbNqBVjEoXaZClLiAMSQRf65l9bRitUs6uo551i0cGHKdPgMs_Z3y-hEi6hwgJHCSim43Nh8X2M9MZK_PtsSHCujQyqpXLu_xq9Md9qKoyR6pJoBpAqXlQllku8oIyRRNN32r2fRaKR94wZHZ3lD5a0WetiyiUF8cyaLd9TYBJk3rIc49WsbWEitEiK7dw6tfjPf2n5czfY467uUlV-umVvFv118LSbq93Sqx7_4Am6Jf3LgYHP8',4),('TXgh3QmM9P4M3Lss7Vf1fIQyTxTA6BjDd6uyhItjLPNqzZ52Up1bAzNeUmwQPhlEQ3pCiY0GMWzzHEyHGRmgxDT6-F4lRDAkGMK_jEK-7iydD9ZFqLBSW_wWNBrbsBl1an_aJm_90gMIPSxHqjgcoWud-jVn1Q_2Gyllm-wZkw6V27W2V8oLaFBSDdWcGEl2mO-ZuKYiReMtD73RhYpVhDaGBlwj1r7SDbyh4VqCZw82pWGucj41NJpTVwBIqZpJ',4),('USwH4on7EJvxjZHQCofqkcBz8IEwFB-pk73oSdtyqJ1G2-W3UQFPcx40qs2y-fgDtqgcQSXKq3HF9jUDVXAQGvnPYn86nOPf2PqGSonvl5UqeSJiwuMjDfZR277hEPBciimlaFLW__IoKgqj4fZtL1ivA4nztTnxNpBWHz_Qo0GWQGyRaZ27V3JPlwn52CcJ1h0t3t63Z93iAN78Udzc55imLr1RpY48cc_iXrEYihgy911GLF4gNej0Yf884I0p',4),('wK-ZRIq2e_mfK57ln6oGrjoXJQ-Pn1aq6QKBSgKpl22yuoXkWmpFObeIK7QR0ZdDajJR2MAuNFcfLvGN3qwxEwKiaai4v-jdrFlwagnTklwDMDVy8dpSbutpaZz3m3YxhtC0Me1SC2vpWFTomMz9I0jyGKhNjxu-SjzbLwvejUKpHuLi5lUxZ7N6vNa_8mSe_XZbEOWzQYGUzW2rGHhozmBnn2dpxZuU5UZt_8P4gnBiXcfO_bqzocnLGyxa_Q3d',4),('YO9BZyeJarI6k9ubHA_9n0kdaj4MTx6YmTHGq7Jt9MmXXv9McuH9AqAWHqpcBGjzDv_-1TEnyg4hninN3fE_eLqMKscXCfJrB_LxQjioc5BBXlOD94MMvu5BKrbEcY4VWmgcUvYb-Rq8EwiLM5EFoIQVOLvpE_B5AFvZeWUBc9IjP9jeAbhZ8KpIZsGu3s8BkN77cSx5ZhB6hwTft6Yecl5wOqa_3ijyv_TBzIz7d5WBy1mDPG_ni1D_r13qIIeL',4),('yt2yIbIIQQtMTzPpfU9fAah9zzmcc9HyU93luoGlnED0uJRiB4BKv0v3eebxMGl9rvWn5qDAukO8ex1y8iqNouW_ulESKFZBBZ6E2ABY4GwVG1Hy_bvDX-Oq3HWjn37Bl2Lt6XnpcVSyetq-70JNCK5pEuHJK0nCzdqbK2WO4vR5R-xuX0FvD506X7g9_1W7efqFq9QF9ViJ1VJQkI2HT_X-I8j0Pgo_y9aJ7iqm6GcgFc7gDce7CU0G1eGaA3mO',4),('zlC1W40Vb1cfxn5dbYQP-SOI_hxCP1lm8Ro8jDuxLfezaJMLUtkz16Y5E4LMdcUjkXp5eQ6jUXpYzUFATYJWEmuTrgwjwqb5bbAskDmFo5UDWSZAooQkO08BpRH_xqW8ol_wSJ988vZoSDkmnh1XNe2jYuECF7eowf7V1V0PFq-bJ1uCNCZS65hPuuzL5QbMIA3U1VzDqyBgA_PxFSLqiyMw9Xf8XyYOx3SsV84NzufQho3vabuG5hYNTXypoHhT',4),('4DuaWlMz_ioGOmWnXbSphVvTLCLzz2H1KfJjWqIUkELW-xr-CaLn6VVUGKK22uKGFLbzeaW-aFsGqHtP5toWAGNuY9WzY52dkc6wlkjpSceAvqHr0klLoFsfSUbJzEnnr_qyI6y0ZOGovXXpxFTBzk-GqVo5PQhadi3Q_ln7rYLavPVfWs9fdyQye9_mmERDg7oJ5TockpFUoqtrdIUT-ZSntzGK4-3WJ0qvL4ADYUYQ_ugv1uP9iuM2lZYyK33k',5),('a46PF59Hd2mNNcf3aWlliXBqHZeQqt8mx07E_LvQ66qjGAkrn_hkuY-jkzNt2Vf1x46lRBZ3gJdaCShb-KK-gz7bpW7IU78Pu4KdIuXVYVqKTyAkmmEVt3DTkoijl8Ye4XZGFFmneC7VEDxRcKfOX6bkhdOfuBf0XEY9L970mGUknlr43yX7wAdKOlxobkkR6-gake8QqnNrNdwHPvJH3WuGxXn7LoHr2PCVwPe0R-1cTm7UHdM-dhJABUnYRHaC',5),('EG_ihvKDvqeUYtkcTsd0T5VEN-BKiDM2OicgGiv5NVNuSeNYfUiPrIwaBynY87TM0q1K0PurB7zk1eKBEJzt1-5sA96ZUtjac5wTvuwG47suAn59GcnIFe1pamfWdqKwd8T7oIaNHecD-bHH0-DX2qCM4hlCNTRB4nC97m09GhnTmKra07L2TkpVTQ_15hmpmROKnx9XUkG2YcORaPagr8icoSPQavuEQNw3Re3tkgemc3vcL1-1IjVqEfJYz3sF',5),('ih8Ep-EY2tatLDCHY6sA8s9KTswSTXe3EB5V_yqBAEcWJr7kX9LCijyg4gasJncZ-9sLQJJwKrywCNlpDKxH1caUxig1YFEHyiPe8EorW7UV1nRA_yrr0iEG77lkeTK21QKyyTZunm-BrP1wNQah_SW30GHBZ_XTc2sAqn7kDw3wvkEWAF46PWh_06sC52XN9pHiuq0cCc49UFr8Rkqgs_a6YQrU3IDRJxyXz3hc01JWfXW6SjunaZIDScNCklka',5),('iJWlTvdKZdyFh_zwQ6oF75Z51HW63d0r0u0wvTLZosCCTRlyXrrFyyULYJWe1w4Ktv5-n0eQoKnEkQB6m1Lzwc97JUAOH7qtRCFIilcg7UEBLarZ9CkIIhYZ6VB3iOr8KhH1o5HZQGp8IxNu65qUWfMuAdmtFo6ldmQgtyBx-6VjomCvsiT9d0MggaW30wWBDDHNdmYQ5f9wSEpHhDx0sJTjYuTjNtR7rqu3su0oExGvD3QQ1k6FhHVp7xGMVkn4',5),('lesyaogr7_I8Gp2v7-V5pvCCzUgi4eOP_ds8DLXYU6ThVTepw0ocnUdE_KHrCB0BJgpJoC_M1Q1mDGPXqh6NQ9m9uwL0rtd5jfSrYLU7E5Eau3eHCKxfWIcmCu8KNu0z-tqU4nX53E4opRIRfiq84kKInMrTjJd-NXAR3Arm81sh4t7YdWc7CiDhcuqxMLNLvY_A7213XnvpyVLy3cAWG3F5E-mFIq4Ywy8ILGLDEIa4K7LM3qkJiPKWMshQBuSf',5),('o_PN7Wda8hgu_VfasLtXRUIqYoUhp8MVLMOtG0EYi3UAgzpOuZExMdJ5XB2eES2OGHaBKLjzCcVoESOEXSOovQgE-o_cLVbS0mAjF7HxIACvOPPZGDVENaqoUt5EsI_QOLrIduqN8m9S_WcF_peHYjnFpEFYyB4byLU1yvp7BpqnFs8GYL06kc8a04o0saHHMng4nM8L-T3-BMRgCxZzOxiojUlw5XRaPZYxYeymgCsK2mqkyK85YIe06PqfrTQ5',5),('oapfknONfwCCAmbBuBltZSq79BQrdfqZOwJtk7KnJhav-AIhNzBD1VnNKuo4qKF9KUvGNicUxYMmMCTvbeIqXGwJrH4QI02oE8LHKAkAobngLmH-t320LJtstDcTyPb3mfoLiJ88U5sRqBUpuMQoKrTY86_AqpGG2iaFk21JAWNEvFtvtgR0JJbuy5weC41PHKABJNYamdOjIjIxzGc_1LI50VyEdroESWis0egf0gO5-SATCnM8OPe8nCqkuS7m',5),('srd8OjEpt-3MJCFT3HgN36aVPIZuSSSUacMM3UUkBtEJVm4TWJMLuRIpueRmhmSrOHxZb9pwQlOGN7MCIQaDld5rZt8M5tu_rad8XfoyPeZE0AjbT-Nbh9IbtvFU9aQJmB4K0fIoKV0-pPLwTu9ZSqvPq1lSheNBRvBoOZYDCFTS9pMzAwjp7SOQ9vFiNftXB-7DTd_1Z-NHqElbeEIKBVVqpg3hy1Jqa0_QVYmLd8FT8HQ9HPphPnQppqT6E8sT',5),('UGV7MD7Of3apSsmQW0vihQ9Z99kPYzPH4bxUMdEkDZF2IkmPfFUntZlQa_ReCT4MumSQl1cTeuHdu1jTXExczivRYgI4mvaCCi9wmH9wiOKK67jRmAAiBbxRxMtBvEmnrvONjIuB1vgdbofSFOJ0dzRXtbcmqcqxhG7vrb2dbYbtdyp6W-gG4Eybh0tSsSV_-BDXVI2y5XocRSqJLQJfntVEdA6Vs-HcpIcfYoP8OpdvzEzJA8vsBhfE6zhewluZ',5),('uN-qSNBNEq49mg4kPoM8vncZjP5SI3cU9qGpziFnWn3WoaXzu0SMzvemp-giOA5W5f6yRzJvzFc2hxxzjezWuORhlutSIpbKEtQYmD2-EMypUwrXzg3pyMyaUPiGjDnpuFUTmT5ouE_OAvgzNC-O7IjLNCqlimi5BGL4XD9XTbEXfWVFu1Yb0QSro97wNN-FGXx_ITV2SP-WfrSRNl4-ydUglde_pl-qu2d8_yDZSr-h18o30McoiF33qSpQuz1M',5),('ViW0DkZw8eeDmY8NrhrS74e0B9f9XT233OANAeZqJiCtKBTYzUM3lmuJx7OjcaMpG6MGOgc6ueACTPW2J2FBAuybwVi8E_xwOMH4XZmOGYiAsDrQpTZEoaO83Vl1mkcH1ETz6X30SOX72DGTS0BIa4beyko9Ye3v-w3pT5lGWBDOo5JQbV0k-qsIu2yNbwR4w_rsryvk-7G5Bfty6dweyIkCf8iM8rfdfi0XUafZ44o60Es28MwppnBcGTdVG-hp',5),('Vz7wB8JVNByBdqGBkMM-JzpxToXVIGy4tHXXW1CNsEO6LHkxPLI8zLf0S6wMpvgGJEPPCNtCkGQzAjRYdY2OK2-Y-vktZk9Uh7Ol_3fiK5C3Cduy5EkkbXqX-FhQnOKlPn-HObcD783OucNrzkFRMGluBxbFwfhzpD38y9MGPi6OV7GE45_bRSn4Wl2gGx2i--eHxe3iKLOlrDci5DptWvdB8i_5thVKzfhstRR3Sqesj7g6pnO9g3T5NXt6fatP',5),('Wg24ROfQ7Py8Wb61OXkhhcm96BInMvrRZLx4zJWVvDPufE2uNuvX1OthdV5ZHLlp-YmpxG3corrcyPsorqnqGc2Jv4IrJQ_lPGrKkK9MYRps5nF7pnYDlXGgRztwhcYWgRoM8sthV20jNwjra9EySzTaKCaq2t8aq6JQjbuOL5EYpN_XukmfxKyIFKF28yKJPm3aobY7ue2HsYY5-DgOHBUdQKsQTW-mdQBxHvLk-FIOuUEjjVHQQR7PoIUDnsXC',5),('wmrIk5CJy8fKDhsK2Y_JMYdd9jiNmaBd08oXe-8d_f3oHJbmyktSZzZ66fFViB8PA66dSKQR4oglx_nhuX67kTWYc2LvTSsjsc0mpN_ZywPKzunNOmjLOsZO7ZcTMMsssKn-1MXVqUOTrGJFjpjmsNQKa98DRVvRegW6-E6qIGwgIig9ML-Kpmuzwhci_QSeZrmzUhgYLVvu8P6oqt1Rt7lexvzLbEcs8i9Py1l6OapQ7R5PDT1VsssK1fyEHoVe',5),('Xt4-bNwt3L0Uu1okfUxz9bJHPT_JnCs-MbwZBn2ZslWOM3ODNi5GHYS3H6O0XtPBEnCTOxGxA8h4FM5hERGje4MJmsPCkZcYh8XeGghAP_HSpHcLXNI7U2fxFuwL5PYvRWlAQfAC_NMFBNBvNo-vlaJRNkL_-cegefN_rZOo_hlusny7AKGTM5c5tWYOLZmdurY00vQ31KHmpyCJSti2uVBsl40-vcT2KCQNl-_tV0cGHoSXI4v9nQJGODjdMX2E',5),('xV357S3Jfzlo0-81PClcGPEbtYE-aPim1Eh54q6rcvCEBqKeGViCEQJTmUsR3II5XA8fYwHFHTGEb60P6nfFRKiUYeiSSe2IYKY6Frd6kyOA-7GZp8Vtto9ppNUU85dPNpLAcudvrxPJsDZIzuwZTqH2I_gb52mavx3SV1hP1xO6P22iU9i79DL2SswsfS1VAPWt5QqXI3hAHfXNW0daYvGWt7eoL_WgeC667o8HvzTwxWchp2jBeNtJeaC3NSKV',5),('Z1vhCoqjplLcyR8Sy5FPNxtaU5D0YoG_3DHhRnDfaTvxIMFll7pJ_BoTpHlUZQ0FNSqs5FKuKwdOglj67s2iVkID5gEsMlQcOpDkYjyU8-g9u7F9e124BWT_BfgbAVMGg8a7_vVF7lynPEMbJFP52jYqBJwLdL9cggLVFWrp36Ee52EOFVgw_Zr92lgzKjwKiweqlM6y8K4aXV1V8UyngnfE2qqgpqZpDRVr9EB7gu0wIWEoN64O3m225UW_DB8F',5);
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-07 21:27:39
