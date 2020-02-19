/*
Navicat MySQL Data Transfer

Source Server         : mybase
Source Server Version : 80003
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 80003
File Encoding         : 65001

Date: 2020-02-19 15:35:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '小白', '白先生', '3964283', '78485696');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `orderNum` (`orderNum`) USING BTREE,
  KEY `productId` (`productId`) USING BTREE,
  KEY `memberId` (`memberId`) USING BTREE,
  CONSTRAINT `memberId` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '5', '2019-11-27 17:37:39', '6', '很好', '1', '1', '1', '1');
INSERT INTO `orders` VALUES ('2', '6', '2019-11-27 21:33:31', '6', 'h', '0', '1', '7', '1');
INSERT INTO `orders` VALUES ('3', '10', '2019-11-27 21:34:13', '5', 'ff', '1', '1', '8', '1');
INSERT INTO `orders` VALUES ('4', '2', '2019-11-27 21:35:13', '10', 'kk', '1', '2', '10', '1');
INSERT INTO `orders` VALUES ('5', '4', '2019-11-27 21:38:29', '30', 'ff', '1', '2', '8', '1');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` int(32) NOT NULL,
  `travellerId` int(32) NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`) USING BTREE,
  KEY `travellerId` (`travellerId`) USING BTREE,
  CONSTRAINT `orderIdone` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `travellerId` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('1', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'admin', '/user/findAll.do');
INSERT INTO `permission` VALUES ('2', 'admins', '/user/findById.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` int(11) DEFAULT NULL,
  `productDesc` varchar(50) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `product` (`id`,`productNum`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '800', '名称1', '广州', '2019-11-27 17:00:15', '600', '很好', '3');
INSERT INTO `product` VALUES ('7', 'item1', '冰岛10日游', '西安', '2019-11-27 17:21:00', '18888', '将会是一次很好的人生体验', '1');
INSERT INTO `product` VALUES ('8', 'item2', '冰岛10日游', '西安', '2019-11-27 21:21:00', '18888', '顶顶顶顶', '1');
INSERT INTO `product` VALUES ('9', 'item3', '冰岛10日游', '西安', '2019-11-27 21:22:00', '18888', ' 哈哈哈哈', '0');
INSERT INTO `product` VALUES ('10', 'item4', '冰岛10日游', '西安', '2019-11-27 21:22:00', '18888', 'sss', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'USER', '高');
INSERT INTO `role` VALUES ('2', 'ADMIN', '高高');
INSERT INTO `role` VALUES ('4', 'MANAGE', '主管');
INSERT INTO `role` VALUES ('5', 'GAGA', '职员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('1', '5');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('199', '2019-12-08 12:17:34', 'admin', '0:0:0:0:0:0:0:1', '/userfindAll.do', '22', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('200', '2019-12-08 12:17:37', 'admin', '0:0:0:0:0:0:0:1', '/ordersfindAll.do', '46', '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('201', '2019-12-08 12:17:41', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '39', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('202', '2019-12-08 14:25:41', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '49', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('203', '2019-12-08 14:28:06', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '27', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('204', '2019-12-08 14:28:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '13', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('205', '2019-12-08 14:28:32', 'admin', '0:0:0:0:0:0:0:1', '/userfindAll.do', '43', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('206', '2019-12-08 14:28:37', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '39', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('207', '2019-12-08 14:32:28', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '41', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('208', '2019-12-08 15:13:20', 'admin', '0:0:0:0:0:0:0:1', '/userfindAll.do', '51', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('209', '2020-02-11 19:41:00', 'admin', '0:0:0:0:0:0:0:1', '/userfindAll.do', '37', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('210', '2020-02-11 19:41:05', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '32', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('1', '晓晓', '女', '56265686', '1', '20', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'java', '78487249026', '$2a$2a$10$uj680NXjZz27X/oHHvGq7eg9RGdDTKiF1OxNUaI8doMSvoIsDc/.m', '1536987521', '1');
INSERT INTO `users` VALUES ('2', 'adminjhj', '78457565632', '$2a$10$PtIr07As4ancV2noMw/m5eSB078UyAtDUduki4MrQW.dve.DxlB7S', '1895235562', '1');
INSERT INTO `users` VALUES ('9', 'admin', '784872490@qq.com', '$2a$10$wbd6hH.iF7QMvyqUnZRU2.3YYQYafQbloEqr/wC.7pBGn3rpBg7R.', '18392025839', '1');
INSERT INTO `users` VALUES ('15', 'hahha', '784872490@qq.com2', '$2a$10$NSQrLj6H1.RSJv7XHcyjIeV212KaEzfulVVAbGIWIqS1NrfbyUMf.', '18392025839', '1');
INSERT INTO `users` VALUES ('16', 'dingge', '78487s2490@qq.com', '$2a$10$qO98x8HLAT94D6Nvo0TYtOeJe31sPY.9Mtzo5yiVvkJjXatcL0ZiK', '18392025839', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('9', '1');
INSERT INTO `users_role` VALUES ('15', '1');
INSERT INTO `users_role` VALUES ('16', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('2', '2');
INSERT INTO `users_role` VALUES ('9', '2');
INSERT INTO `users_role` VALUES ('15', '4');
