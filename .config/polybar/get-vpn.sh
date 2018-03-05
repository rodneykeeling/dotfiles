#!/bin/bash

vpn=$(nmcli | grep "VPN connection")
suffix="VPN connection"
echo ${vpn%$suffix}
