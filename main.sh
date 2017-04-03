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
<<<<<<< HEAD
echo -n "filler..."
# echo -n "<<i3ws -S -s' $BG$FG' "
# echo -n "-f'$BG$FG ' -u$UR -F'%{B#333}%{F#FFF} '>>"
=======
echo -n "<<i3ws -S -B "
echo -n "-f '$BG$FG  ' '  $BG$FG' -u '$UR  ' '  $BG$FG' "
echo -n "-F '%{B#333}%{F#FFF}  ' '  $BG$FG'>>"
>>>>>>> cfae85405ef8710bfff3bb5856b5c3f73799636c
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

<<<<<<< HEAD
} | genbar | lemonbar -b -o 1 -f "Noto Sans" -o -1 -f "FontAwesome" DVI-1
=======
} | genbar \
  | lemonbar -b -o 1 -f "Noto Sans" -o -1 -f "FontAwesome" \
  | sh > /dev/null
>>>>>>> cfae85405ef8710bfff3bb5856b5c3f73799636c
