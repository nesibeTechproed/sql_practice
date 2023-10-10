------------DAY'5 NT-------------
--CREATE:INSERT 
--  READ:SELECT
--UPDATE:?
--DELETE:DELETE

--26-UPDATE .. 
   --SET sütunadı=yeni değer 
   --WHERE koşul            :koşulu sağlayan satırlardaki dataları değiştirir, günceller.
   
--idsi 123456789 olan çalışanın isyeri ismini 'Trendyol' olarak güncelleyeniz.
UPDATE calisanlar3
SET isyeri='Trendyol'
WHERE id=123456789;

-- id’si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve 
--sehirini 'Bursa' olarak güncelleyiniz.
UPDATE calisanlar3
SET isim='Veli Yıldırım',sehir='Bursa'
WHERE id=567890123;

--  markalar tablosundaki marka_id değeri 102 ye eşit veya büyük olanların marka_id’sini 2 ile çarparak değiştirin.

UPDATE markalar
SET marka_id=marka_id*2
WHERE marka_id>=102;

-- markalar tablosundaki tüm markaların calisan_sayisi değerlerini marka_id ile toplayarak güncelleyiniz.
UPDATE markalar
SET calisan_sayisi=calisan_sayisi+marka_id

--calisanlar3 tablosundan Ali Seker’in isyerini, 'Veli Yıldırım' ın isyeri ismi ile güncelleyiniz.

UPDATE calisanlar3
SET isyeri=(SELECT isyeri FROM calisanlar3 WHERE isim='Veli Yıldırım')
WHERE isim='Ali Seker'

--calisanlar3 tablosunda maasi 1500 olanların isyerini, markalar tablosunda
--calisan_sayisi 20000 den fazla olan markanın ismi ile değiştiriniz.

UPDATE calisanlar3
SET isyeri=(SELECT marka_isim FROM markalar WHERE calisan_sayisi>20000)
WHERE maas=1500;

--calisanlar3 tablosundaki isyeri 'Vakko' olanların sehir bilgisinin sonuna ' Şubesi' ekleyiniz.

UPDATE calisanlar3
SET sehir=sehir||' Şubesi'
WHERE isyeri='Vakko'

--alternatif
UPDATE calisanlar3
SET sehir=CONCAT(sehir,' Şubesi')
WHERE isyeri='Vakko'


SELECT * FROM calisanlar3;   
SELECT * FROM markalar;   
   

--27-IS NULL condition  

CREATE TABLE people
(
ssn char(9),
name varchar(50),
address varchar(50)
);
INSERT INTO people VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO people VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO people VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO people (ssn, address) VALUES(456789012, 'Bursa');
INSERT INTO people (ssn, address) VALUES(567890123, 'Denizli');
INSERT INTO people (ssn, name) VALUES(567890123, 'Veli Han');

SELECT * FROM people;

--people tablosundaki name sütununda NULL olan değerleri listeleyiniz.

SELECT *
FROM people
WHERE name IS NULL

--people tablosundaki adres sütununda NULL olmayan değerleri listeleyiniz.

SELECT *
FROM people
WHERE address IS NOT NULL

--people tablosunda name sütunu null olanların name değerini 
--'MISSING...' olarak güncelleyiniz..

UPDATE people
SET name='MISSING...'
WHERE name IS NULL

--people tablosunda address sütunu null olanların address değerini 
--'MISSING...' olarak güncelleyiniz..

UPDATE people
SET address='MISSING...'
WHERE address IS NULL


--28-ORDER BY:kayıtları belirli bir veya daha fazla sütuna yada bir ifade(expression) göre
--varsayılan olarak NATURAL(artan,ASCENDING) olarak sıralamamızı sağlar.

CREATE TABLE person
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir'); 
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa'); 
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara'); 

SELECT * FROM person;

--person tablosundaki tüm kayıtları adrese göre (artan) sıralayarak listeleyiniz.

SELECT * 
FROM person
ORDER BY adres;--default:ASC:artan

SELECT * 
FROM person
ORDER BY adres ASC;--okunabilirlik artar


--person tablosundaki tüm kayıtları soyisime göre (azalan) sıralayarak listeleyiniz.

SELECT * 
FROM person
ORDER BY soyisim DESC;--DESCENDING:azalan

--person tablosundaki soyismi Bulut olanları isime göre (azalan) sıralayarak listeleyiniz.

SELECT *
FROM person
WHERE soyisim='Bulut'
ORDER BY isim DESC;

--alternatif
SELECT *
FROM person
WHERE soyisim='Bulut'
ORDER BY 2 DESC;--not recommended:tavsiye edilmez

--person tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyiniz

SELECT *
FROM person
ORDER BY isim ASC, soyisim DESC

--İsim ve soyisim değerlerini, soyisim kelime uzunluklarına göre sıralayarak listeleyiniz.

SELECT isim,soyisim,LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY LENGTH(soyisim) 

SELECT isim,soyisim,LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY karakter_sayisi 

--Tüm isim ve soyisim değerlerini aralarında bir boşluk ile aynı sutunda çağırarak her bir isim ve 
--soyisim değerinin toplam uzunluğuna göre sıralayınız.

SELECT isim||' '||soyisim ad_soyad
FROM person
ORDER BY LENGTH(isim)+LENGTH(soyisim)


SELECT isim||' '||soyisim ad_soyad,LENGTH(isim||soyisim) karakter_sayisi
FROM person
ORDER BY LENGTH(isim||soyisim)

--calisanlar3 tablosunda maaşı ortalama maaştan yüksek olan çalışanların
--isim,şehir ve maaşlarını maaşa göre artan sıralayarak listeleyiniz.

SELECT isim,sehir,maas
FROM calisanlar3
WHERE maas>(SELECT AVG(maas) FROM calisanlar3)
ORDER BY maas ASC















