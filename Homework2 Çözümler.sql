--HOMEWORK-2--
------SQL Queries-1 Çözümler----------
--1--
CREATE DATABASE sqlpractice_db;
--2--
CREATE TABLE musteri(
      musteri_no SERIAL PRIMARY KEY,
      isim VARCHAR(50) NOT NULL CHECK(isim <> ''),
      yas INT CHECK(yas>18),
      cinsiyet CHAR(1),
      gelir REAL,
      meslek VARCHAR(20) ,
      sehir VARCHAR(20) 
);
--3--
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('Ali',35,'E',2500,'MÜHENDİS','İSTANBUL');
--3 devam--
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('BURAK',   25, 'E', 3500, 'MİMAR',       'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('CEYHUN',  45, 'E', 2000, 'MÜHENDİS',    'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('DEMET',   30, 'K', 3000, 'ÖĞRETMEN',    'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('FERHAT',  40, 'E', 2500, 'MİMAR',       'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('GALİP',   55, 'E', 4000, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('KÖKSAL',  25, 'E', 2000, 'AVUKAT',      'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR');
INSERT INTO musteri(isim,yas,cinsiyet,gelir,meslek,sehir) VALUES('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');
--4--
SELECT * FROM musteri;
--5--
SELECT isim,meslek FROM musteri;
--6--
CREATE TABLE sehirler(
alan_kodu INT,
isim VARCHAR(50) NOT NULL,
nufus INT,
CONSTRAINT alan_kodu_pk PRIMARY KEY(alan_kodu)	
);
--veya
CREATE TABLE sehirler(
alan_kodu INT PRIMARY KEY,
isim VARCHAR(50) NOT NULL,
nufus INT
);
--7-a--
CREATE TABLE tedarikciler3(
tedarikci_id INT PRIMARY KEY,
tedarikci_ismi VARCHAR(50), 
iletisim_isim VARCHAR(50) UNIQUE
);

--7-b--
CREATE TABLE urunler(
tedarikci_id INT,
urun_id VARCHAR(50), 
CONSTRAINT tedarikci_fk FOREIGN KEY(tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);



