FROM debian
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  git \
  openjdk-11-jre-headless \
  wget

RUN mkdir /srv/spigot
RUN mkdir /srv/data

WORKDIR /srv/spigot
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN /usr/bin/java -jar BuildTools.jar

WORKDIR /srv/data
CMD ["/usr/bin/java", "-jar", "/srv/spigot/spigot-1.15.jar"]

