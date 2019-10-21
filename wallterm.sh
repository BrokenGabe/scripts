#!/bin/bash
    # Author Taekus
    # taek.us
    # Depends wmctrl

title=bgcon # Window Title for the Terminal Window{
cols=80 # Width in Columns
rows=30 # Height in Rows
loc=+0+0 # Location on screen in pixels
term=xfce4-terminal # Which Terminal Emulator You Are Using, gnome or xfce4 for now
opts="--hide-menubar --hide-borders --hide-toolbar --hide-scrollbar"
exec="/usr/bin/gotop -b" # Which program to run in the terminal window on launch

if [[ ${term} = "xfce4-terminal" || ${term} = "gnome-terminal" || ${term} = "xterm" ]] then
    ${term} ${opts} --title=${title} --geometry=${rows}${cols}${loc} --command="${exec}" &
elif [[ ${term} = "konsole" ]] then
    ${term} --workdir /home/$USER/ ${opts} --separate -p `TerminalColumns=${cols}` -p `TerminalRows=${rows}` -geometry ${loc} -e `qdbus org.kde.konsole $KONSOLE_DBUS_SESSION setTitle 1 ${title}; ${exec};`
fi
    #I hope the above works, without konsole, I cannot test this.
sleep 1
wmctrl -r ${title} -b add,below,sticky # Split wmctrl calls due to ARGs limitations
wmctrl -r ${title} -b add,skip_taskbar,skip_pager