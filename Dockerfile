# A Dockerfile to build am openNCP container
FROM tomcat:7-jre7

MAINTAINER Thomas DAVID <thomas.david@mines.org>
# From the work of Alexandre Santos

# The list of artifacts that are needed to the openNCP and the latest version
ENV TRC_STS_VERSION 2.3.2
ENV TSL_SYNC_VERSION 3.1.5
ENV NCP_A_VERSION 3.5.4
ENV NCP_B_VERSION 3.5.4
ENV OPENATNA_VERSION 2.0.4
ENV http_proxy http://proxy83.intranet.sante.gouv.fr:8080

RUN wget -O TRC-STS.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-trc-sts/${TRC_STS_VERSION}/epsos-trc-sts-${TRC_STS_VERSION}.war \
    && wget -O epsos-tsl-sync.jar https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-tslutils/epsos-tsl-sync/${TSL_SYNC_VERSION}/epsos-tsl-sync-${TSL_SYNC_VERSION}.jar \
    && wget -O epsos-ws-server.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-protocol-terminators/epsos-ncp-server/epsos-ws-server/${NCP_A_VERSION}/epsos-ws-server-${NCP_A_VERSION}.war \
    && wget -O epsos-client-connector.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-protocol-terminators/epsos-ncp-client/epsos-client-connector/${NCP_B_VERSION}/epsos-client-connector-${NCP_B_VERSION}.war \
    && wget -O openatna-web.war https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-openatna/openatna-web/${OPENATNA_VERSION}/openatna-web-${OPENATNA_VERSION}.war \
    && wget -O slf4j-1.6.1.zip http://www.slf4j.org/dist/slf4j-1.6.1.zip


RUN apt-get update \
		&& apt-get install -y libtcnative-1 unzip zip libcommons-dbcp-java \
		&& ln -s /usr/share/java/*.jar ${CATALINA_HOME}/lib/

RUN unzip slf4j-1.6.1.zip  \
    && mkdir -p WEB-INF/lib \
    && cp slf4j-1.6.1/slf4j-api-1.6.1.jar WEB-INF/lib \
    && cp slf4j-1.6.1/slf4j-simple-1.6.1.jar WEB-INF/lib \
    && zip -d openatna-web.war /WEB-INF/lib/slf4j-api-1.4.3.jar /WEB-INF/lib/slf4j-simple-1.4.3.jar \
    && zip openatna-web.war WEB-INF/lib/slf4j-api-1.6.1.jar WEB-INF/lib/slf4j-simple-1.6.1.jar \
    && rm -rf slf4j-1.6.1* WEB-INF \
    && mv *.war ${CATALINA_HOME}/webapps/

ADD tomcat-users.xml /usr/local/tomcat/conf/

