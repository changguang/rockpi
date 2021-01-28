#!/bin/bash

# Script: temp_log.sh
# Purpose: Log temperature of hw to /var/log/temperature.log
# Author: Galen Kim Davis <galen@redkibble.com> under MIT License
# ---------------------------------------------------------------

timestamp() {
  date +%Y%m%d%H%M%S%Z
}
cpu=`cat /sys/devices/virtual/thermal/thermal_zone0/temp | sed 's/^\(.\{2\}\)/\1./'`
gpu=`cat /sys/devices/virtual/thermal/thermal_zone1/temp | sed 's/^\(.\{2\}\)/\1./'`
echo "$(timestamp) @ $(hostname) CPU: $cpu" >> /var/log/temperature.log
echo "$(timestamp) @ $(hostname) GPU: $gpu" >> /var/log/temperature.log
