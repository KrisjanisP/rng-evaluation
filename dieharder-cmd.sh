#! /usr/bin/env bash

docker run -it $(docker build -q . -t rngeval)