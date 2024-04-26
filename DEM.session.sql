SELECT ST_Value(rast, 1, 1, 1) AS elevation_value
FROM elevation
WHERE rid = 1;


SELECT rid, (stats).mean AS avg_elevation
FROM (SELECT rid, ST_SummaryStats(rast) AS stats FROM elevation WHERE rid = 1) as subquery;


SELECT 
  ST_UpperLeftX(rast) AS upper_left_x, -- X coordinate of the upper-left pixel
  ST_UpperLeftY(rast) AS upper_left_y  -- Y coordinate of the upper-left pixel
FROM 
  elevation
WHERE 
  rid = 1;


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE tracks (
	id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
	line geometry(Linestring, 4326),
	track_id TEXT
);

CREATE INDEX tracks_line_idx ON tracks USING GIST(line);