#! /bin/bash

nodes=( $(bspc query -N -d focused) )
bspc node ${nodes[1]} -t floating
bspc node ${nodes[1]} -v -475 0
bspc node ${nodes[2]} -t floating
bspc node ${nodes[2]} -v 475 0
