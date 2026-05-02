#!/bin/bash
#================================================================
#MINIPROJET
#AUTEUR:L0ICL3LOuCH3
#================================================================

RAPPORT="rapport.txt"
 > "$RAPPORT"

file="data.txt"

echo "*****************|***************|**************************" |tee -a "$RAPPORT"
echo "=================|RAPPORT ANALYSE|==========================" |tee -a "$RAPPORT"
echo "*****************-***************-**************************" |tee -a "$RAPPORT"
echo "  "|tee -a "$RAPPORT"

awk '{count++} END{printf "Total lignes: %d\n" , count}' "$file" | tee -a "$RAPPORT"
echo  "  " |tee -a "$RAPPORT"

awk '
/login/{login++}
/failed/{alerte++}
/denied/{d++}
/ERROR/{e++}
/attack/{a++}
/password/{password++}
/ip/{ip++} 

 END{
	printf "Login: %d\n" , login 
	printf "FAILED: %d\n" , alerte 
	printf "DENIED: %d\n" , d 
	printf "ERRORS: %d\n" , e
	printf "PASSWORDS: %d\n" , password
	printf "ATTACKS: %d\n" , a
	printf "IPS: %d\n" , ip 

}' "$file" | tee -a "$RAPPORT"
echo "  " |tee -a "$RAPPORT"
awk  '
BEGIN {
	print "USERS TROUVERS:"
}
{
   for (i=1; i<=NF; i++) {
      if ($i ~ /^user=/) {
	split($i, u, "=")
	print "- " u[2]
	}
    }
}' "$file" | tee -a "$RAPPORT"

echo "  " |tee -a "$RAPPORT"

awk '
BEGIN{
	print "IP SUSPECTES:"
}
{
 for (i=1; i<=NF; i++) { 
    if ($i ~ /^ip=/){
	split($i, u, "=") 
	print "+ " u[2]
	}
   }
}' "$file" |tee -a "$RAPPORT"

echo "ALERTES:" | tee -a "$RAPPORT"

awk '/failed|denied|ERROR|attack|brute force/ {print "- " $0}' "$file" | tee -a "$RAPPORT"


echo "*************************************************************" | tee -a "$RAPPORT"
