# Bartender

Simple, modular bar generator

Designed to be used with `lemonbar`

### Configuration

Bars can easily be generated using a shell script. The script must
source the provided `source.sh` file to add the block direcory to its
`PATH`.

Next, the string for `lemonbar` is piped into `genbar`, where each
command to be run is delimited by `<<` and `>>`, which can be changed.

Finally, the output of `genbar` is piped into `lemonbar`. Each step can
be seen in the example script below. `lemonbar`'s output can also be
piped to sh for buttons.

````sh
#!/bin/env sh

# Sourcing this file adds the root and block dirs of this repo
source path/to/source.sh

# Between brackets the string to be piped is generated
# This allows us to break down the string into readable segments
{

# Center
echo -n "%{c}"
echo -n "<<clock +%H:%M>>"

} | genbar | lemonbar | sh
````
