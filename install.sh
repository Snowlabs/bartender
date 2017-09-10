#!/bin/sh

has() {
    command -v $1 2>&1 > /dev/null
    return $?
}

get_prompt() {
    read ans

    # return user input
    if [ -n "$ans" ]; then
        echo "$ans"

    # return default
    else
        echo "$1"
    fi | sed -e "s|~|$HOME|"
}

### SETUP
if ! has git; then
    echo "git is not installed! Aborting" 1>&2
    exit 1
fi

echo 'Where should bartender be installed?'
echo -n '[~/.local/share/bartender]: '
while :; do
    dir="$(get_prompt "$HOME/.local/share/bartender")"

    if [ -e "$dir" ]; then
        echo "There is already a directory at $dir"
        echo "Please choose another directory"
        echo ""
        continue
    else
        break
    fi
done
echo ""

echo 'Where should the genbar utility be linked to?'
echo -n '[~/bin]: '
bin="$(get_prompt "$HOME/bin")"
[ ! -d "$bin" ] && mkdir -p "$bin"
echo ""

### INSTALLATION
git clone 'https://github.com/Snowlabs/bartender.git' "$dir"
ln -s "$dir/genbar" "$bin/genbar"
