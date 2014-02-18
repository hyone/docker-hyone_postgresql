# hyone/postgresql Dockerfile

my PostgreSQL ready dockerfile

## Build

```sh
$ bundle install
$ bundle exec rake docker:build
```

## Run

run with mounting persistent data container

```sh
$ bundle exec rake docker:run
```

### access database

then, we can access PostgreSQL server like below :

```sh
$ psql -h <CONTAINER_HOST> -U postgres -p <CONTAINER_POSTGRESQL_PORT>
```

- initial *postgres* user password is `${POSTGRESQL_POSTGRES_PASSWORD}` set by Dockerfile


## Test

```sh
$ bundle exec rake spec
```

## Author

hyone (hyone.development@gmail.com)
