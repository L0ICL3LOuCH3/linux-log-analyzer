#!/bin/bash

#================================================================
#MINIPROJET
#AUTEUR:L0ICL3LOuCH3
#================================================================

RAPPORT="rapport.txt" > "$RAPPORT"

echo "==================RAPPORT ANALYSE==========================" |tee -a "$RAPPORT"
echo "***********************************************************" |tee -a "$RAPPORT"

awk '{count++} END{printf "Total lignes: %d\n" , count}' "data.txt" | tee -a "$RAPPORT"

awk '
/login/{login++}
/failed|ERROR/{alerte++}
/192/{ip++}
/password/{password++}
 END{
	printf "Login: %d\n" , login 
	printf "Alertes: %d\n" , alerte 
	printf "IP: %d\n" , ip 
	printf "Passwords: %d\n" , password 

}' "data.txt" | tee -a "$RAPPORT"

awk -F "=" '
BEGIN {print "users trouves:"}
/user=/  {printf "- %s\n", $NF} 
' "data.txt" | tee -a "$RAPPORT"

echo "*************************************************************" | tee -a "$RAPPORT"
