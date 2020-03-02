-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.4.8-MariaDB - mariadb.org binary distribution
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for my_shop
DROP DATABASE IF EXISTS `my_shop`;
CREATE DATABASE IF NOT EXISTS `my_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `my_shop`;

-- Dumping structure for table my_shop.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nam` varchar(100) DEFAULT NULL,
  `dat` date DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `des` varchar(200) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `pri` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table my_shop.item: ~6 rows (大约)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `nam`, `dat`, `img`, `des`, `typ`, `pri`) VALUES
	(4, 'cayin CS-30TCR凯音播放器专用Type-c转同轴连接线 无损高速', '2020-03-01', '01.jpg', '1-1.jpg;1-2.jpg;1-3.jpg;1-4.jpg', '数码', 398),
	(5, '磁悬浮七彩灯无线蓝牙音箱便携迷你小音响手机电脑音响创意低音炮', '2020-03-01', '02.jpg', '2-1.jpg;2-2.jpg;2-3.jpg;2-4.jpg', '数码', 388),
	(6, '现货当天发honor/荣耀 荣耀Play3华为畅玩7蓝白黑红荣耀20i全网通', '2020-03-01', '03.jpg', '3-1.jpg;3-2.jpg;3-3.jpg;3-4.jpg', '手机', 1088),
	(7, '正品Huawei/华为 畅享8 全网通4G智能学生手机全面屏大屏幕手机', '2020-03-01', '04.jpg', '4-1.jpg;4-2.jpg;4-3.jpg;4-4.jpg', '手机', 880),
	(8, 'Joyoung/九阳 JYL-C051料理机多功能家用小型电动果汁奶昔搅拌机', '2020-03-01', '05.jpg', '5-1.jpg;5-2.jpg;5-3.jpg;5-4.jpg', '家电', 72),
	(9, 'Tonze/天际 DDG-30AZ电炖锅砂锅电炖盅煮粥煲汤养生紫砂陶瓷3L', '2020-03-01', '06.jpg', '6-1.jpg;6-2.jpg;6-3.jpg;6-4.jpg', '家电', 79);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Dumping structure for table my_shop.orde
DROP TABLE IF EXISTS `orde`;
CREATE TABLE IF NOT EXISTS `orde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fin` int(11) DEFAULT NULL,
  `dat` datetime DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table my_shop.orde: ~4 rows (大约)
/*!40000 ALTER TABLE `orde` DISABLE KEYS */;
INSERT INTO `orde` (`id`, `fin`, `dat`, `cost`) VALUES
	(1, 1, '2020-03-02 13:08:58', 8171),
	(2, 1, '2020-03-01 23:40:29', 3652),
	(3, 1, '2020-03-02 13:14:28', 72),
	(4, 1, '2020-03-02 16:11:21', 477),
	(5, 1, '2020-03-02 16:41:50', 1167),
	(6, 1, '2020-03-02 16:46:35', 467),
	(7, 1, '2020-03-02 16:48:50', 470),
	(8, 0, NULL, 0);
/*!40000 ALTER TABLE `orde` ENABLE KEYS */;

-- Dumping structure for table my_shop.order_item
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `orderid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table my_shop.order_item: ~9 rows (大约)
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` (`orderid`, `itemid`, `num`) VALUES
	(1, 4, 4),
	(1, 7, 2),
	(1, 9, 1),
	(2, 5, 1),
	(2, 6, 3),
	(1, 6, 4),
	(0, 6, 1),
	(1, 5, 1),
	(3, 8, 1),
	(4, 9, 1),
	(4, 4, 1),
	(5, 6, 1),
	(5, 9, 1),
	(6, 5, 1),
	(6, 9, 1),
	(7, 4, 1),
	(7, 8, 1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;

-- Dumping structure for table my_shop.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table my_shop.user: ~1 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `money`, `address`, `phone`) VALUES
	(1, 'alex', '123', 923, '某省市', '000-000'),
	(2, 'alex2', '123', 623, 'China', '000'),
	(3, 'alex3', '123', 630, 'addr', '555');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table my_shop.user_order
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE IF NOT EXISTS `user_order` (
  `userid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table my_shop.user_order: ~4 rows (大约)
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
INSERT INTO `user_order` (`userid`, `orderid`) VALUES
	(1, 1),
	(1, 2),
	(1, 1),
	(1, 3),
	(2, 4),
	(1, 5),
	(1, 6),
	(3, 7);
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
