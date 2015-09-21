Create a MariaDB container to hold the necessary databases:

    $ sudo docker run -d -P --name tsamdb -e MYSQL_ROOT_PASSWORD=root.Pass -e MYSQL_DATABASE=ltrdb -e MYSQL_USER=tsam -e MYSQL_PASSWORD=tsam.Pass mysql:latest

Then populate the database with initial values:

    $ sudo docker run -it --link tsamdb:mysql --rm -v $(pwd)/insert_table.sql:/insert_table.sql mariadb:10 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" < /insert_table.sql
    
Create a file (env.list) with the Environment variables used in the TSAM

    WEBSERVICE_URL=https://ecrtsppt.conet-services.de/webservice/commonTerminologyService2.0
    WEBSERVICE_USER=username
    WEBSERVICE_PASSWORD=password

    # Specify the country code that the synchronizer will use to localize the last sync date for.
    SYNC_COUNTRYCODE=pt

Create a container linking it to the database and passing the variables from the env.list file

    $ sudo docker run -d --name tsam --link tsamdb:tsamdb --env-file ./env.list openncp-tsam:7.4.0
