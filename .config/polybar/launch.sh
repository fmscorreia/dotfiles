#!/bin/bash

# terminate running instances of polybar
killall -q polybar

# wait until processeshave been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch polybar
polybar top-bar &
