# Dockerized zen (node & wallet)

This will create a fully functional [ZenCash](https://zencash.io/) ZenCash docker image.

Available on [Docker Hub](https://hub.docker.com/r/e0kra/zen/).

## Build

    docker build --tag e0kra/zen build/

## Tag & Push

    docker push e0kra/zen

## Download

    docker pull e0kra/zen

## Run

Simplest version:

    docker run -d --name zen -p 9033:9033 -v $HOME/.zencash:/root/.zen -v $HOME/.zcash-params:/root/.zcash-params e0kra/zen
