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

SELECT animal.name FROM animal JOIN owner ON owner.id = animal.owners_id WHERE owner.full_name = 'Melody Pond';
SELECT animal.id,animal.name FROM animal JOIN species ON species.id = animal.species_id WHERE species.name = 'Pokemon';
SELECT owner.full_name,animal.name FROM animal FULL JOIN owner ON owner.id = animal.owners_id;
SELECT species.name,COUNT(species.name) FROM animal JOIN species ON animal.species_id = species.id GROUP BY species.name;
SELECT species.id,species.name FROM species JOIN animal ON species.id = animal.species_id JOIN owner ON animal.owners_id = owner.id WHERE species.name = 'Digimon' AND owner.full_name = 'Jennifer Orwell';
SELECT * FROM animal JOIN owner ON owner.id = animal.owners_id WHERE owner.full_name = 'Dean Winchester' AND animal.escape_attempts < 1;
SELECT full_name FROM (SELECT owner.full_name, COUNT(owner.full_name) AS animal_count FROM animal FULL OUTER JOIN owner ON animal.owners_id = owner.id GROUP BY owner.full_name ORDER BY animal_count DESC LIMIT 1) AS subquery;

SELECT visits.animals_id,animal.name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE visits.vets_id = vets.id AND vets.name = 'William Tatcher' ORDER BY animals_id DESC LIMIT 1;

SELECT COUNT(DISTINCT animal.name) FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE visits.vets_id = vets.id AND vets.name = 'Stephanie Mendez';

SELECT vets.name AS vets_name,species.name AS specialty FROM vets LEFT JOIN specialization on vets.id = specialization.vets_id LEFT JOIN species ON vets.id = specialization.vets_id;

SELECT animal.name,visits.date_of_visit  FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE visits.vets_id = vets.id AND vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animal_name,COUNT(animal_name) AS visit_count FROM (SELECT vets.name AS vets_name,animal.name AS animal_name FROM visits FULL JOIN vets ON vets.id = visits.vets_id JOIN animal ON animal.id = visits.animals_id) AS subby GROUP BY animal_name ORDER BY visit_count DESC LIMIT 1;

SELECT date_of_visit,animal.name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE vets.id = visits.vets_id AND vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;

SELECT animal.id AS animal_id,animal.name AS animal_name,date_of_birth,weight_kg,neutered,escape_attempts,vets.id AS vets_id,vets.name AS vets_name,date_of_visit FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id ORDER BY date_of_visit DESC LIMIT 1;

SELECT count(*) FROM visits LEFT JOIN animal ON animal.id = visits.animals_id LEFT JOIN vets ON vets.id = visits.vets_id WHERE animal.species_id NOT IN (SELECT species_id FROM specialization WHERE vets_id = vets.id);

SELECT species.name,COUNT(*) FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id JOIN species ON species.id = animal.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;
