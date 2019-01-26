from alpine:3.8
env VERSION=1.12.2
run apk --no-cache add openjdk8-jre-base bash curl git \
# binary needs to be separated from /data for upgrades
  && mkdir -p /minecraft /data /data/mods \
  && curl -L "https://mrcrayfish.com/download?type=mod&id=515c59e29e50beaa9cebb68d0de2355eae73e33f" > /data/mods/furniture.jar \
  && curl -L https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2808/forge-1.12.2-14.23.5.2808-installer.jar > /minecraft/forge-installer.jar \
  && cd /minecraft \
  && java -jar forge-installer.jar --installServer \
# TODO clean up later ?
#  && rm -rf libraries forge-* \
  && echo "eula=true" > /data/eula.txt \
  && apk del git curl bash
copy server.properties /data
copy run.sh /run.sh
expose 25565
workdir /data
CMD /run.sh
