FROM openjdk:17
RUN mkdir -p /home/calc_apps
COPY . /home/calc_apps
WORKDIR /home/calc_apps
ENTRYPOINT ["java","-jar","target/calculatorDevops-1.0-SNAPSHOT-jar-with-dependencies.jar"]
