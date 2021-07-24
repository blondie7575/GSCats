#!/bin/sh

MAME=/Applications/Ample.app/Contents/MacOS/mame64
cd '/Users/qd/Library/Application Support/Ample'
$MAME apple2gsr1 -skip_gameinfo -nosamples -window -nomax -bgfx_screen_chains unfiltered -flop3 /Users/qd/Documents/Apple2/GSCats/gscats.2mg

