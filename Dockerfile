from alpine
env VERSION=1.9.4
run apk --no-cache add openjdk8-jre-base bash curl git \
# binary needs to be seperated from /data for uprades
  && mkdir /minecraft /data \
  && curl -L https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar > /minecraft/BuildTools.jar \
#  && curl -L https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/minecraft_server.$VERSION.jar > /data/minecraft_server.jar \
  && cd /minecraft \
  && java -jar BuildTools.jar --rev $VERSION \
  && rm -rf /root/.m2 Build* Bukkit CraftBukkit Spigot apache-maven-* work craftbukkit-*.jar \
  && apk del git curl bash
copy server.properties /data
copy run.sh /run.sh
expose 25565
workdir /data
CMD /run.sh

