#!/bin/bash

find . -maxdepth 1 -not -path './\.*' -not -path . -typed -print0 |\
xargs -0 .ciscripts/build-deploy.sh {}
