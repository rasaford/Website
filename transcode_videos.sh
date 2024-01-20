#!/bin/bash

ffmpeg -i "$1" -c:v libx264 -crf 23  -pix_fmt yuv420p \
    -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart \
    -an "${1%.*}-h264.mp4"

ffmpeg -i "$1" -c:v libx265 -crf 23 -tag:v hvc1 -pix_fmt yuv420p \
    -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart \
    -an "${1%.*}-h265.mp4"

ffmpeg -i "$1" -c:v libvpx-vp9 -crf 23 -speed 3 -pix_fmt yuv420p \
    -color_primaries 1 -color_trc 1 -colorspace 1 -movflags +faststart \
    -an "${1%.*}-vp9.webm"