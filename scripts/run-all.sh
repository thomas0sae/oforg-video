#!/bin/bash

#source ../../ffmpeg-video-slideshow-scripts-master/transition_scripts/bars_horizontal_two1.sh

#cd /e/everything-movies/source/oforg-video/scripts
ffmpeg -i transition_bars_horizontal_two.mp4 -vf "ass=input2.ass" -y output_subtitles.mp4

ffmpeg -i output_subtitles.mp4 -stream_loop -1 -i loop-only.mp3 -shortest -map 0:v:0 -map 1:a:0 -y output_audio.mp4

#This was testing to add sound to the clock
#ffmpeg -i digital_clock.mp4 -stream_loop -1 -i loop-only.mp3 -shortest -map 0:v:0 -map 1:a:0 -y digital_clock_audio_output.mp4


ffmpeg -i output_audio.mp4 -vf "movie=digital_clock.mp4, scale=320: -1 [inner]; [in][inner] overlay=enable='between(t\,05,35)'[out]" -pix_fmt yuv420p -y output_audio_sub_clk.mp4

#:: Concatenate Files
ffmpeg -f concat -i mylist.txt -c copy -y output_final_completed.mp4

