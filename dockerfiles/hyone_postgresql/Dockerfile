FROM hyone/sshd:latest
MAINTAINER hyone "hyone.development@gmail.com"

## Install

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list; \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -; \
  apt-get update

# * Stop postgresql service at the end to clean up files in /var/run/postgresql
#   ( if these have remained, cause problem not to start postgresql next time )
RUN apt-get install -q -y \
  postgresql-9.3 \
  postgresql-client-9.3 \
  postgresql-contrib-9.3 ; \
  /etc/init.d/postgresql stop

## Settings

RUN sed -i -e \
  "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" \
  /etc/postgresql/9.3/main/postgresql.conf
ADD postgresql/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD monit/postgresql /etc/monit/conf.d/postgresql

ENV POSTGRESQL_POSTGRES_PASSWORD V9CBTu4F
# set password for case of temporary usage (without persistent data container)
RUN /etc/init.d/postgresql start ; \
    echo "ALTER ROLE postgres WITH PASSWORD '${POSTGRESQL_POSTGRES_PASSWORD}'" | su postgres -c psql ; \
    /etc/init.d/postgresql stop ; \

## Command

ADD cmd.sh /usr/local/bin/cmd.sh
RUN chown root:root /usr/local/bin/cmd.sh; \
    chmod +x /usr/local/bin/cmd.sh
CMD ["/usr/local/bin/cmd.sh"]

# VOLUME ["/var/lib/postgresql"]

EXPOSE 5432
