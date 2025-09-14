CREATE PIPE raw.load_raw_data
  AUTO_INGEST = TRUE
  AS
  COPY INTO raw.raw_events
  FROM @raw.internal_stage
  FILE_FORMAT = (TYPE = 'CSV');
