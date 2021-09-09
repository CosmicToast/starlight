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

# decimal (1-255) 2 real (0-1)
# $1 is an integer from 1 to 255
d2r() {
	awk "BEGIN{print $1 / 255}"
}

# $1: color value
# prints full <dict>
dict() {
	_dict_r=$(d2r $(h2d $(extract $1 R)))
	_dict_g=$(d2r $(h2d $(extract $1 G)))
	_dict_b=$(d2r $(h2d $(extract $1 B)))

	cat <<HEREDOC
<dict>
		<key>Color Space</key>
		<string>sRGB</string>
		
		<key>Alpha Component</key>
		<real>1</real>
		
		<key>Red Component</key>
		<real>$_dict_r</real>
		
		<key>Green Component</key>
		<real>$_dict_g</real>
		
		<key>Blue Component</key>
		<real>$_dict_b</real>
	</dict>
HEREDOC
}

cat <<HEREDOC
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Theme Name</key>
	<string>$theme</string>

	<key>Ansi 0 Color</key>
	$(dict $black)

	<key>Ansi 1 Color</key>
	$(dict $red)

	<key>Ansi 2 Color</key>
	$(dict $green)

	<key>Ansi 3 Color</key>
	$(dict $yellow)

	<key>Ansi 4 Color</key>
	$(dict $blue)

	<key>Ansi 5 Color</key>
	$(dict $magenta)

	<key>Ansi 6 Color</key>
	$(dict $cyan)

	<key>Ansi 7 Color</key>
	$(dict $white)

	<key>Ansi 8 Color</key>
	$(dict $brblack)

	<key>Ansi 9 Color</key>
	$(dict $brred)

	<key>Ansi 10 Color</key>
	$(dict $brgreen)

	<key>Ansi 11 Color</key>
	$(dict $bryellow)

	<key>Ansi 12 Color</key>
	$(dict $brblue)

	<key>Ansi 13 Color</key>
	$(dict $brmagenta)

	<key>Ansi 14 Color</key>
	$(dict $brcyan)

	<key>Ansi 15 Color</key>
	$(dict $brwhite)

	<key>Background Color</key>
	$(dict $background)

	<key>Foreground Color</key>
	$(dict $foreground)

	<key>Selected Text Color</key>
	$(dict $background)

	<key>Selection Color</key>
	$(dict $foreground)

	<key>Cursor Color</key>
	$(dict $foreground)

	<key>Cursor Text Color</key>
	$(dict $background)

	<key>Link Color</key>
	$(dict $brblue)
</dict>
</plist>
HEREDOC
