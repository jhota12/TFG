# Sistema de copias de seguridad híbrido (TFG ASIR)

## Descripción
Proyecto de diseño e implementación de un sistema de copias de seguridad y recuperación ante desastres (DRP) en un entorno híbrido (local + cloud).

## Tecnologías
- Windows Server (Active Directory, DNS)
- Ubuntu Server
- VirtualBox
- RAID (mdadm)
- rsync
- rclone
- cron

## Estructura del sistema
- /datos_empresa → datos principales
- /backup → almacenamiento local (RAID)
- cloud → almacenamiento externo

## Funcionamiento
1. Se generan datos en /datos_empresa
2. Se realiza copia local con rsync
3. Se sincroniza con cloud mediante rclone
4. Se automatiza con cron
5. Se generan logs

## Script de backup
Ubicación: scripts/backup.sh

## Ejecución manual