#!/bin/bash
ffmpeg -i input.mp4 -vf "drawtext=text='timestamp: %{pts \: hms}': x=500: y=500: fontsize=32:fontcolor=yellow@0.9: box=1: boxcolor=black@0.6" -c:a copy output.mp4
Changed font size and color
ffmpeg -i input.mp4 -vf "drawtext=text='timestamp: %{pts \: hms}': x=500: y=500: fontsize=102:fontcolor=white@0.9: box=1: boxcolor=black@0.6" -c:a copy output1.mp4


hms changed to ms. No use. trying to show only seconds

ffmpeg -i input.mp4 -vf "drawtext=text='%H\:%M\:%S': x=500: y=500: fontsize=72:fontcolor=yellow@0.9: box=1: boxcolor=black@0.6" -c:a copy output1.mp4


Worked for seconds only. No start. No end.
ffmpeg -i input.mp4 -vf "drawtext=text='%{localtime\:%S}': x=500: y=500: fontsize=72:fontcolor=yellow@0.9: box=1: boxcolor=black@0.6" -c:a copy output1.mp4

-vf "drawtext=fontfile=/usr/share/fonts/dejavu/DejaVuSans-Bold.ttf: \
text='%{localtime\:%T}': fontcolor=white@0.8: x=7: y=700" -vcodec libx264 \

Changed timestamp format to localtime. No use
ffmpeg -i input.mp4 -vf "drawtext=text='%{localtime\:%T}': x=500: y=500: fontsize=72:fontcolor=yellow@0.9: box=1: boxcolor=black@0.6" -c:a copy output.mp4

ffmpeg -i input.mp4 -vf "drawtext=fontfile=/Windows/Fonts/arial.ttf:fontsize=45:fontcolor=white@0.8:box=1:boxcolor=gray@0.9:x=70: y=20:text=’%%{localtime\: %%m/%%d/%%Y %I.%%M.%%S %%p}'" -c:a copy output.mp4



ffmpeg -i input.mp4 -vf "drawtext=fontfile=arial.ttf:fontsize=104:fontcolor=white:box=1:boxcolor=black@0.9:x=08:y=466:text=’%m/%d/%y %H\:%M\:%S'" -c:a copy output.mp4


I am trying to add text to video using ffmpeg and wants text to appear for a given period of time. I am trying to use DrawText filter but don't know how to provide time period for this filter. 

The drawtext video filter has timeline editing support (see the output of ffmpeg -filters). This can evaluate an expression and allows you to provide the time(s) of when the filter should be enabled.

ffmpeg -i input.mp4 -vf "drawtext=enable='between(t,12,3*60)':fontfile=/usr/share/fonts/truetype/freefont/FreeSerif.ttf: text='Test Text'" -acodec copy output.mp4





I need to add two texts to a video. First text appears in the bottom right for the first 6 seconds, and the second text at the center of the video for the last 3 seconds.
The drawtext should be put into one -vf (using "[in]/[out]" is optional):


ffmpeg -i input.m4 -vf "[in]drawtext=text='Stack Overflow': fontcolor=white: borderw=2: fontfile=Arial Black: fontsize=w*0.04: \
x=(w-text_w)-(w*0.04): y=(h-text_h)-(w*0.04): enable='between(t,0,6)', drawtext=text='Stack Overflow': fontcolor=white: borderw=2: \
fontfile=Arial Black: fontsize=w*0.04: x=(w-text_w)/2: y=(h-text_h)/2: enable='between(t,7,10)'[out]" -codec:a copy output2.mp4




Convert a mov to mp4

ffmpeg -i chodhya-kudukka.MOV -vcodec h264 -acodec mp2 chodhya-kudukka-mp4.mp4





ffmpeg -i input1.mp4 -vf "[in]drawtext=fontfile=E:/everything-movies/source/ffmpeg-video-slideshow-scripts-master/MLKR0ntt.ttf: text='മഞ്ജുവിനെ ചൂണ്ടിക്കാണിച്ചുകൊണ്ട് രാജു പറഞ്ഞു, “അവളുടെ ഏക സഹോദരന്റെ മകൻ എന്റെ ഭാര്യയുടെ സഹോദരനാണ്”. മഞ്ജു രാജുവുമായി എങ്ങനെ ബന്ധപ്പെട്ടിരിക്കുന്നു? ': fontcolor=black: fontsize=100: x=(w-text_w)/2: y=if(lt(t\,3)\,(-h+((3*h-200)*t/6))\,(h-200)/2):enable='between(t,2.9,50)',drawtext=fontfile=E:/everything-movies/source/ffmpeg-video-slideshow-scripts-master/MLKR0ntt.ttf: text='മഞ്ജുവിനെ': fontcolor=black: fontsize=100: x=if(lt(t\,4)\,(-w+((3*w-tw)*t/8))\,(w-tw)/2): y=(h-100)/2:enable='between(t,3.5,50)',drawtext=fontfile=E:/everything-movies/source/ffmpeg-video-slideshow-scripts-master/MLKR0ntt.ttf: text='മഞ്ജുവിനെ': fontcolor=black: fontsize=90: x=if(lt(t\,5)\,(2*w-((3*w+tw)*t/10))\,(w-tw)/2): y=h/2:enable='between(t,4.5,50)',drawtext=fontfile=E:/everything-movies/source/ffmpeg-video-slideshow-scripts-master/MLKR0ntt.ttf: text='മഞ്ജുവിനെ': fontcolor=black: fontsize=120: x=(w-text_w)/2: y=if(lt(t\,6)\,(2*h-((3*h-100)*t/12))\,(h+100)/2):enable='between(t,5.5,50)'[out]" out.mp4


