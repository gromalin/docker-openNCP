#!/bin/bash
set -e

echo webservice.url=$WEBSERVICE_URL >> $TSAM_HOME/conf/settings.properties
echo webservice.user=$WEBSERVICE_USER >> $TSAM_HOME/conf/settings.properties
echo webservice.password=$WEBSERVICE_PASSWORD >> $TSAM_HOME/conf/settings.properties
echo sync.countrycode=$SYNC_COUNTRYCODE >> $TSAM_HOME/conf/settings.properties

$TSAM_HOME/sync.sh
