#!/bin/bash

# Variables
ORIGEN="/datos_empresa/"
DESTINO="/backup/datos_empresa/"
LOG="/home/prometeo/backup_$(date +%F).log"

echo "==== Inicio backup $(date) ====" >> "$LOG"

# Backup local
rsync -av --delete "$ORIGEN" "$DESTINO" >> "$LOG" 2>&1

# Comprobar resultado rsync
if [ $? -eq 0 ]; then
    echo "Backup local OK" >> "$LOG"
else
    echo "ERROR en backup local" >> "$LOG"
fi

# Backup cloud
rclone copy "$DESTINO" remote:backup >> "$LOG" 2>&1

# Comprobar resultado rclone
if [ $? -eq 0 ]; then
    echo "Backup cloud OK" >> "$LOG"
else
    echo "ERROR en backup cloud" >> "$LOG"
fi

echo "==== Fin backup $(date) ====" >> "$LOG"
