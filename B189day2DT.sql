--------------DAY'2 DT------------
-------TEKRAR------------
CREATE TABLE sairler(
id int,
name varchar(50),
email varchar(50)	
);

INSERT INTO sairler VALUES(1001,'Can Yücel','sair@mail.com');
INSERT INTO sairler VALUES(1001,'Didem Madak','sair@mail.com');
INSERT INTO sairler VALUES(1002,'','sair@mail.com');

INSERT INTO sairler(name) VALUES('Necip Fazıl');

SELECT * FROM sairler;

--9-tabloya UNIQUE constraint ekleme
CREATE TABLE it_persons(
id SERIAL,
name VARCHAR(50),
email VARCHAR(50) UNIQUE,
salary REAL,
programming_lang VARCHAR(20)	
);

INSERT INTO it_persons(name,email,salary,programming_lang) 
VALUES('Betül Hanım','dev@mail.com',5000,'Java');

INSERT INTO it_persons(name,email,salary,programming_lang) 
VALUES('İbrahim Bey','developer@mail.com',5000,'Java');

INSERT INTO it_persons(email,salary,programming_lang) 
VALUES('developer2@mail.com',5000,'Java');

SELECT * FROM it_persons;

--10-tabloya NOT NULL constrainti ekleme
CREATE TABLE doctors(
id SERIAL,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
salary REAL
);

INSERT INTO doctors(name,email,salary) VALUES('Dr.Gregory House','dr@mail.com',8000);
INSERT INTO doctors(email,salary) VALUES('doctor@mail.com',8000);--hata
INSERT INTO doctors(name,email,salary) VALUES('','doctor@mail.com',8000);--isim empty
--NOT NULL empty kabul eder

SELECT * FROM doctors;

--11-tabloya PK constrainti ekleme
CREATE TABLE students2(
id int PRIMARY KEY,--not null,unique,başka bir tablo ile ilişkindermek için kullanılacak
name varchar(50),
grade real,
register_date date	
);
SELECT * FROM students2;
--11-tabloya PK constrainti ekleme:2.yöntem

CREATE TABLE students3(
id int,--not null,unique,başka bir tablo ile ilişkindermek için kullanılacak
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
CONSTRAINT std4_pk PRIMARY KEY(id,name)	
);

SELECT * FROM students4;

--12-tabloya FK constrainti ekleme
CREATE TABLE address3(
address_id int,
street VARCHAR(50),
city VARCHAR(50),
student_id int,--FK, null kabul eder,duplicate kabul eder
CONSTRAINT add_fk FOREIGN KEY(student_id) REFERENCES students3(id)
);

SELECT * FROM address3;


--13-tabloya CHECK constrainti ekleme

CREATE TABLE personel(
id int,
name varchar(50),
salary real NOT NULL CHECK(salary>5000),
age int	CHECK(age>0 AND age<50)--negatif kabul etmez
);

INSERT INTO personel VALUES(11,'Ali Can',2000,35);--salary_check
INSERT INTO personel VALUES(11,'Ali Can',7000,55);--age_check

INSERT INTO personel VALUES(11,'Ali Can',7000,25);

SELECT * FROM personel;





