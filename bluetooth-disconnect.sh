#!/bin/sh

if [ -z "$1" ]
then
	echo "Missing required argument"
	exit 1
fi

speaker_mac_address=$(bluetoothctl devices | grep -i "$1" | mawk '{print($2)}')

if [ -z "$speaker_mac_address" ]
then
  echo "Enceinte $1 introuvable"
  exit 1
fi

bluetoothctl power on
bluetoothctl disconnect $speaker_mac_address  2> /dev/null
