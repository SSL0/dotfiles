#!/bin/sh
DIR="/"
USED=$(df -h ${DIR} | grep dev | awk '{print $3}')
AVAI=$(df -h ${DIR} | grep dev | awk '{print $2}')

printf "${USED}/${AVAI}"
