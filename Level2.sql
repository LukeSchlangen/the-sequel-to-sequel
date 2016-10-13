-- Level 1 Aggregate Functions
DROP TABLE movies;

CREATE TABLE movies
(
id SERIAL PRIMARY KEY,
title varchar(255),
cost int NOT NULL,
duration int NOT NULL
);

DROP TABLE movies;

INSERT INTO movies (title, cost, duration)
VALUES ('Gone With the Wind', 390000,220);

INSERT INTO movies (title, cost, duration)
VALUES ('Frankenstein', 3000000,500);

INSERT INTO movies (title, cost, duration)
VALUES ('Creature From the Black Lagoon', 500000, 79);

INSERT INTO movies (cost, duration)
VALUES (100, 10);

SELECT *
FROM movies;

SELECT count(*)
FROM movies;

SELECT count(title)
FROM movies;

SELECT sum(cost)
FROM movies;

ALTER TABLE movies
ADD COLUMN tickets int;

UPDATE movies
SET tickets = 1000;

UPDATE movies
SET tickets = 50000
WHERE title = 'Gone With the Wind';

SELECT avg(tickets)
FROM movies;

SELECT max(duration)
FROM movies;

SELECT max(duration)
FROM movies;

SELECT max(duration), min(duration)
FROM movies;

DROP TABLE actors;

CREATE TABLE actors
(
id SERIAL PRIMARY KEY,
name varchar(150),
country varchar (15)
);

INSERT INTO actors(name, country)
VALUES ('Vivien Leigh', 'IN');

INSERT INTO actors(name, country)
VALUES ('Clark Gable', 'USA');

INSERT INTO actors(name, country)
VALUES ('Olivia de Havilland', 'Japan');

INSERT INTO actors(name, country)
VALUES ('Hattie McDaniel', 'USA');

INSERT INTO actors(name, country)
VALUES ('Leslie Howard', 'UK');

INSERT INTO actors(name, country)
VALUES ('Alicia Rhett', 'USA');

INSERT INTO actors(name, country)
VALUES ('Lillian Kemble-Cooper', 'UK');

SELECT count(*)
FROM actors
WHERE country = 'USA';

ALTER TABLE actors
ADD COLUMN salary int;

SELECT *
FROM actors;

UPDATE actors
SET salary = 50000;

UPDATE actors
SET salary = 300000
WHERE country = 'USA';

UPDATE actors
SET salary = 450000
WHERE name = 'Clark Gable';

UPDATE actors
SET salary = 250000
WHERE country = 'UK';

SELECT avg(salary)
FROM actors;

SELECT avg(salary)
FROM actors
WHERE country = 'USA';

SELECT max(salary)
FROM actors;

SELECT max(salary), min(salary)
FROM actors;

SELECT *
FROM movies;

DELETE FROM movies
WHERE title IS NULL;

ALTER TABLE movies
ADD COLUMN genre varchar(15);

UPDATE movies
SET genre = 'Horror';

INSERT INTO movies(title, cost, duration, tickets, genre)
VALUES ('Casablanca', 1039000, 145, 40000, 'Romance');

UPDATE movies
SET genre = 'Romance'
WHERE title = 'Gone With the Wind';

SELECT *
FROM movies;

SELECT genre, avg(cost)
FROM movies
GROUP BY genre;

INSERT INTO movies(title, cost, duration, tickets, genre)
VALUES ('Not Funny Movie', 1400, 324, 15, 'Comedy');

SELECT genre, avg(cost)
FROM movies
GROUP BY genre
HAVING count(*) > 1;

SELECT genre, avg(cost)
FROM movies
GROUP BY genre
HAVING count(*) > 1;

SELECT genre, avg(cost)
FROM movies
WHERE cost >=500000
GROUP BY genre
HAVING count(*) > 1;

SELECT *
FROM actors;

ALTER TABLE actors
ADD COLUMN role varchar(50);

UPDATE actors
SET role = 'leading';

UPDATE actors
SET role = 'supporting'
WHERE id > 4;

SELECT country, sum(salary)
FROM actors
WHERE role = 'supporting'
GROUP BY country
HAVING count(*) > 1;


-- Level 2 Constraints
CREATE TABLE promotions
(
id SERIAL PRIMARY KEY,
name varchar(50) NOT NUll UNIQUE,
category varchar(15)
);

CREATE TABLE promotions
(
id SERIAL PRIMARY KEY,
name varchar(50) NOT NULL,
category varchar(15),
CONSTRAINT unique_name UNIQUE (name, category)
);

DROP TABLE promotions;

SELECT *
FROM promotions;

INSERT INTO promotions (name, category)
VALUES ('Half Off', 'Discount'),
('Matinee', 'Non-Cash'),
('AARP', 'Discount');


-- Fails because it's the exact same name and category
INSERT INTO promotions (name, category)
VALUES ('AARP', 'Discount');

-- Succeeds because it's only the exact name
INSERT INTO promotions (name, category)
VALUES ('AARP', 'Bonus');


















































