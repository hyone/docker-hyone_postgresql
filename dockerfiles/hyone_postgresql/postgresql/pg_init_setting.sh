#!/bin/sh

chown postgres:postgres /var/lib/postgresql/ -R
su postgres -c "/usr/lib/postgresql/9.3/bin/initdb --encoding=UTF8 --no-locale -D /var/lib/postgresql/9.3/main/"
/etc/init.d/postgresql start
sleep 5
echo "ALTER ROLE postgres WITH PASSWORD '${POSTGRESQL_POSTGRES_PASSWORD}'" | su postgres -c psql
/etc/init.d/postgresql stop
