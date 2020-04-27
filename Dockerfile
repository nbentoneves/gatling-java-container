FROM openjdk:8-jdk-slim

ARG SIMULATION
ARG VERSION=1.0-SNAPSHOT
ARG JAR_FILE=target/gatling-docker-swarm-${VERSION}.jar

WORKDIR /var/app/gatling

ENV SIMULATION_ENV=${SIMULATION}

COPY ${JAR_FILE} app.jar

ENTRYPOINT java -cp app.jar io.gatling.app.Gatling -s ${SIMULATION_ENV}