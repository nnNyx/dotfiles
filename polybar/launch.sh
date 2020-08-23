#!/bin/bash
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -rq left &
polybar -rq middle &
polybar -rq right
