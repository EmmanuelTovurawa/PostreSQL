--DATABASE CREATION
CREATE DATABASE dating_database;


CREATE TABLE profession(
	prof_id serial,
	profession varchar(60) UNIQUE NOT NULL,
	CONSTRAINT profession_key PRIMARY KEY(prof_id)
);


CREATE TABLE zip_code(
	zip_code varchar(4),
	city varchar(40) NOT NULL,
	province varchar(40) UNIQUE NOT NULL,
	CONSTRAINT zip_code_key PRIMARY KEY(zip_code),
	CONSTRAINT zip_length CHECK(length(zip_code) <= 4)
);


CREATE TABLE status(
	status_id serial,
	status varchar(25) NOT NULL,
	CONSTRAINT status_key PRIMARY KEY(status_id)
);


CREATE TABLE my_contacts(
	contact_id serial,
	last_name varchar(25) NOT NULL,
	first_name varchar(25) NOT NULL,
	phone varchar(10) NOT NULL,
	email varchar(50) NOT NULL,
	gender varchar(10) NOT NULL,
	birthday date NOT NULL,
	prof_id integer,
	zip_code varchar(4),
	status_id integer,
	CONSTRAINT my_contacts_key PRIMARY KEY(contact_id),
	CONSTRAINT prof_id_fk FOREIGN KEY(prof_id) REFERENCES profession(prof_id),
	CONSTRAINT zip_code_key FOREIGN KEY(zip_code) REFERENCES zip_code(zip_code),
	CONSTRAINT status_id_fk FOREIGN KEY(status_id) REFERENCES status(status_id)
);


CREATE TABLE interests(
	interest_id serial,
	interest text NOT NULL,
	CONSTRAINT interests_key PRIMARY KEY(interest_id)
);


CREATE TABLE seeking(
	seeking_id serial,
	seeking text NOT NULL,
	CONSTRAINT seeking_pk PRIMARY KEY(seeking_id)
);


CREATE TABLE contact_interest(
	contact_id integer,
	interest_id integer,
	CONSTRAINT contact_interest_pk PRIMARY KEY(contact_id, interest_id),
	CONSTRAINT contact_id_fk FOREIGN KEY(contact_id) REFERENCES my_contacts(contact_id),
	CONSTRAINT interest_id_fk FOREIGN KEY(interest_id) REFERENCES interests(interest_id)
);


CREATE TABLE contact_seeking(
	contact_id integer,
	seeking_id integer,
	CONSTRAINT contact_seeking_pk PRIMARY KEY(contact_id, seeking_id),
	CONSTRAINT contact_id_pk FOREIGN KEY(contact_id) REFERENCES my_contacts(contact_id),
	CONSTRAINT seeking_id_pk FOREIGN KEY(contact_id) REFERENCES seeking(seeking_id)
);