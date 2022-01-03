#!/bin/bash

CURRENT_BRIGHTNESS="$(brightnessctl g)"
MAX_BRIGHTNESS="$(brightnessctl m)"
PERCENTAGE=$(($CURRENT_BRIGHTNESS * 100/$MAX_BRIGHTNESS))

echo "$PERCENTAGE%"
