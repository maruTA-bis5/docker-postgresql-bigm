FROM postgres:9.4
MAINTAINER maruTA-bis5 <bis5.wsys@gmail.com>

RUN apt update
RUN apt install -y postgresql-server-dev-9.4 make gcc wget

RUN wget https://ja.osdn.net/dl/pgbigm/pg_bigm-1.2-20161011.tar.gz
RUN tar zxf pg_bigm-1.2-20161011.tar.gz
RUN cd pg_bigm-1.2-20161011 && make USE_PGXS=1 && make USE_PGXS=1 install

RUN echo shared_preload_libraries='pg_bigm' >> /var/lib/postgresql/data/postgresql.conf

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]


