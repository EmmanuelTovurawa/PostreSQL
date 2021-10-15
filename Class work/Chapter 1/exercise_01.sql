CREATE TABLE kinds(
	id bigserial,
	group_name varchar(25),
	blood_type varchar(25)
);


CREATE TABLE specifics(
	id bigserial,
	description varchar(50),
	num_legs numeric(15)
);


INSERT INTO kinds(group_name, blood_type)
VALUES ('fish', 'cold blooded'),
       ('mammals', 'warm blooded'),
	   ('reptiles', 'cold blooded');
	   
	   
INSERT INTO specifics(description, num_legs)
VALUES('Animals are heterotrophic', 4),
      ('Animals are generally motile', 0),
	  ('Animals are multicellular organisms', 4);