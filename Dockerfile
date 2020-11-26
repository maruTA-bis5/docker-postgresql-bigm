FROM postgres:12
MAINTAINER maruTA-bis5 <bis5.wsys@gmail.com>

RUN apt update
RUN apt install -y postgresql-server-dev-12 make gcc wget libicu-dev

RUN wget https://ja.osdn.net/dl/pgbigm/pg_bigm-1.2-20200228.tar.gz
RUN tar zxf pg_bigm-1.2-20200228.tar.gz
RUN cd pg_bigm-1.2-20200228 && make USE_PGXS=1 && make USE_PGXS=1 install

RUN echo shared_preload_libraries='pg_bigm' >> /var/lib/postgresql/data/postgresql.conf

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]


