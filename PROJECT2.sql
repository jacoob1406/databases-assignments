create table users_followers
(
   username_follower varchar(50),
   username_followed varchar(50),
   PRIMARY KEY (username_follower, username_followed)
);
-- 
ALTER TABLE users_followers
   ADD CONSTRAINT FK_user_follower FOREIGN KEY (username_follower)
	   REFERENCES users (username) ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE users_followers
   ADD CONSTRAINT FK_user_followed FOREIGN KEY (username_followed)
	   REFERENCES users (username) ON UPDATE CASCADE ON DELETE SET NULL;


INSERT INTO person (person_id,
                    name,
                    birthday,
                    sex,
                    birhplace)
     VALUES (1,
             'Matt Damon',
			 '1970-10-08',
             'M',
             'Cambridge');

INSERT INTO person (person_id,
                    name,
                    birthday,
                    sex,
                    birhplace)
     VALUES (2,
             'Julia Stiles',
			 '1981-03-28',
             'F',
             'New York ');
			 
INSERT INTO person (person_id,
                    name,
                    birthday,
                    sex,
                    birhplace)
     VALUES (3,
             'Alicia Vikander',
			 '1988-10-03',
             'F',
             'Gothenburg');

INSERT INTO person (person_id,
                    name,
                    birthday,
                    sex,
                    birhplace)
     VALUES (4,
             'Jennifer Lawrence',
			 '1990-08-15',
             'F',
             'Louisville');
			 
INSERT INTO person (person_id,
                    name,
                    birthday,
                    sex,
                    birhplace)
     VALUES (5,
             'Gary Ross',
			 '1956-11-03',
             'M',
             'Los Angeles');
			 
			 
INSERT INTO status (status_id,
                    name)
     VALUES (1,
             'Released');
			 
INSERT INTO status (status_id,
                    name)
     VALUES (2,
             'Completed');
			 
INSERT INTO status (status_id,
                    name)
     VALUES (3,
             'Post-production');
			 
INSERT INTO status (status_id,
                    name)
     VALUES (4,
             'Filming');
			 
INSERT INTO status (status_id,
                    name)
     VALUES (5,
             'Announced');
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (1,
             'MP BETA Productions',
			 'USA');
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (2,
             'The Kennedy/Marshall Company',
			 'USA');
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (3,
             'Ludlum Entertainment',
			 'USA');
			 
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (4,
             'Perfect World Pictures',
			 'USA');
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (5,
             'Captivate Entertainment',
			 'USA');
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (6,
             'Pearl Street',
			 'USA');
			 
INSERT INTO production_company (production_id,
                    name,
					country)
     VALUES (7,
             'Color Force',
			 'USA');
			 
INSERT INTO movie (movie_id,
                    title,
					production_year,
					status_id)
     VALUES (1,
             'The Bourne Ultimatum',
			 2007,
			 1);
			 
ALTER TABLE movie DROP COLUMN company_id;

INSERT INTO movie (movie_id,
                    title,
					production_year,
					status_id)
     VALUES (2,
             'Jason Bourne',
			 2016,
			 1);
			 
INSERT INTO movie (movie_id,
                    title,
					production_year,
					status_id)
     VALUES (3,
             'The Hunger Games',
			 2012,
			 1);
			 
INSERT INTO images (url,
					description,
					movie_id,
                    person_id)
     VALUES ('http://www.hungergamesdwtc.net/wp-content/uploads/2014/02/The-Hunger-Games-Poster.jpg',
             'The Hunger Games Poster',
			 3,
			 4);
			 
INSERT INTO images (url,
					description,
					movie_id,
                    person_id)
     VALUES ('http://www.impawards.com/2007/posters/bourne_ultimatum_ver4.jpg',
             'The Bourne Ultimatum Poster',
			 1,
			 1);
			 
