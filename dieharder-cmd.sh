#! /usr/bin/env bash

INPUT=qrng_raw_1e7.bin
OUTPUT=qrng_raw_1e7.res.txt

# Overwrite variables if arguments were provided
if [ ! -z "$1" ]; then
  INPUT="$1"
fi

if [ ! -z "$2" ]; then
  OUTPUT="$2"
fi

IMAGE=$(docker build -q . -t rngeval)
docker run > $OUTPUT  -v ./$INPUT:/$INPUT -it $IMAGE dieharder -a -f /$INPUT