# HögLåg v1.0
<# .SYNOPSIS
     Gissa ett nummer. 
.DESCRIPTION
     Ett enkelt spel där man gissar på nummer."
.NOTES
     Author     : Erik Zalitis - erik@zalitis.se
.LINK
     http://erik.zalitis.se
#>
cls
$intHNummer=100 # Högsta möjliga nummer
$intLNummer=1 # Lägsta möjliga nummer
$intAntalGissningar = 0
$intNummer = Get-Random -Maximum $intHNummer -Minimum $intLNummer

[int]$intGissning = Read-Host -Prompt ("Ange ett nummer mellan " + $intLNummer + " och " + $intHNummer + " (0 för att avsluta):")


do {
$intAntalGissningar++
if ($intGissning -eq 0) { exit }
elseif ($intGissning -lt $intNummer) { $intGissning = Read-Host -Prompt "För lågt Försök igen:" }
elseif ($intGissning -gt $intNummer) { $intGissning = Read-Host -Prompt "För högt. Försök igen:" }
} until ($intgissning -eq $intNummer)
write-host ("Bra jobbat! Du gissade rätt! Du tog det på " + $intAntalGissningar +  " försök.")