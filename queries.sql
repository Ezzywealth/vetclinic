/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animal WHERE name LIKE '%mon';
SELECT date_of_birth FROM animal WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT neutered,escape_attempts from animal WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts FROM animal WHERE weight_kg > 10.5;
SELECT * FROM animal WHERE neutered;
SELECT * FROM animal WHERE name = 'Gabumon';
SELECT * FROM animal WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN TRANSACTION;
UPDATE animal SET species = 'undefined';
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animal SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animal SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN TRANSACTION;
TRUNCATE animal;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animal WHERE date_of_birth > '2022-01-01';
SAVEPOINT first_delete;
UPDATE animal SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT first_delete;
UPDATE animal SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animal;
SELECT COUNT(*) FROM animal WHERE escape_attempts < 1;
SELECT AVG(weight_kg) FROM animal;
SELECT neutered,COUNT(escape_attempts) FROM animal GROUP BY neutered;
SELECT species, MAX(weight_kg),MIN(weight_kg) FROM animal GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animal WHERE EXTRACT('YEAR' FROM date_of_birth) BETWEEN '1990' AND '2000' GROUP BY species;