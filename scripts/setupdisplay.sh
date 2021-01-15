#!/bin/bash

VAR="eDP-1"
STR=$(xrandr | grep " connected " | awk '{ print$1 }')
echo $STR

 if [ "$STR" == "$VAR" ]
     then
         echo 'Only Laptop Display Active... Setting DPI to 175'
  	 xlayoutdisplay -d 175
         xrandr --output eDP-1 --auto --primary --mode 2560x1440 --rotate normal
 
     else
         echo 'Both Laptop and External Displays Active...'
         xlayoutdisplay
         xrandr --output eDP-1 --auto --primary --mode 2560x1440 --rate 60 --rotate normal --output DP-1 --auto --scale 2x2 --mode 1920x1080 --rate 60 --rotate normal
         #xrandr --output eDP-1 --auto --primary --mode 2560x1440 --pos 0x720 --rotate normal --output DP-1 --auto --scale 2x2 --mode 1920x1080 --pos 2560x0 --rotate normal
     fi


feh --bg-fill ~/Pictures/wallpaper.jpg
