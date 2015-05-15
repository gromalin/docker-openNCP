# A Dockerfile to build am openNCP TSAM syncronizer
FROM java:7-jre

MAINTAINER Alexandre Santos <ajvsms@gmail.com>

# The list of artifacts that are needed to the openNCP and the latest version
ENV TSAM_SYNC_VERSION 7.4.0
ENV TSAM_HOME /opt/tsam-sync
ENV PATH $TSAM_HOME:$PATH
ENV EPSOS_PROPS_PATH $TSAM_HOME/conf/

WORKDIR $TSAM_HOME

RUN apt-get update \
    && apt-get install -y mariadb-client

RUN mkdir -p "$TSAM_HOME"

RUN wget https://openncp.atlassian.net/wiki/download/attachments/11075686/tsam-sync.tar.gz \
    && tar -xvf tsam-sync.tar.gz --strip-components=1 \
    && rm tsam-sync.tar.gz \
    && wget https://joinup.ec.europa.eu/nexus/content/repositories/releases/eu/europa/ec/joinup/ecc/epsos-tsam-sync/${TSAM_SYNC_VERSION}/epsos-tsam-sync-${TSAM_SYNC_VERSION}.jar

RUN echo -n | openssl s_client -connect ecrtsppt.conet-services.de:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > conet-services.de.cert \
    && keytool -import -trustcacerts -file conet-services.de.cert -alias tsam-server -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -storepass changeit -noprompt \
    && rm conet-services.de.cert

COPY ./create_tsam_database.sql $TSAM_HOME/
COPY ./docker-entrypoint.sh $TSAM_HOME/

CMD ["docker-entrypoint.sh"]
