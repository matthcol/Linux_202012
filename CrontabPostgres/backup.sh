#!/bin/bash
export PATH=/bin
BACKUP_DIR=/mnt/backup/movies
pg_dump -U postgres -d postgres -p 5433 -n movie -Z 9 -f ${BACKUP_DIR}/backup`date +"%Y%m%d_%H%M%S"`.tgz > ${BACKUP_DIR}/backup.log 2>&1
