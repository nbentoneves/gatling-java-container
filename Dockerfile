FROM openjdk:8-jdk-slim

ARG SIMULATION
ARG VERSION=1.0-SNAPSHOT
ARG JAR_FILE=target/gatling-docker-swarm-${VERSION}.jar

WORKDIR /var/app/gatling

ENV SIMULATION_ENV=${SIMULATION}

COPY ${JAR_FILE} app.jar

# Add docker-compose-wait tool
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

CMD /wait && java -cp app.jar io.gatling.app.Gatling -s ${SIMULATION_ENV}