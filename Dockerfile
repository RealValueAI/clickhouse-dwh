FROM yandex/clickhouse-server:latest

COPY config/clickhouse-server-config.xml /etc/clickhouse-server/config.xml
COPY config/users.xml /etc/clickhouse-server/users.xml
COPY init /docker-entrypoint-initdb.d/

WORKDIR /var/lib/clickhouse

EXPOSE 8123 9000

CMD ["clickhouse-server", "--config-file=/etc/clickhouse-server/config.xml"]
