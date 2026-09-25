FROM clickhouse/clickhouse-server:latest
COPY listen.xml /etc/clickhouse-server/config.d/listen.xml