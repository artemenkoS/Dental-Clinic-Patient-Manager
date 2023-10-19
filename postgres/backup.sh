#!/bin/bash

PG_USER=postgres
PG_DATABASE=aktis_patients
BACKUP_DIR=/backups

BACKUP_FILENAME="$BACKUP_DIR/backup-$(TZ=Asia/Aqtobe date +\%Y\%m\%d\%H\%M\%S).sql"
pg_dump  -U $PG_USER -d $PG_DATABASE -f $BACKUP_FILENAME


