#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

#Finds your primary monitor
#primary_monitor=$(xrandr --query | awk '/ primary/{print $1}')

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch the bar
    if [[ "$style" == "pwidgets" ]]; then
        bash "$dir"/pwidgets/launch.sh --main
    else
        for MON in $(polybar --list-monitors | cut -d: -f1); do
            if [[ "$MON" == "$(xrandr --query | awk '/ primary/{print $1}')" ]]; then
                MONITOR=$MON polybar -q main -c "$dir/$style/config.ini" &
            else
                MONITOR=$MON polybar -q main -c "$dir/$style/config.ini" &
            fi
        done
    fi
}

if [[ "$1" == "--forest" ]]; then
	style="forest"
	launch_bar

else
	style="forest"
	launch_bar
fi
