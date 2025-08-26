#!/bin/bash

#Diretório de backup
backup_path="/home/lilwolf/Documents"

#Diretório destino do backup
external_storage="/mnt/backup"

#Formato do arquivo
date_format=$(date "+%d-%m-%Y")
final_archive="backup-$date_format.tar.gz"

#Log
log_file="/var/log/daily-backup.log"

##############
#TESTE#
#############
#checando se o dispositivo esta plugado na máquina.
if ! mountpoint -q -- $external_storage; then
	printf "DEVICE NOT MOUNTED in: $external_storage CHECK IT. \n"
	exit 1
fi

#################
#INICIO BACKUP.
################
tar -czSpf "$external_storage/$final_archive" "$backup_path"


#Registrar log
echo "$(date '+%d-%m-%Y %H:%M:%S') Backup completed: $final_arquive" >> "$log_file"





