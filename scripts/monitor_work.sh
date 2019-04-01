#!/bin/bash

#Work setup
xrandr --output eDP-1-1 --off
xrandr --output DVI-I-2-1 --primary
xrandr --output HDMI-0 --left-of DVI-I-2-1
