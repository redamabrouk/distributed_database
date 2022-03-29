DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `TITLE` varchar(50) NOT NULL,
  `SAL` double DEFAULT NULL,
  PRIMARY KEY (`TITLE`)
);

DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `ENO` varchar(5) NOT NULL,
  `ENAME` varchar(45) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ENO`),
  KEY `L1_idx` (`TITLE`),
  CONSTRAINT `L1` FOREIGN KEY (`TITLE`) REFERENCES `pay` (`TITLE`)
);

DROP TABLE IF EXISTS `proj`;
CREATE TABLE `proj` (
  `PNO` varchar(5) NOT NULL,
  `PNAME` varchar(45) DEFAULT NULL,
  `BUDGET` double DEFAULT NULL,
  `LOC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PNO`)
);

DROP TABLE IF EXISTS `asg`;

CREATE TABLE `asg` (
  `ENO` varchar(5) DEFAULT NULL,
  `PNO` varchar(5) DEFAULT NULL,
  `RESP` varchar(45) DEFAULT NULL,
  `DUR` double DEFAULT NULL,
  KEY `L2_idx` (`ENO`),
  KEY `L3_idx` (`PNO`),
  CONSTRAINT `L2` FOREIGN KEY (`ENO`) REFERENCES `emp` (`ENO`),
  CONSTRAINT `L3` FOREIGN KEY (`PNO`) REFERENCES `proj` (`PNO`)
);


INSERT INTO `pay` VALUES 
('Elect. Eng.',40000),
('Mech. Eng.',27000),
('Programmer',24000),
('Syst. Anal.',34000);

INSERT INTO `emp` VALUES 
('E1','J. Doe','Elect. Eng.'),
('E2','M. Smith','Syst. Anal.'),
('E3','A. Lee','Mech. Eng.'),
('E4','J. Miller','Programmer'),
('E5','B. Casey','Syst. Anal.'),
('E6','L. Chu','Elect. Eng.'),
('E7','R. Davis','Mech. Eng.'),
('E8','J. Jones','Syst. Anal.');

INSERT INTO `proj` VALUES 
('P1','Instrumentation',150000,'Montreal'),
('P2','Database Develop.',135000,'New York'),
('P3','CAD/CAM',250000,'New York'),
('P4','Maintenance',310000,'Paris');

INSERT INTO `asg` VALUES 
('E1','P1','Manager',12),
('E2','P1','Analyst',24),
('E2','P2','Analyst',6),
('E3','P3','Consultant',10),
('E3','P4','Engineer',48),
('E4','P2','Programmer',18),
('E5','P2','Manager',24),
('E6','P4','Manager',48),
('E7','P3','Engineer',36),
('E8','P3','Manager',40);




