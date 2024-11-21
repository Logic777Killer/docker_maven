FROM openjdk:11

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_VERSION 3.8.2
ENV PATH $MAVEN_HOME/bin:$PATH

RUN apt-get update \
    && apt-get install -y maven \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN mvn clean install
CMD ["java", "-jar", "target/myapp-1.0-SNAPSHOT.jar"]

