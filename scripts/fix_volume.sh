#!/bin/bash
X=$1
pactl set-sink-volume 0 +X%
pactl set-sink-volume 0 -X%
