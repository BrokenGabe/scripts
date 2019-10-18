#!/bin/bash
    # Author Taekus
    # taek.us

title=bgcon # Window Title for the Terminal Window
term=xfce4 # Which Terminal Emulator You Are Using, gnome or xfce4 for now
hw=80x30 #  Height and width based on Cols/Rows of the terminal window (ie 80Colsx30Rows)
loc=+0+0 # Location on screen in pixels
exec="/usr/bin/gotop" # Which program to run in the terminal window on launch

${term}-terminal --hide-menubar --hide-borders --hide-toolbar --hide-scrollbar --title=${title} --geometry=${hw}${loc} --command=${exec} &
wmctrl -r ${title} -b add,below,sticky
wmctrl -r ${title} -b add,skip_taskbar,skip_pager