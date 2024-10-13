-- Create Galaxy Table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    size_km NUMERIC NOT NULL,
    spiral BOOLEAN NOT NULL,
    num_stars INT,
    num_planets INT
);

-- Insert Galaxy Rows
INSERT INTO galaxy (name, size_km, spiral, num_stars, num_planets) VALUES
('Milky Way', 100000000000, TRUE, 100000, 8000),
('Andromeda', 220000000000, TRUE, 1000000, 9000),
('Sombrero', 60000000000, FALSE, 50000, 7000);

-- Create Star Table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    brightness INT NOT NULL,
    age_billion_years NUMERIC,
    habitable BOOLEAN NOT NULL
);

-- Insert Star Rows
INSERT INTO star (name, galaxy_id, brightness, age_billion_years, habitable) VALUES
('Sun', 1, 100, 4.6, TRUE),
('Alpha Centauri', 2, 90, 5.0, TRUE);

-- Create Planet Table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    mass_kg NUMERIC NOT NULL,
    radius_km INT NOT NULL,
    rings BOOLEAN NOT NULL
);

-- Insert Planet Rows
INSERT INTO planet (name, star_id, mass_kg, radius_km, rings) VALUES
('Earth', 1, 5.972E24, 6371, FALSE),
('Mars', 1, 0.641E24, 3389, FALSE);

-- Create Moon Table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    diameter_km INT NOT NULL,
    volcanic BOOLEAN NOT NULL
);

-- Insert Moon Rows
INSERT INTO moon (name, planet_id, diameter_km, volcanic) VALUES
('Moon', 1, 3475, FALSE),
('Phobos', 2, 22, FALSE);

-- Create Asteroid Table (Custom)
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    size_km NUMERIC NOT NULL,
    near_earth BOOLEAN NOT NULL,
    planet_id INT REFERENCES planet(planet_id)
);

-- Insert Asteroid Rows
INSERT INTO asteroid (name, size_km, near_earth, planet_id) VALUES
('Ceres', 939, FALSE, 1),
('Vesta', 525, TRUE, 2);
