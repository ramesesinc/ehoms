-- MySQL dump 10.10
--
-- Host: 192.168.254.119    Database: ehoms
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

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
-- Current Database: `ehoms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ehoms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ehoms`;

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
CREATE TABLE `admission` (
  `objid` varchar(50) NOT NULL,
  `controlno` varchar(50) default NULL,
  `fromdate` datetime default NULL,
  `todate` datetime default NULL,
  `admissiontype` varchar(50) default NULL,
  `roomtype` varchar(50) default NULL,
  `roomno` varchar(50) default NULL,
  `chartid` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission`
--

LOCK TABLES `admission` WRITE;
/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `objid` varchar(50) NOT NULL,
  `acctid` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `middlename` varchar(50) default NULL,
  `gender` varchar(1) default NULL,
  `civilstatus` varchar(10) default NULL,
  `birthdate` date default NULL,
  `birthplace` varchar(50) default NULL,
  `nationality` varchar(50) default NULL,
  `occupation` varchar(50) default NULL,
  `religion` varchar(50) default NULL,
  `weight` varchar(10) default NULL,
  `height` varchar(10) default NULL,
  `bloodtype` varchar(10) default NULL,
  `eyecolor` varchar(10) default NULL,
  `haircolor` varchar(10) default NULL,
  `address_objid` varchar(50) default NULL,
  `ethnicity` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `uix_acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_address`
--

DROP TABLE IF EXISTS `patient_address`;
CREATE TABLE `patient_address` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `addresstype` varchar(10) default NULL,
  `street1` varchar(255) default NULL,
  `street2` varchar(255) default NULL,
  `city` varchar(50) default NULL,
  `municipality` varchar(50) default NULL,
  `province` varchar(50) default NULL,
  `zipcode` varchar(10) default NULL,
  `barangay` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_patient_address_parentid` (`parentid`),
  CONSTRAINT `FK_patient_address_parentid` FOREIGN KEY (`parentid`) REFERENCES `patient` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_address`
--

LOCK TABLES `patient_address` WRITE;
/*!40000 ALTER TABLE `patient_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_contact`
--

DROP TABLE IF EXISTS `patient_contact`;
CREATE TABLE `patient_contact` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `contacttype` varchar(50) default NULL,
  `contactno` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_patient_contact_parentid` (`parentid`),
  CONSTRAINT `FK_patient_contact_parentid` FOREIGN KEY (`parentid`) REFERENCES `patient_contact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_contact`
--

LOCK TABLES `patient_contact` WRITE;
/*!40000 ALTER TABLE `patient_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_contactperson`
--

DROP TABLE IF EXISTS `patient_contactperson`;
CREATE TABLE `patient_contactperson` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `ref_objid` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `middlename` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `contactno` varchar(50) default NULL,
  `relation` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_contactperson`
--

LOCK TABLES `patient_contactperson` WRITE;
/*!40000 ALTER TABLE `patient_contactperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_contactperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_id`
--

DROP TABLE IF EXISTS `patient_id`;
CREATE TABLE `patient_id` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `idtype` varchar(50) default NULL,
  `idno` varchar(50) default NULL,
  `dtissued` date default NULL,
  `dtexpiry` date default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_id`
--

LOCK TABLES `patient_id` WRITE;
/*!40000 ALTER TABLE `patient_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart`
--

DROP TABLE IF EXISTS `patientchart`;
CREATE TABLE `patientchart` (
  `objid` varchar(50) NOT NULL,
  `chartno` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `entrypoint` varchar(50) default NULL,
  `dtfiled` datetime default NULL,
  `createdby_objid` varchar(50) default NULL,
  `createdby_name` varchar(100) default NULL,
  `patient_objid` varchar(50) default NULL,
  `patient_classification` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart`
--

LOCK TABLES `patientchart` WRITE;
/*!40000 ALTER TABLE `patientchart` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientchart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart_activity`
--

DROP TABLE IF EXISTS `patientchart_activity`;
CREATE TABLE `patientchart_activity` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `department` varchar(50) default NULL,
  `reforderid` varchar(50) default NULL,
  `activity_objid` varchar(50) default NULL,
  `activity_title` varchar(50) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart_activity`
--

LOCK TABLES `patientchart_activity` WRITE;
/*!40000 ALTER TABLE `patientchart_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientchart_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart_activity_detail`
--

DROP TABLE IF EXISTS `patientchart_activity_detail`;
CREATE TABLE `patientchart_activity_detail` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `type` varchar(20) default NULL,
  `result` varchar(255) default NULL,
  `displayvalue` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart_activity_detail`
--

LOCK TABLES `patientchart_activity_detail` WRITE;
/*!40000 ALTER TABLE `patientchart_activity_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientchart_activity_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart_diagnosis`
--

DROP TABLE IF EXISTS `patientchart_diagnosis`;
CREATE TABLE `patientchart_diagnosis` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `diagnosistype` varchar(10) default NULL,
  `diagnosisid` varchar(50) default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart_diagnosis`
--

LOCK TABLES `patientchart_diagnosis` WRITE;
/*!40000 ALTER TABLE `patientchart_diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientchart_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart_doctororder`
--

DROP TABLE IF EXISTS `patientchart_doctororder`;
CREATE TABLE `patientchart_doctororder` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `title` varchar(50) default NULL,
  `interval` int(11) default NULL,
  `intervalunit` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `doctor_objid` varchar(50) default NULL,
  `doctor_name` varchar(100) default NULL,
  `expirydate` datetime default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart_doctororder`
--

LOCK TABLES `patientchart_doctororder` WRITE;
/*!40000 ALTER TABLE `patientchart_doctororder` DISABLE KEYS */;
INSERT INTO `patientchart_doctororder` VALUES ('B1','C1',NULL,'intake 2mg sodium',3,NULL,NULL,NULL,'D1','D2',NULL);
/*!40000 ALTER TABLE `patientchart_doctororder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart_doctororder_detail`
--

DROP TABLE IF EXISTS `patientchart_doctororder_detail`;
CREATE TABLE `patientchart_doctororder_detail` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `detail` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart_doctororder_detail`
--

LOCK TABLES `patientchart_doctororder_detail` WRITE;
/*!40000 ALTER TABLE `patientchart_doctororder_detail` DISABLE KEYS */;
INSERT INTO `patientchart_doctororder_detail` VALUES ('T1','B1','2mg sodium'),('T2','B1','3mg biogesic');
/*!40000 ALTER TABLE `patientchart_doctororder_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientchart_task`
--

DROP TABLE IF EXISTS `patientchart_task`;
CREATE TABLE `patientchart_task` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `assignee_objid` varchar(50) default NULL,
  `assignee_name` varchar(100) default NULL,
  `actor_objid` varchar(50) default NULL,
  `actor_name` varchar(100) default NULL,
  `action` varchar(50) default NULL,
  `message` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_patientchart_task_parentid` (`parentid`),
  CONSTRAINT `FK_patientchart_task_parentid` FOREIGN KEY (`parentid`) REFERENCES `patientchart` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientchart_task`
--

LOCK TABLES `patientchart_task` WRITE;
/*!40000 ALTER TABLE `patientchart_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientchart_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `objid` varchar(50) NOT NULL,
  `roomno` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_securitygroup`
--

DROP TABLE IF EXISTS `sys_securitygroup`;
CREATE TABLE `sys_securitygroup` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) default 'L',
  `usergroup_objid` varchar(50) default 'L',
  `exclude` text,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_secu__530D6FE4004002F9` (`objid`),
  UNIQUE KEY `idx_securitygroup_name` (`name`),
  KEY `FK_sys_securitygroup_usergroup` (`usergroup_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_securitygroup`
--

LOCK TABLES `sys_securitygroup` WRITE;
/*!40000 ALTER TABLE `sys_securitygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_securitygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(10) NOT NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_sequ__530D6FE433D4B598` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_session`
--

DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) default 'L',
  `username` varchar(50) default 'L',
  `clienttype` varchar(12) default 'L',
  `accesstime` timestamp NULL default NULL,
  `accessexpiry` timestamp NULL default NULL,
  `timein` timestamp NULL default NULL,
  PRIMARY KEY  (`sessionid`),
  UNIQUE KEY `PK__sys_sess__23D81613300424B4` (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_session`
--

LOCK TABLES `sys_session` WRITE;
/*!40000 ALTER TABLE `sys_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_session_log`
--

DROP TABLE IF EXISTS `sys_session_log`;
CREATE TABLE `sys_session_log` (
  `sessionid` varchar(50) NOT NULL,
  `userid` varchar(50) default 'L',
  `username` varchar(50) default 'L',
  `clienttype` varchar(12) default 'L',
  `accesstime` timestamp NULL default NULL,
  `accessexpiry` timestamp NULL default NULL,
  `timein` timestamp NULL default NULL,
  `timeout` timestamp NULL default NULL,
  `state` varchar(10) default 'L',
  PRIMARY KEY  (`sessionid`),
  UNIQUE KEY `PK__sys_sess__23D816132C3393D0` (`sessionid`),
  KEY `ix_timein` (`timein`),
  KEY `ix_timeout` (`timeout`),
  KEY `ix_userid` (`userid`),
  KEY `ix_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_session_log`
--

LOCK TABLES `sys_session_log` WRITE;
/*!40000 ALTER TABLE `sys_session_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_session_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_terminal`
--

DROP TABLE IF EXISTS `sys_terminal`;
CREATE TABLE `sys_terminal` (
  `terminalid` varchar(50) NOT NULL,
  `parentid` varchar(50) default 'L',
  `parentcode` varchar(50) default 'L',
  `parenttype` varchar(50) default 'L',
  `macaddress` varchar(50) default NULL,
  `dtregistered` timestamp NULL default NULL,
  `registeredby` varchar(50) default 'L',
  `info` text,
  `state` int(10) default NULL,
  PRIMARY KEY  (`terminalid`),
  UNIQUE KEY `PK__sys_term__4FDBF6DF286302EC` (`terminalid`),
  KEY `FK_terminal` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_terminal`
--

LOCK TABLES `sys_terminal` WRITE;
/*!40000 ALTER TABLE `sys_terminal` DISABLE KEYS */;
INSERT INTO `sys_terminal` VALUES ('T001','L','L','L',NULL,NULL,'L',NULL,NULL);
/*!40000 ALTER TABLE `sys_terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) default 'L',
  `dtcreated` timestamp NULL default NULL,
  `createdby` varchar(50) default 'L',
  `username` varchar(50) default 'L',
  `pwd` varchar(50) default 'L',
  `firstname` varchar(50) default 'L',
  `lastname` varchar(50) default 'L',
  `middlename` varchar(50) default 'L',
  `name` varchar(50) default 'L',
  `jobtitle` varchar(50) default 'L',
  `pwdlogincount` int(10) default NULL,
  `pwdexpirydate` datetime default NULL,
  `usedpwds` text,
  `lockid` varchar(32) default 'L',
  `txncode` varchar(10) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE4239E4DCF` (`objid`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `ix_lastname_firstname` (`lastname`,`firstname`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) default 'L',
  `domain` varchar(25) default 'L',
  `userclass` varchar(25) default 'L',
  `orgclass` varchar(50) default 'L',
  `role` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE41FCDBCEB` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup`
--

LOCK TABLES `sys_usergroup` WRITE;
/*!40000 ALTER TABLE `sys_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_admin`
--

DROP TABLE IF EXISTS `sys_usergroup_admin`;
CREATE TABLE `sys_usergroup_admin` (
  `objid` varchar(50) NOT NULL,
  `usergroupid` varchar(50) default 'L',
  `user_objid` varchar(50) default 'L',
  `user_username` varchar(50) default 'L',
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) default 'L',
  `exclude` varchar(255) default 'L',
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE44707859D` (`objid`),
  UNIQUE KEY `idx_usergroup_admin_user` (`usergroupid`,`user_objid`),
  KEY `FK_sys_usergroup_admin` (`user_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup_admin`
--

LOCK TABLES `sys_usergroup_admin` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_member`
--

DROP TABLE IF EXISTS `sys_usergroup_member`;
CREATE TABLE `sys_usergroup_member` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) default 'L',
  `usergroup_objid` varchar(50) default 'L',
  `user_objid` varchar(50) NOT NULL,
  `user_username` varchar(50) default 'L',
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `org_objid` varchar(50) default 'L',
  `org_name` varchar(50) default 'L',
  `org_orgclass` varchar(50) default 'L',
  `securitygroup_objid` varchar(50) default 'L',
  `exclude` varchar(255) default 'L',
  `displayname` varchar(50) default 'L',
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK_sys_usergroup_member` (`objid`),
  KEY `FK_sys_usergroup_member` (`user_objid`),
  KEY `FK_sys_usergroup_member_org` (`org_objid`),
  KEY `FK_sys_usergroup_member_securitygorup` (`securitygroup_objid`),
  KEY `ix_user_firstname` (`user_firstname`),
  KEY `ix_user_lastname_firstname` (`user_lastname`,`user_firstname`),
  KEY `ix_username` (`user_username`),
  KEY `uix_usergroup` (`usergroup_objid`,`user_objid`,`org_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup_member`
--

LOCK TABLES `sys_usergroup_member` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup_permission`
--

DROP TABLE IF EXISTS `sys_usergroup_permission`;
CREATE TABLE `sys_usergroup_permission` (
  `objid` varchar(50) NOT NULL,
  `usergroup_objid` varchar(50) default 'L',
  `object` varchar(25) default 'L',
  `permission` varchar(25) default 'L',
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`objid`),
  UNIQUE KEY `PK__sys_user__530D6FE40D99FE17` (`objid`),
  KEY `FK_sys_usergroup_permission_usergroup` (`usergroup_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_usergroup_permission`
--

LOCK TABLES `sys_usergroup_permission` WRITE;
/*!40000 ALTER TABLE `sys_usergroup_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` text,
  `description` varchar(255) default 'L',
  `datatype` varchar(15) default 'L',
  `category` varchar(50) default 'L',
  PRIMARY KEY  (`name`),
  UNIQUE KEY `PK__sys_var__72E12F1A145C0A3F` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
INSERT INTO `sys_var` VALUES ('allow_consolidation_with_balance','0',NULL,'checkbox','ASSESSOR'),('allow_faas_transaction_with_balance','1',NULL,'checkbox','ASSESSOR'),('allow_general_collection_discount','0',NULL,'boole','TC'),('allow_subdivision_with_balance','0',NULL,'checkbox','ASSESSOR'),('assessor_name','Iligan Assessor',NULL,'text','ASSESSOR'),('assessor_officename','OFFICE OF THE CITY ASSESSOR',NULL,'text','ASSESSOR'),('assessor_title','City Assessor',NULL,'text','ASSESSOR'),('barcode_url','http://${apphost}/barcode?data=$P{data}&width=1','barcode servlet path',NULL,'SYSTEM'),('ctc_brgyshare','0.50','CTC Barangay Share',NULL,'CTC'),('current_ry','2014',NULL,'integer','ASSESSOR'),('deposit_print_date','0',NULL,NULL,'TC'),('faas_datacapture_allow_edit_av','1',NULL,'checkbox','ASSESSOR'),('gr_ordinance_date','2013-04-04',NULL,'date','ASSESSOR'),('gr_ordinance_no','13-5985',NULL,'text','ASSESSOR'),('gr_renumber_pi','0',NULL,'checkbox','ASSESSOR'),('gr_t_autonumber','false',NULL,'checkbox','ASSESSOR'),('invalid_login_access_date_interval','1m','number of hours/days access date is moved when failed_login_max_retries is reached( d=days, h=hours)',NULL,NULL),('invalid_login_actio','1','0 - suspend 1-move access to a later date',NULL,NULL),('invalid_login_max_retries','5','No. of times a user can retry login before disabling account',NULL,NULL),('landtax_certifiedby','NICHOLAS JOSE H. LLUCH',NULL,'text','LANDTAX'),('landtax_certifiedby_title','ASST. CITY TREASURER - OPERTIO',NULL,'text','LANDTAX'),('lgu_address','City Hall, Buhanginan Hill, Pala-o',NULL,'text','ASSESSOR'),('lgu_formal_name','City of Iliga',NULL,'text','ASSESSOR'),('lgu_name','ILIGA','lgu name','text','SSESSOR'),('lgu_objid','169',NULL,'text','ASSESSOR'),('lgu_regio','REGION X',NULL,NULL,NULL),('lgu_type','city','Type of LGU. Valid values are city, municipality and province','text','ASSESSOR'),('mayor_name','PAULINO YAP EMANO',NULL,NULL,'LGU'),('mayor_office_name','OFFICE OF THE MUNICIPAL MAYOR',NULL,NULL,'LGU'),('mayor_title','Municipal Mayor',NULL,NULL,'LGU'),('parent_lgu_formal_name',NULL,NULL,'text','ASSESSOR'),('parent_lgu_name',NULL,'Parent LGU Name','text','ASSESSOR'),('pin_autonumber','0',NULL,'checkbox','ASSESSOR'),('pin_parcel_lngth','2','The number of digits in pin parcel.','integer','ASSESSOR'),('pin_section_length','3','The number of digits in pin section.','integer','ASSESSOR'),('pin_type','new','PIN Formatting Type valid values: old or new','text','ASSESSOR'),('provincial_assessor_name',NULL,NULL,'text','ASSESSOR'),('provincial_assessor_title',NULL,NULL,'text','ASSESSOR'),('provincial_treasurer_name','AMELITA G. PACURIBOT',NULL,NULL,'TC'),('provincial_treasurer_title','PROVINCIAL TREASURER',NULL,NULL,'TC'),('pwd_change_cycle','1','No. of times the user cannot use a repeating password',NULL,'SYSTEM'),('pwd_change_date_interval','365M','No. of days/months before a user is required to change their password (d=days, M=months)',NULL,'SYSTEM'),('pwd_change_login_count','0','No. of times a user has successfully logged in before changing their password. (0=no limit) ',NULL,'SYSTEM'),('receipt_item_printout_count','10',NULL,NULL,'SYSTEM'),('rptbilling_assessed_value_fact_years','2002,2009',NULL,NULL,'LANDTAX'),('rptc_barangay_basic_rate','0.25',NULL,'decimal','LANDTAX'),('rptc_barangay_sef_rate','0.0',NULL,'decimal','LANDTAX'),('rptc_city_basic_rate','0.75',NULL,'decimal','LANDTAX'),('rptc_city_sef_rate','100.0',NULL,'decimal','LANXTAX'),('rptc_municipality_basic_rate','0.40',NULL,'decimal','LANDTAX'),('rptc_municipality_sef_rate','0.50',NULL,'decimal','LANDTAX'),('rptc_province_basic_rate','0.35',NULL,'decimal','LANDTAX'),('rptc_province_sef_rate','0.50',NULL,'decimal','LANDTAX'),('rpt_round_to_ten_item_ssessed_value','0',NULL,'checkbox','ASSESSOR'),('sangguinan_name','SANGGUNIANG PANLUNGSOD','sangguinian name','text','ASSESSOR'),('sa_pwd','dc697d45520a7b0fbce51d211d4b7ec8',NULL,NULL,NULL),('secretary_name',NULL,NULL,NULL,NULL),('secretary_title',NULL,NULL,NULL,NULL),('server_timezone','Asia/Shanghai','this must be matched with default timezone of server',NULL,NULL),('session_timeout_interval','1d ','expiry dates of inactive session (d=days, h=hours)',NULL,'SYSTEM'),('subdivision_allow_equal_area_only','1','Allow Subdivision with equal area only ','checkbox','ASSESSOR'),('system_pwd','!12345','system password',NULL,'SYSTEM'),('td_autonumber','true',NULL,'checkbox','ASSESSOR'),('td_autonumber_sequence_count','5',NULL,'integer','ASSESSOR'),('td_format','Y-B','Tax Declaration No. format. Options: Y- revision year, M-municipality index, C - city index, D-district index, B=-barangay index','text','ASSESSOR'),('td_report_display_recommendedby','0','Display Recommended by ',NULL,'ASSESSOR'),('td_report_displa_appraisedby','0',NULL,'checkbox','ASSESSOR'),('td_report_item_format','BLGF','Valid Values: BLGF or MODIFIED','text','ASSESSOR'),('td_show_landinfo_on_improvements','1','Show the land information such as boundary etc in the improvement tax declaration. Options: 1 - show; 0 - hide','checkbox','ASSESSOR'),('treasurer_name','',NULL,NULL,'TREASURY'),('treasurer_title','',NULL,NULL,'TREASURY'),('treasury_officename','OFFICE OF THE CITY TREASURER',NULL,NULL,'TREASURY'),('url_logo_assessor','http://localhost/downloads/images/assessor.png','ASSESSOR URL LOG',NULL,'ASSESSOR'),('url_logo_lgu','http://localhost/downloads/images/lgu.png','ogo path',NULL,'LGU'),('url_logo_treasury','http://localhost/downloads/images/treasury.png','TREASURY LOGO',NULL,'TREASURY');
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-27 11:00:44
