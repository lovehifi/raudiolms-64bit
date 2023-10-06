#!/bin/bash

# Extract the card number from rAudio
card=$(grep -oP '(?<=defaults.pcm.card ).*' /etc/asound.conf)
echo "Card number: $card"

/opt/sq/squeezelite64 -o hw:$card -n SQ64-rAudio -s 127.0.0.1 -m 00:00:00:00:00:00

