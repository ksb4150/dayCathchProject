-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- usertbl_db 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `usertbl_db`;
CREATE DATABASE IF NOT EXISTS `usertbl_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `usertbl_db`;

-- 테이블 usertbl_db.board 구조 내보내기
DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `articleNO` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `writeDate` timestamp NULL DEFAULT current_timestamp(),
  `uid` varchar(45) NOT NULL,
  `viewCnt` int(11) unsigned DEFAULT 0,
  `userName` varchar(45) DEFAULT NULL,
  `commentCnt` int(11) DEFAULT 0,
  `articleCategory` varchar(45) DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `addressList` longtext DEFAULT NULL,
  `mainImageFileName` varchar(100) DEFAULT NULL,
  `likecount` int(11) DEFAULT 0,
  PRIMARY KEY (`articleNO`),
  KEY `fk_board_user_idx` (`uid`),
  CONSTRAINT `fk_board_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=979261 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.board:~5 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`articleNO`, `content`, `writeDate`, `uid`, `viewCnt`, `userName`, `commentCnt`, `articleCategory`, `title`, `addressList`, `mainImageFileName`, `likecount`) VALUES
	(147375, '<p><img src="bImgDownload.do?articleNO=147375&amp;orginFileName=다운로드 (4).jpg" style="width: 50%;" data-filename=""></p><p>강아지랑 갈 바다 추천해주세여!</p><p>				\r\n				</p>', '2022-11-11 15:05:32', 'U1234B', 34, '사용자B', 0, '자유', '바다가고싶네요', '', '17.jpg', 1),
	(272976, '<p><img src="bImgDownload.do?articleNO=272976&amp;orginFileName=다운로드.jpg" style="width: 50%;" data-filename=""></p><p>영도등대</p><p><br></p><p><img src="bImgDownload.do?articleNO=272976&amp;orginFileName=다운로드.png" style="width: 50%;" data-filename=""></p><p>자갈치시장</p><p><br></p><p><br></p><p><img src="bImgDownload.do?articleNO=272976&amp;orginFileName=다운로드 (2).jpg" style="width: 50%;" data-filename=""></p><p>부산 국제 영화제에 다녀왔어요</p><p><br></p><p><img src="bImgDownload.do?articleNO=272976&amp;orginFileName=다운로드 (1).jpg" style="width: 50%;" data-filename=""></p><p>숙소에서 보이는 해운대</p><p><br></p><p>옛 기억을 더듬어서 다녀왔는데, 기억 속 예전 모습과는 다른 느낌이더군요</p><p>볼거리가 많은 곳이니 부산 여행코스 추천드려요^^<br></p><p><br></p><p><br></p><p><br></p>', '2022-11-11 14:59:23', 'U1234A', 16, '사용자A', 0, '후기', '부산 여행 후기욤', '부산 해운대구 중동 1015,부산 해운대구 중동 1015,부산 수영구 광안동 192-20,부산 중구 신창동4가 35-3,부산 영도구 동삼동 산 29-1', '다운로드 (3).jpg', 3),
	(478094, '<p><br></p><p>부산 놀러왔는데</p><p>어디가야 좋을까요</p><p><br></p><p><img src="bImgDownload.do?articleNO=478094&amp;orginFileName=다운로드 (6).jpg" style="width: 50%;" data-filename=""></p><p><br></p><p><img src="bImgDownload.do?articleNO=478094&amp;orginFileName=다운로드 (5).jpg" style="width: 50%;" data-filename="">				\r\n				</p>', '2022-11-11 15:03:20', 'U1234B', 3, '사용자B', 0, '자유', '부산 왔어요', '', '다운로드 (5).jpg', 1),
	(711447, '요즘 가기 좋은 곳 추천해주세요', '2022-11-11 14:45:52', 'U1234A', 1, '사용자A', 0, '자유', '국내여행 어디가 좋을까요', '', '16.jpg', 0),
	(940541, '<p><br></p><p><br></p><p><b style="font-family: &quot;Noto Sans KR&quot;, &quot;애플 SD 산돌고딕 Neo&quot;, &quot;Apple SD Gothic Neo&quot;, 돋움, Dotum, 굴림, Gulim, Helvetica, sans-serif; font-size: 17px;"><span style="font-family: Arial;">여행 코스&nbsp;</span></b><span style="font-family: Arial; font-size: 17px;">바우지움 조각미술관 – 파운드 - 영진해변 – 월성식당 – (숙소) – 유알마인 – 뮤지엄 산</span></p><p><b style="font-family: &quot;Noto Sans KR&quot;, &quot;애플 SD 산돌고딕 Neo&quot;, &quot;Apple SD Gothic Neo&quot;, 돋움, Dotum, 굴림, Gulim, Helvetica, sans-serif; font-size: 17px;">여행에서 추천하는 것</b><span style="font-family: &quot;Noto Sans KR&quot;, &quot;애플 SD 산돌고딕 Neo&quot;, &quot;Apple SD Gothic Neo&quot;, 돋움, Dotum, 굴림, Gulim, Helvetica, sans-serif; font-size: 17px;">&nbsp;조용하고 한적한 바우지움 조각미술관 자체도 좋지만, 물의 정원 건너 의자에 앉아 꼭 쉬었다 오길 바란다. 강릉의 파운드는 다양한 내츄럴 와인 및 컨벤셔널 와인을 구매하고 마실 수 있는 와인 바틀샵이다. 유니크한 와인잔도 판매한다. 영진해변은 주문진에서 조금 떨어진 작은 해변이다. 규모가 크진 않지만 조용하고 깨끗해 더욱더 매력적이다. 월성식당은 생물이 아닌 찬바람에 꾸덕꾸덕하게 말린 반건조 장치를 이용한 장치찜이 유명하다. 쫄깃쫄깃한 식감과 양념이 일품이다. 카페보단 복합문화공간이라는 수식어가 더 잘 어울리는 원주의 유알마인에서는 다양한 전시와 공연이 수시로 열린다. 강원도 여행의 마지막은 뮤지엄 산이 적당하다. 뮤지엄 산의 여러 프로그램 중 명상 프로그램은 적극 추천하는 코스.</span><span style="font-family: Arial; font-size: 17px;"><br></span><br></p><p><br></p><p><img src="bImgDownload.do?articleNO=940541&amp;orginFileName=19.jpg" style="width: 50%;" data-filename=""></p><p><br></p><p><br></p><p><img src="bImgDownload.do?articleNO=940541&amp;orginFileName=14.jpg" style="width: 50%;" data-filename=""></p><p><br></p><p><img src="bImgDownload.do?articleNO=940541&amp;orginFileName=17.jpg" style="width: 50%;" data-filename=""></p><p><br></p><p><br></p><p>				\r\n				</p>', '2022-11-11 14:51:32', 'U1234A', 25, '사용자A', 1, '계획', '강원도 여행 코스 추천', '강원 원주시 지정면 월송리 산 129-5,강원 원주시 지정면 월송리 999-13,강원 강릉시 연곡면 영진리 72-2,강원 고성군 토성면 원암리 288,강원 강릉시 주문진읍 주문리 312-148,강원 원주시 지정면 안창리 595-14', '10.jpg', 1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 usertbl_db.boardcomment 구조 내보내기
DROP TABLE IF EXISTS `boardcomment`;
CREATE TABLE IF NOT EXISTS `boardcomment` (
  `articleNO` int(11) NOT NULL,
  `commentNo` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `commentContent` varchar(300) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `commentCnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentNo`),
  KEY `fk_comment_tbl_userTBL1_idx` (`uid`),
  KEY `fk_comment_board_idx` (`articleNO`),
  CONSTRAINT `fk_comment_board` FOREIGN KEY (`articleNO`) REFERENCES `board` (`articleNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.boardcomment:~2 rows (대략적) 내보내기
DELETE FROM `boardcomment`;
/*!40000 ALTER TABLE `boardcomment` DISABLE KEYS */;
INSERT INTO `boardcomment` (`articleNO`, `commentNo`, `uid`, `userName`, `commentContent`, `regDate`, `commentCnt`) VALUES
	(90327, 2, 'U1234A', '사용자A', 'fkdkfsj;kads', '2022-11-10 16:20:05', NULL),
	(940541, 10, 'U1234B', '사용자B', '유용한 정보였어요!!', '2022-11-14 11:53:20', NULL);
/*!40000 ALTER TABLE `boardcomment` ENABLE KEYS */;

-- 테이블 usertbl_db.boardimagefiles 구조 내보내기
DROP TABLE IF EXISTS `boardimagefiles`;
CREATE TABLE IF NOT EXISTS `boardimagefiles` (
  `imageFileNO` int(11) NOT NULL AUTO_INCREMENT,
  `imageFileName` varchar(50) DEFAULT NULL,
  `articleNO` int(11) NOT NULL,
  `regDate` date DEFAULT NULL,
  PRIMARY KEY (`imageFileNO`),
  KEY `fk_boardImageFiles_board1_idx` (`articleNO`),
  CONSTRAINT `fk_boardImageFiles_board1` FOREIGN KEY (`articleNO`) REFERENCES `board` (`articleNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.boardimagefiles:~0 rows (대략적) 내보내기
DELETE FROM `boardimagefiles`;
/*!40000 ALTER TABLE `boardimagefiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `boardimagefiles` ENABLE KEYS */;

-- 테이블 usertbl_db.cart 구조 내보내기
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL,
  `uid` varchar(45) DEFAULT NULL,
  `goodsQty` int(11) DEFAULT NULL,
  `cartcheckin` date DEFAULT NULL,
  `cartcheckout` date DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  `goodsPrice` int(11) DEFAULT NULL,
  `creDate` timestamp NULL DEFAULT current_timestamp(),
  `cartckid` varchar(100) DEFAULT NULL,
  `cartcklimit` timestamp NULL DEFAULT current_timestamp(),
  `goodsImageFileName` varchar(100) DEFAULT NULL,
  `buid` varchar(45) DEFAULT NULL,
  `numOfTourist` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `fk_cart_goods1_idx` (`goodsId`),
  KEY `fk_cart_userTBL1_idx` (`uid`),
  CONSTRAINT `fk_cart_goods1` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_userTBL1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.cart:~21 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cartId`, `goodsId`, `uid`, `goodsQty`, `cartcheckin`, `cartcheckout`, `goodsName`, `companyName`, `goodsPrice`, `creDate`, `cartckid`, `cartcklimit`, `goodsImageFileName`, `buid`, `numOfTourist`) VALUES
	(16, 5552, NULL, 2, '2022-09-28', '2022-09-30', 'Couple room(2BF) Standard Ocean View(1 Twin B', '포에마 스테이', 74800, '2022-09-27 09:56:51', 'UPeLGq', NULL, '5552.JPG', NULL, NULL),
	(23, 5551, NULL, 1, '2022-09-28', '2022-09-29', 'Standard mountain view (included breakfast fo', '포에마 스테이', 73601, '2022-09-27 15:50:28', 'o2eAwb', NULL, '5551.JPG', 'euiCVh', NULL),
	(49, 14142, NULL, 1, '2022-10-25', '2022-10-26', 'STANDARD with twin bed', '페어몬트 앰배서더', 93779, '2022-10-01 14:47:42', 'a358br', NULL, '14142.JPG', 'jVea9e', NULL),
	(69, 5551, NULL, 1, '2022-10-05', '2022-10-05', 'Standard mountain view (included breakfast fo', '포에마 스테이', 73601, '2022-10-04 14:42:44', 'wTwKwd', NULL, '5551.JPG', 'euiCVh', NULL),
	(77, 9991, NULL, 2, '2022-10-06', '2022-10-06', 'Twin room', '신라스테이', 107543, '2022-10-05 11:16:24', '3ae0yj', NULL, '9991.JPG', '2Hkfdu', NULL),
	(79, 4441, NULL, 1, '2022-10-07', '2022-10-07', 'Deluxe Family Twin', '별똥별 호텔', 118252, '2022-10-06 12:45:38', 'z4VCFl', NULL, '4441.JPG', 'B1234I', 1),
	(81, 10103, NULL, 1, '2022-10-06', '2022-10-08', '정 1품 금실', '왕의지밀', 145000, '2022-10-06 18:38:27', 'mlsYYa', NULL, '10103.JPG', 'B1234K', 1),
	(88, 6661, NULL, 2, '2022-10-07', '2022-10-09', '디럭스 트윈룸', '리베라호텔', 260000, '2022-10-07 11:07:37', 'xivPDW', NULL, '6661.JPG', 'B1234F', 3),
	(90, 5553, NULL, 1, '2022-10-07', '2022-10-08', '스탠다드 더블룸', '리베라호텔', 240000, '2022-10-07 11:23:23', 'xivPDW', NULL, '5553.JPG', 'B1234F', 2),
	(98, 7773, NULL, 1, '2022-10-14', '2022-10-15', '스탠다드 트윈', 'Hotel in 9', 77500, '2022-10-13 11:01:12', 'H3ptDu', NULL, '7773.JPG', 'B1234H', 1),
	(115, 10103, NULL, 1, '2022-10-20', '2022-10-21', '정 1품 금실', '왕의지밀', 145000, '2022-10-20 11:38:23', 'ZWW7DJ', '2022-10-20 11:38:23', '10103.JPG', 'B1234K', 1),
	(116, 10103, NULL, 1, '2022-10-21', '2022-10-22', '정 1품 금실', '왕의지밀', 145000, '2022-10-20 11:38:44', 'ZWW7DJ', '2022-10-20 11:38:44', '10103.JPG', 'B1234K', 1),
	(117, 4441, NULL, 1, '2022-10-21', '2022-10-21', 'Deluxe Family Twin', '통나무파크', 118252, '2022-10-20 11:46:14', 'ZWW7DJ', '2022-10-20 11:46:14', '4441.JPG', 'B1234D', 1),
	(118, 357543, NULL, 1, '2022-10-21', '2022-10-22', '1인실(더블베드, 개인화장실)', '위게스트하우스', 95000, '2022-10-21 15:30:41', 'Fr7MTp', '2022-10-21 15:30:41', '357543.jpg', 'B1234T', 2),
	(122, 5553, NULL, 1, '2022-11-05', '2022-11-06', '스탠다드 더블룸', '리베라호텔', 240000, '2022-11-05 15:15:13', 'rwqeUn', '2022-11-05 15:15:13', '5553.JPG', 'B1234F', 2),
	(123, 549251, NULL, 1, '2022-11-08', '2022-11-09', '스탠다드 트윈룸', '베니키아호텔대림', 82000, '2022-11-07 17:25:04', 'xIjXog', '2022-11-07 17:25:04', '549251.jpg', 'B1234W', 2),
	(126, 623568, NULL, 1, '2022-11-09', '2022-11-10', '스탠다드 더블룸', '베니키아호텔대림', 321500, '2022-11-08 14:33:58', NULL, '2022-11-08 14:33:58', '623568.jpg', 'B1234W', 2),
	(127, 5553, NULL, 1, '2022-11-09', '2022-11-10', '스탠다드 더블룸', '리베라호텔', 240000, '2022-11-09 10:07:58', NULL, '2022-11-09 10:07:58', '5553.JPG', 'B1234F', 2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 usertbl_db.cs 구조 내보내기
DROP TABLE IF EXISTS `cs`;
CREATE TABLE IF NOT EXISTS `cs` (
  `csNO` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `txtContent` text DEFAULT NULL,
  `writeDate` timestamp NULL DEFAULT current_timestamp(),
  `processingStatus` int(11) DEFAULT NULL,
  `userType` varchar(20) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `secret` varchar(1) DEFAULT NULL,
  `goodsMainCategory` varchar(45) DEFAULT NULL,
  `csCategory` varchar(45) DEFAULT NULL,
  `userPhoneNumber` varchar(20) DEFAULT NULL,
  `ordersNO` int(11) DEFAULT NULL,
  `originNo` int(11) NOT NULL DEFAULT 0,
  `groupOrd` int(11) NOT NULL DEFAULT 0,
  `groupLayer` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`csNO`),
  KEY `fk_cs_userTBL1_idx` (`uid`),
  CONSTRAINT `fk_cs_userTBL1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.cs:~4 rows (대략적) 내보내기
DELETE FROM `cs`;
/*!40000 ALTER TABLE `cs` DISABLE KEYS */;
INSERT INTO `cs` (`csNO`, `uid`, `title`, `txtContent`, `writeDate`, `processingStatus`, `userType`, `writer`, `secret`, `goodsMainCategory`, `csCategory`, `userPhoneNumber`, `ordersNO`, `originNo`, `groupOrd`, `groupLayer`) VALUES
	(37, 'A1234A', '김수빈 ', '멍청이', '2022-10-07 11:31:23', NULL, NULL, '김수빈', NULL, NULL, '숙박', '01000000000', 561526526, 39, 0, 1),
	(38, 'A1234A', '김수빈 ', '멍청이', '2022-10-07 11:31:25', NULL, NULL, '김수빈', NULL, NULL, '숙박', '01000000000', 561526526, 0, 0, 0),
	(39, 'U1234A', '안녕하세요', '안녕하세요', '2022-11-14 12:19:59', NULL, NULL, '김수빈', NULL, NULL, '숙박', '01000000000', 34324234, 0, 0, 0),
	(40, 'U1234A', 'asdf', 'asdf', '2022-10-17 17:59:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1);
/*!40000 ALTER TABLE `cs` ENABLE KEYS */;

-- 테이블 usertbl_db.cscomment 구조 내보내기
DROP TABLE IF EXISTS `cscomment`;
CREATE TABLE IF NOT EXISTS `cscomment` (
  `csNO` int(11) NOT NULL,
  `commentNo` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `commentContent` varchar(300) DEFAULT NULL,
  `creDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`commentNo`),
  KEY `fk_csComment_user1_idx` (`uid`),
  KEY `fk_csComment_cs_idx` (`csNO`) USING BTREE,
  CONSTRAINT `fk_csComment_cs` FOREIGN KEY (`csNO`) REFERENCES `cs` (`csNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_csComment_user1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.cscomment:~0 rows (대략적) 내보내기
DELETE FROM `cscomment`;
/*!40000 ALTER TABLE `cscomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cscomment` ENABLE KEYS */;

-- 테이블 usertbl_db.event 구조 내보내기
DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `eventId` int(11) NOT NULL,
  `eventName` varchar(45) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.event:~0 rows (대략적) 내보내기
DELETE FROM `event`;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- 테이블 usertbl_db.faq 구조 내보내기
DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `faq_no` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL DEFAULT '0',
  `faq_title` varchar(50) DEFAULT NULL,
  `faq_date` datetime DEFAULT current_timestamp(),
  `faq_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`faq_no`),
  KEY `uid` (`uid`),
  CONSTRAINT `fk_faq_userTBL1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.faq:~0 rows (대략적) 내보내기
DELETE FROM `faq`;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- 테이블 usertbl_db.goodimagefiles 구조 내보내기
DROP TABLE IF EXISTS `goodimagefiles`;
CREATE TABLE IF NOT EXISTS `goodimagefiles` (
  `fileNumber` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL,
  `orginFileName` varchar(100) DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `deleteCheck` char(1) DEFAULT NULL,
  `originThumbNail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fileNumber`),
  KEY `fk_goodImageFile_good1_idx` (`goodsId`),
  CONSTRAINT `fk_goodImageFile_good1` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2331 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.goodimagefiles:~236 rows (대략적) 내보내기
DELETE FROM `goodimagefiles`;
/*!40000 ALTER TABLE `goodimagefiles` DISABLE KEYS */;
INSERT INTO `goodimagefiles` (`fileNumber`, `goodsId`, `orginFileName`, `fileSize`, `createDate`, `deleteCheck`, `originThumbNail`) VALUES
	(16, 1113, 'standard1.jpg', NULL, NULL, NULL, NULL),
	(17, 1113, 'standard2.jpg', NULL, NULL, NULL, NULL),
	(18, 1113, 'standard3.jpg', NULL, NULL, NULL, NULL),
	(19, 2221, 'twin1.jpg', NULL, NULL, NULL, NULL),
	(20, 2221, 'twin2.jpg', NULL, NULL, NULL, NULL),
	(21, 2221, 'twin3.jpg', NULL, NULL, NULL, NULL),
	(22, 2222, 'king1.jpg', NULL, NULL, NULL, NULL),
	(23, 2222, 'king2.jpg', NULL, NULL, NULL, NULL),
	(24, 2222, 'king3.jpg', NULL, NULL, NULL, NULL),
	(25, 2223, 'twin.jpg', NULL, NULL, NULL, NULL),
	(26, 2223, 'twin2.jpg', NULL, NULL, NULL, NULL),
	(27, 2223, 'twin3.jpg', NULL, NULL, NULL, NULL),
	(28, 3331, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(29, 3331, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(30, 3331, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(31, 3332, '디럭스1.jpg', NULL, NULL, NULL, NULL),
	(32, 3332, '디럭스2.jpg', NULL, NULL, NULL, NULL),
	(33, 3332, '디럭스3.jpg', NULL, NULL, NULL, NULL),
	(34, 3333, 'ondol1.jpg', NULL, NULL, NULL, NULL),
	(35, 3333, 'ondol2.jpg', NULL, NULL, NULL, NULL),
	(36, 3333, 'ondol3.jpg', NULL, NULL, NULL, NULL),
	(37, 4441, 'dang1.jpg', NULL, NULL, NULL, NULL),
	(38, 4441, 'dang2.jpg', NULL, NULL, NULL, NULL),
	(39, 4441, 'dang3.jpg', NULL, NULL, NULL, NULL),
	(40, 4442, 'park1.jpg', NULL, NULL, NULL, NULL),
	(41, 4442, 'part2.jpg', NULL, NULL, NULL, NULL),
	(42, 4442, 'park3.jpg', NULL, NULL, NULL, NULL),
	(48, 47581, 'menu2.png', NULL, NULL, NULL, NULL),
	(49, 47581, 'searching1.png', NULL, NULL, NULL, NULL),
	(52, 759647, 'living-room-ga724f2c4b_640.jpg', NULL, NULL, NULL, NULL),
	(56, 756284, 'girl.jpg', NULL, NULL, NULL, NULL),
	(57, 756284, 'free-logo-technology-7413150.png', NULL, NULL, NULL, NULL),
	(58, 517079, '2.png', NULL, NULL, NULL, NULL),
	(59, 517079, '1.jpg', NULL, NULL, NULL, NULL),
	(60, 517079, '3.jpg', NULL, NULL, NULL, NULL),
	(61, 517079, '4.jpg', NULL, NULL, NULL, NULL),
	(66, 498831, '1.jpg', NULL, NULL, NULL, NULL),
	(67, 498831, '2.png', NULL, NULL, NULL, NULL),
	(68, 498831, '3.jpg', NULL, NULL, NULL, NULL),
	(69, 498831, '4.jpg', NULL, NULL, NULL, NULL),
	(70, 498831, 'house-g4e0e33f2f_640.jpg', NULL, NULL, NULL, NULL),
	(71, 846752, 'house-g4e0e33f2f_640.jpg', NULL, NULL, NULL, NULL),
	(72, 846752, 'searching1 (1).png', NULL, NULL, NULL, NULL),
	(73, 846752, '2.png', NULL, NULL, NULL, NULL),
	(74, 917887, 'couch-g8d6681c31_1920.jpg', NULL, NULL, NULL, NULL),
	(75, 917887, 'house-g4e0e33f2f_640.jpg', NULL, NULL, NULL, NULL),
	(76, 917887, 'house-g1b8924e56_640.jpg', NULL, NULL, NULL, NULL),
	(77, 271194, '271194.jpg', NULL, NULL, NULL, NULL),
	(78, 271194, 'couch-g8d6681c31_1920.jpg', NULL, NULL, NULL, NULL),
	(79, 271194, 'couch-g92f2b8c2b_640.png', NULL, NULL, NULL, NULL),
	(80, 271194, 'apartment-g70ed1b952_640.jpg', NULL, NULL, NULL, NULL),
	(81, 271194, 'house-g4e0e33f2f_640.jpg', NULL, NULL, NULL, NULL),
	(82, 271194, 'couch-g581fff180_640.jpg', NULL, NULL, NULL, NULL),
	(83, 126275, '126275.jpg', NULL, NULL, NULL, NULL),
	(84, 126275, 'house-g1b8924e56_640.jpg', NULL, NULL, NULL, NULL),
	(85, 126275, 'couch-g581fff180_640.jpg', NULL, NULL, NULL, NULL),
	(86, 126275, 'house-g687a6083d_640.jpg', NULL, NULL, NULL, NULL),
	(87, 126275, 'searching.png', NULL, NULL, NULL, NULL),
	(88, 126275, 'house-g687a6083d_640.jpg', NULL, NULL, NULL, NULL),
	(89, 40029, '40029.jpg', NULL, NULL, NULL, NULL),
	(90, 40029, 'couch-g8d6681c31_1920.jpg', NULL, NULL, NULL, NULL),
	(91, 40029, 'couch-g92f2b8c2b_640.png', NULL, NULL, NULL, NULL),
	(92, 40029, 'apartment-g70ed1b952_640.jpg', NULL, NULL, NULL, NULL),
	(93, 40029, 'house-g4e0e33f2f_640.jpg', NULL, NULL, NULL, NULL),
	(94, 40029, 'couch-g581fff180_640.jpg', NULL, NULL, NULL, NULL),
	(102, 259821, '259821.jpg', NULL, NULL, NULL, NULL),
	(103, 259821, 'couch-g581fff180_640.jpg', NULL, NULL, NULL, NULL),
	(104, 97708, '97708.jpg', NULL, NULL, NULL, NULL),
	(105, 97708, 'house-g687a6083d_640.jpg', NULL, NULL, NULL, NULL),
	(106, 97708, 'living-room-ga724f2c4b_640.jpg', NULL, NULL, NULL, NULL),
	(107, 97708, 'living-room-ga724f2c4b_640.jpg', NULL, NULL, NULL, NULL),
	(108, 301964, '301964.jpg', NULL, NULL, NULL, NULL),
	(109, 301964, 'apartment-g70ed1b952_640.jpg', NULL, NULL, NULL, NULL),
	(110, 8881, 'ZyunFpOoHks6odZrRqiTSM6Q.jpg', NULL, NULL, NULL, NULL),
	(111, 8881, 'YnLSE-Q-zuO8aT_U4IqaaAIX.jpg', NULL, NULL, NULL, NULL),
	(112, 8881, '1uH1KxyK0Ez-uAe8BHookZmG.jpg', NULL, NULL, NULL, NULL),
	(113, 7772, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(114, 7772, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(115, 7772, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(116, 5552, 'double5.jpg', NULL, NULL, NULL, NULL),
	(117, 5552, 'double7.jpg', NULL, NULL, NULL, NULL),
	(118, 5552, 'double3.jpg', NULL, NULL, NULL, NULL),
	(119, 5552, '용량축소썬시티DSC_0067.jpg', NULL, NULL, NULL, NULL),
	(120, 5551, '복층도미토리DSC_0210.jpg', NULL, NULL, NULL, NULL),
	(121, 5551, '2.jpg', NULL, NULL, NULL, NULL),
	(122, 5551, '11.jpg', NULL, NULL, NULL, NULL),
	(123, 5551, '4.jpg', NULL, NULL, NULL, NULL),
	(124, 5551, 'image.jpg', NULL, NULL, NULL, NULL),
	(125, 5551, 'image.jpg', NULL, NULL, NULL, NULL),
	(128, 8883, '별장2호_전경.jpg', NULL, NULL, NULL, NULL),
	(129, 8883, '20210902_160206.jpg', NULL, NULL, NULL, NULL),
	(131, 9991, '별장6호.jpg', NULL, NULL, NULL, NULL),
	(132, 9991, '별장6호실내.jpg', NULL, NULL, NULL, NULL),
	(133, 9991, '별장6호_화장실.jpg', NULL, NULL, NULL, NULL),
	(134, 9992, '20210902_163610.jpg', NULL, NULL, NULL, NULL),
	(135, 9992, '20210902_163219.jpg', NULL, NULL, NULL, NULL),
	(136, 9992, '20210902_163035.jpg', NULL, NULL, NULL, NULL),
	(137, 13133, 'image (1).jpg', NULL, NULL, NULL, NULL),
	(138, 13133, 'image (3).jpg', NULL, NULL, NULL, NULL),
	(139, 13133, 'image (2).jpg', NULL, NULL, NULL, NULL),
	(140, 13133, 'image (4).jpg', NULL, NULL, NULL, NULL),
	(141, 14141, 'image (1).jpg', NULL, NULL, NULL, NULL),
	(142, 14141, 'image (2).jpg', NULL, NULL, NULL, NULL),
	(143, 14141, 'image (3).jpg', NULL, NULL, NULL, NULL),
	(144, 14141, 'image (5).jpg', NULL, NULL, NULL, NULL),
	(145, 14141, 'image.jpg', NULL, NULL, NULL, NULL),
	(146, 14142, 'image.jpg', NULL, NULL, NULL, NULL),
	(147, 14142, 'image (1).jpg', NULL, NULL, NULL, NULL),
	(148, 14142, 'image (2).jpg', NULL, NULL, NULL, NULL),
	(149, 14142, 'image (3).jpg', NULL, NULL, NULL, NULL),
	(150, 14142, 'image (4).jpg', NULL, NULL, NULL, NULL),
	(151, 10103, 'cx-PeucIitGJ0OlKwhLIeV7E.jpg', NULL, NULL, NULL, NULL),
	(152, 10103, 'upload_364398fd428331ac68c7e55d3c073c98.jpg', NULL, NULL, NULL, NULL),
	(153, 10103, 'YAFRbykJgoUYcX0byd0aWYdd.jpg', NULL, NULL, NULL, NULL),
	(154, 11111, '다운로드.png', NULL, NULL, NULL, NULL),
	(155, 11111, '다운로드 (1).jpg', NULL, NULL, NULL, NULL),
	(156, 11111, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(157, 11111, 'upload_7d3ab2453e1559c7f820afe7e8788a17.jpg', NULL, NULL, NULL, NULL),
	(158, 11112, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(159, 11112, '다운로드5.jpg', NULL, NULL, NULL, NULL),
	(160, 11112, '다운로드 (2).jpg', NULL, NULL, NULL, NULL),
	(161, 11112, '다운로드 (1).jpg', NULL, NULL, NULL, NULL),
	(162, 549251, 'upload_155f642169650e2bf476af9088f83265.jpg', NULL, NULL, NULL, NULL),
	(163, 549251, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(164, 549251, '다운로드 (1).jpg', NULL, NULL, NULL, NULL),
	(168, 623568, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(169, 623568, '다운로드 (2).jpg', NULL, NULL, NULL, NULL),
	(170, 623568, '다운로드 (1).jpg', NULL, NULL, NULL, NULL),
	(171, 357543, 'KakaoTalk_20210217_154711822_20.jpg', NULL, NULL, NULL, NULL),
	(172, 357543, '꾸미기_NNE_6206.jpg', NULL, NULL, NULL, NULL),
	(173, 357543, 'KakaoTalk_20210217_154007840_16.jpg', NULL, NULL, NULL, NULL),
	(174, 405567, 'KakaoTalk_20210217_112356848_03.jpg', NULL, NULL, NULL, NULL),
	(175, 405567, 'KakaoTalk_20210217_111720968_08.jpg', NULL, NULL, NULL, NULL),
	(176, 405567, 'KakaoTalk_20210217_111720968_27.jpg', NULL, NULL, NULL, NULL),
	(177, 405567, 'KakaoTalk_20210217_111720968_20.jpg', NULL, NULL, NULL, NULL),
	(178, 411938, 'KakaoTalk_20210217_154040590_02.jpg', NULL, NULL, NULL, NULL),
	(179, 411938, 'KakaoTalk_20210217_154007840_24.jpg', NULL, NULL, NULL, NULL),
	(180, 411938, 'KakaoTalk_20210217_154007840_11.jpg', NULL, NULL, NULL, NULL),
	(181, 411938, 'KakaoTalk_20210217_154007840_27.jpg', NULL, NULL, NULL, NULL),
	(182, 5553, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(183, 5553, '다운로드2.jpg', NULL, NULL, NULL, NULL),
	(184, 5553, '다운로드 (1).jpg', NULL, NULL, NULL, NULL),
	(185, 6661, 'upload_be4819c67825af45dc3464859a0c4e68.jpg', NULL, NULL, NULL, NULL),
	(186, 6661, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(187, 6661, 'upload_11e2070f62ef7375fd21d916a3650a02.jpeg', NULL, NULL, NULL, NULL),
	(188, 6662, '다운로드 (2).jpg', NULL, NULL, NULL, NULL),
	(189, 6662, '다운로드.jpg', NULL, NULL, NULL, NULL),
	(190, 6662, '다운로드 (1).jpg', NULL, NULL, NULL, NULL),
	(214, 677859, 'family1.jpg', NULL, NULL, NULL, NULL),
	(215, 677859, 'family2.jpg', NULL, NULL, NULL, NULL),
	(216, 677859, 'family3.jpg', NULL, NULL, NULL, NULL),
	(217, 1113, 'standard4.jpg', NULL, NULL, NULL, NULL),
	(218, 2221, 'twin4.jpg', NULL, NULL, NULL, NULL),
	(219, 2223, 'twin4.jpg', NULL, NULL, NULL, NULL),
	(220, 3331, 'pic4.jpg', NULL, NULL, NULL, NULL),
	(221, 3333, 'ondol4.jpg', NULL, NULL, NULL, NULL),
	(222, 4443, 'park1.jpg', NULL, NULL, NULL, NULL),
	(223, 4443, 'park2.jpg', NULL, NULL, NULL, NULL),
	(224, 4443, 'park3.jpg', NULL, NULL, NULL, NULL),
	(225, 6663, 'twin1.jpg', NULL, NULL, NULL, NULL),
	(226, 6663, 'twin2.jpg', NULL, NULL, NULL, NULL),
	(227, 6663, 'twin3.jpg', NULL, NULL, NULL, NULL),
	(228, 7771, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(229, 7771, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(230, 7771, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(231, 7773, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(232, 7773, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(233, 7773, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(234, 9993, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(235, 9993, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(236, 9993, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(237, 10101, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(238, 10101, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(239, 10101, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(240, 12121, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(241, 12121, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(242, 12121, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(243, 11113, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(244, 11113, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(245, 11113, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(246, 12122, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(247, 12122, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(248, 12122, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(249, 12123, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(250, 12123, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(251, 12123, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(252, 13131, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(253, 13131, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(254, 13131, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(255, 13132, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(256, 13132, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(257, 13133, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(336, 39297, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(337, 39297, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(338, 39297, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(339, 35231, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(340, 35231, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(341, 35231, 'pic4.jpg', NULL, NULL, NULL, NULL),
	(342, 852321, 'pic1.jpg', NULL, NULL, NULL, NULL),
	(343, 852321, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(345, 517725, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(347, 100513, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(348, 100513, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(350, 708001, 'pic2.jpg', NULL, NULL, NULL, NULL),
	(351, 708001, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(352, 708001, 'pic4.jpg', NULL, NULL, NULL, NULL),
	(357, 224126, 'pic3.jpg', NULL, NULL, NULL, NULL),
	(358, 224126, 'pic4.jpg', NULL, NULL, NULL, NULL),
	(360, 970074, 'ed5196b2_z.jpg', NULL, NULL, NULL, NULL),
	(361, 970074, 'aad1f3c2_z.jpg', NULL, NULL, NULL, NULL),
	(363, 704372, 'a8829433-e05a-4d3c-9d31-da300c78a415-original.jpg', NULL, NULL, NULL, NULL),
	(364, 704372, '19f5160b-6cd3-447b-a10c-e83a709b4edd-original.jpg', NULL, NULL, NULL, NULL),
	(369, 900605, '47a172b4-3b4c-4dde-94c4-66aadb5e462e-original.jpg', NULL, NULL, NULL, NULL),
	(370, 900605, '22637cfc-dc3b-4612-8dab-135ee6a8b5e8-original.jpg', NULL, NULL, NULL, NULL),
	(372, 287183, '8302f703-5e64-43e9-8904-4b02682156d2-original.jpg', NULL, NULL, NULL, NULL),
	(373, 287183, '67514f88-658c-42a1-98e1-8ff280c702d8-original.jpg', NULL, NULL, NULL, NULL),
	(374, 287183, '72e96da9-308a-4b70-8dae-188677097c45-original.jpg', NULL, NULL, NULL, NULL),
	(376, 401803, '74395041-2aae-470e-a68a-ea869d757082-original.jpg', NULL, NULL, NULL, NULL),
	(377, 401803, '412ba723-0b12-4865-8de0-15728117f316-original.jpg', NULL, NULL, NULL, NULL),
	(378, 401803, '7fa6f339-7b14-4278-8019-391270dd66bf-original.jpg', NULL, NULL, NULL, NULL),
	(2170, 175159, '스포츠몬스터2.jpg', NULL, NULL, NULL, NULL),
	(2180, 175159, '스포츠몬스터3.JPG', NULL, NULL, NULL, NULL),
	(2200, 625985, '에버랜드2.JPG', NULL, NULL, NULL, NULL),
	(2210, 625985, '에버랜드3.JPG', NULL, NULL, NULL, NULL),
	(2220, 905667, '제주2.JPG', NULL, NULL, NULL, NULL),
	(2230, 905667, '제주3.JPG', NULL, NULL, NULL, NULL),
	(2240, 754017, '전주2.JPG', NULL, NULL, NULL, NULL),
	(2250, 754017, '전주3.JPG', NULL, NULL, NULL, NULL),
	(2260, 563314, '부산2.JPG', NULL, NULL, NULL, NULL),
	(2270, 563314, '부산3.JPG', NULL, NULL, NULL, NULL),
	(2280, 368851, '서울2.JPG', NULL, NULL, NULL, NULL),
	(2290, 368851, '서울3.JPG', NULL, NULL, NULL, NULL),
	(2300, 368851, '서울1.JPG', NULL, NULL, NULL, NULL),
	(2310, 509567, '난타2.JPG', NULL, NULL, NULL, NULL),
	(2320, 509567, '난타3.JPG', NULL, NULL, NULL, NULL),
	(2330, 168290, 's2.JPG', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `goodimagefiles` ENABLE KEYS */;

-- 테이블 usertbl_db.goodreview 구조 내보내기
DROP TABLE IF EXISTS `goodreview`;
CREATE TABLE IF NOT EXISTS `goodreview` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `goodsId` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `userName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `fk_goodReview_goods1_idx` (`goodsId`),
  KEY `fk_goodReview_user1_idx` (`uid`),
  CONSTRAINT `fk_goodReview_goods1` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goodReview_user1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.goodreview:~4 rows (대략적) 내보내기
DELETE FROM `goodreview`;
/*!40000 ALTER TABLE `goodreview` DISABLE KEYS */;
INSERT INTO `goodreview` (`reviewId`, `uid`, `goodsId`, `content`, `score`, `regDate`, `userName`) VALUES
	(49, 'U1234A', 704372, '정말 좋아요~!', 5, '2022-11-15 15:55:50', '가순민'),
	(52, 'U1234A', 704372, '너무너무 좋아요', 5, '2022-11-15 16:00:16', '가순민'),
	(53, 'U1234B', 6663, '금연실이라 담배 냄새도 없었고 침구류도 방금 세탁한듯 향기가 났어요! 추천해요!!', 5, '2022-11-15 16:22:44', '김수빈'),
	(54, 'U1234B', 704372, '깔끔해요! 딱 가격만큼 하는거 같아요~', 3, '2022-11-15 16:23:39', '김수빈'),
	(55, 'U1234C', 852321, '방이 비싸긴 한데 비싼 값 하는거 같아요.', 5, '2022-11-15 16:25:41', '이정규'),
	(56, 'U1234C', 8881, '어.. 너무 별로던데요..? 침구류 세탁 좀 잘 해주세요', 1, '2022-11-15 16:27:24', '이정규'),
	(57, 'U1234C', 623568, '요즘 전국 투어 중인데 여기 호텔이 제일 좋은거 같아요!!', 5, '2022-11-15 16:29:16', '이정규'),
	(58, 'U1234D', 5552, '친구랑 둘이서 갔는데 방 분위기도 좋았고 다른 게스트분들과 파티에서 친해질 수 있어서 좋았습니다!!', 5, '2022-11-15 16:31:59', '이상연'),
	(59, 'U1234D', 509567, '친구랑 제주도에 간 김에 유명한 난타 공연이 있다고 해서 예매했는데 재밌엇어요.', 3, '2022-11-15 16:33:16', '이상연'),
	(60, 'U1234A', 368851, '볼거리도 많고 재밌었어요. 다만.. 성인보다는 어린이들이 좋아할거 같았어요.', 4, '2022-11-15 16:45:09', '가순민');
/*!40000 ALTER TABLE `goodreview` ENABLE KEYS */;

-- 테이블 usertbl_db.goods 구조 내보내기
DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `goodsPrice` int(11) DEFAULT NULL,
  `eventId` int(11) DEFAULT NULL,
  `goodsDiscount` int(11) DEFAULT NULL,
  `goodsMainCategory` varchar(45) DEFAULT NULL,
  `goodsInfo` text DEFAULT NULL,
  `goodsCount` int(11) DEFAULT NULL,
  `adminAllow` int(11) DEFAULT 0,
  `goodsImageFileName` varchar(100) DEFAULT NULL,
  `score` double DEFAULT 0,
  `companyName` varchar(45) DEFAULT NULL,
  `likedCnt` int(11) DEFAULT 0,
  `cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsId`),
  KEY `fk_goods_user1_idx` (`uid`),
  KEY `fk_goods_event_idx` (`eventId`),
  CONSTRAINT `fk_goods_event` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12357895 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.goods:~64 rows (대략적) 내보내기
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`goodsId`, `uid`, `goodsName`, `goodsPrice`, `eventId`, `goodsDiscount`, `goodsMainCategory`, `goodsInfo`, `goodsCount`, `adminAllow`, `goodsImageFileName`, `score`, `companyName`, `likedCnt`, `cnt`) VALUES
	(1113, 'B1234A', 'Room, 2 Twin Beds(2 Twin Beds)', 327800, NULL, NULL, '숙박', '바닥 난방/온돌 및 평면 TV 등이 갖추어진 객실에서 럭셔리 분위기를 만끽하실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 별도의 욕조 및 샤워 시설을 갖춘 욕실에는 전신 욕조 및 무료 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 책상, 별도의 좌석 공간 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 6, 1, '1113.JPG', 0, '해비치호텔앤드리조트', 0, NULL),
	(2221, 'B1234B', '[Special gift for you]65m² 트윈 룸(standalone)', 327800, NULL, NULL, '숙박', '객실에는 냉장고 및 LED TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 금고 및 책상 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 5, 1, '2221.JPG', 0, '그랜드 하얏트 제주', NULL, NULL),
	(2222, 'B1234B', 'Room, 1 King Bed, Mountain View(1 King Bed)', 338800, NULL, NULL, '숙박', '객실에는 냉장고도 갖추어져 있어 편하게 머무실 수 있습니다. 필로우탑 침대에는 오리/거위털 이불도 갖추어져 있습니다. 무료 무선 인터넷 이용이 가능합니다. 별도의 욕조 및 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다.', 6, 1, '2222.JPG', 0, '그랜드 하얏트 제주', NULL, NULL),
	(2223, 'B1234B', 'Room, 2 Twin Beds, Mountain View', 357247, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 LED TV도 갖추어져 있어 편하게 머무실 수 있습니다. 필로우탑 침대에는 고급 침구도 갖추어져 있습니다. 무료 유선 및 무선 인터넷이 지원되며 케이블 프로그램도 시청하실 수 있습니다. 전용 욕실에는 무료 세면용품 및 헤어드라이어도 갖추어져 있습니다.', 3, 1, '2223.JPG', 0, '그랜드 하얏트 제주', 1, NULL),
	(3331, 'B1234C', '스탠다드 더블룸, 정원 전망', 172615, NULL, NULL, '숙박', '24시간 피트니스 센터 같은 레크리에이션 시설을 이용하거나 정원에서 전망을 즐기실 수 있습니다. 이 호텔에는 무료 무선 인터넷, 콘시어지 서비스 및 기념품점/신문 가판대도 편의 시설/서비스로 마련되어 있습니다.', 2, 1, '3331.JPG', 0, '제주신라호텔', NULL, NULL),
	(3332, 'B1234C', '프리미어 더블룸, 산 전망', 169337, NULL, NULL, '숙박', '24시간 피트니스 센터 등의 레크리에이션 시설을 이용하거나 테라스 및 정원 전망을 즐기실 수 있습니다. 이 호텔에는 무료 무선 인터넷 및 자판기도 마련되어 있습니다.', 4, 1, '3332.JPG', 0, '제주신라호텔', 0, NULL),
	(3333, 'B1234C', '온돌 테라스 더블 룸, 정원 전망', 194562, NULL, NULL, '숙박', '금연, 반려동물 동반 가능 연결/인접 객실을 요청하실 수 있으며, 이용 상황에 따라 달라질 수 있습니다.', 3, 1, '3333.JPG', 0, '제주신라호텔', 0, NULL),
	(4441, 'B1234D', '댕댕이p(반려경 돈반 객실)', 118252, NULL, NULL, '숙박', '각각 다르게 가구 비치에서 편하게 머무실 수 있습니다. 메모리폼 침대에는 오리/거위털 이불 및 고급 침구 등이 갖추어져 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 전용 욕실에는 고급 세면용품 및 헤어드라이어도 갖추어져 있습니다.', 2, 1, '4441.JPG', 0, '통나무파크', NULL, NULL),
	(4442, 'B1234D', '파크75P(standalone)', 118451, NULL, NULL, '숙박', '객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 컴퓨터, 무료 무선 인터넷, 케이블 프로그램 등을 즐기실 수 있습니다. 욕실에는 무료 세면용품 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 책상 및 별도의 좌석 공간 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 2, 1, '4442.JPG', 0, '통나무파크', NULL, NULL),
	(4443, 'B1234D', '파크85P(standalone)', 124826, NULL, NULL, '숙박', '객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 컴퓨터, 무료 무선 인터넷, 케이블 프로그램 등을 즐기실 수 있습니다. 욕실에는 욕조 또는 샤워, 무료 세면용품, 헤어드라이어 등이 마련되어 있습니다. 편의 시설/서비스로는 커피/티 메이커 및 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 3, 1, '4443.JPG', 0, '통나무파크', NULL, NULL),
	(5551, 'B1234E', '남성도미토리 6-7인실(파티필참)', 73601, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 스마트 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 디지털 프로그램을 시청하실 수 있습니다. 샤워기가 달린 욕조 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 2, 1, '5551.JPG', 0, '파티월정리썬시티', NULL, NULL),
	(5552, 'B1234E', '더블룸(1-2인 단독사용)', 74800, NULL, NULL, '숙박', '객실에는 냉장고 및 LED TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 금고 및 책상 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 3, 1, '5552.JPG', 5, '파티월정리썬시티', NULL, NULL),
	(5553, 'B1234F', '스탠다드 더블룸', 240000, NULL, NULL, '숙박', '바닥 난방/온돌 및 평면 TV 등이 갖추어진 객실에서 럭셔리 분위기를 만끽하실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 별도의 욕조 및 샤워 시설을 갖춘 욕실에는 전신 욕조 및 무료 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 책상, 별도의 좌석 공간 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 4, 1, '5553.JPG', 0, '리베라호텔', NULL, NULL),
	(6661, 'B1234F', '디럭스 트윈룸', 260000, NULL, NULL, '숙박', '마사지, 전신 트리트먼트 서비스, 얼굴 트리트먼트 서비스 등이 제공되는 풀서비스 스파에서 느긋한 시간을 즐기실 수 있습니다. 레크리에이션 시설로는 야외 수영장, 스파 욕조, 사우나 등이 있습니다. 이 호텔에는 무료 무선 인터넷, 콘시어지 서비스, 시설 내 쇼핑 시설 등도 마련되어 있습니다.', 3, 1, '6661.JPG', 0, '리베라호텔', NULL, NULL),
	(6662, 'B1234F', '럭셔리 트윈룸', 320000, NULL, NULL, '숙박', '마사지, 전신 트리트먼트 서비스, 얼굴 트리트먼트 서비스 등이 제공되는 풀서비스 스파에서 느긋한 시간을 즐기실 수 있습니다. 레크리에이션 시설로는 야외 수영장, 스파 욕조, 사우나 등이 있습니다. 이 호텔에는 무료 무선 인터넷, 콘시어지 서비스, 시설 내 쇼핑 시설 등도 마련되어 있습니다.', 2, 1, '6662.JPG', 0, '리베라호텔', NULL, NULL),
	(6663, 'B1234G', '펜트하우스, 침실 3개, 금연', 235646, NULL, NULL, '숙박', '2 개의 야외 수영장에 몸을 담그고 쉬거나 헬스클럽 및 사우나 등의 다른 레크리에이션 시설을 즐기셔도 좋습니다. 이 호텔에는 이 밖에도 무료 무선 인터넷, 콘시어지 서비스 및 기념품점/신문 가판대도 마련되어 있습니다.', 4, 1, '6663.JPG', 5, 'AC호텔 바이 메리어트', NULL, NULL),
	(7771, 'B1234G', '스위트, 침실 1개, 금연, 시내 전망', 238515, NULL, NULL, '숙박', '바닥 난방/온돌 및 평면 TV 등이 갖추어진 객실에서 럭셔리 분위기를 만끽하실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 별도의 욕조 및 샤워 시설을 갖춘 욕실에는 전신 욕조 및 무료 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 책상, 별도의 좌석 공간 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 2, 1, '7771.JPG', 0, 'AC호텔 바이 메리어트', NULL, NULL),
	(7772, 'B1234G', '이그제큐티브 스위트, 침실 1개, 금연', 240000, NULL, NULL, '숙박', '객실에는 미니바도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 욕실에는 샤워, 무료 세면용품, 비데 등이 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 전기 주전자도 있습니다.', 9, 1, '7772.JPG', 0, 'AC호텔 바이 메리어트', 0, NULL),
	(7773, 'B1234H', '스탠다드 트윈(standalone)', 77500, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 스마트 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 디지털 프로그램을 시청하실 수 있습니다. 샤워기가 달린 욕조 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 6, 1, '7773.JPG', 0, 'Hotel in 9', 4, NULL),
	(8881, 'B1234H', '스탠다드 더블', 65717, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 냉장고도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 위성 프로그램도 시청하실 수 있습니다. 욕조 또는 샤워 시설을 갖춘 전용 욕실에는 무료 세면용품 및 비데도 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 책상도 있습니다.', 5, 1, '8881.JPG', 1, 'Hotel in 9', 1, NULL),
	(8883, 'B1234I', '별장 1호', 82921, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 냉장고 및 에스프레소 메이커도 갖추어져 있어 편하게 머무실 수 있습니다. 컴퓨터 및 무료 무선 인터넷 외에 LED TV도 마련되어 있습니다. 욕조 또는 샤워 시설을 갖춘 전용 욕실에는 무료 세면용품 및 비데도 마련되어 있습니다. 편의 시설/서비스로는 커피/티 메이커 및 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 2, 1, '8883.JPG', 0, '한미장펜션', NULL, NULL),
	(9991, 'B1234I', '별장 2호', 107543, NULL, NULL, '숙박', '각각 다른 스타일의 인테리어에는 미니바 및 LCD TV 등이 갖추어져 있어 편하게 머무실 수 있습니다. 객실에 딸린 전용 가구가 딸린 발코니에서 전망을 감상하실 수 있습니다. 유선 및 무선 인터넷이 무료로 지원되며 DVD 플레이어 및 디지털 프로그램도 즐기실 수 있습니다. 별도의 욕조 및 샤워 시설을 갖춘 욕실에는 전신 욕조 및 레인폴 샤워기도 마련되어 있습니다.', 3, 1, '9991.JPG', 0, '한미장펜션', NULL, NULL),
	(9992, 'B1234I', '별장 3호', 109543, NULL, NULL, '숙박', '에어컨이 설치된  객실에는 미니바 및 LCD TV도 갖추어져 있어 편하게 머무실 수 있습니다. 42인치 스마트 TV에서 케이블 프로그램을 시청하실 수 있으며 무료 무선 인터넷도 지원됩니다. 욕실에는 욕조 또는 샤워, 고급 세면용품, 비데 등이 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 책상도 있습니다.', 2, 1, '9992.JPG', 0, '한미장펜션', NULL, NULL),
	(9993, 'B1234J', '더블룸 (더블침대 1개)', 108711, NULL, NULL, '숙박', '객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 욕실에는 샤워, 무료 세면용품, 비데 등이 마련되어 있습니다. 편의 시설/서비스로는 책상 및 전기 주전자 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 2, 1, '9993.JPG', 0, '홍대 준 게스트하우스', 0, NULL),
	(10101, 'B1234J', '디럭스 트윈룸 (싱글침대 2개)', 143700, NULL, NULL, '숙박', '평면 TV 시청이 가능한 객실이 마련되어 있습니다. 컴퓨터에서는 무료 유선 및 무선 인터넷이 지원되며 케이블 프로그램도 시청하실 수 있습니다. 샤워기가 달린 욕조 시설을 갖춘 전용 욕실에는 무료 세면용품 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 커피/티 메이커, 무료 생수 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 5, 1, '10101.JPG', 0, '홍대 준 게스트하우스', 1, NULL),
	(10103, 'B1234K', '정 1품 금실', 145000, NULL, NULL, '숙박', '객실에는 미니바도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 욕실에는 샤워, 무료 세면용품, 비데 등이 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 전기 주전자도 있습니다.', 3, 1, '10103.JPG', 0, '왕의지밀', 0, NULL),
	(11111, 'B1234K', '정 2품 금실', 124800, NULL, NULL, '숙박', '평면 TV 시청이 가능한 객실이 마련되어 있습니다. 컴퓨터에서는 무료 유선 및 무선 인터넷이 지원되며 케이블 프로그램도 시청하실 수 있습니다. 샤워기가 달린 욕조 시설을 갖춘 전용 욕실에는 무료 세면용품 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 커피/티 메이커, 무료 생수 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 3, 1, '11111.JPG', 0, '왕의지밀', 0, NULL),
	(11112, 'B1234K', '정 2품 은실', 115000, NULL, NULL, '숙박', '바닥 난방/온돌 및 평면 TV 등이 갖추어진 객실에서 럭셔리 분위기를 만끽하실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 별도의 욕조 및 샤워 시설을 갖춘 욕실에는 전신 욕조 및 무료 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 책상, 별도의 좌석 공간 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 2, 1, '11112.JPG', 0, '왕의지밀', 0, NULL),
	(11113, 'B1234L', '스탠다드 더블(넷플릭스+웨이브 시청가능)', 150933, NULL, NULL, '숙박', '객실에는 냉장고도 갖추어져 있어 편하게 머무실 수 있습니다. 필로우탑 침대에는 오리/거위털 이불도 갖추어져 있습니다. 무료 무선 인터넷 이용이 가능합니다. 별도의 욕조 및 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다.', 6, 1, '11113.JPG', 0, '라한호텔 전주', NULL, NULL),
	(12121, 'B1234L', '스탠다드 더블룸(랜덤 배정 객실)', 156000, NULL, NULL, '숙박', '객실에는 미니바도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 욕실에는 샤워, 무료 세면용품, 비데 등이 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 전기 주전자도 있습니다.', 3, 1, '12121.JPG', 0, '라한호텔 전주', 0, NULL),
	(12122, 'B1234L', '프레지덴셜 스위트 (야외 스파)', 156000, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 냉장고 및 LCD TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 유료 영화 시청도 즐기실 수 있습니다. 전용 욕실에는 고급 세면용품 및 비데도 갖추어져 있습니다. 편의 시설/서비스로는 금고 및 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 7, 1, '12122.JPG', 0, '라한호텔 전주', NULL, NULL),
	(12123, 'B1234M', '프리미엄(조식포함)', 156000, NULL, NULL, '숙박', '객실에는 냉장고 및 LED TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 샤워 시설을 갖춘 전용 욕실에는 비데 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 금고 및 책상 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 3, 1, '12123.JPG', 0, '전주관광 호텔 꽃심', NULL, NULL),
	(13131, 'B1234M', '스탠다드(조식포함)', 103000, NULL, NULL, '숙박', '에어컨이 설치된 객실에는 냉장고 및 LCD TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 유료 영화 시청도 즐기실 수 있습니다. 전용 욕실에는 고급 세면용품 및 비데도 갖추어져 있습니다. 편의 시설/서비스로는 금고 및 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 5, 1, '13131.JPG', 0, '전주관광 호텔 꽃심', NULL, NULL),
	(13132, 'B1234M', '디럭스(조식포함', 104000, NULL, NULL, '숙박', '각각 다르게 가구 비치에서 편하게 머무실 수 있습니다. 메모리폼 침대에는 오리/거위털 이불 및 고급 침구 등이 갖추어져 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 전용 욕실에는 고급 세면용품 및 헤어드라이어도 갖추어져 있습니다.', 1, 1, '13132.JPG', 0, '전주관광 호텔 꽃심', 0, NULL),
	(13133, 'B1234N', '사랑채 1호', 85000, NULL, NULL, '숙박', '바닥 난방/온돌 및 평면 TV 등이 갖추어진 각각 다른 스타일의 인테리어에서 럭셔리 분위기를 만끽하실 수 있습니다. 컴퓨터, 무료 무선 인터넷, 케이블 프로그램 등을 즐기실 수 있습니다. 별도의 욕조 및 샤워 시설을 갖춘 전용 욕실에는 전신 욕조 및 무료 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 별도의 좌석 공간, 냉장고 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 2, 1, '13133.JPG', 0, '사랑나무 한옥펜션', NULL, NULL),
	(14141, 'B1234N', '사랑채 2호', 83000, NULL, NULL, '숙박', '객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 유료 영화 시청도 즐기실 수 있습니다. 욕실에는 샤워 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 책상 및 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 2, 1, '14141.JPG', 0, '사랑나무 한옥펜션', NULL, NULL),
	(14142, 'B1234N', '안채 1.2호(투룸 특실)', 124350, NULL, NULL, '숙박', '실내 전용 스파 욕조 및 바닥 난방/온돌 등이 갖추어진 38개의 객실에서 럭셔리 분위기를 만끽하실 수 있습니다. 50인치 평면 TV에서 케이블 프로그램을 시청하실 수 있으며 무료 무선 인터넷도 지원됩니다. 별도의 욕조 및 샤워 시설을 갖춘 욕실에는 전신 욕조 및 고급 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 책상 및 별도의 좌석 공간 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 0, 1, '14142.JPG', 0, '사랑나무 한옥펜션', NULL, NULL),
	(35231, 'B1234P', '디럭스룸, 부분 바다 전망 ', 653400, NULL, NULL, '숙박', '더블침대 1개\r\n\r\n37 제곱미터 크기의 객실, 부분 바다 전망\r\n\r\n\r\n구조 - 별도의 좌석 공간\r\n\r\n휴식 - 객실 내 마사지 이용 가능\r\n\r\n인터넷 - 무료 WiFi 및 유선 인터넷\r\n\r\n엔터테인먼트 - 케이블 채널 시청이 가능한 32인치 LCD TV\r\n\r\n식음료 - 냉장고, 미니바(요금이 부과될 수 있음), 커피/티 메이커 및 24시간 룸서비스\r\n\r\n편안한 잠자리 - 고급 침구, 오리/거위털 이불, 베개 종류 선택 가능 및 턴다운 서비스\r\n\r\n욕실 - 전용 욕실(전신 욕조 있음)\r\n\r\n기타 편의 시설 - 금고, 무료 신문, 책상, 요청 시 간이/추가 침대와 무료 유아용 침대 이용 가능\r\n\r\n편의 서비스/시설 - 냉방 온도 조절 및 하우스키핑(매일)\r\n\r\n알아둘 사항 - 침대 시트 제공 안 됨\r\n\r\n금연', 2, 1, '35231.jpg', 0, '전주한옥마을숙박 다락', 0, NULL),
	(39297, 'B1234P', '디럭스 더블룸, 시내 전망', 605000, NULL, NULL, '숙박', '더블침대 1개\r\n33 제곱미터 크기의 각각 다르게 가구가 비치된 객실, 발코니(시내 전망)\r\n\r\n\r\n구조 - 별도의 좌석 공간\r\n\r\n휴식 - 객실 내 마사지 이용 가능\r\n\r\n인터넷 - 무료 WiFi 및 유선 인터넷\r\n엔터테인먼트 - 케이블 채널 시청이 가능한 32인치 LCD TV\r\n식음료 - 냉장고, 미니바(요금이 부과될 수 있음), 커피/티 메이커 및 24시간 룸서비스\r\n편안한 잠자리 - 고급 침구, 오리/거위털 이불, 베개 종류 선택 가능 및 턴다운 서비스\r\n욕실 - 전용 욕실(전신 욕조 있음)\r\n기타 편의 시설 - 금고, 무료 신문, 책상, 요청 시 간이/추가 침대 이용 가능\r\n편의 서비스/시설 - 냉방 온도 조절 및 하우스키핑(매일)\r\n장애인 편의 시설 - 휠체어로 이용 가능\r\n알아둘 사항 - 유아용 침대 이용 불가, 침대 시트 제공 안 됨\r\n금연', 4, 1, '39297.jpg', 0, '전주한옥마을숙박 다락', 0, NULL),
	(100513, 'B1234S', 'C301(standalone)', 200120, NULL, NULL, '숙박', '인원 추가 정보\r\n- 인원 : 기준 4명 / 최대 10명\r\n- 인원추가 : 가능\r\n- 인원추가요금 : 성인 20,000원, 아동 20,000원, 유아 20,000원\r\n- 추가인원요금: 1인당 20,000원\r\n\r\n객실 정보\r\n거실+방 / 35평\r\n\r\n구비시설\r\n개별바비큐, 침대, 에어컨, TV, 취사시설, 식탁, 냉장고, 전자레인지, 커피포트', 3, 1, '100513.jpg', 0, '바다풍경펜션', 0, NULL),
	(168290, 'B2345B', '[오후]서핑 입문강습(1회)', 60000, NULL, NULL, '투어티켓', '2시간 강습 + 보드/슈트렌탈 포함 + 자유서핑(2시간)', 4, 1, '168290.jpg', 4.7, '송정하와이', 0, NULL),
	(175159, 'B2345X', '[평일] 2시간 패스', 23800, NULL, NULL, '투어티켓', '- 신장 120cm 이하 고객님은 입장 불가\r\n- 본 이용권의 최대 이용시간은 2시간.\r\n(폐장 시간 2시간 전, 입장이 마감됩니다.)\r\n- 기준 이용시간 초과 시 10분당 1,000원의 추가요금\r\n- 주중(월~금) / 주말(토~일,공휴일)\r\n- 모든 시설에는 안전 검증을 받은 규정된 장비만 사용이 가능\r\n- 노약자, 음주자, 임산부의 경우 체험시설 이용이 제한\r\n', 10, 1, '175159.jpg', 5, '스포츠 몬스터', 0, NULL),
	(224126, 'B1234U', '디럭스 더블룸, 더블침대 2개', 286000, NULL, NULL, '숙박', '더블침대 2개\r\n\r\n37 제곱미터 크기\r\n\r\n\r\n인터넷 - 무료 WiFi\r\n\r\n엔터테인먼트 - 위성 채널 시청이 가능한 55인치 평면 TV\r\n\r\n식음료 - 미니바\r\n\r\n편안한 잠자리 - 암막 커튼, 턴다운 서비스 및 침대 시트\r\n\r\n욕실 - 전용 욕실(샤워기, 슬리퍼 및 무료 세면용품 있음)\r\n\r\n기타 편의 시설 - 금고, 다리미/다리미판, 노트북 작업 공간, 요청 시 무료 유아용 침대 이용 가능\r\n\r\n편의 서비스/시설 - 하우스키핑(매일) 및 냉난방 온도 조절\r\n\r\n장애인 편의 시설 - 휠체어로 이용 가능한 출입구, 휠체어로 이용 가능 및 레버식 문손잡이\r\n\r\n알아둘 사항 - 간이/추가 침대 이용 불가\r\n\r\n금연\r\n\r\n연결/인접 객실을 요청하실 수 있으며, 이용 상황에 따라 달라질 수 있습니다.', 10, 1, '224126.jpg', 0, '대전라마다호텔', 0, NULL),
	(287183, 'B1234Y', '스탠다드 더블 (주차, 무료 Wi-Fi)', 94899, NULL, NULL, '숙박', '목욕 가운\r\n헤어드라이어\r\n에어컨\r\n암막 커튼\r\n난방\r\n리넨\r\n숙면용 편의 용품\r\n슬리퍼\r\n침대 옆 콘센트\r\n방음\r\n모닝콜 서비스\r\n무료 생수\r\n거울\r\n전자레인지\r\n미니바\r\n냉장고\r\n일일 청소 서비스\r\n책상\r\n휴식 공간\r\n소파\r\n휴지통\r\n옷장\r\n옷 거는 행거\r\n세면도구\r\n다림질 도구\r\n세탁기\r\n엘리베이터 이용 가능\r\n일산화탄소 감지기\r\n소화기\r\n개별 에어컨\r\n안전/보안 시설/서비스\r\n화재감지기\r\n타월\r\n월풀 욕조\r\n무료 Wi-Fi (모든 객실)\r\n객실 내 영화(VOD)\r\n위성 방송/케이블 방송\r\n전화기', 5, 1, '287183.jpg', 0, '문화게스트하우스', 1, NULL),
	(357543, 'B1234T', '1인실(더블베드, 개인화장실)', 95000, NULL, NULL, '숙박', '평면 TV 시청이 가능한 객실이 마련되어 있습니다. 컴퓨터, 무료 무선 인터넷, 케이블 프로그램 등을 즐기실 수 있습니다. 샤워 시설을 갖춘 전용 욕실에는 무료 세면용품 및 헤어드라이어도 마련되어 있습니다. 편의 시설/서비스로는 전기 주전자, 무료 생수 등은 물론, 무료 시내 통화 서비스가 지원되는 전화도 있습니다.', 1, 1, '357543.jpg', 0, '위게스트하우스', NULL, NULL),
	(368851, 'B2345C', '[할인중] 서울랜드 종일권', 19999, NULL, NULL, '투어티켓', '티켓 이용방법 : 네이버예매 구매 - 내예약에서 바코드확인 - 서울랜드 게이트에서 QR코드 인증후 바로입장\r\n이용 가능 시간\r\n오전 10:00~오후 9:00\r\n\r\n기간별 운영시간이 상이하오니 서울랜드 홈페이지 꼭 참고 부탁 드립니다.', 9, 1, '368851.jpg', 4, '을지아트', 0, NULL),
	(401803, 'B1234Y', '레지던스 스위트(standalone)', 97500, NULL, NULL, '숙박', '더블 침대 1개, 싱글 침대 1개\r\n3인 기준 / 1인 추가시 15,000원 / 최대 4인\r\n에어컨, TV, 냉장고, 수건, 생수\r\n간이주방, 거실\r\n샤워시설, 욕실용품\r\n무료 Wi-Fi', 0, 1, '401803.jpg', 0, '문화게스트하우스', 0, NULL),
	(405567, 'B1234T', '2인실(더블베드, 개인화장실)', 98000, NULL, NULL, '숙박', '객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 욕실에는 무료 세면용품 및 비데도 마련되어 있습니다. 편의 시설/서비스로는 책상 및 별도의 좌석 공간 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 2, 1, '405567.jpg', 0, '위게스트하우스', NULL, NULL),
	(411938, 'B1234T', '6인 단체방(개인화장실)', 95000, NULL, NULL, '숙박', '각각 다른 스타일의 인테리어에는 냉장고 및 평면 TV 등이 갖추어져 있어 편하게 머무실 수 있습니다. 무료 유선 및 무선 인터넷이 지원되며 케이블 프로그램도 시청하실 수 있습니다. 샤워기가 달린 욕조 시설을 갖춘 전용 욕실에는 전신 욕조 및 고급 세면용품도 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 책상도 있습니다.', 3, 1, '441938.jpg', 0, '위게스트하우스', NULL, NULL),
	(503691, 'B1234A', '패밀리 트윈 프리미어', 350000, NULL, NULL, '숙박', '트윈 베드1, 싱글 베드1, 욕실 1, 발코니1, 조식 불포함', 3, 1, '503691.jpg', 0, '해비치호텔앤드리조트', 0, NULL),
	(509567, 'B2345G', '제주 난타공연 입장권/ 호텔에서 진행', 22000, NULL, NULL, '투어티켓', '난타는 주방에서 일어나느 요리사들의 하루 일과를 칼과 도마 등의 주방기구가 멋진 악기로 승화되어 남녀노소 누구나 신나게 즐길 수 있는 파워풀한 공연입니다. \r\n관객이 직접 무대에 오르고 쇼에 참여할 수 있습니다.', 9, 1, '509567.jpg', 3, '제주난타', 0, NULL),
	(517725, 'B1234Q', '프리미엄룸, 킹사이즈침대 1개', 500000, NULL, NULL, '숙박', '킹사이즈침대 1개\r\n\r\n70 제곱미터 크기의 객실, 가구가 딸린 발코니(바다 전망)\r\n\r\n\r\n구조 - 별도의 좌석 공간\r\n\r\n인터넷 - 무료 WiFi(500Mbps 이상(6명 이상 또는 10대 이상 가능))\r\n\r\n엔터테인먼트 - 케이블 채널 시청이 가능한 49인치 LED TV\r\n\r\n식음료 - 에스프레소 메이커, 미니바(요금이 부과될 수 있음) 및 24시간 룸서비스\r\n\r\n편안한 잠자리 - 암막 커튼 및 턴다운 서비스\r\n\r\n욕실 - 전용 욕실, 전신 욕조 및 별도의 샤워실\r\n\r\n기타 편의 시설 - 노트북 보관이 가능한 금고, 무료 신문, 책상, 요청 시 간이/추가 침대 이용 가능\r\n\r\n편의 서비스/시설 - 에어컨, 하우스키핑(매일) 및 난방\r\n\r\n알아둘 사항 - 침대 시트 제공 안 됨\r\n\r\n금연', 0, 1, '517725.jpg', 0, '아난티 힐튼', 0, NULL),
	(549251, 'B1234W', '스탠다드 트윈룸', 82000, NULL, NULL, '숙박', '객실에는 냉장고 및 평면 TV도 갖추어져 있어 편하게 머무실 수 있습니다. 컴퓨터, 무료 무선 인터넷, 케이블 프로그램 등을 즐기실 수 있습니다. 욕실에는 욕조 또는 샤워, 무료 세면용품, 헤어드라이어 등이 마련되어 있습니다. 편의 시설/서비스로는 커피/티 메이커 및 무료 생수 등이 있으며 객실 정돈 서비스는 매일 제공됩니다.', 0, 1, '549251.jpg', 0, '베니키아호텔대림', 0, NULL),
	(563314, 'B2345Q', '[핫딜]부산시티투어버스 X 해운대 요트홀릭', 21000, NULL, NULL, '투어티켓', '운행노선 : 레드라인, 블루라인, 그린라인, 오렌지라인\r\n레드라인/그린라인\r\n-> 주중: 50분 간격 9회, 주말 : 40분 간격 12회\r\n블루라인\r\n-> 주중 : 50분 간격 9회\r\n오렌지라인\r\n-> 주중/주말 : 60분 간격 8회', 10, 1, '563314.jpg', NULL, '해운대투어', 0, NULL),
	(623568, 'B1234W', '스탠다드 더블룸', 321500, NULL, NULL, '숙박', '각각 다르게 가구 비치에서 편하게 머무실 수 있습니다. 메모리폼 침대에는 오리/거위털 이불 및 고급 침구 등이 갖추어져 있습니다. 무료 무선 인터넷도 지원되며 케이블 프로그램을 시청하실 수 있습니다. 전용 욕실에는 고급 세면용품 및 헤어드라이어도 갖추어져 있습니다.', 2, 1, '623568.jpg', 5, '베니키아호텔대림', 0, NULL),
	(625985, 'B2345Y', '[날짜 지정] 에버랜드 A 종일권', 38000, NULL, NULL, '투어티켓', '기다림 없이 네이버 모바일 티켓 제시 후 바로 입장이 가능합니다\r\n1. 상품구매\r\n2. 네이버 마이페이지 내 QR코드 확인\r\n3. 마이페이지 QR리스트에 보여지는 QR코드를 에버랜드 App에 등록 후 에버랜드 정문에서 제시 후 입장\r\n\r\n※QR코드를 못받으신 경우 방문전 야놀자 고객센터(1599-8370)를 통해 재발송 요청 바랍니다.\r\n에버랜드 방문하여 확인 요청시 입장이 지연될 수 있습니다. (입장 전 우측 \'예매티켓교환처\')\r\n(응대 가능시간:~18시)', 9, 1, '625985.jpg', 5, '에버랜드', 0, NULL),
	(677859, 'B1234A', '패밀리 트윈 프리미어', 350000, NULL, NULL, '숙박', '트윈 베드1, 싱글 베드1, 욕실 1, 발코니1, 조식 불포함', 3, 1, '677859.jpg', 0, '해비치호텔앤드리조트', 0, NULL),
	(704372, 'B1234X', '진주(standalone)', 40000, NULL, NULL, '숙박', '인원 추가 정보\r\n- 인원 : 기준 2명 / 최대 4명\r\n- 인원추가 : 가능\r\n- 인원추가요금 : 성인 15,000원, 아동 15,000원, 유아 무료\r\n- 4세 미만 유아는 인원수에 포함되지만 추가 요금은 발생되지 않으며 4세 이상부터 기준인원 2명 외 1인 당 15,000원씩 추가요금이 발생합니다.\r\n\r\n객실 정보\r\n원룸형 / 8평\r\n\r\n구비시설\r\n침대, 에어컨, TV, 취사시설, 냉장고, 전자레인지, 쇼파, 토스터기, 전기포트, 전기밥솥, 주방용품일체, 드라이기, 샤워용품( 샴프, 린스, 바디, 일회용 바디 스폰지)\r\n\r\n침대원룸 + 화장실', 4, 1, '704372.jpg', 3.3125, '힐하우스펜션', 0, NULL),
	(708001, 'B1234S', 'C401(standalone)', 200222, NULL, NULL, '숙박', '인원 추가 정보\r\n- 인원 : 기준 4명 / 최대 10명\r\n- 인원추가 : 가능\r\n- 인원추가요금 : 성인 20,000원, 아동 20,000원, 유아 20,000원\r\n- 추가인원요금: 1인당 20,000원\r\n\r\n객실 정보\r\n거실+방 / 35평\r\n\r\n구비시설\r\n개별바비큐, 침대, 에어컨, TV, 취사시설, 식탁, 냉장고, 전자레인지, 커피포트', 2, 1, '708001.jpg', 0, '바다풍경펜션', 0, NULL),
	(754017, 'B2345K', '전주한옥레일바이크', 20100, NULL, NULL, '투어티켓', '모바일티켓 수신 후 3시간 이후부터 이용 가능합니다.\r\n전주한옥레일바이크는 현장상황에 딸 ㅏ대기 시간이 발생할 수 있습니다.\r\n운영시간: 10:00 ~ 17:30\r\n소요시간: 왕복 30분', 10, 1, '754017.jpg', NULL, '한옥투어', 0, NULL),
	(852321, 'B1234Q', '프리미엄 트윈룸 - 조식 패키지', 627000, NULL, NULL, '숙박', '싱글침대 2개\r\n\r\n70 제곱미터 크기의 객실, 가구가 딸린 발코니(산 전망)\r\n\r\n\r\n구조 - 별도의 좌석 공간\r\n\r\n인터넷 - 무료 WiFi(500Mbps 이상(6명 이상 또는 10대 이상 가능))\r\n\r\n엔터테인먼트 - 케이블 채널 시청이 가능한 49인치 LED TV\r\n\r\n식음료 - 에스프레소 메이커, 미니바(요금이 부과될 수 있음) 및 24시간 룸서비스\r\n\r\n편안한 잠자리 - 암막 커튼 및 턴다운 서비스\r\n\r\n욕실 - 전용 욕실, 전신 욕조 및 별도의 샤워실\r\n\r\n기타 편의 시설 - 노트북 보관이 가능한 금고, 무료 신문, 책상, 요청 시 간이/추가 침대 이용 가능\r\n\r\n편의 서비스/시설 - 에어컨, 하우스키핑(매일) 및 난방\r\n\r\n알아둘 사항 - 침대 시트 제공 안 됨\r\n\r\n금연', 1, 1, '852321.jpg', 5, '아난티 힐튼', 1, NULL),
	(900605, 'B1234X', '레몬(standalone)', 50000, NULL, NULL, '숙박', '인원 추가 정보\r\n- 인원 : 기준 2명 / 최대 4명\r\n- 인원추가 : 가능\r\n- 인원추가요금 : 성인 15,000원, 아동 15,000원, 유아 무료\r\n- 4세 미만 유아는 인원수에 포함되지만 추가 요금은 발생되지 않으며 4세 이상부터 기준인원 2명 외 1인 당 15,000원씩 추가요금이 발생합니다.\r\n\r\n객실 정보\r\n원룸형 / 9평\r\n\r\n구비시설\r\n침대, 에어컨, TV, 취사시설, 냉장고, 전자레인지, 쇼파, 토스터기, 전기포트, 전기밥솥, 주방용품일체, 드라이기, 샤워용품( 샴프, 린스, 바디, 일회용 바디 스폰지)\r\n\r\n침대원룸 + 화장실', 9, 1, '900605.jpg', 0, '힐하우스펜션', 0, NULL),
	(905667, 'B2345J', '제주 서귀포잠수함+중문미로공원 이용권', 39000, NULL, NULL, '투어티켓', '잠수함\r\n기네스 기록 등재 세계최초! 세계최장시간! 잠수함 수사고 운항기록\r\n운항시간: 09:20 ~ 16:00(40분 간격 운항) / 20분전 대기\r\n사전예약 필수!!\r\n파크\r\n아름다운 터널을 지나기도 하고 길을 찾아나가 황금 사자를 만나는 재미있는 미로체험!', 10, 1, '905667.jpg', 5, '제주놀자', 0, NULL),
	(970074, 'B1234U', '프리미엄룸, 더블 사이즈 침대 1개', 160000, NULL, NULL, '숙박', '더블사이즈침대 1개\r\n\r\n52 제곱미터 크기\r\n\r\n\r\n인터넷 - 무료 WiFi\r\n\r\n엔터테인먼트 - 위성 채널 시청이 가능한 55인치 평면 TV\r\n\r\n식음료 - 미니바\r\n\r\n편안한 잠자리 - 암막 커튼, 턴다운 서비스 및 침대 시트\r\n\r\n욕실 - 전용 욕실(샤워기, 슬리퍼 및 무료 세면용품 있음)\r\n\r\n기타 편의 시설 - 금고, 다리미/다리미판, 노트북 작업 공간, 요청 시 간이/추가 침대와 무료 유아용 침대 이용 가능\r\n\r\n편의 서비스/시설 - 하우스키핑(매일) 및 냉난방 온도 조절\r\n\r\n장애인 편의 시설 - 휠체어로 이용 가능한 출입구, 휠체어로 이용 가능 및 레버식 문손잡이\r\n\r\n금연\r\n\r\n연결/인접 객실을 요청하실 수 있으며, 이용 상황에 따라 달라질 수 있습니다.', 6, 1, '970074.jpg', 0, '대전라마다호텔', 0, NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 usertbl_db.goodsliked 구조 내보내기
DROP TABLE IF EXISTS `goodsliked`;
CREATE TABLE IF NOT EXISTS `goodsliked` (
  `likeNo` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `uid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`likeNo`),
  KEY `goodsId` (`goodsId`),
  KEY `uid` (`uid`),
  CONSTRAINT `FK1_goods_goodsId` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.goodsliked:~8 rows (대략적) 내보내기
DELETE FROM `goodsliked`;
/*!40000 ALTER TABLE `goodsliked` DISABLE KEYS */;
INSERT INTO `goodsliked` (`likeNo`, `goodsId`, `uid`) VALUES
	(11, 7773, 'U1234C'),
	(19, 8881, 'U1234B'),
	(20, 7773, 'U1234B'),
	(23, 7773, 'U1234E'),
	(32, 7773, 'U1234A'),
	(83, 2223, 'U1234A'),
	(93, 10101, 'B1234J'),
	(97, 287183, 'U1234A'),
	(110, 852321, 'U1234C');
/*!40000 ALTER TABLE `goodsliked` ENABLE KEYS */;

-- 테이블 usertbl_db.kakao_table 구조 내보내기
DROP TABLE IF EXISTS `kakao_table`;
CREATE TABLE IF NOT EXISTS `kakao_table` (
  `uid` varchar(45) NOT NULL,
  `k_name` varchar(20) NOT NULL,
  `k_email` varchar(50) NOT NULL,
  `userType` int(11) DEFAULT 1,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.kakao_table:~1 rows (대략적) 내보내기
DELETE FROM `kakao_table`;
/*!40000 ALTER TABLE `kakao_table` DISABLE KEYS */;
INSERT INTO `kakao_table` (`uid`, `k_name`, `k_email`, `userType`) VALUES
	('4nqlna', '이상연', 'esyzz@naver.com', NULL);
/*!40000 ALTER TABLE `kakao_table` ENABLE KEYS */;

-- 테이블 usertbl_db.liked 구조 내보내기
DROP TABLE IF EXISTS `liked`;
CREATE TABLE IF NOT EXISTS `liked` (
  `likedId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `articleNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`likedId`),
  KEY `fk_likedTBL_userTBL1_idx` (`uid`),
  KEY `fk_liked_board` (`articleNO`) USING BTREE,
  CONSTRAINT `fk_liked_board` FOREIGN KEY (`articleNO`) REFERENCES `board` (`articleNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_liked_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.liked:~10 rows (대략적) 내보내기
DELETE FROM `liked`;
/*!40000 ALTER TABLE `liked` DISABLE KEYS */;
INSERT INTO `liked` (`likedId`, `uid`, `articleNO`) VALUES
	(32, 'U1234B', 822583),
	(36, 'U1234C', 822583),
	(38, 'U1234C', 90327),
	(42, 'U1234C', 476249),
	(47, 'U1234C', 408615),
	(58, 'U1234A', 408615),
	(60, 'U1234A', 822583),
	(75, 'U1234A', 225425),
	(93, 'U1234B', 90327),
	(101, 'U1234A', 940541);
/*!40000 ALTER TABLE `liked` ENABLE KEYS */;

-- 테이블 usertbl_db.lodgingdetail 구조 내보내기
DROP TABLE IF EXISTS `lodgingdetail`;
CREATE TABLE IF NOT EXISTS `lodgingdetail` (
  `goodsId` int(11) NOT NULL,
  `numOfTourist` int(11) DEFAULT NULL,
  `TV` char(20) DEFAULT NULL,
  `wifi` char(20) DEFAULT NULL,
  `refrigerator` char(20) DEFAULT NULL,
  `checkIn` time DEFAULT NULL,
  `checkOut` time DEFAULT NULL,
  `bedAmount` int(11) DEFAULT NULL,
  `restaurant` char(20) DEFAULT NULL,
  `airConditioner` char(20) DEFAULT NULL,
  `swimmingPool` char(20) DEFAULT NULL,
  `breakfast` char(20) DEFAULT NULL,
  `spar` char(20) DEFAULT NULL,
  `hairAppliance` char(20) DEFAULT NULL,
  `petsAllowed` char(20) DEFAULT NULL,
  `store` char(20) DEFAULT NULL,
  `disabledAccessibility` char(30) DEFAULT NULL,
  `parking` char(20) DEFAULT NULL,
  `hotSpring` char(20) DEFAULT NULL,
  `lodgingType` int(11) DEFAULT NULL,
  `goodsSubCategory` varchar(45) DEFAULT NULL,
  `goodsStart` date DEFAULT NULL,
  `goodsEnd` date DEFAULT NULL,
  `singleBed` char(20) DEFAULT NULL,
  `doubleBed` char(20) DEFAULT NULL,
  `twinBed` char(20) DEFAULT NULL,
  `ondol` char(20) DEFAULT NULL,
  PRIMARY KEY (`goodsId`),
  KEY `fk_goodDetail_goods1_idx` (`goodsId`),
  CONSTRAINT `fk_goodDetail_goods1` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.lodgingdetail:~79 rows (대략적) 내보내기
DELETE FROM `lodgingdetail`;
/*!40000 ALTER TABLE `lodgingdetail` DISABLE KEYS */;
INSERT INTO `lodgingdetail` (`goodsId`, `numOfTourist`, `TV`, `wifi`, `refrigerator`, `checkIn`, `checkOut`, `bedAmount`, `restaurant`, `airConditioner`, `swimmingPool`, `breakfast`, `spar`, `hairAppliance`, `petsAllowed`, `store`, `disabledAccessibility`, `parking`, `hotSpring`, `lodgingType`, `goodsSubCategory`, `goodsStart`, `goodsEnd`, `singleBed`, `doubleBed`, `twinBed`, `ondol`) VALUES
	(1113, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, '', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', NULL, NULL, NULL),
	(2221, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, '', 'airConditioner', 'swimmingPool', '', 'spar', 'hairAppliance', 'petsAllowed', '', 'disable', 'parking', 'hotSpring', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', NULL, NULL, NULL),
	(2222, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 3, '', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(2223, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', '', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(3331, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', 'swimmingPool', '', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', '', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(3332, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', '', 'store', 'disable', 'parking', 'hotSpring', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(3333, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', 'swimmingPool', '', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 1, '제주', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, 'ondol'),
	(4441, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', '', 'disable', 'parking', '', 2, '제주', '2022-10-06', '2023-10-06', NULL, 'doubleBed', NULL, NULL),
	(4442, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, '', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', '', '', 'disable', 'parking', '', 2, '제주', '2022-10-06', '2023-10-06', NULL, 'doubleBed', NULL, NULL),
	(4443, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 3, 'restaurant', 'airConditioner', 'swimmingPool', '', 'spar', 'hairAppliance', '', '', 'disable', 'parking', '', 2, '제주', '2022-10-06', '2023-10-06', NULL, 'doubleBed', NULL, NULL),
	(5551, 10, 'TV', 'wifi', 'refrigerator', '17:00:00', '11:03:00', 1, NULL, 'airConditioner', 'swimmingPool', NULL, NULL, 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 3, '제주', '2022-10-06', '2023-10-13', NULL, 'doubleBed', NULL, NULL),
	(5552, 6, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, '', 'airConditioner', 'swimmingPool', '', '', 'hairAppliance', '', 'store', '', 'parking', '', 3, '제주', '2022-10-06', '2023-10-06', NULL, 'doubleBed', NULL, NULL),
	(5553, 2, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', '', 'hairAppliance', '', 'store', 'disable', 'parking', '', 1, '서울', '2022-10-07', '2023-10-06', 'singleBed', 'doubleBed', 'twinBed', NULL),
	(6661, 3, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', '', 'hairAppliance', '', 'store', 'disable', 'parking', '', 1, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(6662, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', '', 'store', 'disable', 'parking', 'hotSpring', 1, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(6663, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', '', 'disable', 'parking', 'hotSpring', 1, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(7771, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', '', '', 'spar', 'hairAppliance', 'petsAllowed', '', 'disable', 'parking', 'hotSpring', 1, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(7772, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 1, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(7773, 5, 'TV', 'wifi', 'refrigerator', '14:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 1, '서울', '2022-10-24', '2022-10-25', 'singleBed', 'doubleBed', NULL, NULL),
	(8881, 3, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 1, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(8883, 8, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', 'swimmingPool', '', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 2, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(9991, 10, 'TV', 'wifi', 'refrigerator', '13:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', '', '', '', 'hairAppliance', 'petsAllowed', 'store', '', 'parking', '', 2, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(9992, 12, 'TV', 'wifi', 'refrigerator', '13:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', '', '', '', 'hairAppliance', 'petsAllowed', 'store', '', 'parking', '', 2, '서울', '2022-10-06', '2023-10-06', 'singleBed', 'doubleBed', NULL, NULL),
	(9993, 5, 'TV', 'wifi', 'refrigerator', '13:00:00', '11:00:00', 1, '', 'airConditioner', '', '', '', 'hairAppliance', 'petsAllowed', 'store', '', 'parking', '', 3, '서울', '2022-10-06', '2023-10-06', '', 'doubleBed', NULL, NULL),
	(10101, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', '', 'disable', 'parking', '', 3, '서울', '2022-10-06', '2023-10-06', 'singleBed', '', NULL, NULL),
	(10103, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', '', 'breakfast', '', 'hairAppliance', 'petsAllowed', '', '', 'parking', '', 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(11111, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', '', 'breakfast', '', 'hairAppliance', 'petsAllowed', '', '', 'parking', '', 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(11112, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', '', 'breakfast', '', 'hairAppliance', 'petsAllowed', '', '', 'parking', '', 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(11113, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', '', 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(12121, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', '', 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(12122, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, '', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', '', '', 'disable', 'parking', '', 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(12123, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', '', '', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 2, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(13131, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, '', 'airConditioner', '', '', 'spar', 'hairAppliance', 'petsAllowed', '', 'disable', 'parking', '', 2, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(13132, 5, '', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 5, 'restaurant', 'airConditioner', 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', 'store', 'disable', 'parking', 'hotSpring', 2, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(13133, 5, 'TV', 'wifi', '', '15:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', '', '', '', 'parking', '', 3, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(14141, 5, 'TV', 'wifi', '', '15:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', '', '', '', 'parking', '', 3, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(14142, 5, 'TV', 'wifi', '', '15:00:00', '11:00:00', 1, 'restaurant', 'airConditioner', '', 'breakfast', 'spar', 'hairAppliance', 'petsAllowed', '', '', 'parking', '', 3, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(35231, 2, 'TV', 'wifi', 'refrigerator', '11:00:00', '15:00:00', 1, NULL, 'airConditioner', 'swimmingPool', NULL, 'spar', 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 1, '부산', '2022-11-01', '2023-12-11', NULL, 'doubleBed', NULL, NULL),
	(39297, 4, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, NULL, 'airConditioner', 'swimmingPool', NULL, 'spar', 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 1, '부산', '2022-10-01', '2023-11-30', NULL, 'doubleBed', NULL, NULL),
	(40029, 5, NULL, 'wifi', NULL, '10:44:00', '14:47:00', 2, 'restaurant', NULL, NULL, 'breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '전주', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(43132, 5, NULL, 'wifi', NULL, '13:50:00', '16:52:00', 2, NULL, NULL, 'swimmingPool', NULL, 'spar', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(47581, 1, NULL, 'wifi', NULL, '18:45:00', '18:46:00', 1, NULL, NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(97708, 6, NULL, 'wifi', NULL, '10:50:00', '01:52:00', 2, NULL, NULL, 'swimmingPool', NULL, 'spar', NULL, '반려견동반', NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(98027, 1, NULL, 'wifi', NULL, '19:28:00', '18:31:00', 1, 'restaurant', NULL, 'swimmingPool', 'breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(100513, 6, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 3, NULL, 'airConditioner', 'swimmingPool', NULL, 'spar', 'hairAppliance', NULL, NULL, NULL, 'parking', NULL, 0, '부산', '2022-11-01', '2023-12-31', 'singleBed', 'doubleBed', 'twinBed', NULL),
	(122920, 3, NULL, 'wifi', NULL, '18:05:00', '18:08:00', 2, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(126275, 5, 'TV', 'wifi', NULL, '10:20:00', '14:23:00', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '편의점', NULL, '주차장', NULL, 2, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(161127, 3, NULL, 'wifi', NULL, '17:21:00', '17:19:00', 5, 'restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(221159, 5, NULL, 'wifi', NULL, '16:07:00', '17:07:00', 2, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(224126, 5, 'TV', 'wifi', 'refrigerator', '11:00:00', '16:00:00', 2, NULL, 'airConditioner', NULL, NULL, NULL, 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 1, '대전', '2022-11-11', '2023-12-31', NULL, 'doubleBed', NULL, NULL),
	(259821, 1, NULL, 'wifi', NULL, '10:48:00', '10:47:00', 1, 'restaurant', NULL, NULL, 'breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(263710, 5, NULL, 'wifi', NULL, '19:11:00', '21:27:00', 2, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(271194, 5, NULL, 'wifi', NULL, '10:17:00', '04:22:00', 2, 'restaurant', NULL, NULL, 'breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(287183, 3, 'TV', 'wifi', 'refrigerator', '11:00:00', '16:00:00', 1, NULL, 'airConditioner', NULL, NULL, NULL, 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 3, '대전', '2022-11-01', '2023-12-31', NULL, 'doubleBed', NULL, NULL),
	(357543, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, '', NULL, NULL, 'breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(401803, 4, 'TV', 'wifi', 'refrigerator', '16:00:00', '11:00:00', 2, NULL, 'airConditioner', NULL, 'breakfast', NULL, 'hairAppliance', NULL, NULL, NULL, 'parking', NULL, 3, '대전', '2022-11-01', '2023-12-31', 'singleBed', 'doubleBed', NULL, NULL),
	(405567, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 1, '', NULL, NULL, 'breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(411938, 5, 'TV', 'wifi', 'refrigerator', '15:00:00', '11:00:00', 6, '', NULL, '', 'breakfast', 'spar', NULL, NULL, NULL, NULL, '주차장', NULL, 1, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(441303, 6, NULL, 'wifi', NULL, '19:10:00', '20:38:00', 2, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(446184, 1, 'TV', 'wifi', NULL, '16:44:00', '14:49:00', 1, 'restaurant', NULL, 'swimmingPool', 'breakfast', 'spar', NULL, '반려견동반', '편의점', NULL, '주차장', NULL, 1, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(458660, 1, NULL, 'wifi', NULL, '18:47:00', '18:47:00', 1, NULL, NULL, 'swimmingPool', NULL, 'spar', NULL, '반려견동반', NULL, NULL, NULL, NULL, 1, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(480945, 5, NULL, 'wifi', NULL, '19:21:00', '21:23:00', 2, NULL, NULL, 'swimmingPool', NULL, 'spar', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(498831, 5, NULL, 'wifi', NULL, '15:00:00', '11:00:00', 2, 'restaurant', NULL, 'swimmingPool', 'breakfast', 'spar', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(517079, 5, NULL, 'wifi', NULL, '11:59:00', '00:59:00', 2, NULL, NULL, 'swimmingPool', NULL, NULL, NULL, '반려견동반', NULL, NULL, NULL, NULL, 2, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(517725, 2, 'TV', 'wifi', 'refrigerator', '11:00:00', '14:00:00', 1, NULL, 'airConditioner', NULL, 'breakfast', 'spar', 'hairAppliance', NULL, 'store', 'disabledAccessibility', NULL, NULL, 1, '부산', '2022-11-01', '2023-12-31', 'singleBed', 'doubleBed', NULL, NULL),
	(549251, 3, 'TV', 'wifi', NULL, '15:00:00', '11:59:00', 2, 'restaurant', NULL, '', 'breakfast', 'spar', 'hairAppliance', NULL, NULL, NULL, 'parking', NULL, 3, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(623568, 3, 'TV', 'wifi', NULL, '15:00:00', '11:59:00', 3, 'restaurant', NULL, 'swimmingPool', 'breakfast', 'spar', 'hairAppliance', NULL, NULL, NULL, 'parking', NULL, 2, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(628967, 3, NULL, 'wifi', NULL, '18:06:00', '22:09:00', 2, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '대전', '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(629207, 1, NULL, 'wifi', NULL, '20:26:00', '16:27:00', 1, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(660599, 5, NULL, 'wifi', NULL, '19:14:00', '23:14:00', 2, 'restaurant', NULL, 'swimmingPool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(677859, 5, 'TV', 'wifi', 'refrigerator', '12:00:00', '11:00:00', 2, 'restaurant', 'airConditioner', 'swimmingPool', NULL, NULL, 'hairAppliance', NULL, NULL, 'disabledAccessibility', 'parking', NULL, 1, '제주', '2022-11-01', '2023-12-11', 'singleBed', NULL, 'twinBed', NULL),
	(704372, 4, 'TV', 'wifi', 'refrigerator', '11:00:00', '16:00:00', 1, NULL, 'airConditioner', NULL, NULL, NULL, 'hairAppliance', NULL, 'store', NULL, NULL, NULL, 2, '대전', '2022-11-01', '2023-12-31', NULL, 'doubleBed', NULL, NULL),
	(708001, 7, 'TV', 'wifi', 'refrigerator', '11:00:00', '17:03:00', 4, NULL, 'airConditioner', 'swimmingPool', NULL, 'spar', 'hairAppliance', NULL, 'store', NULL, NULL, NULL, 2, '부산', '2022-11-01', '2023-12-01', 'singleBed', NULL, NULL, 'ondol'),
	(756284, 1, NULL, 'wifi', NULL, '21:58:00', '19:58:00', 1, 'restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(759647, 1, NULL, 'wifi', NULL, '20:53:00', '22:53:00', 1, 'restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '주차장', NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(846752, 5, 'TV', 'wifi', NULL, '15:00:00', '11:00:00', 2, 'restaurant', NULL, NULL, 'breakfast', NULL, NULL, NULL, '편의점', NULL, '주차장', NULL, 1, NULL, '2022-10-06', '2023-10-06', NULL, NULL, NULL, NULL),
	(852321, 4, 'TV', 'wifi', 'refrigerator', '11:00:00', '15:00:00', 2, NULL, 'airConditioner', NULL, NULL, 'spar', 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 1, '부산', '2022-11-01', '2023-12-31', 'singleBed', NULL, NULL, NULL),
	(900605, 3, 'TV', 'wifi', 'refrigerator', '11:00:00', '15:00:00', 1, NULL, 'airConditioner', NULL, NULL, NULL, 'hairAppliance', NULL, NULL, NULL, NULL, NULL, 2, '대전', '2022-11-01', '2023-12-31', NULL, NULL, 'twinBed', NULL),
	(970074, 2, 'TV', 'wifi', 'refrigerator', '11:00:00', '16:00:00', 1, NULL, 'airConditioner', NULL, NULL, NULL, 'hairAppliance', NULL, NULL, 'disabledAccessibility', NULL, NULL, 1, '대전', '2022-11-11', '2023-12-31', 'singleBed', NULL, NULL, NULL);
/*!40000 ALTER TABLE `lodgingdetail` ENABLE KEYS */;

-- 테이블 usertbl_db.naver_table 구조 내보내기
DROP TABLE IF EXISTS `naver_table`;
CREATE TABLE IF NOT EXISTS `naver_table` (
  `uid` varchar(45) NOT NULL,
  `n_name` varchar(20) NOT NULL,
  `n_email` varchar(50) NOT NULL,
  `userType` int(11) DEFAULT 1,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.naver_table:~2 rows (대략적) 내보내기
DELETE FROM `naver_table`;
/*!40000 ALTER TABLE `naver_table` DISABLE KEYS */;
INSERT INTO `naver_table` (`uid`, `n_name`, `n_email`, `userType`) VALUES
	('DTB3mj', '김수빈', 'ksb4150@nate.com', 1),
	('V35hUI', '이상연', 'syxdz@naver.com', 1);
/*!40000 ALTER TABLE `naver_table` ENABLE KEYS */;

-- 테이블 usertbl_db.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `noticeNo` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `regDate` datetime DEFAULT current_timestamp(),
  `notice_writer` varchar(45) DEFAULT NULL,
  `notice_category` varchar(45) DEFAULT NULL,
  `view_cnt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`noticeNo`),
  KEY `fk_notice_user1_idx` (`uid`),
  CONSTRAINT `fk_notice_user1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.notice:~148 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`noticeNo`, `uid`, `title`, `content`, `regDate`, `notice_writer`, `notice_category`, `view_cnt`) VALUES
	(8, 'A1234A', 'gg', 'gg', '2022-10-21 11:00:30', NULL, '공지사항', 5),
	(9, 'A1234A', 'gg', 'gg', '2022-10-21 11:00:31', NULL, '공지사항', 5),
	(10, 'A1234A', 'gg', 'gg', '2022-10-21 11:00:32', NULL, '공지사항', 5),
	(11, 'A1234A', 'gg', 'gg', '2022-10-21 11:00:33', NULL, '공지사항', 5),
	(12, 'A1234A', 'gg', 'gg', '2022-10-21 11:00:32', NULL, '공지사항', 5),
	(13, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(14, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(15, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(16, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(17, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(18, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(19, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(20, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(21, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(22, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(23, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(24, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(25, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(26, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(27, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(28, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(29, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(30, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(31, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(32, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(33, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(34, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(35, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(36, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(37, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(38, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(39, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(40, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(41, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(42, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(43, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(44, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(45, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(46, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(47, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(48, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(49, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(50, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(51, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(52, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(53, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(54, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(55, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(56, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(57, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(58, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(59, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(60, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(61, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(62, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(63, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(64, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(65, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(66, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(67, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(68, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(69, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(70, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(71, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(72, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(73, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(74, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(75, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(76, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(77, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(78, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(79, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(80, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(81, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(82, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(83, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(84, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(85, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(86, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(87, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(88, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(89, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(90, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(91, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(92, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(93, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(94, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(95, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(96, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(97, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(98, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(99, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(100, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(101, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(102, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(103, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(104, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(105, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(106, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(107, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(108, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(109, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(110, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(111, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(112, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(113, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(114, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(115, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(116, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(117, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(118, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(119, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(120, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(121, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(122, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(123, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(124, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(125, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(126, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(127, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(128, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(129, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(130, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(131, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(132, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(133, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(134, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(135, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(136, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(137, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(138, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(139, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(140, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(141, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(142, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(143, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(144, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(145, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(146, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(147, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(148, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(149, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(150, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(151, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(152, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(153, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 5),
	(154, 'A1234A', 'gg', 'gg', NULL, NULL, '공지사항', 6),
	(157, 'A1234A', '333', '33333', '2022-11-08 15:24:35', NULL, '공지사항', 1);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 usertbl_db.orderrefund 구조 내보내기
DROP TABLE IF EXISTS `orderrefund`;
CREATE TABLE IF NOT EXISTS `orderrefund` (
  `refundNumber` int(11) NOT NULL AUTO_INCREMENT,
  `ordersNO` int(11) DEFAULT 0,
  `uid` varchar(50) DEFAULT NULL,
  `ordererName` varchar(20) DEFAULT NULL,
  `ordererPhoneNumber` varchar(20) DEFAULT NULL,
  `goodsId` int(11) DEFAULT 0,
  `goodsName` varchar(100) DEFAULT NULL,
  `goodsPrice` int(11) DEFAULT 0,
  `goodsQty` int(11) DEFAULT 0,
  `totalPrice` int(11) DEFAULT 0,
  `numOfTourist` int(11) DEFAULT 0,
  `cartcheckin` date DEFAULT NULL,
  `cartcheckout` date DEFAULT NULL,
  `orderRefundState` varchar(11) DEFAULT '주문취소',
  `creDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`refundNumber`),
  KEY `ordersNO` (`ordersNO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.orderrefund:~0 rows (대략적) 내보내기
DELETE FROM `orderrefund`;
/*!40000 ALTER TABLE `orderrefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderrefund` ENABLE KEYS */;

-- 테이블 usertbl_db.orders 구조 내보내기
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ordersNO` int(11) NOT NULL AUTO_INCREMENT,
  `orderSeqNum` varchar(50) DEFAULT NULL,
  `uid` varchar(45) DEFAULT NULL,
  `ordererName` varchar(20) DEFAULT NULL,
  `ordererPhoneNumber` varchar(20) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `creDate` timestamp NULL DEFAULT current_timestamp(),
  `couponId` int(11) DEFAULT NULL,
  `QA1` varchar(100) DEFAULT NULL,
  `QA2` varchar(100) DEFAULT NULL,
  `QA3` varchar(100) DEFAULT NULL,
  `usePoint` int(11) NOT NULL DEFAULT 0,
  `savePoint` int(11) NOT NULL DEFAULT 0,
  `finalTotalPrice` int(25) NOT NULL DEFAULT 0,
  `orderState` varchar(11) DEFAULT '결제완료',
  PRIMARY KEY (`ordersNO`) USING BTREE,
  KEY `fk_user_Order_user1_idx` (`uid`),
  CONSTRAINT `fk_user_Order_user1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7775447 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.orders:~2 rows (대략적) 내보내기
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`ordersNO`, `orderSeqNum`, `uid`, `ordererName`, `ordererPhoneNumber`, `payment`, `creDate`, `couponId`, `QA1`, `QA2`, `QA3`, `usePoint`, `savePoint`, `finalTotalPrice`, `orderState`) VALUES
	(13393, 'U1234A_2022111544', 'U1234A', '가순민', '01062484159', NULL, '2022-11-15 16:44:39', NULL, '2022-11-17', '', '', 0, 2899, 57999, '결제완료'),
	(162950, 'U1234A_2022111452', 'U1234A', '사용자A', '01062484159', NULL, '2022-11-14 16:52:49', NULL, '2022-11-15', '날잡아', '날잡아', 0, 15619, 312399, '결제완료'),
	(309956, 'U1234A_2022111455', 'U1234A', '사용자A', '01062484159', NULL, '2022-11-14 16:55:37', NULL, '2022-11-17', '날잡아', '날잡아', 0, 2000, 40000, '결제완료'),
	(379214, 'U1234A_2022111543', 'U1234A', '가순민', '01062484159', NULL, '2022-11-15 16:43:06', NULL, '2022-11-16', '', '', 67969, 11925, 170546, '결제완료'),
	(457006, 'U1234C_2022111525', 'U1234C', '이정규', '01020221005', NULL, '2022-11-15 16:25:21', NULL, '2022-11-17', '', '', 3875, 34350, 683125, '결제완료'),
	(492491, 'U1234B_2022111519', 'U1234B', '김수빈', '01020221005', NULL, '2022-11-15 16:19:46', NULL, '2022-11-24', '날잡아', '날잡아', 0, 48707, 974161, '결제완료'),
	(610495, 'U1234C_2022111528', 'U1234C', '이정규', '01020221005', NULL, '2022-11-15 16:28:54', NULL, '2022-11-21', '', '', 3285, 16075, 318215, '결제완료'),
	(615936, 'U1234C_2022111526', 'U1234C', '이정규', '01020221005', NULL, '2022-11-15 16:26:58', NULL, '2022-11-17', '날잡아', '날잡아', 34350, 3285, 31367, '결제완료'),
	(669553, 'U1234D_2022111531', 'U1234D', '이상연', '01020221005', NULL, '2022-11-15 16:31:09', NULL, '2022-11-16', '날잡아', '날잡아', 0, 3740, 74800, '결제완료'),
	(681084, 'U1234B_2022111518', 'U1234B', '김수빈', '01020221005', NULL, '2022-11-15 16:18:19', NULL, '2022-11-18', '힐하우스', '마트', 0, 2000, 40000, '결제완료'),
	(905697, 'U1234D_2022111532', 'U1234D', '이상연', '01020221005', NULL, '2022-11-15 16:32:53', NULL, '2022-11-15', '날잡아', '날잡아', 3740, 1100, 18260, '결제완료'),
	(7775447, 'U1234B_2022101518', 'U1234B', '김수빈', '01020221005', NULL, '2022-10-15 16:18:19', NULL, '2022-10-15', '힐하우스', '마트', 0, 2000, 40000, '결제완료');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 usertbl_db.ordersgoods 구조 내보내기
DROP TABLE IF EXISTS `ordersgoods`;
CREATE TABLE IF NOT EXISTS `ordersgoods` (
  `ordersGoodsId` int(11) NOT NULL AUTO_INCREMENT,
  `ordersNO` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `goodsQty` int(11) DEFAULT NULL,
  `goodsPrice` int(11) DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `cartcheckin` date DEFAULT NULL,
  `cartcheckout` date DEFAULT NULL,
  `numOfTourist` int(11) DEFAULT 1,
  `orderState` varchar(11) DEFAULT '결제완료',
  `creDate` timestamp(6) NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`ordersGoodsId`) USING BTREE,
  KEY `ordersNO` (`ordersNO`),
  CONSTRAINT `fk_user_OrdersGoods_Orders` FOREIGN KEY (`ordersNO`) REFERENCES `orders` (`ordersNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.ordersgoods:~4 rows (대략적) 내보내기
DELETE FROM `ordersgoods`;
/*!40000 ALTER TABLE `ordersgoods` DISABLE KEYS */;
INSERT INTO `ordersgoods` (`ordersGoodsId`, `ordersNO`, `goodsId`, `goodsQty`, `goodsPrice`, `goodsName`, `totalPrice`, `cartcheckin`, `cartcheckout`, `numOfTourist`, `orderState`, `creDate`) VALUES
	(153, 162950, 401803, 1, 97500, '레지던스 스위트(standalone)', 97500, '2022-11-15', '2022-11-15', 2, '결제완료', '2022-11-14 16:52:49.530818'),
	(154, 162950, 287183, 1, 94899, '스탠다드 더블 (주차, 무료 Wi-Fi)', 94899, '2022-11-21', '2022-11-22', 2, '결제완료', '2022-11-14 16:52:49.531080'),
	(155, 162950, 666666, 1, 120000, '[경기 양평] 패러글라이딩 미래항공스포츠', 120000, '2022-11-14', '2022-11-14', 5, '결제완료', '2022-11-14 16:52:49.531364'),
	(156, 309956, 704372, 1, 40000, '진주(standalone)', 40000, '2022-11-17', '2022-11-19', 2, '결제완료', '2022-11-14 16:55:37.775283'),
	(157, 681084, 704372, 1, 40000, '진주(standalone)', 40000, '2022-11-18', '2022-11-19', 2, '결제완료', '2022-11-15 16:18:19.245711'),
	(158, 492491, 517725, 1, 500000, '프리미엄룸, 킹사이즈침대 1개', 500000, '2022-11-24', '2022-11-25', 2, '결제완료', '2022-11-15 16:19:46.497593'),
	(159, 492491, 7771, 1, 238515, '스위트, 침실 1개, 금연, 시내 전망', 238515, '2022-11-22', '2022-11-22', 2, '결제완료', '2022-11-15 16:19:46.497855'),
	(160, 492491, 6663, 1, 235646, '펜트하우스, 침실 3개, 금연', 235646, '2022-11-17', '2022-11-19', 2, '결제완료', '2022-11-15 16:19:46.498064'),
	(161, 457006, 168290, 1, 60000, '[오후]서핑 입문강습(1회)', 60000, '2022-11-17', '2022-11-17', 1, '결제완료', '2022-11-15 16:25:21.758459'),
	(162, 457006, 852321, 1, 627000, '프리미엄 트윈룸 - 조식 패키지', 627000, '2022-11-16', '2022-11-17', 2, '결제완료', '2022-11-15 16:25:21.758670'),
	(163, 615936, 8881, 1, 65717, '스탠다드 더블', 65717, '2022-11-17', '2022-11-19', 2, '결제완료', '2022-11-15 16:26:58.569196'),
	(164, 610495, 623568, 1, 321500, '스탠다드 더블룸', 321500, '2022-11-21', '2022-11-23', 2, '결제완료', '2022-11-15 16:28:54.799862'),
	(165, 669553, 5552, 1, 74800, '더블룸(1-2인 단독사용)', 74800, '2022-11-16', '2022-11-17', 2, '결제완료', '2022-11-15 16:31:09.336217'),
	(166, 905697, 509567, 1, 22000, '제주 난타공연 입장권/ 호텔에서 진행', 22000, '2022-11-15', '2022-11-15', 1, '결제완료', '2022-11-15 16:32:53.480152'),
	(167, 7775447, 704372, 1, 40000, '진주(standalone)', 40000, '2022-10-18', '2022-10-19', 2, '결제완료', '2022-10-15 16:18:19.245711'),
	(168, 379214, 7771, 1, 238515, '스위트, 침실 1개, 금연, 시내 전망', 238515, '2022-11-16', '2022-11-18', 2, '결제완료', '2022-11-15 16:43:06.457130'),
	(169, 13393, 625985, 1, 38000, '[날짜 지정] 에버랜드 A 종일권', 38000, '2022-11-17', '2022-11-17', 1, '결제완료', '2022-11-15 16:44:39.801995'),
	(170, 13393, 368851, 1, 19999, '[할인중] 서울랜드 종일권', 19999, '2022-11-16', '2022-11-16', 1, '결제완료', '2022-11-15 16:44:39.802207');
/*!40000 ALTER TABLE `ordersgoods` ENABLE KEYS */;

-- 테이블 usertbl_db.pointhis 구조 내보내기
DROP TABLE IF EXISTS `pointhis`;
CREATE TABLE IF NOT EXISTS `pointhis` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `ordersNO` int(11) DEFAULT NULL,
  `uid` varchar(45) NOT NULL,
  `usePoint` int(11) DEFAULT 0,
  `savePoint` int(11) DEFAULT 0,
  `userPoint` int(11) DEFAULT 0,
  `creDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`historyId`),
  KEY `fk_pointHis_user_Order2_idx` (`uid`),
  KEY `ordersNO` (`ordersNO`),
  CONSTRAINT `FK_pointhis_orders` FOREIGN KEY (`ordersNO`) REFERENCES `orders` (`ordersNO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pointHis_user_Order2` FOREIGN KEY (`uid`) REFERENCES `orders` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.pointhis:~2 rows (대략적) 내보내기
DELETE FROM `pointhis`;
/*!40000 ALTER TABLE `pointhis` DISABLE KEYS */;
INSERT INTO `pointhis` (`historyId`, `ordersNO`, `uid`, `usePoint`, `savePoint`, `userPoint`, `creDate`) VALUES
	(34, 162950, 'U1234A', 0, 15619, 65969, '2022-11-14 16:52:49'),
	(35, 309956, 'U1234A', 0, 2000, 67969, '2022-11-14 16:55:37'),
	(36, 681084, 'U1234B', 0, 2000, 15723, '2022-11-15 16:18:19'),
	(37, 492491, 'U1234B', 0, 48707, 64430, '2022-11-15 16:19:46'),
	(38, 457006, 'U1234C', 3875, 34350, 34350, '2022-11-15 16:25:21'),
	(39, 615936, 'U1234C', 34350, 3285, 3285, '2022-11-15 16:26:58'),
	(40, 610495, 'U1234C', 3285, 16075, 16075, '2022-11-15 16:28:54'),
	(41, 669553, 'U1234D', 0, 3740, 3740, '2022-11-15 16:31:09'),
	(42, 905697, 'U1234D', 3740, 1100, 1100, '2022-11-15 16:32:53'),
	(43, 379214, 'U1234A', 67969, 11925, 11925, '2022-11-15 16:43:06'),
	(44, 13393, 'U1234A', 0, 2899, 14824, '2022-11-15 16:44:39');
/*!40000 ALTER TABLE `pointhis` ENABLE KEYS */;

-- 테이블 usertbl_db.ticketdetail 구조 내보내기
DROP TABLE IF EXISTS `ticketdetail`;
CREATE TABLE IF NOT EXISTS `ticketdetail` (
  `goodsId` int(11) NOT NULL,
  `guide` char(5) DEFAULT NULL,
  `goodsSubCategory` varchar(45) DEFAULT NULL,
  `goodsStart` date DEFAULT NULL,
  `goodsEnd` date DEFAULT NULL,
  PRIMARY KEY (`goodsId`),
  CONSTRAINT `fk_ticketDetail_goods1` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.ticketdetail:~8 rows (대략적) 내보내기
DELETE FROM `ticketdetail`;
/*!40000 ALTER TABLE `ticketdetail` DISABLE KEYS */;
INSERT INTO `ticketdetail` (`goodsId`, `guide`, `goodsSubCategory`, `goodsStart`, `goodsEnd`) VALUES
	(168290, '있음', '부산', '2022-11-01', '2023-12-15'),
	(175159, '없음', '대전', '2022-11-01', '2023-12-15'),
	(368851, '없음', '서울', '2022-11-01', '2023-12-31'),
	(509567, '없음', '제주', '2022-11-01', '2023-12-31'),
	(563314, '없음', '부산', '2022-11-01', '2022-11-30'),
	(625985, '없음', '서울', '2022-11-09', '2023-12-31'),
	(754017, '없음', '전주', '2022-11-01', '2023-12-31'),
	(905667, '없음', '제주', '2022-11-01', '2023-12-31');
/*!40000 ALTER TABLE `ticketdetail` ENABLE KEYS */;

-- 테이블 usertbl_db.touristinfo 구조 내보내기
DROP TABLE IF EXISTS `touristinfo`;
CREATE TABLE IF NOT EXISTS `touristinfo` (
  `touristNum` int(11) NOT NULL AUTO_INCREMENT,
  `ordersNO` int(11) NOT NULL,
  `touristName` varchar(20) DEFAULT NULL,
  `touristGender` varchar(50) DEFAULT NULL,
  `touristPhoneNumber` varchar(20) DEFAULT NULL,
  `touristBirth` varchar(15) DEFAULT NULL,
  `creDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`touristNum`)
) ENGINE=InnoDB AUTO_INCREMENT=534233 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.touristinfo:~33 rows (대략적) 내보내기
DELETE FROM `touristinfo`;
/*!40000 ALTER TABLE `touristinfo` DISABLE KEYS */;
INSERT INTO `touristinfo` (`touristNum`, `ordersNO`, `touristName`, `touristGender`, `touristPhoneNumber`, `touristBirth`, `creDate`) VALUES
	(224764, 701450, '', NULL, '', '', '2022-10-06 12:43:11'),
	(461315, 777748, '', NULL, '', '', '2022-10-06 12:43:11'),
	(534202, 920905, '', NULL, '', '', '2022-10-06 12:43:11'),
	(534203, 916268, '김수빈', 'F', '01000000000', '19990511', '2022-10-06 12:49:57'),
	(534204, 310654, '김수빈', NULL, '01000000000', '19990511', '2022-10-06 12:53:56'),
	(534205, 218231, '', NULL, '', '', '2022-10-06 18:39:16'),
	(534206, 258130, '김수빈', 'F', '01000000000', '1991905', '2022-10-06 18:53:01'),
	(534207, 609567, '', NULL, '', '', '2022-10-06 19:15:32'),
	(534208, 103483, '김수빈', 'F', '01096599601', '19960717', '2022-10-07 15:03:58'),
	(534209, 738891, '김북북', 'M', '김북북', '19950505', '2022-10-17 10:38:16'),
	(534210, 300877, '', NULL, '', '', '2022-10-18 14:23:19'),
	(534211, 351288, '', NULL, '', '', '2022-10-18 14:32:24'),
	(534212, 563401, '가순민', NULL, '0100000000', '1999071', '2022-10-20 11:50:50'),
	(534213, 939467, '김수빈', 'F', '01000000000', '19990710', '2022-10-20 12:00:09'),
	(534214, 544571, '북북스', 'M', '01055555555', '19950505', '2022-10-24 10:08:10'),
	(534215, 96197, '북북스', 'M', '01055555555', '19990110', '2022-10-24 10:17:15'),
	(534216, 268896, '김북북', NULL, '', '19950120', '2022-10-24 10:25:40'),
	(534217, 690697, '북북스', 'M', '01055555555', '19950505', '2022-10-24 10:33:13'),
	(534218, 310469, '북북스', 'M', '01055555555', '19950303', '2022-10-24 10:54:28'),
	(534219, 771275, '북북스', 'M', '01055555555', '19950505', '2022-10-24 11:06:26'),
	(534220, 986239, '북북스', 'M', '01055555555', '19950120', '2022-10-24 11:12:34'),
	(534221, 732975, '북북스', 'M', '01055555555', '19950120', '2022-10-24 11:19:39'),
	(534222, 416892, '김수빈', 'F', '01062484159', '19990511', '2022-10-25 09:36:12'),
	(534223, 12377, '', NULL, '', '', '2022-11-01 15:41:43'),
	(534224, 881413, '', NULL, '', '', '2022-11-05 15:23:05'),
	(534225, 158146, '', NULL, '', '', '2022-11-07 17:44:19'),
	(534226, 300644, '', NULL, '', '', '2022-11-07 17:46:03'),
	(534227, 668138, '', NULL, '', '', '2022-11-07 17:49:53'),
	(534228, 344937, '', NULL, '', '', '2022-11-07 17:53:33'),
	(534229, 260558, '', NULL, '', '', '2022-11-07 18:01:17'),
	(534230, 766618, '', NULL, '', '', '2022-11-07 18:07:24'),
	(534231, 162950, '김수빈', 'F', '01099998888', '960612', '2022-11-14 16:52:49'),
	(534232, 309956, '김수빈', 'M', '01099998888', '960612', '2022-11-14 16:55:37'),
	(534233, 681084, '김수빈', 'F', '01062484159', '19990511', '2022-11-15 16:18:19'),
	(534234, 492491, '김수빈', 'M', '01099998888', '19990511', '2022-11-15 16:19:46'),
	(534235, 457006, '', NULL, '', '', '2022-11-15 16:25:21'),
	(534236, 615936, '이정규', 'M', '01000000000', '19970101', '2022-11-15 16:26:58'),
	(534237, 610495, '', NULL, '', '', '2022-11-15 16:28:54'),
	(534238, 669553, '이상연', 'F', '01062480000', '19920101', '2022-11-15 16:31:09'),
	(534239, 905697, '이상연', 'F', '01099998888', '19990511', '2022-11-15 16:32:53'),
	(534240, 379214, '', NULL, '', '', '2022-11-15 16:43:06'),
	(534241, 13393, '', NULL, '', '', '2022-11-15 16:44:39');
/*!40000 ALTER TABLE `touristinfo` ENABLE KEYS */;

-- 테이블 usertbl_db.user 구조 내보내기
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` varchar(45) NOT NULL,
  `userId` varchar(35) NOT NULL,
  `userPwd` varchar(100) DEFAULT NULL,
  `userName` varchar(20) NOT NULL,
  `userBirth` varchar(15) DEFAULT NULL,
  `userGender` varchar(5) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `userLevel` int(11) DEFAULT NULL,
  `userPoint` int(11) DEFAULT NULL,
  `userPhoneNumber` varchar(20) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `userImageFileName` varchar(100) DEFAULT NULL,
  `roadAddress` varchar(100) DEFAULT NULL,
  `jibunAddress` varchar(100) DEFAULT NULL,
  `extraAddress` varchar(45) DEFAULT NULL,
  `info_a` char(1) DEFAULT NULL,
  `info_b` char(1) DEFAULT NULL,
  `joinDate` timestamp NULL DEFAULT current_timestamp(),
  `businessNumber` varchar(15) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  `adminAllow` int(11) DEFAULT 0,
  `businessPic` varchar(300) DEFAULT NULL,
  `companyNum` varchar(20) DEFAULT NULL,
  `companyInfo` varchar(500) DEFAULT NULL,
  `facilities` varchar(500) DEFAULT NULL,
  `companyNotice` varchar(500) DEFAULT NULL,
  `score` double DEFAULT 0,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.user:~62 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uid`, `userId`, `userPwd`, `userName`, `userBirth`, `userGender`, `userType`, `userLevel`, `userPoint`, `userPhoneNumber`, `zipcode`, `userImageFileName`, `roadAddress`, `jibunAddress`, `extraAddress`, `info_a`, `info_b`, `joinDate`, `businessNumber`, `salt`, `companyName`, `adminAllow`, `businessPic`, `companyNum`, `companyInfo`, `facilities`, `companyNotice`, `score`) VALUES
	('2dEJRT', 'userAA@naver.com', 'qweqweqwe11$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '김수빈', '19990511', 'F', 1, NULL, NULL, '01062484159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-07 12:45:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('7FnxEq', 'ksb4150@nate.com', NULL, '김수빈', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-09 18:40:09', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0),
	('A1234A', 'adminA@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '관리자A', '19960717', 'F', 0, NULL, 4100, '01020221005', NULL, '', NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('A1234B', 'adminB@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '관리자B', '19990511', 'F', 0, NULL, NULL, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('A1234C', 'adminC@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '관리자C', '19970711', 'M', 0, NULL, NULL, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('A1234D', 'adminD@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '관리자D', '19991111', 'M', 0, NULL, NULL, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('A1234E', 'adminE@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '관리자E', '19940625', 'M', 0, NULL, NULL, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('B1234A', 'businessA@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자A', '20221005', 'F', 2, NULL, NULL, '064-780-8100', '63629', 'pic1.JPG', '제주 서귀포시 표선면 민속해안로 537', '표선리 40-69', NULL, NULL, NULL, '2022-10-05 18:56:30', NULL, NULL, '해비치호텔앤드리조트', 1, NULL, '82-2-2230-0700', '서귀포(표선)에 위치한 해비치 호텔 & 리조트 제주의 경우 표선 해비치 해변에서 가까우며 걸어서 4분 거리에 제주 민속촌 박물관 등이 있습니다. 이 5성급 호텔에서 성읍민속마을까지는 9.3km 떨어져 있으며, 13.3km 거리에는 조랑말체험공원도 있습니다.', '마사지, 전신 트리트먼트 서비스, 얼굴 트리트먼트 서비스 등이 제공되는 풀서비스 스파에서 느긋한 시간을 즐기실 수 있습니다. 실내 수영장, 야외 테니스 코트, 사우나 등의 레크리에이션 시설을 십분 활용하시기 바랍니다. 이 호텔에는 이 밖에도 무료 무선 인터넷, 콘시어지 서비스 및 아케이드/게임룸도 마련되어 있습니다.', '아침 식사 요금: 성인 KRW 36000 ~ KRW 55000, 어린이 KRW 24000 ~ KRW 36000(대략적인 금액)', 0),
	('B1234B', 'businessB@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자B', '20221005', 'F', 2, NULL, NULL, '1533-1234', '63082', 'pic2.JPG', '제주 제주시 노연로 12 그랜드 하얏트 제주 ', '노형동 925', NULL, NULL, NULL, '2022-10-05 18:56:30', NULL, NULL, '그랜드 하얏트 제주', 1, NULL, '82-64-738 6600', '제주시 중심에 자리한 그랜드 하얏트 제주의 경우 차로 1분 거리에는 Nuwemaru Street, 8분 거리에는 이호해수욕장 등이 있습니다. 이 5성급 호텔에서 한라수목원까지는 2.6km 떨어져 있으며, 5.5km 거리에는 용두암도 있습니다.', '마사지, 전신 트리트먼트 서비스, 얼굴 트리트먼트 서비스 등이 제공되는 풀서비스 스파에서 느긋한 시간을 즐기실 수 있습니다. 야외 수영장, 실내 수영장, 스파 욕조 등의 레크리에이션 시설에 확실히 만족하실 것입니다. 이 호텔에는 무료 무선 인터넷, 콘시어지 서비스 및 미용실도 편의 시설/서비스로 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 60000, 어린이 KRW 30000(대략적인 금액)', 0),
	('B1234C', 'businessC@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자C', '20221005', 'F', 2, NULL, NULL, '064-735-5114', '63535', 'pic3.JPG', '제주 서귀포시 중문관광로72번길 75', '색달동 3039-3', NULL, NULL, NULL, '2022-10-05 18:56:30', NULL, NULL, '제주신라호텔', 1, NULL, '82-64-720 6001', '서귀포(중문)에 위치한 제주신라호텔의 경우 걸어서 15분 이내 거리에 중문 골프 클럽 및 제주 테디베어뮤지엄 등이 있습니다. 이 5성급 리조트에서 제주신화월드까지는 16.9km 떨어져 있으며, 15.9km 거리에는 한라산국립공원도 있습니다.', '2 개의 야외 수영장에 몸을 담그고 쉬거나 헬스클럽 및 사우나 등의 다른 레크리에이션 시설을 즐기셔도 좋습니다. 이 리조트에는 무료 무선 인터넷, 콘시어지 서비스, 아케이드/게임룸 등도 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 60000, 어린이 KRW 35000(대략적인 금액)', 0),
	('B1234D', 'businessD@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자D', '20221005', 'F', 2, NULL, NULL, '01020221005', '63035', 'pic4.JPG', '제주 제주시 애월읍 도치돌길 293 통나무파크', '납읍리 102', NULL, NULL, NULL, '2022-10-05 18:56:30', NULL, NULL, '통나무파크', 1, NULL, '82-64-7408000', '서귀포(중문)에 위치한 제주 중문 통나무 펜션 & 리조트의 경우 차로 15분 이내 거리에 헬로키티 아일랜드 및 제주 테디베어뮤지엄 등이 있습니다. 이 호텔에서 제주워터월드까지는 7.2km 떨어져 있으며, 11.8km 거리에는 천지연 폭포도 있습니다.', '테라스 및 정원 전망을 감상하고 무료 무선 인터넷 등의 편의 시설/서비스를 이용하실 수 있습니다. 이 호텔에는 투어/티켓 안내, 피크닉 공간 및 바비큐 그릴도 편의 시설/서비스로 마련되어 있습니다.', '숙박 시설에서 현재 고객 안전 조치 시행 중', 0),
	('B1234E', 'businessE@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자E', '20221005', 'F', 2, NULL, NULL, '01000000000', '41055', 'pic5.JPG', '제주 제주시 구좌읍 월정5길 33 102동', '월정리 243', '', NULL, NULL, '2022-10-05 18:56:30', '0000000000', NULL, '파티월정리썬시티', 1, NULL, '82-647-298100', '제주시에 위치한 바오젠 게스트하우스 - 호스텔에서 한라수목원까지는 2.5km 떨어져 있으며, 4.5km 거리에는 용두암도 있습니다. 이 호스텔에서 이호해수욕장까지는 4.9km 떨어져 있으며, 5.2km 거리에는 동문시장도 있습니다.', '루프탑 테라스 전망을 감상하고 무료 무선 인터넷 및 공용 거실 등의 편의 시설/서비스를 이용하실 수 있습니다.', '간이 침대 이용 요금: 1박 기준, KRW 15000.0', 5),
	('B1234F', 'businessF@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자F', '20221005', 'M', 2, NULL, NULL, '01020221005', '06071', 'pic6.JPG', '서울특별시 강남구 영동대로 737', '서울특별시 강남구 청담동 53-7', NULL, NULL, NULL, '2022-10-05 19:07:39', NULL, NULL, '리베라호텔', 1, NULL, '82-64-7301000', '서울(강남)에 위치한 호텔 리베라의 경우 차로 15분 이내 거리에 롯데월드 및 봉은사 등이 있습니다. 이 4성급 호텔에서 롯데월드타워까지는 6.1km 떨어져 있으며, 11.4km 거리에는 북촌 한옥마을도 있습니다.', '나이트클럽, 실내 수영장, 사우나 등의 다양한 레크리에이션 시설을 즐기실 수 있습니다. 이 호텔에는 무료 무선 인터넷, 콘시어지 서비스 및 기념품점/신문 가판대도 편의 시설/서비스로 마련되어 있습니다.', '주문 요리 아침 식사 요금: 성인 KRW 27000, 어린이 KRW 16200(대략적인 금액)', 0),
	('B1234G', 'businessG@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자G', '20221005', 'M', 2, NULL, NULL, '01020221005', '06132', 'pic7.JPG', '서울특별시 강남구 테헤란로25길 10', '서울 강남구 역삼동 642', NULL, NULL, NULL, '2022-10-05 19:07:39', NULL, NULL, 'AC호텔 바이 메리어트', 1, NULL, '82-64-908-8888', '서울 중심에 자리한 AC 호텔 바이 메리어트 서울 강남의 경우 테헤란로에서 아주 가까우며 차로 2분 거리에 선정릉 등이 있습니다. 이 4성급 호텔에서 롯데월드까지는 5.8km 떨어져 있으며, 6.6km 거리에는 롯데월드타워도 있습니다.', '피트니스 센터 같은 레크리에이션 시설 외에 무료 무선 인터넷, 콘시어지 서비스 등의 기타 편의 시설/서비스를 이용하실 수 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 45000, 어린이 KRW 22500(대략적인 금액)', 5),
	('B1234H', 'businessH@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자H', '20221005', 'M', 2, NULL, NULL, '01020221005', '06081', 'pic8.JPG', '서울특별시 강남구 영동대로 618', '서울 강남구 삼성동 91-28', NULL, NULL, NULL, '2022-10-05 19:07:39', NULL, NULL, 'Hotel in 9', 1, NULL, '82-1670 8800', '서울(강남)에 위치한 호텔 인 9 강남의 경우 걸어서 5분 이내 거리에 봉은사 및 코엑스 등이 있습니다. 이 호텔에서 압구정 로데오거리까지는 2.8km 떨어져 있으며, 3.5km 거리에는 서울 올림픽 경기장도 있습니다.', '피트니스 센터 같은 레크리에이션 시설 외에 무료 무선 인터넷, 콘시어지 서비스 등의 기타 편의 시설/서비스를 이용하실 수 있습니다. 이 호텔에는 기념품점/신문 가판대 및 연회장도 마련되어 있습니다.', '셀프 주차 요금: 1박 기준 KRW 10000', 1),
	('B1234I', 'businessI@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자I', '20221005', 'M', 2, NULL, NULL, '01020221005', '01000', 'pic9.JPG', '서울 강북구 삼양로181길 168 (우이동)', '우이동 303', NULL, NULL, NULL, '2022-10-05 19:07:39', NULL, NULL, '한미장펜션', 1, NULL, '82-64-738-3800', '\'한미장펜션은 일제시대 조선 한복판에 대량으로 세워진 주거로서 출발합니다', '정원 전망을 감상하고 무료 무선 인터넷 등의 편의 시설/서비스를 이용하실 수 있습니다.', '셀프 주차 요금: 1박 기준 KRW 10000', 0),
	('B1234J', 'businessJ@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자J', '20221005', 'M', 2, NULL, NULL, '01020221005', '04053', 'pic10.JPG', '서울 마포구 와우산로29나길 24-3', '서교동 335-36', NULL, NULL, NULL, '2022-10-05 19:09:45', NULL, NULL, '홍대 준 게스트하우스', 1, NULL, '82-64-752-8222', '서울 중심에 자리한 스테이 7 - 호스텔(구 K게스트하우스 명동 3호점)에 머무실 경우 15분 정도 걸으면 청계천 및 덕수궁에 가실 수 있습니다. 이 게스트하우스에서 광화문까지는 2.4km 떨어져 있으며, 3.3km 거리에는 경복궁도 있습니다.', '루프탑 테라스 전망을 감상하고 무료 무선 인터넷 및 콘시어지 서비스 등의 편의 시설/서비스를 이용하실 수 있습니다. 이 게스트하우스에는 이 밖에도 TV(공용 구역) 및 바비큐 그릴도 마련되어 있습니다.', '추가 요금 지불 시 이른 체크인이 가능합니다(객실 상황에 따라 다름, 요금 변동).', 0),
	('B1234K', 'businessK@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자K', '20221005', 'F', 2, NULL, NULL, '01020221005', '55041', 'pic11.JPG', '전북 전주시 완산구 기린대로 85 라한호텔 전주', '풍남동3가 26-5', NULL, NULL, NULL, '2022-10-05 19:09:45', NULL, NULL, '왕의지밀', 1, NULL, '82-64-7957040', '전주에서 강변에 위치한 왕의지밀에 머무실 경우 차로 5분 정도 이동하면 전주한옥마을 및 한벽당에 가실 수 있습니다. 이 호텔에서 동고사까지는 2.2km 떨어져 있으며, 2.4km 거리에는 치명자산 성지도 있습니다.', '정원 전망을 감상하고 무료 무선 인터넷 등의 편의 시설/서비스를 이용하실 수 있습니다.', '현지식 아침 식사 요금: 성인 KRW 10000, 어린이 KRW 5000(대략적인 금액)', 0),
	('B1234L', 'businessL@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자L', '20221005', 'F', 2, NULL, NULL, '01020221005', '55100', 'pic12.JPG', '전라북도 전주시 완산구 전주천서로 81', '전북 전주시 완산구 동서학동 66', NULL, NULL, NULL, '2022-10-05 19:10:30', NULL, NULL, '라한호텔 전주', 1, NULL, '82-64-7271800', '전주 중심에 자리한 라한호텔 전주의 경우 걸어서 5분 이내 거리에 전주전통술박물관 및 전주한옥마을 등이 있습니다. 이 4성급 호텔에서 동락원까지는 0.1km 떨어져 있으며, 0.2km 거리에는 전주 한옥체험장도 있습니다.', '사우나, 피트니스 센터, 시즌별로 운영되는 야외 수영장 등의 다양한 레크리에이션 시설을 즐기실 수 있습니다. 이 호텔에는 무료 무선 인터넷 및 콘시어지 서비스도 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 23000, 어린이 KRW 15000(대략적인 금액)', 0),
	('B1234M', 'businessM@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자M', '20221005', 'M', 2, NULL, NULL, '0507-1353-5356', '55038', 'pic13.JPG', '전북 전주시 완산구 팔달로 171 호텔 꽃심', '경원동1가 102', NULL, NULL, NULL, '2022-10-05 19:10:30', NULL, NULL, '전주관광 호텔 꽃심', 1, NULL, '82-64-799 2600', '전주에 위치한 전주 관광호텔 꽃심에 머무실 경우 15분 정도 걸으면 전주한옥마을 및 전주 풍패지관에 가실 수 있습니다. 이 호텔에서 전동성당까지는 0.5km 떨어져 있으며, 0.6km 거리에는 풍남문도 있습니다.', '이 호텔에서는 지정 흡연 구역 이용이 가능합니다.', '간이 침대 이용 요금: 총 숙박 기간 기준, KRW 40000.0', 0),
	('B1234N', 'businessN@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자N', '20221005', 'F', 2, NULL, NULL, '010-5176-7970', '55044', 'pic14.JPG', '전북 전주시 완산구 은행로 96', '교동 190-10', NULL, NULL, NULL, '2022-10-05 19:10:30', NULL, NULL, '사랑나무 한옥펜션', 1, NULL, '82-64-7958888', '전주에 위치한 전주 고현당펜션에 머무실 경우 5분 정도 걸으면 전주한옥마을 및 전주전통술박물관에 가실 수 있습니다. 이 펜션에서 오목대와 이목대까지는 0.1km 떨어져 있으며, 0.3km 거리에는 동락원도 있습니다.', '이 펜션에서는 지정 흡연 구역 이용이 가능합니다.', '유니코드 지원 false', 0),
	('B1234O', 'businessO@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자O', '20221005', 'M', 2, NULL, NULL, '0507-1401-1963', '55042', 'pic15.JPG', '전북 전주시 완산구 경기전길 57-6', '풍남동3가 87', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '전주한옥마을숙박 다락', 1, NULL, '82-064-7809311', '전주에 위치한 전주한옥마을숙박 다락에 머무실 경우 10분 정도 걸으면 강암 서예관 및 학인당에 가실 수 있습니다. 이 게스트하우스에서 전주한옥마을까지는 2.4km 떨어져 있으며, 0.7km 거리에는 전주 남부시장도 있습니다.', '정원 전망을 감상하고 무료 무선 인터넷 등의 편의 시설/서비스를 이용하실 수 있습니다.', '유아용 침대 이용 불가', 0),
	('B1234P', 'businessP@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자P', '20221005', 'M', 2, NULL, NULL, '01020221005', '48099', 'pic16.JPG', '부산 해운대구 해운대해변로 296', '중동 1411-1', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '파라다이스호텔', 1, NULL, '82-64-7315500', '부산(해운대)에 위치한 파라다이스 호텔 부산의 경우 해운대 해수욕장에서 아주 가까우며 걸어서 5분 거리에는 광안리 해수욕장 등이 있습니다. 이 5성급 호텔에서 신세계 센텀 시티까지는 3.9km 떨어져 있으며, 5.2km 거리에는 송정 해변도 있습니다.', '풀서비스 스파에서 럭셔리한 분위기를 맘껏 즐기실 수 있습니다. 온천 및 헬스클럽 등의 레크리에이션 시설을 즐긴 후 밤에는 카지노에서 그날의 운을 시험해 보면서 하루를 완벽하게 마무리하실 수 있습니다. 이 아르데코 양식 호텔에는 이 밖에도 무료 무선 인터넷, 콘시어지 서비스 및 아케이드/게임룸도 마련되어 있습니다.', '아침 식사 요금: 성인 KRW 58000 ~ KRW 58000, 어린이 KRW 29000 ~ KRW 29000(대략적인 금액)', 0),
	('B1234Q', 'businessQ@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자Q', '20221005', 'M', 2, NULL, NULL, '01020221005', '46083', 'pic17.JPG', '부산 기장군 기장읍 기장해안로 268-32', '시랑리 704-1', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '아난티 힐튼', 1, NULL, '82-02-69009363', '부산에서 골프장 옆에 위치한 아난티 힐튼 부산에 머무실 경우 차로 15분 정도 이동하면 광안리 해수욕장 및 해운대 해수욕장에 가실 수 있습니다. 이 5성급 호텔에서 송정 해변까지는 3.3km 떨어져 있으며, 13.1km 거리에는 신세계 센텀 시티도 있습니다.', '2 개의 야외 수영장에 몸을 담그고 쉬거나 헬스클럽 및 사우나 등의 다른 레크리에이션 시설을 즐기셔도 좋습니다. 이 호텔에는 이 밖에도 무료 무선 인터넷, 콘시어지 서비스 및 기념품점/신문 가판대도 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 48000, 어린이 KRW 24000(대략적인 금액)', 5),
	('B1234R', 'businessR@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자R', '20221005', 'M', 2, NULL, NULL, '01020221005', '47285', 'pic18.JPG', '부산 부산진구 가야대로 772', '부전동 503-15', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '롯데호텔 부산', 1, NULL, '82-64-7466800', '롯데 호텔 부산의 경우 부산 중심에 있으며 차로 8분 거리에는 광안리 해수욕장, 10분 거리에는 이기대 공원 등이 있습니다. 이 5성급 호텔에서 남포동 거리까지는 7.5km 떨어져 있으며, 7.7km 거리에는 국제 시장도 있습니다.', '마사지를 받을 수 있는 풀서비스 스파에서 느긋한 시간을 즐기실 수 있습니다. 밤에 카지노로 향하기 전에 2 개의 스파 욕조에서 긴장을 풀고 완전히 재충전하실 수 있습니다. 이 호텔에는 무료 무선 인터넷, 콘시어지 서비스 및 시설 내 쇼핑 시설도 편의 시설/서비스로 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 39200, 어린이 KRW 24800(대략적인 금액)', 0),
	('B1234S', 'businessS@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자S', '20221005', 'M', 2, NULL, NULL, '01020221005', '48095', 'pic19.JPG', '부산 해운대구 구남로 35-13 바다풍경', '중동 1393-78', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '바다풍경펜션', 1, NULL, '82-64-7450700', '부산(해운대)에 위치한 바다풍경 펜션에 머무실 경우 차로 1분이면 송정 해변에, 6분이면 해운대 해수욕장에 가실 수 있습니다. 이 콘도에서 광안리 해수욕장까지는 9.8km 떨어져 있으며, 5.6km 거리에는 달맞이 고개도 있습니다.', '무료 무선 인터넷 및 바비큐 그릴 등의 편의 시설/서비스를 이용하실 수 있습니다.', '만 3 세 이하 어린이는 부모 또는 보호자와 같은 객실에서 침구를 추가하지 않고 이용할 경우 무료로 숙박할 수 있습니다.', 0),
	('B1234T', 'businessT@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자T', '20221005', 'M', 2, NULL, NULL, '01020221005', '48094', 'pic20.JPG', '부산 해운대구 해운대로594번가길 43', '우동 635-11', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '위게스트하우스', 1, NULL, '82-064-8006001', '부산 중심에 자리한 K-게스트하우스 서면1호점에 머무실 경우 걸어서 4분이면 서면 거리에, 6분이면 서면 메디컬 스트리트에 가실 수 있습니다. 이 게스트하우스에서 광안리 해수욕장까지는 6.7km 떨어져 있으며, 13km 거리에는 해운대 해수욕장도 있습니다.', '무료 무선 인터넷, 콘시어지 서비스, TV(공용 구역) 등의 편의 시설/서비스를 이용하실 수 있습니다.', '공항 셔틀 요금: 차량 1대당 KRW 60000(편도)', 0),
	('B1234U', 'businessU@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자U', '20221005', 'F', 2, NULL, NULL, '01020221005', '34187', 'pic21.JPG', '대전광역시 유성구 계룡로 127', '대전 유성구 봉명동 548-13', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '대전라마다호텔', 1, NULL, '82-64-7661000', '대전에 위치한 호텔 인터불고 엑스코의 경우 걸어서 10분 이내 거리에 엑스코 및 대전종합유통단지 등이 있습니다. 이 4.5성급 호텔에서 국채보상운동기념공원까지는 5.1km 떨어져 있으며, 6.5km 거리에는 달성공원도 있습니다.', '마사지를 받을 수 있는 스파에서 럭셔리한 분위기를 맘껏 즐기실 수 있습니다. 사우나 및 피트니스 센터 등의 레크리에이션 시설에 확실히 만족하실 것입니다. 이 호텔에는 이 밖에도 무료 무선 인터넷, 콘시어지 서비스 및 웨딩 서비스도 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 33000, 어린이 KRW 16500(대략적인 금액)', 0),
	('B1234V', 'businessV@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자V', '20221005', 'F', 2, NULL, NULL, '01020221005', '35233', 'pic22.JPG', '대전광역시 서구 둔산로51번길 42', '대전 서구 둔산동 1356', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '레지던스호텔라미아', 1, NULL, '82-64-7415000', '대전 중심에 자리한 엘디스 레지던스 호텔라미아에 머무실 경우 15분 정도 걸으면 천주교대구대교구 주교좌계산대성당 및 서문시장에 가실 수 있습니다. 이 호텔에서 달성공원까지는 1.6km 떨어져 있으며, 1.9km 거리에는 국채보상운동기념공원도 있습니다.', '피트니스 센터 같은 레크리에이션 시설을 이용하거나 루프탑 테라스에서 전망을 즐기실 수 있습니다. 이 호텔에는 무료 무선 인터넷 및 콘시어지 서비스도 마련되어 있습니다.', '뷔페 아침 식사 요금: 1인당 약 KRW 11000', 0),
	('B1234W', 'businessW@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자W', '20221005', 'M', 2, NULL, NULL, '01020221005', '34839', 'pic23.JPG', '대전광역시 중구 대종로505번길 50', '대전 중구 선화동 230-6', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '베니키아호텔대림', 1, NULL, '82-64-7428848', '대전(중구)에 위치한 베니키아 호텔대림에 숙박하실 경우 차로 10분 정도 이동하면 천주교대구대교구 주교좌계산대성당에 가실 수 있습니다. 이 4.5성급 호텔에서 동촌 공원까지는 3.3km 떨어져 있으며, 3.4km 거리에는 국채보상운동기념공원도 있습니다.', '실내 수영장, 사우나, 24시간 피트니스 센터 등의 레크리에이션 시설을 즐기실 수 있습니다. 이 호텔에는 이 밖에도 무료 무선 인터넷, 콘시어지 서비스 및 웨딩 서비스도 마련되어 있습니다.', '뷔페 아침 식사 요금: 성인 KRW 43000, 어린이 KRW 21500(대략적인 금액)', 5),
	('B1234X', 'businessX@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자X', '20221005', 'M', 2, NULL, NULL, '01020221005', '34917', 'pic24.JPG', '대전광역시 중구 대흥로111번길 35', '대전 중구 대흥동 452-30', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '힐하우스펜션', 1, NULL, '82-064-802 3500', '대전에 위치한 힐하우스 펜션의 경우 차로 15분 이내 거리에 시민운동장 및 Dongnak Park 등이 있습니다. 이 펜션에서 선산컨트리클럽까지는 15.6km 떨어져 있으며, 16.9km 거리에는 천생산도 있습니다.', '이 펜션에서는 지정 흡연 구역 이용이 가능합니다.', '늦은 체크인 요금', 3.2),
	('B1234Y', 'businessY@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자Y', '20221005', 'M', 2, NULL, NULL, '01020221005', '34626', 'pic25.JPG', '대전 동구 역전2길 6', '정동 14-24', NULL, NULL, NULL, '2022-10-05 19:13:27', NULL, NULL, '문화게스트하우스', 1, NULL, '82-64-7326500', '대구 중심에 자리한 캐주얼하우스 소노 게스트하우스 - 호스텔에 머무실 경우 차로 5분 정도 이동하면 김광석다시그리기길 및 천주교대구대교구 주교좌계산대성당에 가실 수 있습니다. 이 호스텔에서 엑스코까지는 6.7km 떨어져 있으며, 1.8km 거리에는 국채보상운동기념공원도 있습니다.', '무료 무선 인터넷, TV(공용 구역), 자판기 등의 편의 시설/서비스를 이용하실 수 있습니다.', '숙박 시설에서 현재 강화된 청소 조치 시행 중', 0),
	('B2345A', 'tbusinessA@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_a', '19900101', 'M', 2, NULL, NULL, '01012151215', '05551', 'pic26.JPG', '서울특별시 송파구 올림픽로 300', '서울특별시 송파구 신천동 29', NULL, NULL, NULL, '2022-10-06 12:00:07', NULL, NULL, '레인보우 티켓', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345B', 'tbusinessB@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_b', '19910105', 'M', 2, NULL, NULL, '01023452525', '04533', 'pic27.JPG', '부산광역시 해운대구 송정해변로 48 2층', '부산광역시 해운대구 송정동 711-7 2층', NULL, NULL, NULL, '2022-10-06 12:05:07', NULL, NULL, '송정하와이', 1, NULL, NULL, '부산 송정의 서핑맛집 써피써피 입니다.\r\n안녕하세요,\r\n저희 써피써피 서핑샵은 무엇보다도\r\n고객님들의 편안함과 즐거움\r\n그리고 추억을 남겨드리도록 노력하겠습니다.\r\n\r\n\'surfy\' 라는 단어는\r\n\'밀려드는 파도가 많은\',\r\n\'밀려드는 파도의\' 라는 뜻으로\r\n항상 좋은 파도가 밀려들어와\r\n즐거운 서핑 라이프를 즐기시도록 하고자\r\n\'SURFY SURFY\' 라는 이름을 지었습니다.\r\n\r\n서퍼가 아니시더라도\r\n바다를 사랑하는 모든 분들이\r\n편하게 오셔서 쉬고, 즐기고\r\n아름다운 추억을 담아가셨으면 좋겠습니다.', '카페, 렌탈샵, 탈의실, 샤워실 등 구비', NULL, 5),
	('B2345C', 'tbusinessC@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_c', '19920104', 'M', 2, NULL, NULL, '01050505525', '04566', 'pic28.JPG', '서울특별시 중구 을지로 281', '서울특별시 중구 을지로7가 143', NULL, NULL, NULL, '2022-10-06 12:05:54', NULL, NULL, '서울랜드', 1, NULL, NULL, NULL, NULL, NULL, 4),
	('B2345D', 'tbusinessD@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_d', '19930130', 'F', 2, NULL, NULL, '01022293939', '04340', 'pic29.JPG', '서울특별시 용산구 남산공원길 105', '서울특별시 용산구 용산동2가 산1-3', NULL, NULL, NULL, '2022-10-06 12:06:39', NULL, NULL, '동대문티켓', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345E', 'tbusinessE@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_e', '19920305', 'M', 2, NULL, NULL, '01033394342', '06164', 'pic30.JPG', '서울특별시 강남구 영동대로 513', '서울특별시 강남구 삼성동 159', NULL, NULL, NULL, '2022-10-06 12:07:15', NULL, NULL, '아쿠아리움 티켓', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345F', 'tbusinessF@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_f', '19930330', 'F', 2, NULL, NULL, '01033930222', '63543', 'pic31.JPG', '제주특별자치도 서귀포시 대포로 172-5', '제주 서귀포시 대포동 2184-10', NULL, NULL, NULL, '2022-10-06 12:07:38', NULL, NULL, '제트제주', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345G', 'tbusinessG@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_g', '19930202', 'F', 2, NULL, NULL, '01011252525', '63242', 'pic32.JPG', '제주시 선돌목동길 56-26', '제주특별자치도 제주시 오등동 10-1', NULL, NULL, NULL, '2022-10-06 12:09:16', NULL, NULL, '제주난타', 1, NULL, NULL, NULL, NULL, NULL, 3),
	('B2345H', 'tbusinessH@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_h', '19950331', 'F', 2, NULL, NULL, '01002303033', '63629', 'pic33.JPG', '서귀포시 표선면 민속해안로 631-34', '제주특별자치도 서귀포시 표선면 표선리 40-1', NULL, NULL, NULL, '2022-10-06 12:10:01', NULL, NULL, '민속촌투어', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345I', 'tbusinessI@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_i', '19990303', 'M', 2, NULL, NULL, '01055525654', '63113', 'pic34.JPG', '제주특별자치도 제주시 도두항서길 41', '제주특별자치도 제주시 도두일동 2614', NULL, NULL, NULL, '2022-10-06 12:10:30', NULL, NULL, '제주레저', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345J', 'tbusinessJ@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_j', '19991101', 'F', 2, NULL, NULL, '01033033955', '63629', 'pic35.JPG', '서귀포시 표선면 민속해안로 631-34', '제주특별자치도 서귀포시 표선면 표선리 40-1', NULL, NULL, NULL, '2022-10-06 12:11:16', NULL, NULL, '제주놀자', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345K', 'tbusinessK@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_k', '19930803', 'M', 2, NULL, NULL, '01025525151', '55039', 'pic36.JPG', '전북 전주시 덕진구 동부대로 420', '우아동1가 944-1', NULL, NULL, NULL, '2022-10-06 12:11:58', NULL, NULL, '전북투어', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345L', 'tbusinessL@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_l', '19930302', 'M', 2, NULL, NULL, '01055264521', '55042', 'pic37.JPG', '전북 전주시 완산구 은행로 54-1', '전라북도 전주시 완산구 풍남동3가 72-7', NULL, NULL, NULL, '2022-10-06 12:16:49', NULL, NULL, '전주한복', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345M', 'tbusinessM@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_m', '19970303', 'F', 2, NULL, NULL, '01015192525', '55045', 'pic38.JPG', '전라북도 전주시 완산구 향교길 104', '전라북도 전주시 완산구 교동 141-1', NULL, NULL, NULL, '2022-10-06 12:17:39', NULL, NULL, '전주 아트', 0, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345N', 'tbusinessN@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_n', '19900303', 'F', 2, NULL, NULL, '01051521515', '54848', 'pic39.JPG', '전북 전주시 덕진구 덕용2길 7', '전라북도 전주시 덕진구 여의동2가 708-3', NULL, NULL, NULL, '2022-10-06 12:18:22', NULL, NULL, '으뜸한옥', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345O', 'tbusinessO@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_o', '19950420', 'F', 2, NULL, NULL, '01005555258', '55044', 'pic40.JPG', '전라북도 전주시 완산구 태조로 25-9', '전라북도 전주시 완산구 교동 80-9', NULL, NULL, NULL, '2022-10-06 12:19:02', NULL, NULL, '전주 티켓', 0, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345P', 'tbusinessP@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_p', '19910220', 'F', 2, NULL, NULL, '01003394324', '48950', 'pic41.JPG', '부산광역시 중구 용두산길 37-55', '부산광역시 중구 광복동2가 1-2', NULL, NULL, NULL, '2022-10-06 12:19:34', NULL, NULL, '광복요트', 0, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345Q', 'tbusinessQ@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_q', '19930303', 'F', 2, NULL, NULL, '01033020392', '48099', 'pic42.JPG', '부산광역시 해운대구 달맞이길 30', '부산광역시 해운대구 중동 1829', NULL, NULL, NULL, '2022-10-06 12:20:12', NULL, NULL, '해운대투어', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345R', 'tbusinessR@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_r', '19940303', 'F', 2, NULL, NULL, '01033939220', '48090', 'pic43.JPG', '부산광역시 해운대구 해운대해변로 84', '부산광역시 해운대구 우동 1393', NULL, NULL, NULL, '2022-10-06 12:20:51', NULL, NULL, '해운대 티켓', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345S', 'tbusinessS@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_s', '19990202', 'F', 2, NULL, NULL, '01099300022', '48099', 'pic44.JPG', '부산광역시 해운대구 해운대해변로 292', '부산광역시 해운대구 중동 1405-16', NULL, NULL, NULL, '2022-10-06 12:21:44', NULL, NULL, '롯데월드', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345T', 'tbusinessT@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_t', '19900110', 'M', 2, NULL, NULL, '01000300239', '48515', 'pic45.JPG', '부산광역시 남구 분포로 145 W스퀘어 B102호', '부산광역시 남구 용호동 954', NULL, NULL, NULL, '2022-10-06 12:22:15', NULL, NULL, '용호요트', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345U', 'tbusinessU@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_u', '19930530', 'M', 2, NULL, NULL, '01003002034', '34551', 'pic46.JPG', '대전 동구 동서대로1695번길 30', '대전광역시 동구 용전동 68-2', NULL, NULL, NULL, '2022-10-06 12:22:46', NULL, NULL, '하이티켓', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345V', 'tbusinessV@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_v', '19900529', 'M', 2, NULL, NULL, '01000300293', '34126', 'pic47.JPG', '대전광역시 유성구 엑스포로 1', '대전광역시 유성구 도룡동 3-1', NULL, NULL, NULL, '2022-10-06 12:23:21', NULL, NULL, '도룡아트', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345W', 'tbusinessW@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_w', '19830223', 'M', 2, NULL, NULL, '01040329443', '34923', 'pic48.JPG', '대전 중구 대종로480번길 56', '대전광역시 중구 은행동 66-1', NULL, NULL, NULL, '2022-10-06 12:23:53', NULL, NULL, '은행동놀자', 1, NULL, NULL, NULL, NULL, NULL, NULL),
	('B2345X', 'tbuinessX@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_x', '19880303', 'M', 2, NULL, NULL, '01004038283', '35312', 'pic49.JPG', '대전광역시 유성구 엑스포로 1 6F, 7F', '대전광역시 유성구 엑스포로 1 6F, 7F', NULL, NULL, NULL, '2022-10-06 12:24:35', NULL, NULL, '스포츠 몬스터', 1, NULL, NULL, '대한민국 최초, 스포츠와 익스트림 게임을 즐길 수 있는 세상에 없던 스포테인먼트 테마파크를 선보입니다.\r\n스포츠몬스터는 스포츠를 넘어선 새로운 놀이 문화 공간으로써 지금까지 느끼지 못했던 색다른 즐거움이 있는 곳 입니다. 구기스포츠를 포함하여 클라이밍, 점핑 트램폴린, VR체험 등 운동을 싫어해도 재미있는 놀거리가 가득합니다.', '짚코스터, 파라볼릭 슬라이드, 로프코스 등', NULL, NULL),
	('B2345Y', 'tbusinessY@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '사업자t_y', '19800505', 'M', 2, NULL, NULL, '01003392939', '35073', 'pic50.JPG', '경기 용인시 처인구 포곡읍 에버랜드로 199', '전대리 310', NULL, NULL, NULL, '2022-10-06 12:25:09', NULL, NULL, '에버랜드', 1, NULL, NULL, '영원과 활력을 의미하는 ‘EVER’와 자연과 포근함을 상징하는 ‘LAND’를 결합한 이름의 에버랜드 리조트는 1976년', '축제, 어트랙션, 엔터테인먼트, 동물원, 식물원, 워터 어트랙션, 스파 및 뷰티존, 빌리지 등', NULL, NULL),
	('U1234A', 'userA@naver.com', '$2a$10$IRbz4xf.YGuUuDvhkjItKOcEwx48.ONXxqyBZmdEhbC6vAGrEv0va', '가순민', '19960717', 'F', 1, NULL, 14824, '01062484159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:02:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('U1234B', 'userB@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '김수빈', '19930102', 'F', 1, NULL, 64430, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:02:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('U1234C', 'userC@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '이정규', '19910630', 'M', 1, NULL, 16075, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:03:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('U1234D', 'userD@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '이상연', '19890220', 'M', 1, NULL, 1100, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:04:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('U1234E', 'userE@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '손흥민', '19991213', 'M', 1, NULL, 89246, '01020221005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-05 19:05:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 usertbl_db.userdelete 구조 내보내기
DROP TABLE IF EXISTS `userdelete`;
CREATE TABLE IF NOT EXISTS `userdelete` (
  `deleteUserNO` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `userId` varchar(35) NOT NULL,
  `userPwd` varchar(100) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `userBirth` varchar(15) DEFAULT NULL,
  `userGender` varchar(10) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `userLevel` int(11) DEFAULT NULL,
  `userPoint` int(11) DEFAULT 0,
  `userPhoneNumber` varchar(20) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `roadAddress` varchar(100) DEFAULT NULL,
  `jibunAddress` varchar(100) DEFAULT NULL,
  `extraAddress` varchar(45) DEFAULT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `pwdFindA` varchar(100) DEFAULT NULL,
  `businessNumber` varchar(15) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `joinDate` timestamp NULL DEFAULT NULL,
  `deletedDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`deleteUserNO`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 usertbl_db.userdelete:~5 rows (대략적) 내보내기
DELETE FROM `userdelete`;
/*!40000 ALTER TABLE `userdelete` DISABLE KEYS */;
INSERT INTO `userdelete` (`deleteUserNO`, `uid`, `userId`, `userPwd`, `userName`, `userBirth`, `userGender`, `userType`, `userLevel`, `userPoint`, `userPhoneNumber`, `zipcode`, `roadAddress`, `jibunAddress`, `extraAddress`, `companyName`, `pwdFindA`, `businessNumber`, `salt`, `joinDate`, `deletedDate`) VALUES
	(4, 'S4uVWX', 'ksb4150@naver.com', '$2a$10$2S6cQF9IdvF7Oht8nCDel.PoclmHNmvDoatLeMdbxPTWMLeFSUUnO', '김빈', '19990511', 'F', 2, NULL, 0, '01062484159', '41055', '대구 동구 대구외곽순환고속도로 38', '', '', '가순민 컴퍼니', NULL, '0000000', NULL, '2022-10-22 00:00:00', '2022-10-22 15:03:15'),
	(5, 'mxiGNR', 'dub3344@naver.com', '$2a$10$AYQfughs.wNsHAHirGKZVejdQQG2GHiSqjb2jg6ag4SnqrM1hYrme', '가민', '19990511', 'F', 2, NULL, 0, '01062484159', '35230', '대전 서구 갈마역로 6', '대전 서구 둔산동 1122', '', '', NULL, '00000000', NULL, '2022-10-22 00:00:00', '2022-10-22 15:03:16'),
	(6, '0YVkQV', 'businessZ@naver.com', '$2a$10$gBqd5zh/bFszW/Ps4AYyIOA2oa9v3vv23Oymhpc7ydMQKhS3hye/m', '김빈', '19990511', 'F', 2, NULL, 0, '01062484159', '35340', '대전 서구 계백로 1353', '대전 서구 도마동 312-198', '', '가순민', NULL, '11111111', NULL, '2022-10-24 00:00:00', '2022-10-24 16:29:35'),
	(7, 'L4dekA', 'businessZ@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '등록 테스트', '19990511', 'F', 2, NULL, 0, '01062484159', '35230', '대전 서구 갈마역로 10', '대전 서구 둔산동 1097', 'ㅁㄴㅇㄹ', '가순민', NULL, '1111111111', NULL, '2022-10-24 00:00:00', '2022-10-24 18:59:57'),
	(8, 'UFfluH', 'userAAA@naver.com', '$2a$10$6jhepRT15pIcRv2btkm14uqdoSB.zKNd8rz4bL/ziHiALW3pNBYg2', '김수빈', '19960717', 'F', 2, NULL, 0, '01096599601', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-07 00:00:00', '2022-11-01 15:32:22');
/*!40000 ALTER TABLE `userdelete` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
