FROM clickhouse/clickhouse-server:latest
COPY clickhouse/config.d/platform /etc/clickhouse-server/config.d/listen.xml