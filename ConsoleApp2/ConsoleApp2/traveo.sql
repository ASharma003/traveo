/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.3.16-MariaDB : Database - traveo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`traveo` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `courses` */

CREATE TABLE `courses` (
  `CourseId` int(11) unsigned NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  PRIMARY KEY (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `courses` */

insert  into `courses`(`CourseId`,`CourseName`) values (101,'English'),(102,'Mathematics'),(103,'Physics'),(104,'Chemistry'),(105,'Political Science'),(106,'History'),(107,'Computer Administration'),(108,'Geography');

/*Table structure for table `professors` */

CREATE TABLE `professors` (
  `ProfessorId` int(11) unsigned NOT NULL,
  `ProfessorName` varchar(100) NOT NULL,
  `CourseId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ProfessorId`),
  KEY `Professors_CoursesId` (`CourseId`),
  CONSTRAINT `Professors_CoursesId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `professors` */

insert  into `professors`(`ProfessorId`,`ProfessorName`,`CourseId`) values (1,'Anil',101),(2,'Anil',106),(3,'Anil',105),(4,'Suresh',103),(5,'Suresh',102),(6,'Mohan',107),(7,'Mohan',104),(8,'Abhay',108);

/*Table structure for table `studentenrollment` */

CREATE TABLE `studentenrollment` (
  `StudentEnrollmentId` int(11) unsigned NOT NULL,
  `StudentId` int(11) unsigned NOT NULL,
  `CourseId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`StudentEnrollmentId`),
  KEY `StudentEnrollment_StudentId` (`StudentId`),
  KEY `StudentEnrollment_CourseId` (`CourseId`),
  CONSTRAINT `StudentEnrollment_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`),
  CONSTRAINT `StudentEnrollment_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `students` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `studentenrollment` */

insert  into `studentenrollment`(`StudentEnrollmentId`,`StudentId`,`CourseId`) values (1,1,101),(2,2,101),(3,2,104),(4,3,103),(5,3,101),(6,3,107),(7,4,105),(8,4,106),(9,4,102),(10,5,103),(11,5,107),(12,6,108),(13,7,108),(14,7,103),(15,7,105),(16,8,104),(17,9,104),(18,9,101),(19,10,102),(20,10,106);

/*Table structure for table `students` */

CREATE TABLE `students` (
  `StudentId` int(11) unsigned NOT NULL,
  `StudentName` varchar(11) NOT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `students` */

insert  into `students`(`StudentId`,`StudentName`) values (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'I'),(10,'j');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