INSERT INTO images (url,
					description,
					movie_id,
                    person_id)
     VALUES ('http://cdn1-www.comingsoon.net/assets/uploads/gallery/jason-bourne/jason_bourne_ver3_xlg.jpg',
             'Jason Bourne Poster',
			 2,
			 1);
			 
INSERT INTO images (url,
					description,
					movie_id,
                    person_id)
     VALUES ('http://static.srcdn.com/wp-content/uploads/Matt-Damon-as-Jason-Bourne-in-The-Bourne-Ultimatum.jpg',
             'Matt Damon in Bourne Ultimatum',
			 1,
			 1);
			 
INSERT INTO images (url,
					description,
					movie_id,
                    person_id)
     VALUES ('http://i.dailymail.co.uk/i/pix/2015/05/10/11/122DB1D8000005DC-3075487-image-a-1_1431253487957.jpg',
             'Jennifer Lawrence in Hunger Games',
			 3,
			 4);
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (1,
             1);
			 
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (1,
             2);
			 
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (1,
             3);
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (2,
             2);
			 
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (2,
             4);
			 
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (1,
             5);
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (2,
             6);
			 
			 
INSERT INTO movie_company (movie_id,
                    company_id)
     VALUES (3,
             7);
			 
--it will be easier to add role_id attribute to a person_movie table

ALTER TABLE person_movie Add role_id int;

CREATE TABLE role
(
   role_id int PRIMARY KEY,
   role_name varchar(30) 
);

ALTER TABLE person_movie
   ADD CONSTRAINT FK_person_movie_role FOREIGN KEY (role_id)
       REFERENCES role (role_id) ON UPDATE CASCADE ON DELETE SET NULL;

INSERT INTO role (role_id,
                    role_name)
     VALUES (1,
             'Director');
			 
INSERT INTO role (role_id,
                    role_name)
     VALUES (2,
             'Actor');
			 
INSERT INTO role (role_id,
                    role_name)
     VALUES (3,
             'Writer');
			 
INSERT INTO role (role_id,
                    role_name)
     VALUES (4,
             'Producer');
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (1,
             1,
			 2);
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (1,
             2,
			 2);
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (2,
             1,
			 2);
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (2,
             2,
			 2);
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (2,
             3,
			 2);
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (3,
             4,
			 2);
			 
INSERT INTO person_movie (movie_id,
                    person_id,
					role_id)
     VALUES (3,
             5,
			 1);
			 
-- tutaj trzeba zrobiæ Users i Review (recursive relationship), ale jak ????

insert into Users (username, name, mail, password)
VALUES ('jacoob', 'Jakub', 'jacoob@pc.com', 'ManUnited');

insert into Users (username, name, mail, password)
VALUES ('ann', 'Anna', 'anna@pc.com', 'HaloHalo');

insert into Users (username, name, mail, password)
VALUES ('cris', 'Krzysiu', 'cris@pc.com', 'GGMU');

insert into Users (username, name, mail, password)
VALUES ('mama', 'Mama', 'mama@pc.com', '123mama');

insert into Users (username, name, mail, password)
VALUES ('tata', 'Tata', 'tata@pc.com', '123tata');

insert into Users (username, name, mail, password)
VALUES ('babciaidziadek', 'Babcia i Dziadek', 'babciaidziadek@pc.com', '123babciaidziadek');

insert into users_followers (username_follower, username_followed)
VALUES ('ann', 'jacoob');

insert into users_followers (username_follower, username_followed)
VALUES ('mama', 'jacoob');

insert into users_followers (username_follower, username_followed)
VALUES ('tata', 'jacoob');

insert into users_followers (username_follower, username_followed)
VALUES ('mama', 'ann');

insert into users_followers (username_follower, username_followed)
VALUES ('babciaidziadek', 'ann');

insert into users_followers (username_follower, username_followed)
VALUES ('mama', 'tata');

insert into users_followers (username_follower, username_followed)
VALUES ('tata', 'mama');

insert into users_followers (username_follower, username_followed)
VALUES ('jacoob', 'babciaidziadek');

