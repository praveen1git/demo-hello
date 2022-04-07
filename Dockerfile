FROM maven:3-jdk-8 as builder
RUN git clone https://github.com/praveen1git/gameoflifeondocker.git
RUN cd /gameoflifeondocker/game-of-life
WORKDIR /gameoflifeondocker/game-of-life
RUN mvn package


FROM tomcat:8
LABEL owner=none
EXPOSE 8080
COPY --from=builder /gameoflifeondocker/game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
CMD ["catalina.sh", "run"]
