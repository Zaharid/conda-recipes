#!/bin/bash

find . -maxdepth 1 -not -path './\.*' -not -path . -type d -print0 |\
xargs -0 .ciscripts/build-deploy.sh
