FROM clickhouse/clickhouse-server:latest
COPY clickhouse/config.d/platform.xml /etc/clickhouse-server/config.d/listen.xml