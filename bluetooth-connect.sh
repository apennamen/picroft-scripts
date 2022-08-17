#!/bin/sh

if [ -z "$1" ]
then
	echo "Missing required argument"
	exit 1
fi

speaker_name=$1

speaker_mac_address=$(bluetoothctl devices | grep "$speaker_name" | mawk '{print($2)}')

if [ -z "$speaker_mac_address" ]
then
  echo "Enceinte $speaker_name introuvable"
  exit 1
fi

bluetoothctl power on
bluetoothctl connect $speaker_mac_address  2> /dev/null

is_connected=$(bluetoothctl info $speaker_mac_address | grep "Connected" | mawk '{print($2)}')

if [ "$is_connected" = "no" ]
then
  echo "Enceinte $speaker_name non disponible"
  exit 1
fi
