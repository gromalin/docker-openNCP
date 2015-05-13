Create a MariaDB container to hold the necessary databases:

    $ sudo docker run -d -P --name tsamdb -e MYSQL_ROOT_PASSWORD=password  mariadb:latest

Verify the status of the container and the port it is listening on the host.

    $ sudo docker ps
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                     NAMES
    66b87a674821        mariadb:latest      "/docker-entrypoint.   3 minutes ago       Up 3 minutes        0.0.0.0:32780->3306/tcp   db  

Use a mariadb client (or a MySQL gui one like Workbench) and execute the create_database.sql file.

    $ mysql -h0.0.0.0 -P32780 -uroot -proot.Pass < create_tsam_database.sql 

Create a file (env.list) with the Environment variables used in the TSAM

    WEBSERVICE_URL=https://ecrtsppt.conet-services.de/webservice/commonTerminologyService2.0
    WEBSERVICE_USER=username
    WEBSERVICE_PASSWORD=password

    # Specify the country code that the synchronizer will use to localize the last sync date for.
    SYNC_COUNTRYCODE=pt

Create the container for the openNCP TSAM Syncronizer

    $ sudo docker run -d --name tsam --link tsamdb:tsamdb --env-file ./env.list openncp-tsam:7.4.0

