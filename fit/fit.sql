/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : fit

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 27/06/2019 11:27:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act
-- ----------------------------
DROP TABLE IF EXISTS `act`;
CREATE TABLE `act`  (
  `act_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `act_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动作描述',
  `act_grade` int(11) NULL DEFAULT NULL COMMENT '动作等级',
  `act_facility` int(11) NULL DEFAULT NULL COMMENT '使用器械，关联到器械表\r\n',
  `act_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动作示例图片',
  PRIMARY KEY (`act_id`) USING BTREE,
  INDEX `act_facility`(`act_facility`) USING BTREE,
  INDEX `act_class`(`act_grade`) USING BTREE,
  CONSTRAINT `act_ibfk_1` FOREIGN KEY (`act_facility`) REFERENCES `facility` (`facility_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ibfk_2` FOREIGN KEY (`act_grade`) REFERENCES `grade` (`grade_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act
-- ----------------------------
INSERT INTO `act` VALUES (1, '仰卧起坐', NULL, 1, 1, 'act2.jpg');
INSERT INTO `act` VALUES (2, '俯卧撑', NULL, 2, 2, 'act1.jpg');
INSERT INTO `act` VALUES (3, 'HIT', NULL, 3, 3, 'act2.jpg');
INSERT INTO `act` VALUES (4, '跪姿俯卧撑', NULL, 1, 1, 'act1.PNG');
INSERT INTO `act` VALUES (5, '弓步转体抬臂', NULL, 2, 2, 'act2.PNG');
INSERT INTO `act` VALUES (6, '坐姿收腿', NULL, 3, 3, 'act3.PNG');
INSERT INTO `act` VALUES (7, '波比', NULL, 1, 1, 'act4.PNG');
INSERT INTO `act` VALUES (8, '胸部拉伸', NULL, 2, 2, 'act5.PNG');
INSERT INTO `act` VALUES (9, '扩胸运动', NULL, 3, 3, 'act6.PNG');
INSERT INTO `act` VALUES (10, '腹部拉伸', NULL, 1, 1, 'act7.PNG');
INSERT INTO `act` VALUES (11, '背部拉伸', NULL, 2, 2, 'act8.PNG');
INSERT INTO `act` VALUES (12, '过顶交替收腿', NULL, 3, 3, 'act9.PNG');
INSERT INTO `act` VALUES (13, '俯卧背伸', NULL, 1, 1, 'act10.PNG');
INSERT INTO `act` VALUES (14, '四足伸展', NULL, 2, 2, 'act11.PNG');
INSERT INTO `act` VALUES (15, '四足游泳', NULL, 3, 3, 'act12.PNG');
INSERT INTO `act` VALUES (16, '反向卷腹', NULL, 1, 1, 'act13.PNG');
INSERT INTO `act` VALUES (17, '仰卧两头起', NULL, 2, 2, 'act14.PNG');
INSERT INTO `act` VALUES (18, '直臂平板支撑', NULL, 3, 3, 'act15.PNG');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_psw` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_power` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '12345678', '123456', 1);

