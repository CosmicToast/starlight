#!/bin/sh
. ./colors.sh

cat <<HEREDOC
! $theme
! special
*.foreground:   #$foreground
*.background:   #$background
! black
*.color0:       #$black
*.color8:       #$brblack
! red
*.color1:       #$red
*.color9:       #$brred
! green
*.color2:       #$green
*.color10:      #$brgreen
! yellow
*.color3:       #$yellow
*.color11:      #$bryellow
! blue
*.color4:       #$blue
*.color12:      #$brblue
! magenta
*.color5:       #$magenta
*.color13:      #$brmagenta
! cyan
*.color6:       #$cyan
*.color14:      #$brcyan
! white
*.color7:       #$white
*.color15:      #$brwhite
HEREDOC
