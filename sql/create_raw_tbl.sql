CREATE IF NOT EXISTS TABLE raw.raw_events (
       event_timestamp TIMESTAMP,
       process_name STRING,
       process_id NUMBER,
       message STRING
)