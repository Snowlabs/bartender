# Bartender

Simple, modular bar generator

Designed to be used with `lemonbar`

### Configuration

Bars can easily be generated using a shell script. The script must have the
genbar command and the commands under block in its path. Alternatively, the
`$TENDERBLOCKS` variable can be set to the blocks directory for genbar to
prepend to the path.

Next, the string for `lemonbar` is piped into `genbar`, where each
command to be run is delimited by `<<` and `>>`, which can be changed.

Finally, the output of `genbar` is piped into `lemonbar`. Each step can
be seen in the example script below. `lemonbar`'s output can also be
piped to sh for buttons.

````sh
#!/bin/env sh

# Between brackets the string to be piped is generated
# This allows us to break down the string into readable segments
# -n is used to not have a newline. Any command can be used, such as printf
{

# Center
echo -n "%{c}"
echo -n "<<clock +%H:%M>>"

} | genbar | lemonbar | sh
````
