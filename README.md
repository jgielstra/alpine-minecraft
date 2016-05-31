A lightweight minecraft server based on spigot, alpine, and openjdk8.
The container contains spigot-$VER.jar precompiled
 
 /data - contains persisted data like world, config, and etc.
 /minecraft - containers the spigot-$VER.jar

#requirements
docker-compose >= 1.6 
It needs docker-compose version 2 support

# Running
To use run using `docker-compose`
`docker-compose up -d`

This will build the server, create a data volume for `/data`, and start the server 

`docker attach minecraft_server_1` to execute command against the server 

`ctrl+q ctrl+c to` exit
