#!/bin/sh

POSTGRES_DATADIR=/var/lib/postgresql

# if data directory is empty, initialize database
if [ "$(ls ${POSTGRES_DATADIR} | wc -l)" -eq 0 ]; then
  chown postgres:postgres ${POSTGRES_DATADIR} -R
  su postgres -c "/usr/lib/postgresql/9.3/bin/initdb --encoding=UTF8 --no-locale -D /var/lib/postgresql/9.3/main/"
  /etc/init.d/postgresql start
  sleep 5
  echo "ALTER ROLE postgres WITH PASSWORD '${POSTGRESQL_POSTGRES_PASSWORD}'" | su postgres -c psql
  /etc/init.d/postgresql stop
  sleep 3
  echo 'Finish to set up database'
fi

echo 'Start to monit...'
exec /usr/bin/monit -I
