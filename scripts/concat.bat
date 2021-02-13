:: Create File List
echo file chodhya-kudukka-mp4.mp4 >  mylist.txt 
echo file output.mp4 >> mylist.txt
rem echo file file3.mp4 >> mylist.txt

:: Concatenate Files
ffmpeg -f concat -i mylist.txt -c copy output123.mp4