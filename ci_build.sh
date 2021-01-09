#!/bin/bash
docker run --rm -v `pwd`:/app ghcr.io/toltec-dev/qt:v1.2.2 /app/build.sh
