#/usr/bin/bash

#Find conda
source ~/.bashrc
conda build -q $1
if [ $? != 0 ]; then
	echo failed to build
	exit 1
fi


echo "Uploading package to zigzah"
KEY=$( mktemp )
#This is defined in the Gitlab variables, under the Settings Menu.
echo "$ZIGZAH_SSH_KEY" | base64 --decode > "$KEY"

scp -i "$KEY" -o StrictHostKeyChecking=no\
    ${CONDA_PATH}/conda-bld/${OUTPUT_ARCH}/*.tar.bz2 \
    dummy@zigzah.com:~/${OUTPUT_CHANNEL}/${OUTPUT_ARCH}

if [ $? == 0 ]; then
	echo "Upload suceeded"
else
	echo "Upload failed"
	exit 1
fi
