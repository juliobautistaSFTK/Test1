docker exec mariadb_1 bash -c "apt-get update && apt-get install -y mysql-client"
sleep 30
docker exec -i mariadb_1 mysql -u root -p12345678 taskmanager < CreateSQLtask.sql
sleep 5
docker exec maven-java8-container mvn clean install -DskipTests
sleep 5
docker cp maven-java8-container:/app/target/TaskManager.war target/
sleep 5
docker cp target/TaskManager.war my-tomcat-container:/usr/local/tomcat/webapps/TaskManager.war
