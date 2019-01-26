#!/bin/sh -eu
MEM=${JAVA_MEM:-1G}
exec java -Xmn512m -Xmx${MEM} -jar /minecraft/minecraft_server.*.jar nogui
