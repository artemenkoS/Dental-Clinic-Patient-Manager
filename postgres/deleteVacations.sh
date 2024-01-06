#!/bin/bash

PG_USER=postgres
PG_DATABASE=aktis_patients

CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")

DELETE_QUERY="DELETE FROM vacation WHERE \"endDate\" < '$CURRENT_DATE';"

psql -U $PG_USER -d $PG_DATABASE -c "$DELETE_QUERY"