-- ----------------------------
-- Table structure for am
-- ----------------------------
DROP TABLE IF EXISTS `am`;
CREATE TABLE `am`  (
  `a_act` int(11) NULL DEFAULT NULL,
  `a_muscle` int(11) NULL DEFAULT NULL,
  INDEX `a_act`(`a_act`) USING BTREE,
  INDEX `a_muscle`(`a_muscle`) USING BTREE,
  CONSTRAINT `am_ibfk_1` FOREIGN KEY (`a_act`) REFERENCES `act` (`act_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `am_ibfk_2` FOREIGN KEY (`a_muscle`) REFERENCES `muscle` (`muscle_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of am
-- ----------------------------
INSERT INTO `am` VALUES (1, 1);
INSERT INTO `am` VALUES (4, 4);
INSERT INTO `am` VALUES (3, 3);
INSERT INTO `am` VALUES (2, 2);
INSERT INTO `am` VALUES (5, 5);
INSERT INTO `am` VALUES (6, 6);
INSERT INTO `am` VALUES (7, 1);
INSERT INTO `am` VALUES (8, 2);
INSERT INTO `am` VALUES (9, 3);
INSERT INTO `am` VALUES (10, 4);
INSERT INTO `am` VALUES (11, 5);
INSERT INTO `am` VALUES (12, 6);
INSERT INTO `am` VALUES (13, 1);
INSERT INTO `am` VALUES (14, 2);
INSERT INTO `am` VALUES (15, 3);
INSERT INTO `am` VALUES (16, 4);
INSERT INTO `am` VALUES (17, 5);
INSERT INTO `am` VALUES (18, 6);
INSERT INTO `am` VALUES (1, 3);
INSERT INTO `am` VALUES (1, 3);
INSERT INTO `am` VALUES (1, 3);
INSERT INTO `am` VALUES (1, 3);
INSERT INTO `am` VALUES (1, 5);
INSERT INTO `am` VALUES (2, 3);
INSERT INTO `am` VALUES (2, 4);
INSERT INTO `am` VALUES (4, 2);
INSERT INTO `am` VALUES (16, 1);
INSERT INTO `am` VALUES (5, 1);
INSERT INTO `am` VALUES (14, 1);
INSERT INTO `am` VALUES (16, 2);
INSERT INTO `am` VALUES (7, 2);
INSERT INTO `am` VALUES (18, 3);
INSERT INTO `am` VALUES (12, 4);
INSERT INTO `am` VALUES (6, 4);
INSERT INTO `am` VALUES (6, 5);
INSERT INTO `am` VALUES (13, 5);
INSERT INTO `am` VALUES (8, 6);
INSERT INTO `am` VALUES (15, 6);
INSERT INTO `am` VALUES (10, 6);
INSERT INTO `am` VALUES (4, 1);
INSERT INTO `am` VALUES (8, 1);
INSERT INTO `am` VALUES (9, 1);
INSERT INTO `am` VALUES (3, 2);
INSERT INTO `am` VALUES (3, 2);
INSERT INTO `am` VALUES (5, 2);
INSERT INTO `am` VALUES (5, 2);
INSERT INTO `am` VALUES (18, 2);
INSERT INTO `am` VALUES (4, 3);
INSERT INTO `am` VALUES (7, 3);
INSERT INTO `am` VALUES (10, 3);
INSERT INTO `am` VALUES (9, 4);
INSERT INTO `am` VALUES (14, 4);
INSERT INTO `am` VALUES (17, 4);
INSERT INTO `am` VALUES (2, 5);
INSERT INTO `am` VALUES (9, 5);
INSERT INTO `am` VALUES (16, 5);
INSERT INTO `am` VALUES (16, 6);
INSERT INTO `am` VALUES (4, 6);
INSERT INTO `am` VALUES (14, 6);

-- ----------------------------
-- Table structure for c_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `c_order_detail`;
CREATE TABLE `c_order_detail`  (
  `co_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_detail_train_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_detail_train_price` double(10, 2) NULL DEFAULT NULL,
  `co_detail_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`co_detail_id`) USING BTREE,
  INDEX `co_detail_order`(`co_detail_order`) USING BTREE,
  CONSTRAINT `c_order_detail_ibfk_1` FOREIGN KEY (`co_detail_order`) REFERENCES `coachorder` (`coachorder_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_order_detail
-- ----------------------------
INSERT INTO `c_order_detail` VALUES (1, '详情1', 2220.00, '1');
INSERT INTO `c_order_detail` VALUES (2, '添加课程测试3', 222.00, 'b6b0a5f7c2824d108dd3fe699c5e1243');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_user` int(11) NULL DEFAULT NULL COMMENT 'user的购物车',
  `car_totalprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '购物车总价格',
  `car_allchecked` tinyint(1) NULL DEFAULT NULL COMMENT '是否全选',
  PRIMARY KEY (`car_id`) USING BTREE,
  INDEX `car_user`(`car_user`) USING BTREE,
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_user`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, 1, NULL, NULL);
INSERT INTO `car` VALUES (3, 2, 8809.00, NULL);
INSERT INTO `car` VALUES (11, 4, NULL, NULL);

-- ----------------------------
-- Table structure for caritem
-- ----------------------------
DROP TABLE IF EXISTS `caritem`;
CREATE TABLE `caritem`  (
  `caritem_id` int(11) NOT NULL AUTO_INCREMENT,
  `caritem_train_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物车项名称\r\n',
  `caritem_train_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '购物车项价格',
  `caritem_train_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物车项图片\r\n',
  `caritem_car` int(11) NULL DEFAULT NULL COMMENT '属于某购物车',
  `caritem_checked` int(255) NULL DEFAULT NULL COMMENT '此商品是否被勾选',
  PRIMARY KEY (`caritem_id`) USING BTREE,
  INDEX `caritem_train`(`caritem_train_name`) USING BTREE,
  INDEX `caritem_car`(`caritem_car`) USING BTREE,
  CONSTRAINT `caritem_ibfk_1` FOREIGN KEY (`caritem_car`) REFERENCES `car` (`car_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of caritem
-- ----------------------------
INSERT INTO `caritem` VALUES (66, '课程测试5', 100.00, '54fb0a71-07b1-4877-9f1a-c3d0ad9d9563123.jpg', 11, NULL);

-- ----------------------------
-- Table structure for coach
-- ----------------------------
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach`  (
  `coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coach_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coach_psw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coach_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coach_power` int(2) NULL DEFAULT NULL,
  `coach_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coach_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coach_salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`coach_id`) USING BTREE,
  INDEX `coach_power`(`coach_power`) USING BTREE,
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`coach_power`) REFERENCES `power` (`power_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coach
-- ----------------------------
INSERT INTO `coach` VALUES (1, '13578544562', '李教练', '123456', '男', NULL, 'c223b2a8ce07414ba278735dcca4b97fa.jpg', '中联健身高级教练，一级社会体育指导员', NULL);
INSERT INTO `coach` VALUES (2, '18276708350', '卢教练', '123', '男', NULL, '8fd798f0-cccd-451a-a274-1d7f2d5d4364a.jpg', '赛普健身高级教练，瑜伽教练', NULL);
INSERT INTO `coach` VALUES (7, '18276708351', '李鮰鱼', '11111', '女', NULL, '7c8d08e0-9ee9-4c24-a496-2f4669bbb07ba.jpg', '启航健身高级教练，一级社会体育指导员', NULL);
INSERT INTO `coach` VALUES (8, '18276708352', '廖猪', '3333', '女', NULL, '4379ef5c-3bf6-4868-8edc-8cd869537e41c.gif', '赛普健身高级教练，一级社会体育指导员', NULL);
INSERT INTO `coach` VALUES (9, '18276708353', '卢教练', '123456', '女', NULL, '3c42b977-14e0-4d7d-9dc8-e2bf887ecf22b.jpg', '爱尚国际健身高级教练，一级社会体育指导员', NULL);
INSERT INTO `coach` VALUES (11, '18276701295', '由教练', 'PBKDF2&SHA256$500$PBKDF2&SHA256$500$Fj63oP55Ivhv8P13$ac2db8c63029e478b131756f26528c31708532d507d5b9de888b1acbeb36e893$cc15ed0370aa8055d2d61ccff155c3e43b05ab01cc1ce7bbe7daf7b036b99d91', '男', NULL, '7289d968-a7e7-4a17-9b05-6f43101012482.jpg', '哈哈哈哈', NULL);
INSERT INTO `coach` VALUES (12, '18276702222', '哈教练', 'PBKDF2&SHA256$500$PBKDF2&SHA256$500$400qG0mbW99kX7Nk$2a94a1ff8555ad97b033ee6e3041f04e588ddbb04aed0c1291b2dbf1f4c1994f$8ae9a1ed591f77e556891c796e47c02a1535d85e6bd3753ed26fa2459173f21c', '女', NULL, '1963f0db-fb9a-4830-866d-4e4bf070b1032.jpg', '非常nice的教练', 'PBKDF2&SHA256$500$400qG0mbW99kX7Nk$2a94a1ff8555ad97b033ee6e3041f04e588ddbb04aed0c1291b2dbf1f4c1994f');
INSERT INTO `coach` VALUES (13, '18276700000', '刘亦菲', 'PBKDF2&SHA256$500$PBKDF2&SHA256$500$2EBNisI78gPas8wO$b7271d7443f6a3aa2822d2ed69a1d03181e93976abc542a290325030e7499528$869f09b006c262776319695365fb57dc7d3e22e30eaf9f964929691e2bd0f90f', '男', NULL, '89b88cde-ad74-4f72-8c80-4128690e29f92.jpg', '非常nice的教练', 'PBKDF2&SHA256$500$2EBNisI78gPas8wO$b7271d7443f6a3aa2822d2ed69a1d03181e93976abc542a290325030e7499528');

-- ----------------------------
-- Table structure for coachorder
-- ----------------------------
DROP TABLE IF EXISTS `coachorder`;
CREATE TABLE `coachorder`  (
  `coachorder_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coachorder_coach` int(11) NULL DEFAULT NULL,
  `coachorder_createtime` timestamp(0) NULL DEFAULT NULL,
  `coachorder_user` int(11) NULL DEFAULT NULL COMMENT '下单顾客',
  PRIMARY KEY (`coachorder_id`) USING BTREE,
  INDEX `coachorder_coach`(`coachorder_coach`) USING BTREE,
  CONSTRAINT `coachorder_ibfk_1` FOREIGN KEY (`coachorder_coach`) REFERENCES `coach` (`coach_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coachorder
-- ----------------------------
INSERT INTO `coachorder` VALUES ('1', 1, '2019-06-04 17:05:24', NULL);
INSERT INTO `coachorder` VALUES ('b6b0a5f7c2824d108dd3fe699c5e1243', 2, '2019-06-27 10:11:46', 4);

-- ----------------------------
-- Table structure for facility
-- ----------------------------
DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility`  (
  `facility_id` int(11) NOT NULL,
  `facility_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用器械名称',
  PRIMARY KEY (`facility_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of facility
-- ----------------------------
INSERT INTO `facility` VALUES (1, '徒手');
INSERT INTO `facility` VALUES (2, '杠铃');
INSERT INTO `facility` VALUES (3, '哑铃');
INSERT INTO `facility` VALUES (4, '固定器械');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '初级');
INSERT INTO `grade` VALUES (2, '中级');
INSERT INTO `grade` VALUES (3, '高级');

-- ----------------------------
-- Table structure for muscle
-- ----------------------------
DROP TABLE IF EXISTS `muscle`;
CREATE TABLE `muscle`  (
  `muscle_id` int(11) NOT NULL AUTO_INCREMENT,
  `muscle_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `muscle_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`muscle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of muscle
-- ----------------------------
INSERT INTO `muscle` VALUES (1, '肱二头肌', NULL);
INSERT INTO `muscle` VALUES (2, '肱三头肌', NULL);
INSERT INTO `muscle` VALUES (3, '腹肌', NULL);
INSERT INTO `muscle` VALUES (4, '背阔肌', NULL);

-- ----------------------------
-- Table structure for order_state
-- ----------------------------
DROP TABLE IF EXISTS `order_state`;
CREATE TABLE `order_state`  (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态名称',
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_state
-- ----------------------------
INSERT INTO `order_state` VALUES (2, '已付款');
INSERT INTO `order_state` VALUES (3, '已下单，未付款');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power`  (
  `power_id` int(4) NOT NULL AUTO_INCREMENT,
  `power_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`power_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES (1, '用户');
INSERT INTO `power` VALUES (2, '教练');
INSERT INTO `power` VALUES (3, '管理员');

-- ----------------------------
-- Table structure for shoporder
-- ----------------------------
DROP TABLE IF EXISTS `shoporder`;
CREATE TABLE `shoporder`  (
  `shoporder_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shoporder_user` int(11) NULL DEFAULT NULL,
  `shoporder_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`shoporder_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `t_order_detail_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_order_detail_price` double(10, 2) NULL DEFAULT NULL,
  `t_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `t_order`(`t_order`) USING BTREE,
  CONSTRAINT `t_order_detail_ibfk_1` FOREIGN KEY (`t_order`) REFERENCES `totalorder` (`totalorder_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('腹肌撕裂', 2200.00, '1');
INSERT INTO `t_order_detail` VALUES ('15天减脂计划', 2500.00, '2');
INSERT INTO `t_order_detail` VALUES ('私人教练拉伸课程', 5000.00, '1');
INSERT INTO `t_order_detail` VALUES ('添加课程测试3', 222.00, 'b6b0a5f7c2824d108dd3fe699c5e1243');

-- ----------------------------
-- Table structure for totalorder
-- ----------------------------
DROP TABLE IF EXISTS `totalorder`;
CREATE TABLE `totalorder`  (
  `totalorder_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `totalorder_coach` int(4) NULL DEFAULT NULL,
  `totalorder_createtime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`totalorder_id`) USING BTREE,
  INDEX `totalorder_coach`(`totalorder_coach`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of totalorder
-- ----------------------------
INSERT INTO `totalorder` VALUES ('1', 1, '2019-06-11 16:49:03');
INSERT INTO `totalorder` VALUES ('2', 2, '2019-06-25 16:49:14');
INSERT INTO `totalorder` VALUES ('b6b0a5f7c2824d108dd3fe699c5e1243', 2, '2019-06-27 10:11:46');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `train_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `train_period` int(3) NULL DEFAULT NULL COMMENT '训练周期时长',
  `train_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `train_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `train_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '示例图片',
  `train_coach` int(11) NULL DEFAULT NULL,
  `train_grade` int(11) NULL DEFAULT NULL COMMENT '训练级别',
  PRIMARY KEY (`train_id`) USING BTREE,
  INDEX `train_coach`(`train_coach`) USING BTREE,
  INDEX `train_class`(`train_grade`) USING BTREE,
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`train_coach`) REFERENCES `coach` (`coach_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `train_ibfk_2` FOREIGN KEY (`train_grade`) REFERENCES `grade` (`grade_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (1, '腹肌撕裂', 3, 9204.00, '描述。。。。', 'train2.jpg', 1, 1);
INSERT INTO `train` VALUES (2, '蜜桃臀计划', 5, 5000.00, '蜜桃臀的描述呗', 'train1.gif', 2, 2);
INSERT INTO `train` VALUES (3, '颈椎肩膀特调', 3, 8809.00, '肩膀训练，颈椎训练', 'train2.jpg', 1, 2);
INSERT INTO `train` VALUES (8, '力量训练', 4, 8833.00, '针对力量力量训练', 'd8dd868c5e4c452884f4b90d3999dc0b.jpg', 2, 2);
INSERT INTO `train` VALUES (10, '力量训练2', 3, 8888.00, '课程秒速', 'd8dd868c5e4c452884f4b90d3999dc0b.jpg', 2, 3);
INSERT INTO `train` VALUES (13, '添加课程测试3', 2, 222.00, '没描述', '40aaa7a8a6944c2ca4db009a366fcbd6.gif', 2, 1);
INSERT INTO `train` VALUES (14, '15天虐腹计划', 21, 2200.00, '科学练腹，练出完美腹肌', '28dc6acb-7359-43ae-9ebc-0b700988d917aa.jpg', 11, 3);
INSERT INTO `train` VALUES (15, '课程测试4', 55, 100.00, '测试课程4，请购买', 'c9bf8751-dda6-4543-ab7a-e745756de792timg (1).jpg', 13, 3);
INSERT INTO `train` VALUES (16, '课程测试5', 554, 100.00, '测试课程5，请购买', '54fb0a71-07b1-4877-9f1a-c3d0ad9d9563123.jpg', 13, 1);
INSERT INTO `train` VALUES (17, '课程测试6', 55, 100.00, '测试课程6，请购买', '29164d41-c9ce-4fa1-8f00-d34d1d34990b1.jpg', 13, NULL);

-- ----------------------------
-- Table structure for u_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `u_order_detail`;
CREATE TABLE `u_order_detail`  (
  `uo_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `uo_detail_train_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uo_detail_train_price` decimal(10, 2) NULL DEFAULT NULL,
  `uo` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uo_detail_id`) USING BTREE,
  INDEX `u_order_detail_ibfk_1`(`uo`) USING BTREE,
  CONSTRAINT `u_order_detail_ibfk_1` FOREIGN KEY (`uo`) REFERENCES `userorder` (`userorder_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_order_detail
-- ----------------------------
INSERT INTO `u_order_detail` VALUES (66, '蜜桃臀计划', 5000.00, '59216f0f8d0347eeb27ceb3a020d5724');
INSERT INTO `u_order_detail` VALUES (67, '力量训练2', 8888.00, '59216f0f8d0347eeb27ceb3a020d5724');
INSERT INTO `u_order_detail` VALUES (68, '腹肌撕裂', 9204.00, '35c0ed11967f44908bd44afe88eccef0');
INSERT INTO `u_order_detail` VALUES (69, '腹肌撕裂', 9204.00, 'bc190b29b4304fa097fbb2de3dcecb22');
INSERT INTO `u_order_detail` VALUES (70, '腹肌撕裂', 9204.00, '0728b4096a8748f4860f597a2a7b1dfc');
INSERT INTO `u_order_detail` VALUES (71, '腹肌撕裂', 9204.00, '09bffbeda6f44e069dc85b571d98b2e1');
INSERT INTO `u_order_detail` VALUES (72, '添加课程测试3', 222.00, 'ac9696be0f1b481988d66a4a243b3e51');
INSERT INTO `u_order_detail` VALUES (73, '蜜桃臀计划', 5000.00, 'ac9696be0f1b481988d66a4a243b3e51');
INSERT INTO `u_order_detail` VALUES (74, '腹肌撕裂', 9204.00, '834b083d436f400abc298b425711f1a6');
INSERT INTO `u_order_detail` VALUES (75, '添加课程测试3', 222.00, '834b083d436f400abc298b425711f1a6');
INSERT INTO `u_order_detail` VALUES (76, '颈椎肩膀特调', 8809.00, '834b083d436f400abc298b425711f1a6');
INSERT INTO `u_order_detail` VALUES (77, '力量训练2', 8888.00, '834b083d436f400abc298b425711f1a6');
INSERT INTO `u_order_detail` VALUES (78, '添加课程测试3', 222.00, 'e88d756e84e74924a8ce3351fe5b578f');
INSERT INTO `u_order_detail` VALUES (79, '腹肌撕裂', 9204.00, 'e88d756e84e74924a8ce3351fe5b578f');
INSERT INTO `u_order_detail` VALUES (80, '添加课程测试3', 222.00, 'b6b0a5f7c2824d108dd3fe699c5e1243');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_psw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_age` int(3) NULL DEFAULT NULL,
  `u_power` int(2) NULL DEFAULT NULL,
  `u_img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `u_salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  INDEX `u_power`(`u_power`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`u_power`) REFERENCES `power` (`power_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '18346577246', '张三', '123456', '男', 25, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, '1826708888', 'testName', '123456', '女', 11, 1, NULL, NULL);
INSERT INTO `user` VALUES (3, '1234567788', 'testname2', '123455', '女', 12, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, '18276701111', '肉肉肉', 'PBKDF2&SHA256$500$PBKDF2&SHA256$500$XsBI5nuL2qEtXf3Y$6b6f24d210913565eba71b2ab838d3e568df7382a3b987636c80ffc0455aa99b$c254a0f2c6f3ae7cc76afda9e1f9744ef6ac94edc6a764f88f62748a834e794d', '男', 21, NULL, 'd5701b26-42e7-40b8-9121-d27ddf8e84a14.jpg', 'PBKDF2&SHA256$500$XsBI5nuL2qEtXf3Y$6b6f24d210913565eba71b2ab838d3e568df7382a3b987636c80ffc0455aa99b');

-- ----------------------------
-- Table structure for userorder
-- ----------------------------
DROP TABLE IF EXISTS `userorder`;
CREATE TABLE `userorder`  (
  `userorder_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userorder_createtime` timestamp(0) NULL DEFAULT NULL,
  `userorder_user` int(11) NULL DEFAULT NULL,
  `userorder_state` int(11) NULL DEFAULT NULL COMMENT '用户订单状态',
  `userorder_price` decimal(10, 2) NULL DEFAULT NULL,
  `userorder_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userorder_id`) USING BTREE,
  INDEX `userorder_user`(`userorder_user`) USING BTREE,
  INDEX `userorder_state`(`userorder_state`) USING BTREE,
  CONSTRAINT `userorder_ibfk_1` FOREIGN KEY (`userorder_user`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userorder_ibfk_2` FOREIGN KEY (`userorder_state`) REFERENCES `order_state` (`state_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userorder
-- ----------------------------
INSERT INTO `userorder` VALUES ('0728b4096a8748f4860f597a2a7b1dfc', '2019-06-27 08:39:07', 4, 3, 9204.00, '18276701111');
INSERT INTO `userorder` VALUES ('09bffbeda6f44e069dc85b571d98b2e1', '2019-06-27 08:59:15', 4, 3, 9204.00, '18276701111');
INSERT INTO `userorder` VALUES ('35c0ed11967f44908bd44afe88eccef0', '2019-06-25 16:26:04', 2, 3, 9204.00, '1826708888');
INSERT INTO `userorder` VALUES ('59216f0f8d0347eeb27ceb3a020d5724', '2019-06-25 16:09:06', 2, 3, 13888.00, '1826708888');
INSERT INTO `userorder` VALUES ('834b083d436f400abc298b425711f1a6', '2019-06-27 09:26:03', 4, 3, 9426.00, '18276701111');
INSERT INTO `userorder` VALUES ('ac9696be0f1b481988d66a4a243b3e51', '2019-06-27 09:02:25', 4, 3, 5222.00, '18276701111');
INSERT INTO `userorder` VALUES ('b6b0a5f7c2824d108dd3fe699c5e1243', '2019-06-27 10:11:46', 4, 2, 222.00, '18276701111');
INSERT INTO `userorder` VALUES ('bc190b29b4304fa097fbb2de3dcecb22', '2019-06-25 17:09:13', 2, 3, 9204.00, '1826708888');
INSERT INTO `userorder` VALUES ('e88d756e84e74924a8ce3351fe5b578f', '2019-06-27 10:11:31', 4, 3, 9426.00, '18276701111');

SET FOREIGN_KEY_CHECKS = 1;
