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


INSERT INTO owner(full_name,age) VALUES
('Sam Smith', 34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);

SELECT * FROM owner;

INSERT INTO species(name) VALUES
('Pokemon'),
('Digimon');

SELECT * FROM species;

UPDATE animal SET species_id = '1' WHERE name NOT LIKE '%mon';
UPDATE animal SET species_id = '2' WHERE name LIKE '%mon';

UPDATE animal SET owners_id = '1' WHERE name = 'Agumon';
UPDATE animal SET owners_id = '2' WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animal SET owners_id = '3' WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animal SET owners_id = '4' WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animal SET owners_id = '5' WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets(name,age,date_of_graduation) VALUES
('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harness',38,'2008-06-08');

INSERT INTO specialization(species_id,vets_id) VALUES
(1,1),
(2,4),
(1,4),
(2,3);

SELECT * FROM visits;

INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES
(1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-02-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,2,'2019-12-21'),
(6,1,'2020-08-10'),
(6,2,'2021-04-07'),
(7,3,'2019-09-29'),
(8,3,'2020-10-03'),
(8,3,'2020-11-04'),
(9,2,'2019-01-24'),
(9,2,'2019-05-15'),
(9,2,'2020-02-27'),
(9,2,'2020-08-03'),
(10,3,'2020-05-24'),
(10,1,'2021-01-11');




