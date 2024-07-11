CREATE TABLE `Users` (
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `contact` bigint(10) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
)

INSERT INTO `Users` VALUES ('suvan','Suvan Banerjee','DSCE','Banglore',123456789,19,'Male');

CREATE TABLE `Logins` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  FOREIGN KEY (`username`) REFERENCES `Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
)

INSERT INTO `Logins` VALUES ('suvan','admin');

CREATE TABLE `Passengers` (
  `pnr` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `train_no` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`pnr`),
  FOREIGN KEY (`username`) REFERENCES `Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`train_no`) REFERENCES `Trains` (`train_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) AUTO_INCREMENT=123460

CREATE TABLE `Stations` (
  `train_no` bigint(10) NOT NULL,
  `mumbai` tinyint(1) NOT NULL,
  `ahmedabad` tinyint(1) DEFAULT NULL,
  `jaipur` tinyint(1) DEFAULT NULL,
  `delhi` tinyint(1) DEFAULT NULL,
  `end_station` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`train_no`),
  FOREIGN KEY (`train_no`) REFERENCES `Trains` (`train_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
)

INSERT INTO `Stations` VALUES 
(1021,1,0,1,1,'Delhi'),
(1233,0,0,1,1,'Jaipur'),
(1678,1,1,1,0,'Jaipur'),
(2335,1,0,0,1,'Mumbai'),
(4513,1,1,1,1,'Delhi'),
(4566,0,1,1,0,'Jaipur'),
(5677,0,1,1,1,'Delhi'),
(5785,0,1,0,1,'Ahmedabad'),
(6245,1,1,1,0,'Mumbai'),
(9815,0,1,1,0,'Ahmedabad');

CREATE TABLE `Trains` (
  `train_no` bigint(10) NOT NULL,
  `train_name` varchar(45) NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `monday` int(11) DEFAULT '600',
  `tuesday` int(11) DEFAULT '600',
  `wednesday` int(11) DEFAULT '600',
  `cost` int(11) DEFAULT '500',
  PRIMARY KEY (`train_no`)
)

INSERT INTO `Trains` VALUES 
(1021,'Duronto','Mumbai','Delhi',590,597,598,650),
(1233,'Rajkalyan Express','Delhi','Jaipur',600,600,600,800),
(1678,'Kalyani Express','Mumbai','Jaipur',600,597,600,800),
(2335,'Nizauddin Express','Delhi','Mumbai',600,600,600,600),
(4513,'Rajdhani Express','Mumbai','Delhi',600,597,600,1000),
(4566,'Nazi Express','Ahmedabad','Jaipur',600,600,600,700),
(5677,'Krishna Express','Ahmedabad','Delhi',600,600,600,699),
(5785,'Gujarat Mail','Delhi','Ahmedabad',600,600,600,990),
(6245,'Rawal Express','Jaipur','Mumbai',600,600,600,720),
(9815,'Fazal','Jaipur','Ahmedabad',600,600,600,640);