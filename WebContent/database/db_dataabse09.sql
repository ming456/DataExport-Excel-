/*
 Navicat Premium Data Transfer

 Source Server         : Medicine
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : db_dataabse09

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 26/11/2018 10:39:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_kucun
-- ----------------------------
DROP TABLE IF EXISTS `tb_kucun`;
CREATE TABLE `tb_kucun`  (
  `id` int(11) NOT NULL,
  `spname` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dj` float(255, 0) NULL DEFAULT NULL,
  `kcsl` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`spname`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_kucun
-- ----------------------------
INSERT INTO `tb_kucun` VALUES (1, '奥术大师', '大萨达撒多', '阿斯顿撒多撒多', '萨德', 34, 2312);
INSERT INTO `tb_kucun` VALUES (2, '奥术大师佛挡杀佛', '奥术大师多', '阿达', '大萨达', 44, 445);
INSERT INTO `tb_kucun` VALUES (3, '木吉他', '中国大陆 ', 'PD-445', '把', 55, 778);
INSERT INTO `tb_kucun` VALUES (4, '电吉他', '中国大陆 ', 'PD-030    ', '把         ', 4, 1213);
INSERT INTO `tb_kucun` VALUES (5, '阿萨大师', '萨德撒多', '萨达', '撒大声地', 23, 323);
INSERT INTO `tb_kucun` VALUES (6, '阿达', '奥术大师', '大萨达', '萨德', 44, 444);

-- ----------------------------
-- Table structure for tb_wage
-- ----------------------------
DROP TABLE IF EXISTS `tb_wage`;
CREATE TABLE `tb_wage`  (
  `id` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wageDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `award` float(255, 0) NULL DEFAULT NULL,
  `basicPay` float(255, 0) NULL DEFAULT NULL,
  `allowance` float(255, 0) NULL DEFAULT NULL,
  `fare` float(255, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_wage
-- ----------------------------
INSERT INTO `tb_wage` VALUES (1, 'wgh', '2018-09', 300, 1800, 50, 100);
INSERT INTO `tb_wage` VALUES (2, '无语', '2007-10', 300, 1896, 20, 200);

SET FOREIGN_KEY_CHECKS = 1;
