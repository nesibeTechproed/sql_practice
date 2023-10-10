--------------------DAY'2 NT--------------------
------------------tekrar-----------------------
CREATE TABLE sairler(
id int,
name varchar(50),
email varchar(50)	
);

INSERT INTO sairler VALUES(1001,'Can Yücel','sair@mail.com');
INSERT INTO sairler VALUES(1001,'Necip Fazıl','sair@mail.com');
INSERT INTO sairler VALUES(1002,'','sair@mail.com');

INSERT INTO sairler(name) VALUES('Nazım Hikmet');

SELECT * FROM sairler;

--9-tabloya UNIQUE constrainti ekleme
CREATE TABLE it_persons(
id SERIAL,
name VARCHAR(50),
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)	
);

INSERT INTO it_persons(name,email,salary,prog_lang) 
VALUES('Sezer Bey','dev@mailcom',5000,'Java');

INSERT INTO it_persons(name,email,salary,prog_lang) 
VALUES('Zafer Bey','developer@mailcom',5000,'Java');

INSERT INTO it_persons(name,email,salary) 
VALUES('Buse Hanım','tester@mailcom',5000);

SELECT * FROM it_persons;

--10-tabloya NOT NULL constrainti ekleme

CREATE TABLE doctors(
id SERIAL,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
salary REAL
);

INSERT INTO doctors(name,email,salary) VALUES('Fatıma Hoca','dr@mail.com',7000);

INSERT INTO doctors(email,salary) VALUES('dr@mail.com',7000);

INSERT INTO doctors(name,email,salary) VALUES('Dr.Gregory House','doctor@mail.com',7000);
INSERT INTO doctors(name,email,salary) VALUES('','doctor@email.com',7000);
--NOT NULL empty kabul eder.
SELECT * FROM doctors;

--11-tabloya PK constrainti ekleme
CREATE TABLE students2(
id int PRIMARY KEY,--UNIQUE,NOT NULL,başka bir tablo ile ilişkilendirmek için kullanılacak
name varchar(50),
grade real,
register_date date	
);
SELECT * FROM students2;


--11-tabloya PK constrainti ekleme:2.yöntem
CREATE TABLE students3(
id int,--UNIQUE,NOT NULL,başka bir tablo ile ilişkilendirmek için kullanılacak
name varchar(50),
grade real,
register_date date,
CONSTRAINT std_pk PRIMARY KEY(id)	
);
SELECT * FROM students3;

--composite key
CREATE TABLE students4(
id int,
name varchar(50),
grade real,
register_date date,
CONSTRAINT composite_pk PRIMARY KEY(id,name) 
);
SELECT * FROM students4;

--12-tabloya FK constrainti ekleme
CREATE TABLE address3(
address_id int,
street varchar(50),
city varchar(20),
student_id int,--FK olsun
CONSTRAINT add_fk FOREIGN KEY(student_id) REFERENCES students3(id)	
);

SELECT * FROM address3;

--13-tabloya CHECK constrainti ekleme
CREATE TABLE personel(
id int,
name varchar(50),
salary real CHECK(salary>5000),
age int CHECK(age>0 AND age<50)--Negatif olmamalı
);

INSERT INTO personel VALUES(11,'Ali Can',2000,25);--"personel_salary_check"
INSERT INTO personel VALUES(11,'Ali Can',7000,55);--"personel_age_check"
INSERT INTO personel VALUES(11,'Ali Can',7000,25);

