convert .srt to ass

ffmpeg -i subtitle.srt input.ass




ffmpeg -i input1.mp4 -vf "ass=input.ass" output.mp4

ffmpeg -i ../background1.mp4 -vf "ass=input.ass" -y output.mp4

ffmpeg -i ../../ffmpeg-video-slideshow-scripts-master/transition_bars_horizontal_two.mp4 -vf "ass=input2.ass" -y ../output.mp4


Style: Default,Tahoma,16,&H00000000,&H00ffffff,&H00ffffff,&H00c0c0c0,-1,0,0,0,100,100,0,0.00,1,2,3,2,20,20,20,1

Dialogue: 0,0:01:41.70,0:01:46.84,Default,,0000,0000,0000,,Le rugissement des larmes !\NTu es mon ami.
Dialogue: 0,0:02:00.99,0:02:02.87,Default,,0000,0000,0000,,Est-ce vraiment Naruto ?




desc.ass
[Script Info]
PlayResY: 600
WrapStyle: 1

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
Style: Code, monospace,20,&H00B0B0B0,&H00B0B0B0,&H00303030,&H80000008,-1,0,0,0,100,100,0.00,0.00,1,1.00,2.00, 7 ,30,10,30,0
Style: Expl, Arial,28,&H00FFB0B0,&H00B0B0B0,&H00303030,&H80000008,-1,0,0,0,100,100,0.00,0.00,1,1.00,2.00, 7 ,30,10,30,0

