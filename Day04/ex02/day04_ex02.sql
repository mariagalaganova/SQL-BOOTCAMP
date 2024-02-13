CREATE VIEW v_generated_dates AS
SELECT generated_dates::date AS generated_date
FROM GENERATE_SERIES('2022-01-01', '2022-01-31', INTERVAL '1 DAY') AS generated_dates