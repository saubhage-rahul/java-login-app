FROM maven:3.8-jdk-11 as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:8.5
COPY --from=build /app/target/*.war /app/usr/local/tomcat/webapps/*.war
