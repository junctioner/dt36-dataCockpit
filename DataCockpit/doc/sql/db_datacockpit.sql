/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17-log : Database - datacockpit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`datacockpit` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `datacockpit`;

/*Table structure for table `analysistasks` */

DROP TABLE IF EXISTS `analysistasks`;

CREATE TABLE `analysistasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` datetime DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '企业编号',
  `did` int(11) DEFAULT NULL COMMENT '关联关系编号',
  `taskstatus` int(11) DEFAULT NULL COMMENT '已添加:0,进行中:1，完成:2,失败:-1',
  `rule` varchar(50) DEFAULT NULL,
  `feedback` varchar(1000) DEFAULT NULL,
  `arithmeticid` int(11) DEFAULT NULL COMMENT '算法ID',
  PRIMARY KEY (`id`),
  KEY `did` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `analysistasks` */

/*Table structure for table `companyinfo` */

DROP TABLE IF EXISTS `companyinfo`;

CREATE TABLE `companyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corpName` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态    禁：0,不禁1',
  `approval` int(11) DEFAULT NULL COMMENT '审批状态  拒：0，过：1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `companyinfo` */

insert  into `companyinfo`(`id`,`corpName`,`phone`,`name`,`job`,`password`,`email`,`state`,`approval`) values (1,'香港恒生','1347891102','马人才','总裁','123456','123@emailcom',1,0),(2,'恒源祥','1356789110','李冠荣','总经理','123456','123@email.com',1,1),(3,'香港金泰','1356689110','王爱玲','总经理','123456','123@email.com',1,1),(4,'伊利乳业','1356678110','牛根生','总裁','123456','123@email.com',1,1),(5,'百事通','1356678119','李小兰','总裁','123456','123@email.com',1,1),(6,'可乐','1356678112','戴维斯','总裁','123456',NULL,NULL,NULL),(7,'紫金山科技有限公司','13926475847','张蕾','董事长','123456789','zhanglei@163.com',1,1),(8,'万达',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'联想',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'华为',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `datarelation` */

DROP TABLE IF EXISTS `datarelation`;

CREATE TABLE `datarelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '企业ID',
  `tid1` int(11) DEFAULT NULL COMMENT '关联表A字段',
  `tid2` int(11) DEFAULT NULL COMMENT '关联表B字段',
  `col1` int(11) DEFAULT NULL,
  `col2` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '关联关系状态 禁：0,不禁1',
  PRIMARY KEY (`id`),
  KEY `datarelation_ibfk_1` (`tid1`),
  KEY `datarelation_ibfk_2` (`tid2`),
  KEY `datarelation_col_1` (`col1`),
  KEY `datarelation_col_2` (`col2`),
  KEY `datarelation_com_1` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `datarelation` */

/*Table structure for table `inform` */

DROP TABLE IF EXISTS `inform`;

CREATE TABLE `inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `inform` */

insert  into `inform`(`id`,`title`,`publish_date`,`details`,`publisher`) values (1,'会议还睡了看到回复发了','2017-08-28 16:57:47','的回复拉卡拉货收到了风凉话','张总'),(3,'时间','2017-08-28 00:48:50','<p>第三个时间</p>\r\n','3'),(8,'鄂我若翁',NULL,'<p>我儿童任天野</p>\r\n','问问'),(9,'时间','2017-08-28 01:26:22','<p>而儿童羽绒体育</p>\r\n','dddd');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `per_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `percode` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`per_name`,`type`,`percode`,`url`) values (1,'watch',NULL,NULL,NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`role_name`) values (1,'supereme'),(2,'admin');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `pid` int(11) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`rid`,`pid`) values (11,1,1),(12,2,1),(13,3,1),(14,4,1);

/*Table structure for table `tablecolumninfo` */

DROP TABLE IF EXISTS `tablecolumninfo`;

CREATE TABLE `tablecolumninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `columnName` varchar(50) DEFAULT NULL,
  `columnType` varchar(50) DEFAULT NULL,
  `physicalColumnName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tablecolumninfo` */

/*Table structure for table `tableinfo` */

DROP TABLE IF EXISTS `tableinfo`;

CREATE TABLE `tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `physicalTableName` varchar(200) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '企业ID',
  `state` int(11) DEFAULT NULL COMMENT '0禁用，1启用',
  `showtype` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tableinfo` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`rid`,`uid`) values (1,1,1),(2,2,2),(5,2,3),(6,2,4);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态    禁：0,不禁1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`name`,`job`,`password`,`phone`,`email`,`state`) values (2,'Lily','Secratry','123456','234','123@qq.com',1),(3,'Bob','Aassistant','123456','345','123@qq.com',1),(4,'Jack','Customer','123456','567','123@qq.com',1);

/*Table structure for table `xstable` */

DROP TABLE IF EXISTS `xstable`;

CREATE TABLE `xstable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `area` varchar(100) DEFAULT NULL COMMENT '区域',
  `times` date DEFAULT NULL COMMENT '日期',
  `f_nums` int(10) DEFAULT NULL COMMENT '到访人数',
  `r_nums` int(10) DEFAULT NULL COMMENT '认筹人数',
  `t_nums` int(10) DEFAULT NULL COMMENT '退订人数',
  `shows` int(2) DEFAULT NULL COMMENT '0:折线图；1:柱状图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `xstable` */

insert  into `xstable`(`id`,`name`,`area`,`times`,`f_nums`,`r_nums`,`t_nums`,`shows`) values (1,'湖北武汉XXX有限公司','湖北武汉XXX地区','2017-06-25',13,15,1,1),(2,'湖北武汉XXX有限公司','湖北武汉XXX地区','2017-03-25',32,11,3,1),(3,'湖北武汉XXX有限公司','湖北武汉XXX地区','2011-08-25',43,34,5,1),(4,'湖北武汉XXX有限公司','湖北武汉XXX地区','2016-08-25',54,66,6,1),(5,'湖北武汉XXX有限公司','湖北武汉XXX地区','2012-08-25',23,33,7,1),(6,'湖北武汉XXX有限公司','湖北武汉XXX地区','2013-08-25',12,22,5,1),(7,'湖北武汉XXX有限公司','湖北武汉XXX地区','2014-08-25',54,5,4,1),(8,'湖北武汉XXX有限公司','湖北武汉XXX地区','2015-08-25',43,5,2,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
