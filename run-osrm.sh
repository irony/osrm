#!/bin/bash

#MAP=Bremen
#MAP_URL=http://download.geofabrik.de/europe/germany/bremen-latest.osm.pbf
#MAP=Thueringen
#MAP_URL=http://download.geofabrik.de/europe/germany/thueringen-latest.osm.pbf
MAP=Germany
MAP_URL=http://download.geofabrik.de/europe/germany-latest.osm.pbf

docker run \
    -d \
    --volumes-from osrm-data \
    -p 5000:5000 \
    starfox/osrm-docker:latest \
    ./start.sh ${MAP} ${MAP_URL}