[Events]
Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
Dialogue: 0,00:00:00.00,00:03:00.00,Expl, NTP,0,0,0,,{\pos(20,20)}To split audio stream into several bands, you can use `lowpass', `bandpass', `highpass', etc., but in recent ffmpeg you can also use `acrossover'.\N\NThough it is unclear how to use it due to the lack of explanation of the official document, it seems to be used like this.
Dialogue: 0,00:00:00.00,00:03:00.00,Code, NTP,0,0,0,,{\pos(40,160)}#! /bin/sh\Nifn="Air on the G String (from Orchestral Suite no. 3, BWV 1068).mp3"\Nifnb="`basename \"$\{ifn\}\" .mp3`"\Npref="`basename $0 .sh`"\N#\N"/c/Program Files/ffmpeg-4.1-win64-shared/bin/ffmpeg" -y \\N    -i "$\{ifn\}" -filter_complex "\N\N[0:a]acrossover=split='500 2000'[div1][div2][div3];\N\N[div1]asplit[div1_1][div1_2];\N[div2]asplit[div2_1][div2_2];\N[div3]asplit[div3_1][div3_2];\N\N[div1_2]showcqt=s=1920x1080[v1];\N[div2_2]showcqt=s=1920x1080[v2];\N[div3_2]showcqt=s=1920x1080[v3]" \\N    -map '[v1]' -map '[div1_1]' "$\{pref\}_$\{ifnb\}_1.mp4" \\N    -map '[v2]' -map '[div2_1]' "$\{pref\}_$\{ifnb\}_2.mp4" \\N    -map '[v3]' -map '[div3_1]' "$\{pref\}_$\{ifnb\}_3.mp4"
Dialogue: 0,00:00:00.00,00:03:00.00,Expl, NTP,0,0,0,,{\pos(20,550)}(Note: Uploaded video is of `div2'.)



[me@host: ~]$ ffmpeg -y -i input.mp4 -vf "subtitles=desc.ass" -c:a copy output.mp4


[Script Info]
PlayResX: 1280
PlayResY: 720
WrapStyle: 1

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, Alignment, Encoding
Style: F1, impact,70,&H30FF30,7,0
Style: F2, comic sans ms,70,&H30FF30,7,0
Style: F3, ar christy,70,&H30FF30,7,0
Style: F4, ar carter,120,&H30FF30,7,0
Style: F5, ar bonnie,72,&H30FF30,7,0
Style: F6, levenim mt,60,&H30FF30,7,0
Style: F7, segoe script,66,&H30FF30,7,0
Style: F8, segoe print,80,&H30FF30,7,0
Style: F9, segoe print bold,80,&H30FF30,7,0

[Fonts]
impact: impact.ttf
comic sans ms: comic.ttf
ar christy: ARCHRISTY.ttf
ar carter: ARCARTER.ttf
ar bonnie: ARBONNIE.ttf
levenim mt: lvnm.ttf
segoe script: segoesc.ttf
segoe print: segoepr.ttf
segoe print bold: segoeprb.ttf

[Events]
Format: Start, End, Style, Text
Dialogue: 0:00:00.00,0:00:10.00,F1,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:10.00,0:00:20.00,	,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:20.00,0:00:30.00,F3,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:30.00,0:00:40.00,F4,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:40.00,0:00:50.00,F5,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:50.00,0:01:00.00,F6,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:01:00.00,0:01:10.00,F7,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:01:10.00,0:01:20.00,F8,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:01:20.00,0:01:30.00,F9,{\pos(260,320)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.







In the case of V4.00+, the values of this is so-called “numpad layout”.

[Script Info]
PlayResX: 1280
PlayResY: 720
WrapStyle: 1

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, Alignment, Encoding
Style: A1, Arial,34,&H3030FF,1,0
Style: A2, Arial,34,&H3030FF,2,0
Style: A3, Arial,34,&H3030FF,3,0
Style: A4, Arial,34,&H3030FF,4,0
Style: A5, Arial,34,&H3030FF,5,0
Style: A6, Arial,34,&H3030FF,6,0
Style: A7, Arial,34,&H3030FF,7,0
Style: A8, Arial,34,&H3030FF,8,0
Style: A9, Arial,34,&H3030FF,9,0

[Events]
Format: Start, End, Style, Text
Dialogue: 0:00:00.00,0:00:10.00,A1,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:10.00,0:00:20.00,A2,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:20.00,0:00:30.00,A3,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:30.00,0:00:40.00,A4,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:40.00,0:00:50.00,A5,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:00:50.00,0:01:00.00,A6,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:01:00.00,0:01:10.00,A7,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:01:10.00,0:01:20.00,A8,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.
Dialogue: 0:01:20.00,0:01:30.00,A9,{\pos(600,400)}The quick brown fox jumps over a lazy dog.\NSphinx of black quartz, judge my vow.


using a box
$ ffmpeg -i Clouds.mp4 -vf "ass=input.ass,drawbox=y=ih/PHI:color=black@0.4:width=iw:height=48:t=fill" -y output.mp4

ffmpeg -i C:\Users\Developer_2\Videos\2.mkv -vf drawtext="fontfile=C\:/Regular.ttf: text='apcis.tmou.org': fontcolor=white: fontsize=24: box=1: boxcolor=black@0.4: x=w-tw:y=h-th" C:\inetpub\wwwroot\videos\1.mp4

using boxcolor-white@0.9 





0

Maybe too late but the solution is enable='between(t, {start}, {end})' available on drawtext filter:

You will have to draw each text by separate filter, so you will create 4 texts and add them on a transparent background:

-t 2 -i color=black@0:{size}, format=rgba -i your_video.mp4

-filter_complex "[0] drawtext=...:enable='between(t, 0, 0.5)', drawtext=...:enable='between(t, 0.501, 1)', ... [texts]"

The duration of color background set to 2 seconds for 4 texts, each 0.5 seconds.

Then you overlay them looping over the video:

[1] [texts] overlay={x}:{y}:eof_action=repeat [out]


ffmpeg -y -i input.mp4 -filter_complex "[0]split[base][text];[text]drawtext=fontfile=HelveticaNeue.ttf:text='Testing': fontcolor=white:\
fontsize=40: box=1: boxcolor=black@0.5:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2,format=yuva444p,fade=t=in:st=2:d=1:alpha=1,fade=t=out:st=3:d=1:alpha=1[subtitles]; \
[base][subtitles]overlay" output.mp4



To run all the scripts in a folder

for f in *.sh; do  # or wget-*.sh instead of *.sh
  bash "$f" -H 
done




To put a timer video on top on another video
ffmpeg -i ../output.mp4 -vf "movie=../digital_clock.mp4, scale=320: -1 [inner]; [in][inner] overlay =10: 10 [out]" completed.mp4
ffmpeg -i ../output.mp4 -vf "movie=../digital_clock.mp4, scale=320: -1 [inner]; [in][inner] overlay=enable='between(t\,05,35)'[out]" -y completed.mp4

https://superuser.com/questions/1082477/ffmpeg-overlay-video-on-another-video-in-specific-time
To put a timer video on top on another video - at a specific time

ffmpeg -i ../output.mp4 -i digital_clock.mp4 -filter_complex "[0:0][1:0]overlay=enable='between(t\,05,35)'[out]" -shortest -map [out] -map 0:1 -pix_fmt yuv420p -c:a copy -c:v libx264 -crf 18  ../final_video.mp4

Working
ffmpeg -i ../output.mp4 -vf "movie=../digital_clock.mp4, scale=320: -1 [inner]; [in][inner] overlay=enable='between(t\,05,35)'[out]" -pix_fmt yuv420p -y completed.mp4




How to cut a video based on time
ffmpeg -i movie.mp4 -ss 00:00:03 -t 00:00:08 -async 1 cut.mp4


