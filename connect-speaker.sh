#!/bin/sh

# First try to connect to speaker
./bluetooth-connect "JBL GO 2"

if [ $? = 0 ]
then
	# Restart mycroft audio service to take speaker into account
	mycroft-start restart audio
else
	echo "Failed to connect to speaker"
	exit 1
fi
