#!/bin/sh
. ./colors.sh

# $1 is the combined value
# $2 is R, G or B
extract() {
	case "$2" in
		R) awk "BEGIN{print substr(\"$1\", 1, 2)}" ;;
		G) awk "BEGIN{print substr(\"$1\", 3, 2)}" ;;
		B) awk "BEGIN{print substr(\"$1\", 5, 2)}" ;;
		*) return 1 ;;
	esac
}

# hex 2 decimal
# $1 is a number in hex
h2d() {
	printf '%d' 0x"$1"
}

# $1: color value
# prints r,g,b
rgb() {
	_rgb_r=$(h2d $(extract $1 R))
	_rgb_g=$(h2d $(extract $1 G))
	_rgb_b=$(h2d $(extract $1 B))
	echo $_rgb_r,$_rgb_g,$_rgb_b
}

cat <<HEREDOC
[Background]
Color=$(rgb $background)

[BackgroundIntense]
Color=$(rgb $background)

[Color0]
Color=$(rgb $black)

[Color0Intense]
Color=$(rgb $brblack)

[Color1]
Color=$(rgb $red)

[Color1Intense]
Color=$(rgb $brred)

[Color2]
Color=$(rgb $green)

[Color2Intense]
Color=$(rgb $brgreen)

[Color3]
Color=$(rgb $yellow)

[Color3Intense]
Color=$(rgb $bryellow)

[Color4]
Color=$(rgb $blue)

[Color4Intense]
Color=$(rgb $brblue)

[Color5]
Color=$(rgb $magenta)

[Color5Intense]
Color=$(rgb $brmagenta)

[Color6]
Color=$(rgb $cyan)

[Color6Intense]
Color=$(rgb $brcyan)

[Color7]
Color=$(rgb $white)

[Color7Intense]
Color=$(rgb $brwhite)

[Foreground]
Color=$(rgb $foreground)

[ForegroundIntense]
Color=$(rgb $foreground)

[General]
Description=Starlight
Opacity=0.96
Wallpaper=
HEREDOC
