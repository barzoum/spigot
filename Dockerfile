FROM alpine
LABEL version=1
LABEL date=2019-01-10
RUN apk update && apk add \
 git \
 openjdk8 \
 wget &&\
 mkdir minecraft &&\
 wget "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -O minecraft/BuildTools.jar && \
 (git config --global --unset core.autocrlf; exit 0) &&\
 java -Xmx2G -jar minecraft/BuildTools.jar --rev 1.12.2 &&\
 rm -r Bukkit &&\
 rm -r CraftBukkit &&\
 rm -r Spigot &&\
 rm -r BuildData &&\
 rm -r apache-maven-3.* &&\
 rm -r work &&\
 rm craftbukkit-1.12.2.jar &&\
 rm -r minecraft &&\
 apk del git wget &&\
 rm -r /var/cache/apk/* &&\
 echo "eula=true" > eula.txt 
# &&\ mkdir plugins
#ADD Tutorial.jar /plugins/Tutorial.jar
CMD [ "java", "-Xms1G", "-Xmx1G", "-jar", "spigot-1.12.2.jar", "nogui"]
EXPOSE 25565