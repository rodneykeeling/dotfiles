#!/bin/bash

currentcon=$($HOME/.config/polybar/get-vpn.sh)
if [ ! -z "$currentcon" ]; then
    nmcli con down id "$currentcon"
fi

conns=(
    'USA - New Jersey'
    'USA - Los Angeles'
    'USA - Chicago'
    'USA - Salt Lake City'
    'USA - Miami'
    'USA - Atlanta'
    'USA - Dallas'
    'Canada'
)
newcon=${conns[$RANDOM % ${#conns[@]}]}
nmcli con up id "$newcon"
