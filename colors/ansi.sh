#!/bin/sh
# utilities for outputting ansi escape codes
# including ansi colors and truecolor

# low level output coding
acol() { printf '%b[%dm' '\033' "$@"; }
pcol() { printf '%b[%d;2;%d;%d;%dm' '\033' "$1" "$2" "$3" "$4"; }
pcolx() { pcol "$1" 0x"$2" 0x"$3" 0x"$4"; }
fg()  { pcol  38 "$@"; }
fgx() { pcolx 38 "$@"; }
bg()  { pcol  48 "$@"; }
bgx() { pcolx 48 "$@"; }
bold()  { acol 1 "$@"; }
reset() { acol 0; }

# logical input processing
colsep() { echo $* | fold -w2; }
fgc() { fgx $(colsep $1); }
bgc() { bgx $(colsep $1); }
