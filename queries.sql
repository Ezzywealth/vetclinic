/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animal WHERE name LIKE '%mon';
SELECT date_of_birth FROM animal WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT neutered,escape_attempts from animal WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts FROM animal WHERE weight_kg > 10.5;
SELECT * FROM animal WHERE neutered;
SELECT * FROM animal WHERE name = 'Gabumon';
SELECT * FROM animal WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;