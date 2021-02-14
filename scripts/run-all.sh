#!/bin/bash

#source ../../ffmpeg-video-slideshow-scripts-master/transition_scripts/bars_horizontal_two1.sh

#cd /e/everything-movies/source/oforg-video/scripts
ffmpeg -i ../transition_bars_horizontal_two.mp4 -vf "ass=input2.ass" -y ../output.mp4

#ffmpeg -i ../output.mp4 -vf "movie=../digital_clock.mp4, scale=320: -1 [inner]; [in][inner] overlay=enable='between(t\,05,35)'[out]" completed.mp4
ffmpeg -i ../output.mp4 -vf "movie=../digital_clock.mp4, scale=320: -1 [inner]; [in][inner] overlay=enable='between(t\,05,35)'[out]" -pix_fmt yuv420p -y completed.mp4

#:: Concatenate Files
ffmpeg -f concat -i mylist.txt -c copy -y output123.mp4

