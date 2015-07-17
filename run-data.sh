#!/bin/bash

docker run \
    -v /data \
    --name osrm-data \
    starfox899/osrm-docker:latest \
    echo "running data container..."
