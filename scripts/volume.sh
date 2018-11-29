#!/bin/bash

ACTIVESYNC=$(pacmd list-sinks | grep \* | awk '{print $3}')

case $1 in
    +)
	pactl set-sink-volume "$ACTIVESYNC" +5%
        update_bar;;
    -)
	pactl set-sink-volume "$ACTIVESYNC" -5%
        update_bar;;
    !)
	pactl set-sink-mute "$ACTIVESYNC" toggle
        update_bar;;
    state|level)
        $1;;
    *)
        amixer set Master $1 >/dev/null
        update_bar;;
esac

