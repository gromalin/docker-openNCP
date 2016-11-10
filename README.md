Credits : fork from the work of Alexander Santos https://github.com/alexsantos/docker-openNCP

Create a MariaDB container to hold the necessary databases:

    $ sudo docker run -d -P --name db -e MYSQL_ROOT_PASSWORD=password  mariadb:latest

Verify the status of the container and the port it is listening on the host.

    $ sudo docker ps
    CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                     NAMES
    66b87a674821        mariadb:latest      "/docker-entrypoint.   3 minutes ago       Up 3 minutes        0.0.0.0:32780->3306/tcp   db  

Use a mariadb client (or a MySQL gui one like Workbench) and execute the create_database.sql file.

    $ mysql -h0.0.0.0 -P32780 -uroot -ppassword < create_database.sql 

Create the container for the openNCP

    $ sudo docker run --rm --name test1 --link db:epsosdb -p 8080:8080  -e "JAVA_OPTS=-Djava.security.egd=file:/dev/./urandom"  -v $(pwd)/epsos-configuration:/usr/local/tomcat/epsos-configuration -v $(pwd)/tsam-sync:/opt/tsam-sync -v $(pwd)/context.xml:/usr/local/tomcat/conf/context.xml --hostname="openncp" --env EPSOS_PROPS_PATH=/usr/local/tomcat/epsos-configuration/ --env JAVA_OPTS="-Xms32m -Xmx384m -XX:MaxPermSize=256m -DopenATNA.properties.path=file:/usr/local/tomcat/epsos-configuration/ATNA_resources/openatna.properties" openncp:latest

Testing TRC-STS

  Try to access to http://127.0.0.1:8080/TRC-STS/STSServiceService
