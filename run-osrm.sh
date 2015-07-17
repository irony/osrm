#!/bin/bash

MAP=Barcelona
MAP_URL=https://s3.amazonaws.com/metro-extracts.mapzen.com/barcelona_spain.osm.pbf

docker run \
    -d \
    --volumes-from osrm-data \
    -p 5000:5000 \
    starfox899/osrm-docker \
    ./start.sh ${MAP} ${MAP_URL}
