#!/bin/bash

# Build the Phoenix container
docker build -t boreddev/phoenix .

# Start
docker run -d -p 4000:4000 --name phoenix-api boreddev/phoenix
