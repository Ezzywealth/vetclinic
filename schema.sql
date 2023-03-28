/* Database schema to keep the structure of entire database. */

CREATE TABLE animal (
    id INT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg float(2),
    species VARCHAR(100),
);
