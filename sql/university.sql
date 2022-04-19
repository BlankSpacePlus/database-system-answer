DROP DATABASE IF EXISTS `university`;

CREATE DATABASE `university`;

USE `university`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advisor
-- ----------------------------
DROP TABLE IF EXISTS `advisor`;
CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`s_ID`),
  KEY `i_ID` (`i_ID`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of advisor
-- ----------------------------
INSERT INTO `advisor` VALUES ('12345', '10101');
INSERT INTO `advisor` VALUES ('44553', '22222');
INSERT INTO `advisor` VALUES ('45678', '22222');
INSERT INTO `advisor` VALUES ('00128', '45565');
INSERT INTO `advisor` VALUES ('76543', '45565');
INSERT INTO `advisor` VALUES ('23121', '76543');
INSERT INTO `advisor` VALUES ('98988', '76766');
INSERT INTO `advisor` VALUES ('76653', '98345');
INSERT INTO `advisor` VALUES ('98765', '98345');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `building` varchar(15) NOT NULL,
  `room_number` varchar(7) NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('Packard', '101', '500');
INSERT INTO `classroom` VALUES ('Painter', '514', '10');
INSERT INTO `classroom` VALUES ('Taylor', '3128', '70');
INSERT INTO `classroom` VALUES ('Watson', '100', '30');
INSERT INTO `classroom` VALUES ('Watson', '120', '50');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('BIO-101', 'Intro. to Biology', 'Biology', '4');
INSERT INTO `course` VALUES ('BIO-301', 'Genetics', 'Biology', '4');
INSERT INTO `course` VALUES ('BIO-399', 'Computational Biology', 'Biology', '3');
INSERT INTO `course` VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
INSERT INTO `course` VALUES ('CS-190', 'Game Design', 'Comp. Sci.', '4');
INSERT INTO `course` VALUES ('CS-315', 'Robotics', 'Comp. Sci.', '3');
INSERT INTO `course` VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
INSERT INTO `course` VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
INSERT INTO `course` VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
INSERT INTO `course` VALUES ('FIN-201', 'Investment Banking', 'Finance', '3');
INSERT INTO `course` VALUES ('HIS-351', 'World History', 'History', '3');
INSERT INTO `course` VALUES ('MU-199', 'Music Video Production', 'Music', '3');
INSERT INTO `course` VALUES ('PHY-101', 'Physical Principles', 'Physics', '4');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('Biology', 'Watson', '90000.00');
INSERT INTO `department` VALUES ('Comp. Sci.', 'Taylor', '100000.00');
INSERT INTO `department` VALUES ('Elec. Eng.', 'Taylor', '85000.00');
INSERT INTO `department` VALUES ('Finance', 'Painter', '120000.00');
INSERT INTO `department` VALUES ('History', 'Painter', '50000.00');
INSERT INTO `department` VALUES ('Music', 'Packard', '80000.00');
INSERT INTO `department` VALUES ('Physics', 'Watson', '70000.00');

-- ----------------------------
-- Table structure for instructor
-- ----------------------------
DROP TABLE IF EXISTS `instructor`;
CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of instructor
-- ----------------------------
INSERT INTO `instructor` VALUES ('10101', 'Srinivasan', 'Comp. Sci.', '65000.00');
INSERT INTO `instructor` VALUES ('12121', 'Wu', 'Finance', '90000.00');
INSERT INTO `instructor` VALUES ('15151', 'Mozart', 'Music', '40000.00');
INSERT INTO `instructor` VALUES ('22222', 'Einstein', 'Physics', '95000.00');
INSERT INTO `instructor` VALUES ('32343', 'El Said', 'History', '60000.00');
INSERT INTO `instructor` VALUES ('33456', 'Gold', 'Physics', '87000.00');
INSERT INTO `instructor` VALUES ('45565', 'Katz', 'Comp. Sci.', '75000.00');
INSERT INTO `instructor` VALUES ('58583', 'Califieri', 'History', '62000.00');
INSERT INTO `instructor` VALUES ('76543', 'Singh', 'Finance', '80000.00');
INSERT INTO `instructor` VALUES ('76766', 'Crick', 'Biology', '72000.00');
INSERT INTO `instructor` VALUES ('83821', 'Brandt', 'Comp. Sci.', '92000.00');
INSERT INTO `instructor` VALUES ('98345', 'Kim', 'Elec. Eng.', '80000.00');

-- ----------------------------
-- Table structure for prereq
-- ----------------------------
DROP TABLE IF EXISTS `prereq`;
CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of prereq
-- ----------------------------
INSERT INTO `prereq` VALUES ('BIO-301', 'BIO-101');
INSERT INTO `prereq` VALUES ('BIO-399', 'BIO-101');
INSERT INTO `prereq` VALUES ('CS-190', 'CS-101');
INSERT INTO `prereq` VALUES ('CS-315', 'CS-101');
INSERT INTO `prereq` VALUES ('CS-319', 'CS-101');
INSERT INTO `prereq` VALUES ('CS-347', 'CS-101');
INSERT INTO `prereq` VALUES ('EE-181', 'PHY-101');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `time_slot_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `building` (`building`,`room_number`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B');
INSERT INTO `section` VALUES ('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A');
INSERT INTO `section` VALUES ('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H');
INSERT INTO `section` VALUES ('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F');
INSERT INTO `section` VALUES ('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E');
INSERT INTO `section` VALUES ('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A');
INSERT INTO `section` VALUES ('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D');
INSERT INTO `section` VALUES ('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B');
INSERT INTO `section` VALUES ('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C');
INSERT INTO `section` VALUES ('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A');
INSERT INTO `section` VALUES ('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C');
INSERT INTO `section` VALUES ('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B');
INSERT INTO `section` VALUES ('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C');
INSERT INTO `section` VALUES ('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D');
INSERT INTO `section` VALUES ('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('00128', 'Zhang', 'Comp. Sci.', '102');
INSERT INTO `student` VALUES ('12345', 'Shankar', 'Comp. Sci.', '32');
INSERT INTO `student` VALUES ('19991', 'Brandt', 'History', '80');
INSERT INTO `student` VALUES ('23121', 'Chavez', 'Finance', '110');
INSERT INTO `student` VALUES ('44553', 'Peltier', 'Physics', '56');
INSERT INTO `student` VALUES ('45678', 'Levy', 'Physics', '46');
INSERT INTO `student` VALUES ('54321', 'Williams', 'Comp. Sci.', '54');
INSERT INTO `student` VALUES ('55739', 'Sanchez', 'Music', '38');
INSERT INTO `student` VALUES ('70557', 'Snow', 'Physics', '0');
INSERT INTO `student` VALUES ('76543', 'Brown', 'Comp. Sci.', '58');
INSERT INTO `student` VALUES ('76653', 'Aoi', 'Elec. Eng.', '60');
INSERT INTO `student` VALUES ('98765', 'Bourikas', 'Elec. Eng.', '98');
INSERT INTO `student` VALUES ('98988', 'Tanaka', 'Biology', '120');

-- ----------------------------
-- Table structure for takes
-- ----------------------------
DROP TABLE IF EXISTS `takes`;
CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of takes
-- ----------------------------
INSERT INTO `takes` VALUES ('00128', 'CS-101', '1', 'Fall', '2009', 'A');
INSERT INTO `takes` VALUES ('00128', 'CS-347', '1', 'Fall', '2009', 'A-');
INSERT INTO `takes` VALUES ('12345', 'CS-101', '1', 'Fall', '2009', 'C');
INSERT INTO `takes` VALUES ('12345', 'CS-190', '2', 'Spring', '2009', 'A');
INSERT INTO `takes` VALUES ('12345', 'CS-315', '1', 'Spring', '2010', 'A');
INSERT INTO `takes` VALUES ('12345', 'CS-347', '1', 'Fall', '2009', 'A');
INSERT INTO `takes` VALUES ('19991', 'HIS-351', '1', 'Spring', '2010', 'B');
INSERT INTO `takes` VALUES ('23121', 'FIN-201', '1', 'Spring', '2010', 'C+');
INSERT INTO `takes` VALUES ('44553', 'PHY-101', '1', 'Fall', '2009', 'B-');
INSERT INTO `takes` VALUES ('45678', 'CS-101', '1', 'Fall', '2009', 'F');
INSERT INTO `takes` VALUES ('45678', 'CS-101', '1', 'Spring', '2010', 'B+');
INSERT INTO `takes` VALUES ('45678', 'CS-319', '1', 'Spring', '2010', 'B');
INSERT INTO `takes` VALUES ('54321', 'CS-101', '1', 'Fall', '2009', 'A-');
INSERT INTO `takes` VALUES ('54321', 'CS-190', '2', 'Spring', '2009', 'B+');
INSERT INTO `takes` VALUES ('55739', 'MU-199', '1', 'Spring', '2010', 'A-');
INSERT INTO `takes` VALUES ('76543', 'CS-101', '1', 'Fall', '2009', 'A');
INSERT INTO `takes` VALUES ('76543', 'CS-319', '2', 'Spring', '2010', 'A');
INSERT INTO `takes` VALUES ('76653', 'EE-181', '1', 'Spring', '2009', 'C');
INSERT INTO `takes` VALUES ('98765', 'CS-101', '1', 'Fall', '2009', 'C-');
INSERT INTO `takes` VALUES ('98765', 'CS-315', '1', 'Spring', '2010', 'B');
INSERT INTO `takes` VALUES ('98988', 'BIO-101', '1', 'Summer', '2009', 'A');
INSERT INTO `takes` VALUES ('98988', 'BIO-301', '1', 'Summer', '2010', null);

-- ----------------------------
-- Table structure for teaches
-- ----------------------------
DROP TABLE IF EXISTS `teaches`;
CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of teaches
-- ----------------------------
INSERT INTO `teaches` VALUES ('76766', 'BIO-101', '1', 'Summer', '2009');
INSERT INTO `teaches` VALUES ('76766', 'BIO-301', '1', 'Summer', '2010');
INSERT INTO `teaches` VALUES ('10101', 'CS-101', '1', 'Fall', '2009');
INSERT INTO `teaches` VALUES ('45565', 'CS-101', '1', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('83821', 'CS-190', '1', 'Spring', '2009');
INSERT INTO `teaches` VALUES ('83821', 'CS-190', '2', 'Spring', '2009');
INSERT INTO `teaches` VALUES ('10101', 'CS-315', '1', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('45565', 'CS-319', '1', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('83821', 'CS-319', '2', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('10101', 'CS-347', '1', 'Fall', '2009');
INSERT INTO `teaches` VALUES ('98345', 'EE-181', '1', 'Spring', '2009');
INSERT INTO `teaches` VALUES ('12121', 'FIN-201', '1', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('32343', 'HIS-351', '1', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('15151', 'MU-199', '1', 'Spring', '2010');
INSERT INTO `teaches` VALUES ('22222', 'PHY-101', '1', 'Fall', '2009');

-- ----------------------------
-- Table structure for time_slot
-- ----------------------------
DROP TABLE IF EXISTS `time_slot`;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of time_slot
-- ----------------------------
INSERT INTO `time_slot` VALUES ('A', 'F', '8', '0', '8', '50');
INSERT INTO `time_slot` VALUES ('A', 'M', '8', '0', '8', '50');
INSERT INTO `time_slot` VALUES ('A', 'W', '8', '0', '8', '50');
INSERT INTO `time_slot` VALUES ('B', 'F', '9', '0', '9', '50');
INSERT INTO `time_slot` VALUES ('B', 'M', '9', '0', '9', '50');
INSERT INTO `time_slot` VALUES ('B', 'W', '9', '0', '9', '50');
INSERT INTO `time_slot` VALUES ('C', 'F', '11', '0', '11', '50');
INSERT INTO `time_slot` VALUES ('C', 'M', '11', '0', '11', '50');
INSERT INTO `time_slot` VALUES ('C', 'W', '11', '0', '11', '50');
INSERT INTO `time_slot` VALUES ('D', 'F', '13', '0', '13', '50');
INSERT INTO `time_slot` VALUES ('D', 'M', '13', '0', '13', '50');
INSERT INTO `time_slot` VALUES ('D', 'W', '13', '0', '13', '50');
INSERT INTO `time_slot` VALUES ('E', 'R', '10', '30', '11', '45');
INSERT INTO `time_slot` VALUES ('E', 'T', '10', '30', '11', '45');
INSERT INTO `time_slot` VALUES ('F', 'R', '14', '30', '15', '45');
INSERT INTO `time_slot` VALUES ('F', 'T', '14', '30', '15', '45');
INSERT INTO `time_slot` VALUES ('G', 'F', '16', '0', '16', '50');
INSERT INTO `time_slot` VALUES ('G', 'M', '16', '0', '16', '50');
INSERT INTO `time_slot` VALUES ('G', 'W', '16', '0', '16', '50');
INSERT INTO `time_slot` VALUES ('H', 'W', '10', '0', '12', '30');
