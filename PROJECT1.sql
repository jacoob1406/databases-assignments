/* DOMAINS: */

CREATE DOMAIN SexType AS CHAR
DEFAULT 'M'
CHECK (VALUE IN ("M', 'F’));

CREATE DOMAIN ReviewRate AS smallint 
DEFAULT null 
CHECK (VALUE IN (0, 1, 2, 3, 4, 5));

CREATE DOMAIN prod_year AS integer
DEFAULT null
CHECK (VALUE BETWEEN 1896 AND 9999);

/* TABLES: */

CREATE TABLE images
(
   URL           VARCHAR (100),
   Description   VARCHAR (50),
   movie_id      integer,
   person_id     integer,
   PRIMARY KEY (URL)
);


CREATE TABLE movie
(
   movie_ID          Integer,
   title             varchar (30) NOT NULL,
   avg_review        ReviewRate,           
   production_year   prod_year,                                     
   company_id        integer,
   status_id         integer,
   PRIMARY KEY (movie_id)
);

CREATE TABLE status
(
   status_id   integer,
   name        varchar (30) NOT NULL,
   PRIMARY KEY (status_id)
);

CREATE TABLE production_company
(
   production_id   integer,
   name            varchar (30) NOT NULL,
   country         varchar (30),
   PRIMARY KEY (production_id)
);

CREATE TABLE Person
(
   person_id   integer,
   name        varchar (30) NOT NULL,
   birthday    date,
   sex         SexType, 
   birhplace   varchar (30),
   age         integer, 
   PRIMARY KEY (person_id)
);


CREATE TABLE person_movie                         
(
   movie_id    integer,
   person_id   integer,
   PRIMARY KEY (movie_id, person_id)
);

CREATE TABLE movie_company                         
(
   movie_id    integer,
   company_id   integer,
   PRIMARY KEY (movie_id, company_id)
);



CREATE TABLE review
(
   username    varchar(50),
   movie_id   integer,
   rate       ReviewRate,
   text       varchar (100),
   PRIMARY KEY (username, movie_id)
);

CREATE TABLE users
(
   username   varchar (50),
   name       varchar (30),
   mail       varchar (30) NOT NULL UNIQUE,
   password   varchar (20) NOT NULL,
   follow_username varchar (50),
   PRIMARY KEY (username)
);


ALTER TABLE images
   ADD CONSTRAINT FK_movie_images FOREIGN KEY (movie_id)
       REFERENCES movie (movie_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE images
   ADD CONSTRAINT FK_person_images FOREIGN KEY (person_id)
       REFERENCES person (person_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE movie_company
   ADD CONSTRAINT FK_prod_company_company FOREIGN KEY (company_id)
       REFERENCES production_company (production_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE movie_company
   ADD CONSTRAINT FK_prod_company_movie FOREIGN KEY (movie_id)
       REFERENCES movie (movie_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE movie
   ADD CONSTRAINT FK_status FOREIGN KEY (status_id)
       REFERENCES status (status_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE review
   ADD CONSTRAINT FK_review_user FOREIGN KEY (username)
       REFERENCES users (username) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE review
   ADD CONSTRAINT FK_review_movie FOREIGN KEY (movie_id)
       REFERENCES movie (movie_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE person_movie
   ADD CONSTRAINT FK_pers_movie FOREIGN KEY (movie_id)
       REFERENCES movie (movie_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE person_movie
   ADD CONSTRAINT FK_movie_person FOREIGN KEY (person_id)
       REFERENCES person (person_id) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
ALTER TABLE users
   ADD CONSTRAINT FK_user_follow FOREIGN KEY (follow_username)
       REFERENCES users (username) 
	   ON UPDATE CASCADE ON DELETE SET NULL;
	   
