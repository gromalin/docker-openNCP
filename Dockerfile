# A Dockerfile to build am openNCP container
FROM tomcat:7-jre7

MAINTAINER Alexandre Santos <ajvsms@gmail.com>

# The list of artifacts that are needed to the openNCP and the latest version
ENV TRC_STS_VERSION 2.1.2
ENV TSL_SYNC_VERSION 2.8.9
ENV TSAM_SYNC_VERSION 7.4.0
ENV NCP_A_VERSION 3.5.0
ENV NCP_B_VERSION 3.5.0
ENV OPENATNA_VERSION 2.0.2

RUN apt-get update \
		&& apt-get install -y libtcnative-1 unzip zip libcommons-dbcp-java \
		&& ln -s /usr/share/java/*.jar ${CATALINA_HOME}/lib/

RUN wget -O TRC-STS.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-trc-sts/${TRC_STS_VERSION}/epsos-trc-sts-${TRC_STS_VERSION}.war \
    && wget -O epsos-tsl-sync.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-tslutils/epsos-tsl-sync/${TSL_SYNC_VERSION}/epsos-tsl-sync-${TSL_SYNC_VERSION}.war \
    && wget -O epsos-ws-server.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-protocol-terminators/epsos-ncp-server/epsos-ws-server/${NCP_A_VERSION}/epsos-ws-server-${NCP_A_VERSION}.war \
    && wget -O epsos-client-connector.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-protocol-terminators/epsos-ncp-client/epsos-client-connector/${NCP_B_VERSION}/epsos-client-connector-${NCP_B_VERSION}.war \
    && wget -O openatna-web.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-openatna/openatna-web/${OPENATNA_VERSION}/openatna-web-${OPENATNA_VERSION}.war \
    && wget -O slf4j-1.6.1.zip http://www.slf4j.org/dist/slf4j-1.6.1.zip

RUN unzip slf4j-1.6.1.zip  \
    && mkdir -p WEB-INF/lib \
    && cp slf4j-1.6.1/slf4j-api-1.6.1.jar WEB-INF/lib \
    && cp slf4j-1.6.1/slf4j-simple-1.6.1.jar WEB-INF/lib \
    && zip -d openatna-web.war /WEB-INF/lib/slf4j-api-1.4.3.jar /WEB-INF/lib/slf4j-simple-1.4.3.jar \
    && zip openatna-web.war WEB-INF/lib/slf4j-api-1.6.1.jar WEB-INF/lib/slf4j-simple-1.6.1.jar \
    && rm -rf slf4j-1.6.1* WEB-INF \
    && mv *.war ${CATALINA_HOME}/webapps/

RUN echo -n | openssl s_client -connect ecrtsppt.conet-services.de:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > conet-services.de.cert \
    && keytool -import -trustcacerts -file conet-services.de.cert -alias tsam-server -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -storepass changeit -noprompt \
    && rm conet-services.de.cert
