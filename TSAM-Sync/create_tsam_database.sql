CREATE DATABASE epsos_properties;
GRANT ALL ON epsos_properties.* TO epsos IDENTIFIED BY 'epsos.Pass';

CREATE DATABASE ltrdb;
GRANT ALL ON ltrdb.* TO tsam IDENTIFIED BY 'tsam.Pass';

CREATE TABLE `epsos_properties`.`property` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;
