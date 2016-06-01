#!/bin/bash

KERNELS_COUNT=`dpkg --list | grep linux-image-3 | awk -F ' ' '{print $2}' | wc -l`
echo "$KERNELS_COUNT kerners found."

echo "removing all but last 3"
dpkg --list | grep linux-image-3 | awk -F ' ' '{print $2}' | head -n $((KERNELS_COUNT-3)) | xargs apt-get --yes purge

echo "done."
