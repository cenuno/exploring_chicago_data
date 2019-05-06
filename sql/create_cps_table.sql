/* Drop the cps_sy1819 table if it exists */
DROP TABLE IF EXISTS cps_sy1819;

/* Create skelton table that supplies the table name, column names, and column types */
CREATE TABLE cps_sy1819 (
    school_id VARCHAR(12) PRIMARY KEY
    , short_name CHAR(150)
    , is_high_school VARCHAR(50)
    );

/* Copy data from CSV file to the table */
COPY cps_sy1819 
FROM '/Users/cnuno/Documents/exploring_chicago_data/write_data/cps_sy1819_three_columns.csv' 
WITH (FORMAT csv);
