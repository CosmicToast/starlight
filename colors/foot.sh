#!/bin/sh
. ./colors.sh

cat <<HEREDOC
# $theme
[colors]
foreground = $foreground
background = $background

regular0 = $black
regular1 = $red
regular2 = $green
regular3 = $yellow
regular4 = $blue
regular5 = $magenta
regular6 = $cyan
regular7 = $white

bright0 = $brblack
bright1 = $brred
bright2 = $brgreen
bright3 = $bryellow
bright4 = $brblue
bright5 = $brmagenta
bright6 = $brcyan
bright7 = $brwhite
HEREDOC
