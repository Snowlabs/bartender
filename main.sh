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
echo -n "filler..."
# echo -n "<<i3ws -S -s' $BG$FG' "
# echo -n "-f'$BG$FG ' -u$UR -F'%{B#333}%{F#FFF} '>>"
echo -n "$BG$FG"

### Center
echo -n "%{c}"
echo -n " "
echo -n "<<clock +%Y-%m-%d>>"
echo -n "   "
echo -n "<<clock +%H:%M>>"

### Right
echo -n "%{r}"
echo -n " "
echo -n "<<vol>>"
echo -n " "

echo ""

} | genbar | lemonbar -b -o 1 -f "Noto Sans" -o -1 -f "FontAwesome" DVI-1
