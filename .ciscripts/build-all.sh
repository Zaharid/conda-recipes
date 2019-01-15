#!/bin/bash
set -e
set -u

conda build .
conda build lhapdf --python=2

echo "Uploading package to zigzah"
#Idiotic mac mktemp
KEY=$( mktemp  "${TMPDIR:-/tmp}/key.XXXXXXXXX" )
#This is defined in the Gitlab variables, under the Settings Menu.
echo "$ZIGZAH_SSH_KEY" | base64 --decode > "$KEY"

scp -i "$KEY" -o StrictHostKeyChecking=no\
    ${CONDAPATH}/conda-bld/${OUTPUT_ARCH}/*.tar.bz2 \
    dummy@zigzah.com:~/${OUTPUT_CHANNEL}/${OUTPUT_ARCH}

if [ $? == 0 ]; then
	echo "Upload suceeded"
else
	echo "Upload failed"
	exit 1
fi
