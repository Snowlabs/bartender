#!/bin/env python3

from subprocess import Popen, PIPE
from threading import Thread

import re
import sys


## Variables

# Standard input
stdin = sys.stdin.read()

# Entire string split by matches
base = re.split(r'(\$\([^\)]+\))', stdin)

# List containing only the command names
cmds = re.findall(r'(\$\([^\)]+\))', stdin)
for i, v in enumerate(cmds):
    cmds[i] = cmds[i].strip("$()") # Removes '$()' chars

# Output values from cmds to replace those in base
replace = cmds[:]



# Replace output of respective commands in the base string
# Both args are lists of strings
# Values from base are replaced from those in rep
def genout(base, rep):

    for i, v in enumerate(rep):
        base[i * 2 + 1] = rep[i].rstrip('\n')

    return ''.join(base)


# Starts a subprocess with cmds[id] as the command.
# Output is flushed to replace[id] and genout is called every newline.
def opensub(id):
    with Popen(cmds[id], stdout=PIPE, universal_newlines=True) as p:
        for line in p.stdout:
            replace[id] = line
            print(genout(base, replace), flush=True)


# Start each command on its own thread
for i, v in enumerate(cmds):
    Thread(target=opensub, args=(i,)).start()
