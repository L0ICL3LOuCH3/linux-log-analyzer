# Linux Log Analyzer

Mini-projet Linux/Bash/AWK pour analyser un fichier de logs simulés en cybersécurité.

## Objectif

Ce projet sert à pratiquer :

- Bash scripting
- AWK
- analyse de logs
- extraction de données
- détection d'événements suspects

## Fichiers

- `analyse.sh` : script principal
- `data.txt` : fichier de logs simulés
- `rapport.txt` : rapport généré automatiquement

## Fonctionnalités

Le script analyse `data.txt` et génère un rapport avec :

- nombre total de lignes
- nombre de connexions `login`
- nombre d'échecs `failed`
- accès refusés `denied`
- erreurs `ERROR`
- mots de passe détectés
- attaques détectées
- IP trouvées
- utilisateurs extraits
- IP listées
- alertes de sécurité


## Technologies utilisées

- Bash
- AWK
- Linux CLI

## Utilisation

1. Rendre le script exécutable :
   chmod +x analyse.sh

2. Lancer le script :
   ./analyse.sh

3. Résultat :
   Un fichier rapport.txt est généré

## Auteur

L0ICL3LOuCH3
