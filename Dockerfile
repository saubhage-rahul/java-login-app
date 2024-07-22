FROM ubuntu:22.04
MAINTAINER Rahul <rahulSaubhage555@gmail.com>
WORKDIR /opt
RUN apt update -y
RUN apt install zip -y && apt install unzip -y
RUN apt install default-jre -y
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.zip /opt/
RUN unzip /opt/apache-tomcat-9.0.91.zip
RUN mv /opt/apache-tomcat-9.0.91 /opt/tomcat-9
RUN chmod -R 777 /opt/tomcat-9/bin
COPY target/dptweb-1.0*.war /opt/tomcat-9/webapps/dptweb-1.0.war
CMD ["/opt/tomcat-9/bin/catalina.sh","run"]
