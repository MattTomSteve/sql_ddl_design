-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies,
  moons TEXT[]
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 1, '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 1, '{}'),
  ('Neptune', 164.8, 'The Sun', 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way', '{}');