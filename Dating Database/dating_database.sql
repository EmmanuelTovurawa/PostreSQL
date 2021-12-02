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
	province varchar(40) NOT NULL,
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
	CONSTRAINT seeking_id_pk FOREIGN KEY(seeking_id) REFERENCES seeking(seeking_id)
);


--DATA INSERTION INTO ZIP_CODE TABLE
INSERT INTO zip_code(zip_code, city, province)
VALUES('0001', 'Bhisho', 'Eastern Cape'),
      ('0002', 'Bloemfontein', 'Free State'),
	  ('0003', 'Johannesburg', 'Gauteng'),
	  ('0004', 'Pietermaritzburg', 'KwaZulu-Natal'),
	  ('0005', 'Polokwane', 'Limpopo'),
	  ('0006', 'Nelspruit', 'Mpumalanga'),
	  ('0007', 'Kimberley', 'Northern Cape'),
	  ('0008', 'Mahikeng', 'North West'),
	  ('0009', 'Cape Town', 'Western Cape'),
	  ('0010', 'Grahamstown', 'Eastern Cape'),
	  ('0011', 'Winburg', 'Free State'),
	  ('0012', 'Pretoria', 'Gauteng'),
	  ('0013', 'Durban', 'KwaZulu-Natal'),
	  ('0014', 'Louis Trichardt', 'Limpopo'),
	  ('0015', 'Belfast', 'Mpumalanga'),
	  ('0016', 'Kimberly', 'Northern Cape'),
	  ('0017', 'Klerksdorp', 'North West'),
	  ('0018', 'Stellenbosch', 'Western Cape');
	  

--DATA INSERTION INTO INTERESTS TABLE
INSERT INTO interests(interest)
VALUES('travelling'),
      ('exercise'),
	  ('going to the theatre'),
	  ('cooking'),
	  ('doing stuff outdoors'),
	  ('politics'),
	  ('pets');
	  
	  
--DATA INSERTION INTO SEEKING TABLEINSERT INTO SEEKING TABLE
INSERT INTO seeking(seeking)
VALUES('stable relationship'),
      ('monetary benefit'),
	  ('life style'),
	  ('family');
	  
	  
--DATA INSERTION INTO PROFESSION TABLE
INSERT INTO profession(profession)
VALUES('software engineer'),
      ('database developer'),
	  ('doctor'),
	  ('civil engineer'),
	  ('accountant');
	  
	  
--DATA INSERTION INTO STATUS TABLE
INSERT INTO status(status)
VALUES('single'),
      ('widowed'),
	  ('devorced'),
	  ('married');
	  
	  
--DATA INSERTION IN MY_CONTACTS TABLE
INSERT INTO my_contacts(last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES('Best', 'Lawrence', '0785421452', 'lbest@gmail.com', 'male', '2000-12-15', 1, '0001', 1),
      ('Green', 'Trust', '0795491492', 'trustg@gmail.com', 'male', '1999-12-11', 1, '0002', 2),
	  ('Zuma', 'Albert', '0645451455', 'azuma@gmail.com', 'male', '1990-11-25', 2, '0001', 2),
	  ('Duzi', 'Patrick', '0845741241', 'pduzi@gmail.com', 'female', '2000-12-18', 1, '0002', 1),
	  ('Best', 'Willard', '0745156354', 'wbest@gmail.com', 'male', '2010-11-15', 1, '0003', 1),
	  ('Moyo', 'Stanely', '0655214514', 'mstanely@gmail.com', 'male', '2000-12-15', 3, '0001', 1),
	  ('More', 'Pardon', '0784571245', 'pmore@gmail.com', 'male', '2001-10-15', 1, '0003', 3),
	  ('Elphas', 'Lawrence', '0745421452', 'lelp@gmail.com', 'male', '2000-12-15', 1, '0002', 1),
	  ('Jazi', 'Trevor', '0785475214', 'jazi@gmail.com', 'male', '2000-12-15', 1, '0003', 1),
	  ('Jazi', 'Nomsa', '0775365647', 'njazi@gmail.com', 'female', '2003-12-15', 1, '0003', 3),
	  ('Maya', 'Susan', '0635646524', 'smaya@gmail.com', 'female', '2001-05-28', 1, '0004', 1),
	  ('Thompson', 'Tracey', '0785412302', 'tthompson@gmail.com', 'female', '1998-12-15', 3, '0004', 3),
	  ('Chengson', 'Trust', '0747845896', 'tchengson@gmail.com', 'male', '1991-11-11', 4, '0003', 3),
	  ('More', 'Tracey', '0785452302', 'tmore@gmail.com', 'female', '1993-12-15', 3, '0002', 3),
	  ('Dube', 'Webster', '0685142301', 'wdube@gmail.com', 'male', '1995-10-10', 3, '0003', 4);
	  
	  
--DATA INSERTION INTO CONTACT_INTEREST TABLE
INSERT INTO contact_interest(contact_id, interest_id)
VALUES(16, 4),
      (16, 2),
	  (17, 2),
	  (17, 6),
	  (18, 2),
	  (18, 5),
	  (19, 2),
	  (19, 3),
	  (20, 2),
	  (20, 5),
	  (21, 3),
	  (21, 2),
	  (22, 2),
	  (22, 6),
	  (23, 3),
	  (23, 2),
	  (24, 7),
	  (24, 2),
	  (25, 2),
	  (25, 1),
	  (26, 2),
	  (26, 3),
	  (27, 2),
	  (27, 4),
	  (28, 2),
	  (28, 4),
	  (29, 7),
	  (29, 6),
	  (30, 5),
	  (30, 6);
	  
	  
--DATA INSERTION INTO CONTACT_SEEKING TABLE
INSERT INTO contact_seeking(contact_id, seeking_id)
VALUES(16, 1),
      (17, 3),
	  (19, 1),
	  (23, 2),
	  (25, 4),
	  (28, 2),
	  (18, 3),
	  (21, 4),
	  (23, 3),
	  (27, 4),
	  (29, 3);
	  

--LEFT JOIN ON TABLES INCOMPLETE
SELECT prof.profession, zip.zip_code, zip.city, zip.province, s.status, i.interest, s.seeking
FROM my_contacts LEFT JOIN profession AS prof
    ON my_contacts.prof_id = prof.prof_id
LEFT JOIN zip_code AS zip
    ON my_contacts.zip_code = zip.zip_code
LEFT JOIN status as s
    ON my_contacts.status_id = s.status_id