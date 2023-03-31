/* Database schema to keep the structure of entire database. */

CREATE TABLE animal (
    id INT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg float(2),
);

ALTER TABLE animal ADD COLUMN species VARCHAR(100);

CREATE TABLE owner(id SERIAL PRIMARY KEY, full_name VARCHAR, age INT);
CREATE TABLE species(id SERIAL PRIMARY KEY, name VARCHAR);

CREATE SEQUENCE animal_seq;
ALTER TABLE animal ALTER COLUMN id SET DEFAULT nextval('animal_seq');

ALTER TABLE animal DROP COLUMN IF EXISTS species;

ALTER TABLE animal ADD COLUMN species_id INT;
ALTER TABLE animal ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animal ADD COLUMN owners_id INT;
ALTER TABLE animal ADD CONSTRAINT fk_owners_id FOREIGN KEY(owners_id) REFERENCES owner(id);


CREATE TABLE vets (id SERIAL PRIMARY KEY,name VARCHAR,age INT, date_of_graduation DATE);
CREATE TABLE specialization(species_id INT,vets_id INT);
CREATE TABLE visits(animals_id INT,vets_id INT,date_of_visit DATE);