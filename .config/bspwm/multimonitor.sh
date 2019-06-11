#!/bin/bash

PRIMARY_MONITOR="eDP1"
EXTERNAL_MONITOR="HDMI2"
MOVABLE_DESKTOPS=("7" "8" "9" "0")
CONNECTED_MONITORS_TMP=/tmp/bspwm_connected_monitors
N_CONNECTED=$( xrandr -q | grep " connected" | wc -l )
WALLPAPER=/home/filipe/Pics/wallhaven-256690.png


function set_wallpaper_dual () {
    feh --bg-fill $WALLPAPER --bg-fill $WALLPAPER
}

function set_wallpaper_single () {
    feh --bg-fill $WALLPAPER
}


if [ ! -f $CONNECTED_MONITORS_TMP ]; then
    # first run
    if [ $N_CONNECTED -eq 2 ]; then
        xrandr --output $EXTERNAL_MONITOR --preferred --left-of $PRIMARY_MONITOR
        bspc monitor $PRIMARY_MONITOR -d 1 2 3 4 5 6
        bspc monitor $EXTERNAL_MONITOR -d 7 8 9 0
        echo "2 1" > $CONNECTED_MONITORS_TMP
        set_wallpaper_dual
    else
        bspc monitor -d 1 2 3 4 5 6 7 8 9 0
        echo "1 0" > $CONNECTED_MONITORS_TMP
        set_wallpaper_single
    fi
else
    # subsequent runs, determine whether desktops should move

    IFS=' ' read -a PREV_CONNECTED_MONITORS <<< $( cat $CONNECTED_MONITORS_TMP )
    # PREV_CONNECTED_MONITORS[0] = number of monitors that were connected
    # PREV_CONNECTED_MONITORS[1] = 1 if external monitor has ever been connected

    if [ $N_CONNECTED -gt ${PREV_CONNECTED_MONITORS[0]} ]; then
        # external monitor connected, move desktops to external monitor
        xrandr --output $EXTERNAL_MONITOR --preferred --left-of $PRIMARY_MONITOR

        if [ ${PREV_CONNECTED_MONITORS[1]} -eq 0 ]; then
            # first time external monitor is connected
            bspc monitor $EXTERNAL_MONITOR -d 7 8 9 0
        else
            for d in ${MOVABLE_DESKTOPS[@]} ; do
                bspc desktop "%"$d -m $EXTERNAL_MONITOR
            done
        fi
        bspc monitor $PRIMARY_MONITOR -d 1 2 3 4 5 6
        bspc desktop %Desktop -r
        echo "2 1" > $CONNECTED_MONITORS_TMP
        set_wallpaper_dual

    elif [ $N_CONNECTED -lt ${PREV_CONNECTED_MONITORS[0]} ]; then
        logger 'here'
        # external monitor disconnected, move desktops back to primary monitor
        for d in ${MOVABLE_DESKTOPS[@]} ; do
            bspc desktop "%"$d -m $EXTERNAL_MONITOR
        done
        xrandr --output $EXTERNAL_MONITOR --off
        bspc monitor $EXTERNAL_MONITOR -r
        echo "1 1" > $CONNECTED_MONITORS_TMP
        set_wallpaper_single
    fi
fi

bspc wm --reorder-monitors $PRIMARY_MONITOR $EXTERNAL_MONITOR
