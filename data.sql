/* Populate database with sample data. */
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(1,'Agumon','2020-02-03',0,True,10.23);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(2,'Gabumon','2018-11-15',2,True,8.0);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(3,'Pikachu','2021-01-07',1,False,15.04);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(4,'Devimon','2017-05-12',5,True,11);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(5,'Charmander','2020-02-08',0,False,-11.0);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(6,'Plantmon','2021-11-15',2,True,-5.7);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(7,'Squirtle','1993-04-02',3,False,-12.13);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(8,'Angemon','2005-06-12',1,True,-45.0);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(9,'Boarmon','2005-06-07',7,True,20.4);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(10,'Blossom','1998-10-13',3,True,17);
 INSERT INTO animal (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(11,'Ditto','2022-05-14',4,True,22);


INSERT INTO owner(full_name,age) VALUES('Sam Smith', 34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);
INSERT INTO species(name) VALUES('Pokemon'),('Digimon');

UPDATE animal SET species_id = '1' WHERE name NOT LIKE '%mon';
UPDATE animal SET species_id = '2' WHERE name LIKE '%mon';

UPDATE animal SET owners_id = '1' WHERE name = 'Agumon';
UPDATE animal SET owners_id = '2' WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animal SET owners_id = '3' WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animal SET owners_id = '4' WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animal SET owners_id = '5' WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets(name,age,date_of_graduation) VALUES('William Tatcher',45,'2000-04-23'),('Maisy Smith',26,'2019-01-17'), ('Stephanie Mendez',64,'1981-05-04'),('Jack Harness',38,'2008-06-08');

INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(1,1,'2020-05-24'),(1,4,'2020-07-22'),(2,3,'2021-02-02'),(3,2,'2020-01-05'),(3,2,'2020-03-08'),(3,2,'2020-05-14'),(4,4,'2021-05-04'),(5,3,'2021-02-24'),(6,2,'2019-12-21'),(6,1,'2020-08-10'),(6,2,'2021-04-07'),(7,4,'2019-09-29'),(8,3,'2020-10-03'),(8,3,'2020-11-04'),(9,2,'2019-01-24'),(9,2,'2019-05-15'),(9,2,'2020-02-27'),(9,2,'2020-08-03'),(10,4,'2020-05-24'),(10,1,'2021-01-11');

SELECT visits.animals_id,animal.name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE visits.vets_id = vets.id AND vets.name = 'William Tatcher' ORDER BY animals_id DESC LIMIT 1;

SELECT COUNT(DISTINCT animal.name) FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE visits.vets_id = vets.id AND vets.name = 'Stephanie Mendez';

SELECT * FROM vets FULL JOIN specialization on vets.id = specialization.vets_id FULL JOIN species ON species.id = specialization.vets_id;

SELECT animal.name,visits.date_of_visit  FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE visits.vets_id = vets.id AND vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animal_name,COUNT(animal_name) AS visit_count FROM (SELECT vets.name AS vets_name,animal.name AS animal_name FROM visits FULL JOIN vets ON vets.id = visits.vets_id JOIN animal ON animal.id = visits.animals_id) AS subby GROUP BY animal_name ORDER BY visit_count DESC LIMIT 1;

SELECT date_of_visit,animal.name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id WHERE vets.id = visits.vets_id AND vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;

SELECT animal.id AS animal_id,animal.name AS animal_name,date_of_birth,weight_kg,neutered,escape_attempts,vets.id AS vets_id,vets.name AS vets_name,date_of_visit FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id ORDER BY date_of_visit DESC LIMIT 1;

SELECT visit_count FROM (SELECT species.id AS species,COUNT(*) AS visit_count FROM visits JOIN vets ON visits.vets_id = vets.id FULL JOIN species ON species.id = vets.id GROUP BY species.id ORDER BY species.id DESC LIMIT 1) AS subby;

SELECT species.name,COUNT(*) FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animal ON animal.id = visits.animals_id JOIN species ON species.id = animal.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;