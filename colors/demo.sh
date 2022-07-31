#!/bin/sh
# demo as in starlight.png
# requires truecolor

# for every color:
# color, bright color | bold color, bright bold color

# low level output coding
pcol() { printf '%b[%d;2;%d;%d;%dm' '\033' "$1" "$2" "$3" "$4"; }
pcolx() { pcol "$1" 0x"$2" 0x"$3" 0x"$4"; }
fg()  { pcol  38 "$@"; }
fgx() { pcolx 38 "$@"; }
bg()  { pcol  48 "$@"; }
bgx() { pcolx 48 "$@"; }
bold()  { printf '%b[1m' '\033'; }
reset() { printf '%b[0m' '\033'; }

# logical input processing
colsep() { echo $* | fold -w2; }
fgc() { fgx $(colsep $1); }
bgc() { bgx $(colsep $1); }

# loop
demopart() {
	eval fgc '$'"$1"
	if [ $# -gt 1 ]; then
		bold
		printf 'bold '
	fi
	# 9 is the length of brmagenta
	printf '%-9s' "$1"
	reset
}

demo() {
	for col in black red green yellow blue magenta cyan white; do
		printf '%b %b | %b %b\n' "$(demopart $col)" "$(demopart br$col)" \
			"$(demopart $col bold)" "$(demopart br$col bold)"
	done
}

. ./colors.sh
demo
