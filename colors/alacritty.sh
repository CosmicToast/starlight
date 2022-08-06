#!/bin/sh
. ./colors.sh

cat <<HEREDOC
# $theme
colors:
  # Default colors
  primary:
    foreground: '#$foreground'
    background: '#$background'

  # Normal colors
  normal:
    black:   '#$black'
    red:     '#$red'
    green:   '#$green'
    yellow:  '#$yellow'
    blue:    '#$blue'
    magenta: '#$magenta'
    cyan:    '#$cyan'
    white:   '#$white'

  # Bright colors
  bright:
    black:   '#$brblack'
    red:     '#$brred'
    green:   '#$brgreen'
    yellow:  '#$bryellow'
    blue:    '#$brblue'
    magenta: '#$brmagenta'
    cyan:    '#$brcyan'
    white:   '#$brwhite'
HEREDOC
