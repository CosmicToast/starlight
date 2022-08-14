function HexToDword {
  param (
    [Parameter(Mandatory, ValueFromPipeline,
      HelpMessage='Hex-formatted 24-bit RGB value to convert')]
    [ValidatePattern('^[0-9a-fA-F]{6}$')]
    [string]$Hex
  )
  $r = $Hex.Substring(0, 2).ToLower()
  $g = $Hex.Substring(2, 2).ToLower()
  $b = $Hex.Substring(4, 2).ToLower()
  return "dword:00$b$g$r"
}

function NameToTableIndex {
  param (
    [Parameter(Mandatory, ValueFromPipeline,
      HelpMessage='Starlight color name')]
    [ValidatePattern('^(br)?(black|blue|green|cyan|red|magenta|yellow|white)$')]
    [string]$Name
  )
  switch ($Name) {
    'black'     { 00 }
    'blue'      { 01 }
    'green'     { 02 }
    'cyan'      { 03 }
    'red'       { 04 }
    'magenta'   { 05 }
    'yellow'    { 06 }
    'white'     { 07 }
    'brblack'   { 08 }
    'brblue'    { 09 }
    'brgreen'   { 10 }
    'brcyan'    { 11 }
    'brred'     { 12 }
    'brmagenta' { 13 }
    'bryellow'  { 14 }
    'brwhite'   { 15 }
  }
}

# reasonable bg/fg defaults
$bg = 0
$fg = 7

Write-Output 'Windows Registry Editor Version 5.00'
Write-Output '[HKEY_CURRENT_USER\Console]'
Get-Content .\colors.sh | ForEach-Object {
  $Name, $Value = $_ -split '='
  try {
    if ($Name -eq 'background') { $bg = $(NameToTableIndex $Value.Substring(1)) }
    if ($Name -eq 'foreground') { $fg = $(NameToTableIndex $Value.Substring(1)) }
    Write-Output $('"ColorTable{0:d2}"={1}' -f $(NameToTableIndex $Name), $(HexToDword $Value))
  } catch {}
}
Write-Output $('"ScreenColors"=dword:000000{0:x}{1:x}' -f $bg, $fg)
