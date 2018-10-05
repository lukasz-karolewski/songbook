#!/bin/bash

docker build -t songbook .
docker run --rm -v `pwd`:/home/ubuntu songbook:latest $1