# Docker image for OSRM version 5

This project lets you prepare and run a docker container with OSRM latest version and the map of your choice.

## About versions

The OSRM project recently made a breaking change in the API between 4 and 5 - no other docker containers where available to use the latest API so I decided to take the last docker-image I was successfully using for a while and bumped the version and adjusted the startup script. It works for me and if you have any suggestions, please submit a PR. I will keep track on official minor updates and push new images to docker hub: `irony/osrm5`

## Usage

Easiest way to use this docker image is to use Docker Compose. It allows you to set up your environment and just run one command: `docker-compose up` whenever you want to get back to where you left off. 

OSRM takes a while to start the first time (around 5 minutes) so it is a good idea to keep the generated data in a separate data-volume so you can start or stop your server really quick whenever you want and you will always have the latest state available.

Add this to a file called docker-compose.yml

```
osrm-data:
  image: irony/osrm5
  volumes:
    - /data
osrm:
  image: irony/osrm5 
  volumes_from: 
    - osrm-data
  ports:
    - 5000:5000
  command: ./start.sh Sweden http://download.geofabrik.de/europe/sweden-latest.osm.pbf

```
/The first argument is the name you want to give to the map. It's used mostly as a file name in the data storage.
The second argument is the URL to your source map file./

Now run `docker-compose up` and visit `http://localhost:5000` and you will be able to query your local routing engine for routes and match gps-positions to the road network.

## Thanks

A lot of people have published working or non-working docker images for running OSRM. I have based this fork on the work from `Starfox899/osrm-docker` which worked for me up until version 5. 
