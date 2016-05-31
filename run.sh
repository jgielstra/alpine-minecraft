#!/bin/sh
echo "eula=true" > eula.txt
MEM=${JAVA_MEM:-1G}
java -Xmn512m -Xmx${MEM} -jar /minecraft/spigot*.jar nogui 
