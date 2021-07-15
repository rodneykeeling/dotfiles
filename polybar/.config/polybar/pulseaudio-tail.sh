#!/bin/sh

update_sink() {
    sink=$(pacmd list-sinks | sed -n '/\* index:/ s/.*: //p')
}

volume_up() {
    update_sink
    pactl set-sink-volume "$sink" +3%
}

volume_down() {
    update_sink
    pactl set-sink-volume "$sink" -3%
}

volume_mute() {
    update_sink
    pactl set-sink-mute "$sink" toggle
}

volume_print() {
    update_sink

    #active_port=$(pacmd list-sinks | sed -n "/index: $sink/,/index:/p" | grep active)
    #if echo "$active_port" | grep -q hdmi; then
    #    icon="HDMI"
    #else
    #    icon="Analog"
    #fi

    muted=$(pamixer --sink "$sink" --get-mute)

    if [ "$muted" = true ]; then
        echo " MUTE"
    else
        echo " $(pamixer --sink "$sink" --get-volume)%"
    fi
}

listen() {
    volume_print
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac

