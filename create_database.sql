# Configure some variables
SET @@SQL_MODE = REPLACE(@@SQL_MODE, 'NO_AUTO_CREATE_USER', '');
SET @EPSOS_PROPS_PATH = '/usr/local/tomcat/epsos-configuration';
SET @JKS_PASSWORD = 'spirit';


CREATE DATABASE eadc;
GRANT ALL ON eadc.* TO eadc IDENTIFIED BY 'eadc.Pass';

CREATE DATABASE epsos_properties;
GRANT ALL ON epsos_properties.* TO epsos IDENTIFIED BY 'epsos.Pass';

CREATE DATABASE hcer;
GRANT ALL ON hcer.* TO hcer IDENTIFIED BY 'hcer.Pass';

CREATE DATABASE ltrdb;
GRANT ALL ON ltrdb.* TO tsam IDENTIFIED BY 'tsam.Pass';

CREATE DATABASE openatna;
GRANT ALL ON openatna.* TO openatna IDENTIFIED BY 'openatna.Pass';

DROP TABLE IF EXISTS `epsos_properties`.`property`;

CREATE TABLE `epsos_properties`.`property` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB;

INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('audit.repository.port','2862');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('audit.repository.url','localhost');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('audit.time.to.try','60000');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('auditrep.forcewrite','TRUE');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('AUDIT_DUMP_PATH','audits/');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('automated.validation','false');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('certificates.storepath',concat(@EPSOS_PROPS_PATH, '/temp/'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('COUNTRY_CODE','PT');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('COUNTRY_NAME','Portugal');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('COUNTRY_PRINCIPAL_SUBDIVISION','PT-1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('DGST_ALG_PROP','http://www.w3.org/2000/09/xmldsig#sha1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('HOME_COMM_ID','2.16.17.710.820.1000.990.1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('javax.net.ssl.key.alias','epsos.min-saude.pt_1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('javax.net.ssl.keyStore',concat(@EPSOS_PROPS_PATH, '/cert/PPT/ppt.epsos.pt.jks'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('javax.net.ssl.keyStorePassword',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('javax.net.ssl.privateKeyPassword',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('javax.net.ssl.trustStore',CONCAT(@EPSOS_PROPS_PATH, '/cert/PPT/truststore.jks'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('javax.net.ssl.trustStorePassword',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('LANGUAGE_CODE','pt-PT');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('ncp.countries','lu,pt');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('ncp.country','PT');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('ncp.email','openncp@spms.min-saude.pt');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('NCP_SIG_KEYSTORE_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('NCP_SIG_KEYSTORE_PATH',concat(@EPSOS_PROPS_PATH, '/cert/PPT/sign.ppt.epsos.pt.jks'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('NCP_SIG_PRIVATEKEY_ALIAS','sign.ppt.epsos.pt');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('NCP_SIG_PRIVATEKEY_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SC_KEYSTORE_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SC_KEYSTORE_PATH',concat(@EPSOS_PROPS_PATH, '/cert/PPT/ppt.epsos.pt.jks'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SC_PRIVATEKEY_ALIAS','epsos.min-saude.pt_1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SC_PRIVATEKEY_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.cert.validator.checkforcrldp','false');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.cert.validator.checkforkeyusage','false');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.digest.algorithm.default','http://www.w3.org/2000/09/xmldsig#sha1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.signature.algorithm.default','http://www.w3.org/2001/04/xmldsig-more#rsa-sha256');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.sts.checkHostname','false');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.sts.url','http://openncp:8080/TRC-STS/STSServiceService');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('secman.trc.endpoint','urn:initgw:countryB');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SERVER_IP','openncp');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SIG_ALG_PROP','http://www.w3.org/2000/09/xmldsig#rsa-sha1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SP_KEYSTORE_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SP_KEYSTORE_PATH',concat(@EPSOS_PROPS_PATH, '/cert/PPT/ppt.epsos.pt.jks'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SP_PRIVATEKEY_ALIAS','epsos.min-saude.pt_1');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('SP_PRIVATEKEY_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('TRUSTSTORE_PASSWORD',@JKS_PASSWORD);
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('TRUSTSTORE_PATH',concat(@EPSOS_PROPS_PATH, '/cert/PPT/truststore.jks'));
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('tsl.location.lu','https://ecrtsppt.conet-services.de:8445/NCP_Service_Status_List__Luxembourg_LU_.xml');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('tsl.location.pt','https://ecrtsppt.conet-services.de:8445/NCP_Service_Status_List__Portugal_PT_.xml');
INSERT INTO `epsos_properties`.`property` (`name`,`value`) VALUES ('WRITE_TEST_AUDITS','false');
