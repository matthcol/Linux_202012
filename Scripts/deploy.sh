#!/bin/bash
# usage: ./deploy.sh FILE REMOTE_DIR < serveurs.txt

# TODO: verifier le nombre de parametre, existence du fichier

FILE=$1
REMOTE_DIR=$2

while read SERV
do
	scp ${FILE} ${SERV}:${REMOTE_DIR}/
done
