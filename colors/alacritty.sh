#!/bin/sh
. ./colors.sh

cat <<HEREDOC
# $theme
# Default colors
[colors.primary]
foreground = '#$foreground'
background = '#$background'

# Normal colors
[colors.normal]
black   = '#$black'
red     = '#$red'
green   = '#$green'
yellow  = '#$yellow'
blue    = '#$blue'
magenta = '#$magenta'
cyan    = '#$cyan'
white   = '#$white'

# Bright colors
[colors.bright]
black   = '#$brblack'
red     = '#$brred'
green   = '#$brgreen'
yellow  = '#$bryellow'
blue    = '#$brblue'
magenta = '#$brmagenta'
cyan    = '#$brcyan'
white   = '#$brwhite'
HEREDOC
