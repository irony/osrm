#!/bin/bash

docker run \
    -v /data \
    --name osrm-data \
    starfox/osrm-docker:latest \
    echo "running data container..."
