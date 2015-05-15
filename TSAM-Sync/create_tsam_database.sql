CREATE DATABASE IF NOT EXISTS epsos_properties CHARACTER SET utf8;
GRANT ALL ON epsos_properties.* TO epsos IDENTIFIED BY 'epsos.Pass';

CREATE DATABASE IF NOT EXISTS ltrdb CHARACTER SET utf8;
GRANT ALL ON ltrdb.* TO tsam IDENTIFIED BY 'tsam.Pass';

CREATE TABLE IF NOT EXISTS `epsos_properties`.`property` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;
