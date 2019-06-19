#!/bin/bash

#Work setup
xrandr --output DVI-I-2-1 --mode 1920x1080 --left-of DVI-I-3-2
xrandr --output DVI-I-2-1 --rotate left
xrandr --output DVI-I-3-2 --primary --mode 1920x1080
xrandr --output eDP-1-1 --right-of DVI-I-3-2
