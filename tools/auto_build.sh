#!/bin/sh

# Read the 'camera_list.csv' file ($3) and run the
# CHDK build action ($2) using the designated
# make program ($1)
# - also see main Makefile
while IFS=, read cam fw state copy skip
do
  if [ ${cam} != "CAMERA" ] && [ "${skip}" = "" ]; then \
    if [ "${state}" != "" ]; then state=_${state}; fi; \
    $1 -s --no-print-directory PLATFORM=${cam} PLATFORMSUB=${fw} STATE=${state} COPY_TO=${copy} $2 || exit 1; \
  fi;
done < $3
