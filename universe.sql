psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;

c\ universe;

CREATE TABLE galaxy(
galaxy_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
description_galaxy TEXT NOT NULL,
plants_num INT,
is_active BOOLEAN NOT NULL,
age_years NUMERIC NOT NULL
);

CREATE TABLE star(
star_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
galaxy_id INT NOT NULL,
age_years NUMERIC NOT NULL,
brightness_level INT NOT NULL,
is_active BOOLEAN NOT NULL
);

CREATE TABLE planet(
planet_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
star_id INT NOT NULL,
population INT NOT NULL,
description TEXT,
distance_from_star NUMERIC NOT NULL
);

CREATE TABLE moon(
moon_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
planet_id INT NOT NULL,
is_habitable BOOLEAN NOT NULL,
surface_type VARCHAR(50),
orbital_period_days INT NOT NULL
);

CREATE TABLE asteroid(
asteroid_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
galaxy_id INT NOT NULL,
width NUMERIC NOT NULL,
high NUMERIC NOT NULL,
speed_kmxs NUMERIC
);

ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star(star_id);
ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);
ALTER TABLE asteroid ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);




-- Inserción de registros en la tabla 'galaxy'
INSERT INTO galaxy (name, description_galaxy, plants_num, is_active, age_years)
VALUES
    ('Andromeda', 'Large spiral galaxy', 200, true, 10.5),
    ('Milky Way', 'Our home galaxy', 100, true, 13.8),
    ('Triangulum', 'Small spiral galaxy', 50, true, 8.2),
    ('Centaurus A', 'Elliptical galaxy with dust lane', 0, false, 12.1),
    ('M87', 'Giant elliptical galaxy in Virgo Cluster', 0, true, 10.2),
    ('Sombrero', 'Edge-on spiral galaxy', 20, true, 9.7);

-- Inserción de registros en la tabla 'star'
INSERT INTO star (name, galaxy_id, age_years, brightness_level, is_active)
VALUES
    ('Sun', 1, 4.6, 5, true),
    ('Sirius', 2, 200, 1, true),
    ('Alpha Centauri A', 3, 6.3, 3, true),
    ('Betelgeuse', 4, 10, 4, true),
    ('Proxima Centauri', 5, 4.85, 2, true),
    ('Vega', 6, 455, 3, true);

-- Inserción de registros en la tabla 'planet'
INSERT INTO planet (name, star_id, population, description, distance_from_star)
VALUES
    ('Earth', 1, 77000, 'Third planet from the Sun', 93.0),
    ('Mars', 1, 10000, 'The Red Planet', 142.0),
    ('Venus', 1, 5000, 'Second planet from the Sun', 67.2),
    ('Jupiter', 1, 0, 'Largest planet in our solar system', 484.0),
    ('Saturn', 1, 0, 'Known for its beautiful rings', 886.0),
    ('Neptune', 1, 0, 'Blue gas giant', 2795.0),
    ('Uranus', 1, 0, 'Tilted on its side', 1784.0),
    ('Mercury', 1, 0, 'Closest planet to the Sun', 36.0),
    ('Pluto', 1, 0, 'Dwarf planet', 3674.5),
    ('Titan', 3, 0, 'Saturns largest moon', 759.0),
    ('Europa', 4, 0, 'Jupiters icy moon', 485.0),
    ('Proxima Centauri b', 5, 0, 'Exoplanet orbiting Proxima Centauri', 0.0485);

-- Inserción de registros en la tabla 'moon'
INSERT INTO moon (name, planet_id, is_habitable, surface_type, orbital_period_days)
VALUES
    ('Luna', 1, true, 'Rocky', 27),
    ('Phobos', 2, false, 'Irregular', 0.32),
    ('Deimos', 2, false, 'Irregular', 1.26),
    ('Europa', 3, true, 'Icy', 3.55),
    ('Ganymede', 3, false, 'Icy', 7.15),
    ('Callisto', 3, false, 'Icy', 16.69),
    ('Titan', 4, true, 'Thick atmosphere', 15.95),
    ('Enceladus', 4, true, 'Icy', 1.37),
    ('Triton', 5, false, 'Icy', 5.88),
    ('Io', 6, false, 'Volcanic', 1.77),
    ('Charon', 7, false, 'Rocky', 6.39),
    ('Phoebe', 8, false, 'Irregular', 550.48),
    ('Oberon', 9, false, 'Icy', 13.46),
    ('Miranda', 10, false, 'Rocky', 1.41),
    ('Ariel', 11, false, 'Icy', 2.52),
    ('Dione', 12, false, 'Icy', 2.74),
    ('Rhea', 8, false, 'Icy', 4.52),
    ('Hyperion', 9, false, 'Irregular', 21.28),
    ('Iapetus', 7, false, 'Icy', 79.32),
    ('Pholus', 8, false, 'Irregular', 9.12);

-- Inserción de registros en la tabla 'asteroid'
INSERT INTO asteroid (name, galaxy_id, width, high, speed_kmxs)
VALUES
    ('Apophis', 1, 500, 200, 30.5),
    ('Bennu', 2, 300, 150, 25.2),
    ('Ceres', 1, 700, 300, 40.8),
    ('Eros', 1, 400, 180, 28.0),
    ('Vesta', 3, 600, 250, 35.3);