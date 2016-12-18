#!/bin/bash

for recipe in \
$(find . -maxdepth 1 -not -path './\.*' -not -path . -type d);\
do
echo "Building ${recipe}"
.ciscripts/build-deploy.sh "$recipe"
done
