/*
 Navicat Premium Data Transfer

 Source Server         : marlabs
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : InsuranceMgmt

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 03/08/2020 06:49:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `profileid` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `DOB` int DEFAULT NULL,
  `registeration` int DEFAULT NULL,
  `assignedAgent` varchar(255) DEFAULT NULL,
  `valid` int DEFAULT NULL,
  PRIMARY KEY (`profileid`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO `login` VALUES ('admin', 'admin', 'admin', 1001, 'Amy', 'Smith', 'Female', 'amy.smith@gmail.com', 'usa', 'ny', 'albany', NULL, NULL, NULL, 1);
INSERT INTO `login` VALUES ('agent', 'agentBob', 'agentBob', 1002, 'Bob', 'Smith', 'Male', 'bob.smith@gmail.com', 'usa', 'ny', 'troy', NULL, NULL, NULL, 0);
INSERT INTO `login` VALUES ('agent', 'agentCarrie', 'agentCarrie', 1003, 'Carrie', 'Smith', 'Female', 'carrie.smith@gmail.com', 'usa', 'ny', 'buffalo', NULL, NULL, NULL, 1);
INSERT INTO `login` VALUES ('client', 'Daisy', 'Daisy', 1004, 'Daisy', 'Jones', 'Female', 'daisy.jones@gmail.com', 'usa', 'ca', 'san francisco', 6061966, 8012020, '1002', 0);
INSERT INTO `login` VALUES ('client', 'Emma', 'Emma', 1005, 'Emma', 'Johnson', 'Female', 'emma.johnson@gmail.com', 'usa', 'GA', 'Atlanta', 9091999, NULL, '1002', 0);
INSERT INTO `login` VALUES ('agent', 'agentFarrah', 'agentFarrah', 1014, 'Farrah', 'Miller', 'female', 'farrah.miller@gmail.com', 'usa', 'ca', 'San Jones', 9091990, NULL, '0000', 0);
COMMIT;

-- ----------------------------
-- Table structure for policy
-- ----------------------------
DROP TABLE IF EXISTS `policy`;
CREATE TABLE `policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` int DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '365',
  `yearintereste` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of policy
-- ----------------------------
BEGIN;
INSERT INTO `policy` VALUES (1, 'health', 'student health insurance', 1000, 365, 1);
INSERT INTO `policy` VALUES (2, 'car', 'suv insurance', 2000, 365, 2);
INSERT INTO `policy` VALUES (3, 'homeowner', 'apartment homeowner insurance', 100, 365, 3);
INSERT INTO `policy` VALUES (13, 'health', 'Senior Health Insurance', 4000, 180, 1);
COMMIT;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `txID` int NOT NULL AUTO_INCREMENT,
  `clientID` int DEFAULT NULL,
  `insuranceID` int DEFAULT NULL,
  PRIMARY KEY (`txID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of transaction
-- ----------------------------
BEGIN;
INSERT INTO `transaction` VALUES (1, 1005, 1);
INSERT INTO `transaction` VALUES (2, 1005, 2);
INSERT INTO `transaction` VALUES (3, 1004, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
