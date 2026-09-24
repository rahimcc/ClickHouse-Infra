# Storage stack

| Service           | Address                      |
|-------------------|------------------------------|
| SeaweedFS S3 API  | http://localhost:8333 (inside network: http://seaweedfs:8333) |
| SeaweedFS filer UI| http://localhost:8888 (browse buckets/files) |
| ClickHouse HTTP   | http://localhost:8123 (Play UI: /play)     |
| ClickHouse native | localhost:9000               |

    make init   # edit secrets in .env
    make up     # buckets from S3_BUCKETS are created automatically
    make ch     # SQL shell

## Using the lake from ClickHouse
    -- write a table to the lake as Parquet
    INSERT INTO FUNCTION s3(lake, filename = 'exports/orders.parquet', format = 'Parquet')
    SELECT * FROM warehouse.orders;

    -- read files back
    SELECT * FROM s3(lake, filename = 'exports/*.parquet');

    -- store a table directly on SeaweedFS
    CREATE TABLE archive (...) ENGINE = MergeTree ORDER BY id SETTINGS storage_policy = 'lake';
