--DATABASE CREATION

CREATE DATABASE EmployeeDB;


CREATE TABLE roles(
	role_id bigserial,
	role varchar(60) NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY(role_id)
);


CREATE TABLE department(
	depart_id bigserial,
	depart_name varchar(60) NOT NULL,
	depart_city varchar(60) NOT NULL,
	CONSTRAINT depart_key PRIMARY KEY(depart_id)
);


CREATE TABLE salaries(
	salary_id bigserial,
	salary_pa numeric(8,2) NOT NULL,
	CONSTRAINT salary_key PRIMARY KEY(salary_id),
	CONSTRAINT salary_check CHECK(salary_pa > 0)
);


CREATE TABLE overtime_hours(
	overtime_id bigserial,
	overtime_hours interval NOT NULL,
	CONSTRAINT overtime_key PRIMARY KEY(overtime_id)
);


CREATE TABLE employees(
	emp_id bigserial,
	first_name varchar(50) NOT NULL,
	surname varchar(50) NOT NULL,
	gender varchar(10) NOT NULL,
	address varchar(250) NOT NULL,
	email varchar(50) NOT NULL,
	depart_id bigint REFERENCES department(depart_id),
	role_id bigint REFERENCES roles(role_id),
	salary_id bigint REFERENCES salaries(salary_id),
	overtime_id bigint REFERENCES overtime_hours(overtime_id),
	CONSTRAINT employees_key PRIMARY KEY(emp_id)
);


--LEFT JOIN
SELECT emp.emp_id, dpt.depart_name, sl.salary_pa, ro.role, ot.overtime_hours
FROM employees AS emp LEFT JOIN department AS dpt
ON emp.depart_id = dpt.depart_id
LEFT JOIN salaries AS sl
ON emp.salary_id = sl.salary_id
LEFT JOIN roles AS ro
ON ro.role_id = emp.role_id
LEFT JOIN overtime_hours as ot
ON ot.overtime_id = emp.overtime_id;


