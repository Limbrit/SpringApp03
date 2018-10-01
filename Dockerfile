From tomcat:8
COPY target/*.jar /usr/local/tomcat/webapps/
EXPOSE 8095