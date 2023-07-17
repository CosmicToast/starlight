#!/bin/sh
. ./ansi.sh
. ./colors.sh

lightness() {
	bc -l <<-EOF
	define pow(a, b) {
		if (scale(b) == 0) return a ^ b
		return e(b * l(a))
	}
	define cprime(c) {
		c = c/256
		if (c <= 0.03928) return(c / 12.92)
		return pow((c + 0.055)/1.055, 2.4)
	}
	define lumi(r, g, b) {
		return (cprime(r) * 0.2126) + \
			(cprime(g) * 0.7152) + \
			(cprime(b) * 0.0722)
	}
	lumi($1, $2, $3)
	EOF
}
contrast() {
	bc <<-EOF
	scale = 2
	define contrast(a, b) {
		if (a > b) {
			return (a + 0.05) / (b + 0.05)
		} else {
			return (b + 0.05) / (a + 0.05)
		}
	}
	contrast($(lightness $(coldec $1)), $(lightness $(coldec $2)))
	EOF
}

[ $# -lt 0 ] || set -- \
	red   green   yellow   blue   magenta   cyan   white \
	brred brgreen bryellow brblue brmagenta brcyan brwhite

# lower: error if below this
lower=4
# higher: warn if below this
higher=7

reprint() {
	printf '%s%s' "$@" "$(reset)"
}

demo() {
	reprint "$(fgc $1)$(bgc $2)  demo text  "
}

gt() {
	test -n "$(printf 'if (%s > %s) 1' "$1" "$2" | bc)"
}

for i; do
	color=$(eval echo '$'$i)
	value=$(contrast $background $color)
	if gt "$lower" "$value"; then
		# fail
		reprint "$(acol 31)fail"
	elif gt "$higher" "$value"; then
		# warn
		reprint "$(acol 33)warn"
	else
		# pass
		reprint "$(acol 32)pass"
	fi
	printf ': #%s at %s\t%s (%s)\n' \
		"$color" "$value" "$(demo $color $background)" "$i"
done
