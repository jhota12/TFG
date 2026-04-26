#!/bin/bash

# Variables
ORIGEN="/datos_empresa"
DESTINO="/backup/datos_empresa"
LOG="/home/prometeo/backup_$(date +%F).log"

# Backup local
rsync -av --delete $ORIGEN $DESTINO >> $LOG 2>&1

# Backup cloud
rclone copy $DESTINO remote:backup >> $LOG 2>&1

# Estado
echo "Backup finalizado $(date)" >> $LOG