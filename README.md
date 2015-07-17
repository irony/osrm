# Docker image for OSRM

This project lets you prepare and run a docker container with OSRM (stable version 4.7.0) and the map of your choice.

## Build

Run `make` in the directory with the dockerfile.

## Run

Go to `run-osrm.sh` and adapt MAP and MAP_URL to your needs with any `.osm.pfb` source file you need.

Run your data container:
```
./run-data.sh
```
The data container will keep your map files even if you restart your OSRM server.

Now you can run your osrm server:
```
./run-osrm.sh
```
or if you want to modify map being used inline:
```
docker run \
    -d \
    --volumes-from osrm-data \
    -p 5000:5000 \
    starfox/osrm-docker:latest \
    ./start.sh \
        Barcelona \
        "https://s3.amazonaws.com/metro-extracts.mapzen.com/barcelona_spain.osm.pbf"
```
The first argument is the name you want to give to the map. It's used mostly as a file name in the data storage.
The second argument is the URL to your source map file.
