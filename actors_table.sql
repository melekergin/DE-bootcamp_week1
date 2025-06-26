--DROP TABLE IF EXISTS actors CASCADE;

-- Now we can safely drop the types
--DROP TYPE IF EXISTS quality_class CASCADE;
--DROP TYPE IF EXISTS film_type CASCADE;

-- Recreate the enum type for quality classification
CREATE TYPE quality_class AS ENUM ('star', 'good', 'average', 'bad');

-- Recreate the composite type for film details
CREATE TYPE film_type AS (
    film TEXT,
    votes INTEGER,
    rating REAL,
    filmid TEXT,
    year INTEGER
);

-- Recreate the actors table
CREATE TABLE actors (
    actor TEXT,
    actorid TEXT PRIMARY KEY,
    films film_type[],
    quality_class quality_class,
    is_active BOOLEAN,
    current_year INTEGER
);

CALL load_actors_yearly(1970, 2020);
