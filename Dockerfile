FROM postgres:15
MAINTAINER maruTA-bis5 <bis5.wsys@gmail.com>

RUN apt update
RUN apt install -y postgresql-server-dev-15 make gcc wget libicu-dev

RUN wget https://github.com/pgbigm/pg_bigm/archive/refs/tags/v1.2-20240606.tar.gz
RUN tar zxf v1.2-20240606.tar.gz
RUN cd pg_bigm-1.2-20240606 && make USE_PGXS=1 && make USE_PGXS=1 install

RUN echo shared_preload_libraries='pg_bigm' >> /var/lib/postgresql/data/postgresql.conf

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
