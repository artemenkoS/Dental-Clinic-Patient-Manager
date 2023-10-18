Для запуска в режиме разработки:
docker-compose -f docker-compose.dev.yml up --build

Для бекапа БД:
docker exec -it containerID bash

pg_dump -U postgres -d aktis_patients -f /backups/filename.sql

Для восстановления БД из бекапа:
docker exec -it containerID bash

psql -U postgres -d postgres -c "CREATE DATABASE aktis_patients" 2> /dev/null || true

psql -U postgres -d aktis_patients -f /backups/filename.sql

Для запуска в production режиме:
docker-compose up --build
