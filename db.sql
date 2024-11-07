/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - jiaoshipeixunguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiaoshipeixunguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jiaoshipeixunguanli`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别类型名称',1,'男',NULL,'2021-04-25 09:28:58'),(2,'sex_types','性别类型名称',2,'女',NULL,'2021-04-25 09:28:58'),(3,'kecheng_types','课程类型名称',1,'课程类型1',NULL,'2021-04-25 09:28:58'),(4,'kecheng_types','课程类型名称',2,'课程类型2',NULL,'2021-04-25 09:28:58'),(5,'kecheng_types','课程类型名称',3,'课程类型3',NULL,'2021-04-25 09:28:58'),(6,'peixun_types','培训类型名称',1,'入职培训',NULL,'2021-04-25 09:28:58'),(7,'peixun_types','培训类型名称',2,'进修培训',NULL,'2021-04-25 09:28:58'),(8,'peixun_types','培训类型名称',3,'专业培训',NULL,'2021-04-25 09:28:58'),(9,'gonggao_types','公告类型名称',1,'日常公告',NULL,'2021-04-25 09:28:58'),(10,'gonggao_types','公告类型名称',2,'紧急公告',NULL,'2021-04-25 09:28:58'),(11,'peixun_types','培训类型名称',4,'其他',NULL,'2021-04-25 10:07:15');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111 ',
  `gonggao_types` int(11) DEFAULT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `gonggao_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (3,'公告1',1,'2021-04-25 10:00:26','公告1的详情\r\n','2021-04-25 10:00:26'),(4,'公告2',2,'2021-04-25 10:06:06','公告2的详情\r\n','2021-04-25 10:06:06');

/*Table structure for table `kecheng` */

DROP TABLE IF EXISTS `kecheng`;

CREATE TABLE `kecheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_name` varchar(200) DEFAULT NULL COMMENT '课程名称 Search111 ',
  `kecheng_types` int(11) DEFAULT NULL COMMENT '课程类型 Search111 ',
  `kecheng_file` varchar(200) DEFAULT NULL COMMENT '课程文件',
  `kecheng_content` text COMMENT '课程详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新增时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='课程';

/*Data for the table `kecheng` */

insert  into `kecheng`(`id`,`kecheng_name`,`kecheng_types`,`kecheng_file`,`kecheng_content`,`insert_time`,`create_time`) values (3,'课程1',3,'http://localhost:8080/jiaoshipeixunguanli/file/download?fileName=1619314999900.txt','课程1的详情\r\n','2021-04-25 09:43:21','2021-04-25 09:43:21'),(4,'课程2',3,'http://localhost:8080/jiaoshipeixunguanli/file/download?fileName=1619315014955.txt','课程2的详情\r\n','2021-04-25 09:43:43','2021-04-25 09:43:43'),(5,'课程3',3,'http://localhost:8080/jiaoshipeixunguanli/file/download?fileName=1619316205571.txt','课程3的介绍及详情\r\n','2021-04-25 10:03:36','2021-04-25 10:03:36');

/*Table structure for table `peixun` */

DROP TABLE IF EXISTS `peixun`;

CREATE TABLE `peixun` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `peixun_name` varchar(200) DEFAULT NULL COMMENT '课程名称 Search111 ',
  `peixun_on_time` timestamp NULL DEFAULT NULL COMMENT '培训开始时间 Search111 ',
  `peixun_down_time` timestamp NULL DEFAULT NULL COMMENT '培训结束时间 Search111 ',
  `peixun_types` int(11) DEFAULT NULL COMMENT '培训类型 Search111 ',
  `cultivate_content` text COMMENT '培训内容',
  `peixun_fenshu` decimal(10,4) DEFAULT NULL COMMENT '分数 Search111 ',
  `pingjia_content` text COMMENT '培训评价',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='培训';

/*Data for the table `peixun` */

insert  into `peixun`(`id`,`yonghu_id`,`peixun_name`,`peixun_on_time`,`peixun_down_time`,`peixun_types`,`cultivate_content`,`peixun_fenshu`,`pingjia_content`,`create_time`) values (9,1,'第一次培训','2021-04-28 00:00:00','2021-04-30 00:00:00',3,'第一次培训的专业培训的详情\r\n',NULL,'这次培训非常好,让我了解到我的工作的重要性\r\n','2021-04-25 09:58:53'),(10,2,'第一次培训','2021-04-28 00:00:00','2021-04-30 00:00:00',3,'培训详情\r\n','50.0000','‍\r\n','2021-04-25 10:04:41');

/*Table structure for table `sushe` */

DROP TABLE IF EXISTS `sushe`;

CREATE TABLE `sushe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `building` varchar(200) DEFAULT NULL COMMENT '楼栋 Search111 ',
  `unit` varchar(200) DEFAULT NULL COMMENT '单元 Search111 ',
  `room` varchar(200) DEFAULT NULL COMMENT '房间号 Search111 ',
  `sushe_number` int(11) DEFAULT '0' COMMENT '已住人员',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='宿舍信息';

/*Data for the table `sushe` */

insert  into `sushe`(`id`,`building`,`unit`,`room`,`sushe_number`,`create_time`) values (1,'1','1','102',2,'2021-04-25 10:00:10'),(2,'1','1','103',0,'2021-04-25 10:05:31');

/*Table structure for table `sushe_yonghu` */

DROP TABLE IF EXISTS `sushe_yonghu`;

CREATE TABLE `sushe_yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户id',
  `sushe_id` int(11) DEFAULT NULL COMMENT '宿舍id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='人员与宿舍关系';

/*Data for the table `sushe_yonghu` */

insert  into `sushe_yonghu`(`id`,`yonghu_id`,`sushe_id`,`create_time`) values (1,3,1,'2021-04-25 10:04:54'),(2,1,1,'2021-04-25 10:05:01');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','uadg93uwaawjd061qvv5lf7akrksetnt','2021-04-25 09:39:37','2021-04-25 11:02:14'),(2,7,'a11','users','员工','u0bt2c70tqxrqcfyodhnwbcqd6l3aaui','2021-04-25 10:01:38','2021-04-25 11:01:38'),(3,8,'a22','users','员工','v7jjnblv26fn8oazf6wv3sdnsp0wr0vp','2021-04-25 10:07:34','2021-04-25 11:07:35'),(4,1,'a1','yonghu','用户','vp420zv2ktvfn3qpyijeloqic44tlb19','2021-04-25 10:09:34','2021-04-25 11:09:34');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','123456','管理员','2021-01-29 14:51:13'),(7,'a11','123456','员工','2021-04-25 09:39:47'),(8,'a22','123456','员工','2021-04-25 10:02:29');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 Search111 ',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`create_time`) values (1,'a1','123456','张199','17703786901','410224199610232001','http://localhost:8080/jiaoshipeixunguanli/file/download?fileName=1619314830558.jpg',2,'2021-04-25 09:40:32'),(2,'a2','123456','张2','17703786902','410224199610232002','http://localhost:8080/jiaoshipeixunguanli/file/download?fileName=1619314868519.jpg',1,'2021-04-25 09:41:10'),(3,'a3','123456','张三','17703786903','410224199610232003','http://localhost:8080/jiaoshipeixunguanli/file/download?fileName=1619316180818.jpg',2,'2021-04-25 10:03:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
