#!/bin/bash
sudo ./fbi -S -1 -T 1 -d /dev/fb0 kitten.png
sleep 5
sudo ./fbi -S -1 -T 1 -d /dev/fb0 black.png
sudo killall fbi         # because it leaves processes lying around
