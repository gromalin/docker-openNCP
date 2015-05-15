Create a MariaDB container to hold the necessary databases:

    $ sudo docker run -d --name tsamdb -e MYSQL_ROOT_PASSWORD=password  mariadb:latest

Create a file (env.list) with the Environment variables used in the TSAM

    WEBSERVICE_URL=https://ecrtsppt.conet-services.de/webservice/commonTerminologyService2.0
    WEBSERVICE_USER=username
    WEBSERVICE_PASSWORD=password

    # Specify the country code that the synchronizer will use to localize the last sync date for.
    SYNC_COUNTRYCODE=pt
    
    # Database password
    MYSQL_ENV_MYSQL_ROOT_PASSWORD=password

Create a container linking it to the database and passing the variables from the env.list file

    $ sudo docker run -d --name tsam --link tsamdb:tsamdb --env-file ./env.list openncp-tsam:7.4.0
