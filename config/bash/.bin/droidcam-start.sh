#!/bin/bash

GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

cleanup() {
    printf "\n${YELLOW}[!] Stopping DroidCam...${NC}\n"
    pkill -f droidcam-cli 2>/dev/null
    adb forward --remove tcp:4747 2>/dev/null
    sudo modprobe -r v4l2loopback 2>/dev/null
    printf "${GREEN}[✓] DroidCam stopped.${NC}\n\n"
    exit 0
}

trap cleanup INT TERM

printf "\n${BLUE}[i] Load v4l2loopback module...${NC}\n"
sudo modprobe v4l2loopback devices=2 video_nr=10,11 card_label="DroidCam","OBS Virtual Camera" exclusive_caps=1,1

printf "${BLUE}[i] ADB port forwarding (TCP 4747)...${NC}\n"
adb forward tcp:4747 tcp:4747

printf "${GREEN}[✓] Start DroidCam CLI...${NC}\n"
droidcam-cli adb 4747 &
DROID_PID=$!

sleep 1
printf "\n${BLUE}[i] V4L2 status:${NC}\n"
v4l2-ctl --list-devices 2>/dev/null | grep -A 2 -E "DroidCam|OBS Virtual Camera|video10|video11"
printf "\n${YELLOW}'Ctrl+C' to stop DroidCam.${NC}\n\n"

wait $DROID_PID 2>/dev/null
cleanup
