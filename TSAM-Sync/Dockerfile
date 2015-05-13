# A Dockerfile to build am openNCP TSAM syncronizer
FROM java:7-jre

MAINTAINER Alexandre Santos <ajvsms@gmail.com>

# The list of artifacts that are needed to the openNCP and the latest version
ENV TSAM_SYNC_VERSION 7.4.0
ENV TSAM_HOME /opt/tsam-sync
ENV PATH $TSAM_HOME:$PATH
ENV EPSOS_PROPS_PATH $TSAM_HOME/conf/

RUN mkdir -p "$TSAM_HOME"
WORKDIR $TSAM_HOME

COPY ./tsam-sync.tar.gz $TSAM_HOME/
RUN tar -xvf tsam-sync.tar.gz --strip-components=1 \
    && rm tsam-sync.tar.gz

RUN echo -n | openssl s_client -connect ecrtsppt.conet-services.de:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > conet-services.de.cert \
    && keytool -import -trustcacerts -file conet-services.de.cert -alias tsam-server -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts -storepass changeit -noprompt \
    && rm conet-services.de.cert

COPY ./docker-entrypoint.sh $TSAM_HOME/

CMD ["docker-entrypoint.sh"]
