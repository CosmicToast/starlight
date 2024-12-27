#!/bin/sh
. ./colors.sh

cat <<HEREDOC
# $theme
background = $background
foreground = $foreground

# cursor-color
# selection-background
# selection-foreground

palette =  0=$black
palette =  1=$red
palette =  2=$green
palette =  3=$yellow
palette =  4=$blue
palette =  5=$magenta
palette =  6=$cyan
palette =  7=$white
palette =  8=$brblack
palette =  9=$brred
palette = 10=$brgreen
palette = 11=$bryellow
palette = 12=$brblue
palette = 13=$brmagenta
palette = 14=$brcyan
palette = 15=$brwhite
HEREDOC
