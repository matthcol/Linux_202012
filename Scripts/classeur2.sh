#!/bin/bash

if [ $# -ne 2 ] 
then
	echo "nombre de paramètres insuffisant (attendu 2, fourni $#)"
	exit -1
fi

DIR_IN=$1
BASEDIR_OUT=$2

if [ ! -d "${DIR_IN}" -o ! -d "${BASEDIR_OUT}" ]
then
	echo "un paramètre fourni n'est pas un répertoire"
	exit -1
fi

for IMG_PATH in ${DIR_IN}/*.jpg
do
	# extraction du nom d'image: IMG_20200731_112734.jpg
	IMG_FILENAME=${IMG_PATH##*/}
	# extraction de la partie date du nom du fichier
	DIR_DAY_IMAGE=${IMG_FILENAME:4:8}
	# dossier de destination en fonction d la date
	DIR_OUT=${BASEDIR_OUT}/${DIR_DAY_IMAGE}
	# creation du dossier si besoin
	mkdir -p ${DIR_OUT}
	# sol1: deplacement de la photo en reprecisant le nom du fichier
	mv ${IMG_PATH} ${DIR_OUT}/${IMG_FILENAME}
	# sol2: deplacement de la photo sans préciser le nom du fichier
	# (potentiellement dangereux si on n'a pas bien créé le répertoire avant)
	# mv ${IMG_PATH} ${DIR_OUT}
done