insert into users_followers (username_follower, username_followed)
VALUES ('cris', 'babciaidziadek');

insert into users_followers (username_follower, username_followed)
VALUES ('ann', 'cris');

insert into Review (username, movie_id, rate, text)
VALUES ('jacoob', 1, 5, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('ann', 1, 3, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('tata', 1, 4, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('jacoob', 2, 1, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('cris', 2, 5, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('mama', 2, 2, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('tata', 3, 5, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('jacoob', 3, 5, 'XXX');

insert into Review (username, movie_id, rate, text)
VALUES ('ann', 3, 1, 'XXX');


--### 1.	In which movies has Matt Damon participated?

SELECT distinct p.movie_id, m.title
from movie m, person_movie p
where p.person_id = (select person_id from person where name='Matt Damon')
and m.movie_id = p.movie_id;

--### 2.	When was The Hunger Games released?

select production_year
from movie
where title = 'The Hunger Games';

--### 3.	What is the average review score of all reviews?

select AVG(rate)
from review;

--### 4.	Who reviewed the Bourne Ultimatum?

select username
from review r
where r.movie_id = (SELECT movie_id from movie m where m.title='The Bourne Ultimatum');

--### 5.	Which actors appeared in Jason Bourne?

select pm.person_id, p.name
from person_movie pm, person p
where pm.movie_id = (select movie_id from movie m where m.title='Jason Bourne')
AND pm.person_id = p.person_id;

--### 6.	Which actors have appeared in Movies from Lionsgate?

select distinct p.name --, m.title, pc.name
from person p, movie m, production_company pc, person_movie pm
where pc.name = 'Pearl Street' and p.person_id = pm.person_id 
and pm.role_id = '2' and m.movie_id = pm.movie_id;

--### 7.	In which movies has the director also performed as an actor?

select distinct pm1.movie_id from 
person_movie pm1, person_movie pm2
where pm1.movie_id = pm2.movie_id and 
pm1.role_id=(SELECT Role.role_id FROM Role WHERE Role_name='Director') and 
pm2.role_id=(SELECT Role.role_id FROM Role WHERE Role_name='Actor');


--### 8.	Which reviewers have not reviewed Hunger Games?

select username 
from users EXCEPT (select username from review r
where r.movie_id = (SELECT movie_id from movie where title='The Hunger Games'));

--### 9.	What is the average rating of all reviews?

select AVG(rate)   --czym to siê ró¿ni od numeru 3?????
from review;

--### 10.	Which persons do not appear in any images? 

select p.person_id, p.name
from person p EXCEPT (select distinct y. person_id, x.name 
from person x, images y
where x.person_id = y.person_id);

--### 11.	What is the average review score from each reviewer?

select username, avg (rate) 
from review
group by username
order by username;

-- 12.	What is the average movie review score for each actor? 
--(The average review for the movies, they've played in)

select p.name, avg(r.rate)
from person_movie pm, review r, person p
where pm.role_id=2
AND pm.movie_id = r.movie_id
and p.person_id = pm.person_id
group by p.name;

-- 13.	What is the average number of followers for the reviewers?

select  ROUND(CAST(count(username_follower) as numeric),2) / 
(select count(username)from users) as avg_num_of_followers
from users_followers;

--PART 2.3 - DERIVED ATTRIBUTES

update person p set age = ROUND(CAST(DATE_PART('year', now()) - DATE_PART('year', p.birthday) as numeric), 0);

update movie m set avg_review = (select AVG(rate) 
from review r
where r.movie_id = m.movie_id);

--robimy potrojny klucz glowny 
ALTER TABLE person_movie
   ADD CONSTRAINT person_movie_pkey PRIMARY KEY
         (movie_id, person_id, role_id);
		 
--do tabeli person dodalismy kolumne num_of_movies i to bedzie nasz trzeci derived
select * from person;

update person p set num_of_movies = (select  COUNT(distinct (movie_id))
from person_movie pm
where pm.person_id=p.person_id);





