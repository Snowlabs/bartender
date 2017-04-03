#!/bin/sh

PATH=.:./block:$PATH

BG="%{B#222222}"
FG="%{F#DDDDDD}"
UR="%{B#EEAAAA}%{F#DDDDDD}" # urgent


{

### All
echo -n "$BG$FG"

### Left
echo -n "%{l}"
echo -n "<<i3ws -S -B "
echo -n "-f '$BG$FG  ' '  $BG$FG' -u '$UR  ' '  $BG$FG' "
echo -n "-F '%{B#333}%{F#FFF}  ' '  $BG$FG'>>"
echo -n "$BG$FG"

### Center
echo -n "%{c}"
echo -n "<<clock '+ %Y-%m-%d   %H:%M'>>"

### Right
echo -n "%{r}"
echo -n " "
echo -n "<<vol>>"
echo -n " "

#echo ""

} | genbar \
  | lemonbar -b -o 1 -f "Noto Sans" -o -1 -f "FontAwesome" \
  | sh > /dev/null
