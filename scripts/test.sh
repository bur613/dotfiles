#!/bin/bash

var="$(xrandr | grep " connected " | awk '{ print$1 }')"
declare varsh=($(xrandr | grep " connected " | awk '{ print$1 }'))
echo "$var"
echo ${varsh[1]}

if [ "$var" == "${varsh[0]}" ];
then
	echo "bitch better have my money"
fi

