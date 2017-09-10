#!/bin/sh

## javyre colorscheme
fg_color="#d8dee9"
bg_color="#262626"
bz_color="#151515"
ac_color="#0d61ac"
ur_color="#870000"

rslant=""
lslant=""

lvl0="%{B$bz_color}%{F$bg_color}"
lvl1="%{B$bg_color}%{F$fg_color}"
lvl2="%{B$ac_color}%{F$fg_color}"
urge="%{B$ur_color}%{F$fg_color}"

trans() {
    ret=
    if [ "$4" = "l" ]; then
        _from="$3"; _to="$1"
        _slant="$lslant"
    else
        _from="$1"; _to="$3"
        _slant="$rslant"
    fi

    case $_from in
        0) _fg="%{F$bz_color}" ;;
        1) _fg="%{F$bg_color}" ;;
        2) _fg="%{F$ac_color}" ;;
        u) _fg="%{F$ur_color}" ;;
    esac
    case $_to in
        0) _bg="%{B$bz_color}$ret" ;;
        1) _bg="%{B$bg_color}$ret" ;;
        2) _bg="%{B$ac_color}$ret" ;;
        u) _bg="%{B$ur_color}$ret" ;;
    esac

    eval "ret=\"$_fg$_bg$_slant\$lvl$3\""

    echo -n "$ret"
}


sep="        "

screen1="DVI-1"
screen2="DVI-0"

i3ws_common="\
-S -B -c \
-f '$lvl0  ' '  ' \
-F '$lvl1  ' '  ' \
-u '$urge  ' '  ' \
-psf '' \"$(trans 0 to 0)\" \
-psF '' \"$(trans 1 to 0)\" \
-psu '' \"$(trans u to 0)\" \
"

lemonbar_common=$(
# -u 2 -a 20 -b \
echo "\
-u 2 -a 20 \
-o '0' -f 'Noto Sans-12' \
-o '-1' -f 'Monaco for Powerline for Slantline-13' \
-o '-1' -f 'FontAwesome-12' \
"
)


{
echo -n "$lvl0"

### Left
echo -n "%{l}"

echo -n "<<"
echo -n "i3ws "
echo -n "-m $screen1 "
echo -n "$i3ws_common"
echo -n ">>"

echo -n "$sep"
trans 0 to 2


echo -n "<<music -f 'prev:---:toggle:---:next'>>"
echo -n "    "
echo -n "<<music -f 'title'>>"

trans 2 to 0


### Center
echo -n "%{c}"

trans 0 to 1
echo -n "<<i3window>>"
trans 1 to 0

echo -n "$sep"

trans 0 to 2
echo -n " "
trans 2 to 1
echo -n " / "
trans 1 to 2
echo -n ": <<disk -n 300 -H -f 2 />>"
trans 2 to 0

### Right
echo -n "%{r}"

trans 0 to 1 l
echo -n " <<clock '+%a, %d %b %I:%M'>> "
trans 1 to 2 l
echo -n "   <<vol -j -o -s -c PRIVATE>> "

echo -n "$lvl0"

# Requires a patched lemonbar for xft support
} | genbar -b '<<' -e '>>' | \
    eval lemonbar $lemonbar_common "$screen1" | sh &> /dev/null &

wait
