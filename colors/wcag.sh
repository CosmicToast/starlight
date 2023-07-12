#!/bin/sh
. ./ansi.sh
. ./colors.sh

# this uses the webaim.org contrast checker api to check all colors against
# background.
# depends on jo, jq, and xh

[ $# -lt 0 ] || set -- \
	red   green   yellow   blue   magenta   cyan   white \
	brred brgreen bryellow brblue brmagenta brcyan brwhite

# lower: error if below this
lower=4.5
# higher: warn if below this
higher=7

# reset after printing
reprint() {
	printf '%s%s' "$@" "$(reset)"
}

prefix() {
	reprint "$(acol $1)$2"
}

demo() {
	reprint "$(fgc $color)$(bgc $background)demo text"
}

# $1 should be "fail" or "warn"
fmt() {
	case "$1" in
		fail) printf '"%s: #%s at \(.ratio)\t%s (%s)\n"' \
				"$(prefix 31 fail)" "$color" "$(demo)" "$colnm";;
		warn) printf '"%s: #%s at \(.ratio)\t%s (%s)\n"' \
				"$(prefix 33 warn)" "$color" "$(demo)" "$colnm";;
		*) printf '""' ;;
	esac
}

# reads stdin (json) and prints information about color if it fails
check() {
	jq -j "
		if (.ratio | tonumber) < $lower then    $(fmt fail)
		elif (.ratio | tonumber) < $higher then $(fmt warn)
		else                                    $(fmt none)
		end"
}

for i; do
	color=$(eval echo '$'$i)
	colnm=$i
	xh https://webaim.org/resources/contrastchecker/ api== \
		bcolor==$background fcolor==$color | \
		jo -f- color=$color | check
	done
