#!/bin/sh
#           _       _ __
#     _  __(_)___  (_) /_
#    | |/_/ / __ \/ / __/
#   _>  </ / / / / / /_
#  /_/|_/_/_/ /_/_/\__/
# Xorg runtime config file.

setxkbmap -option caps:escape & #-option caps:super &		# Map caps to escape/mod, details: /usr/local/share/X11/xkb/rules/evdev.lst
sxhkd &								# Bind hotkeys
# 	killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' & # Mod by itself is now escape, TODO: do the same for right window button
# xset r rate 300 50 &						# Increase xrate, speeds up key input
# unclutter &							# Remove mouse when idle
# dunst &							# dunst for notifications
#redshift -l "$("$XDG_SCRIPT_HOME/apitools/geoloc" | tr ',' ':')" & # TODO
# exec "$XDG_CONFIG_HOME/polybar/launch.sh" &
exec bspwm -c "$XDG_CONFIG_HOME/bspwm/bspwmrc"
