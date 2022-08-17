#!/bin/sh

# First try to disconnect to speaker
./bluetooth-disconnect "JBL GO 2"

if [ $? = 0 ]
then
	# Restart mycroft audio service
	mycroft-start restart audio
else
	echo "Failed to disconnect the speaker"
	exit 1
fi
