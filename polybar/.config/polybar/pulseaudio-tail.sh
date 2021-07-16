#!/bin/sh

update_sink() {
    sink=$(pacmd list-sinks | sed -n '/\* index:/ s/.*: //p')
}

update_profile() {
    profile=$(pacmd list-cards | grep "active profile.*output" | cut -d "<" -f2 | cut -d ">" -f1)
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

toggle_profile() {
    update_profile
    if [ $profile == 'output:hdmi-stereo' ]; then
        pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo-extra1
    else
        pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo
    fi
}

volume_print() {
    update_sink
    update_profile

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
        if [ $profile == 'output:hdmi-stereo' ]; then
            echo " $(pamixer --sink "$sink" --get-volume)%"
        else
            echo " $(pamixer --sink "$sink" --get-volume)%"
        fi
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
    --profile)
        toggle_profile
        ;;
    *)
        listen
        ;;
esac

