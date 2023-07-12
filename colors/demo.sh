#!/bin/sh
. ./ansi.sh
# demo as in starlight.png
# requires truecolor

# for every color:
# color, bright color | bold color, bright bold color

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
	bgc $background
}

demo() {
	for col in black red green yellow blue magenta cyan white; do
		printf '%b %b | %b %b\n' "$(demopart $col)" "$(demopart br$col)" \
			"$(demopart $col bold)" "$(demopart br$col bold)"
	done
}

. ./colors.sh
bgc $background
demo
reset
