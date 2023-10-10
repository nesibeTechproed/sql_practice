--TEK YORUM SATIRI
/*ÇOKLU YORUM SATIRI*/
------------------DAY'1 NT----------------------------
--1-Database oluşturma--DDL
CREATE DATABASE nesibe;--SQL komutlarında büyük/küçük harf duyarlılığı yoktur
create database nesibe2;

--2-database silme--DDL
DROP DATABASE nesibe;

--3-table oluşturma--DDL
CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE
);

--4-mevcut bir tablodan yeni tablo oluşturma
CREATE TABLE grades AS SELECT name,grade FROM students;

--5-tabloya data ekleme--DML
INSERT INTO students VALUES('1001','Sherlock Holmes',99.8,'2023-10-04');
INSERT INTO students VALUES('1002','Harry Potter',100.0,now());

--6-tablodaki tüm kayıtları(dataları) görüntüleme--DQL
SELECT * FROM students

--7-tablodaki bazı sütunlara data ekleme
INSERT INTO students(name,grade) VALUES('Jack Sparrow',88.8);

--8-tabloda tüm kayıtların belirli sütunlarındaki dataları görüntüleme
SELECT name,grade FROM students;


--practice
--grades tabloyu silelim
--4. adımı tekrar yapalım
--tabloyu görüntüleme

SELECT * FROM grades;

/*------------------------------------
ÖDEVV:)
1) Tablo Oluşturma

“tedarikciler” isminde bir tablo olusturun,
“tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi”	field’lari olsun. 

2) Var olan tablodan yeni tablo olusturmak 
 “tedarikci_info” isminde bir tabloyu  “tedarikciler” tablosundan olusturun.
Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari olsun

3) Data ekleme
“ ogretmenler” isminde tablo olusturun.
 Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet” field’lari olsun.
“ogretmenler” tablosuna bilgileri asagidaki gibi olan kisileri ekleyin.
kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
kimlik_no: 234431224, isim: Ali Guler, brans : Fizik, cinsiyet: erkek.

4) bazı fieldları olan kayıt ekleme
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
kimlik_no: 567597624, isim: Veli Guler
--------------------------------------*/











