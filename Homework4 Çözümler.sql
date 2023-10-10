CREATE TABLE teachers(
id int,
firstname varchar(50),
lastname varchar(50),
age int,	
city varchar(20),
course_name varchar(20),
salary real	
);


CREATE TABLE courses(
course_id int,
course_name varchar(20) UNIQUE,
credit int,
course_fee numeric(5,2),
start_date date,
finish_date date	
);

INSERT INTO teachers VALUES(111,'Ahmet','Han',35,'Istanbul','SpringMVC',5000);
INSERT INTO teachers VALUES(112,'Mehmet','Ran',33,'Van','HTML',4000);
INSERT INTO teachers VALUES(113,'Bilal','Fan',34,'Bursa','SQL',3000);
INSERT INTO teachers VALUES(114,'Celal','San',30,'Bursa','Java',3000);
INSERT INTO teachers VALUES(115,'Deniz','Can',30,'Istanbul','SQL',3500);
INSERT INTO teachers VALUES(116,'Ekrem','Demir',36,'Istanbul','Java',4000.5);
INSERT INTO teachers VALUES(117,'Fatma','Celik',38,'Van','SpringBOOT',5550);
INSERT INTO teachers VALUES(118,'Hakan','Cetin',44,'Izmir','Java',3999.5);
INSERT INTO teachers VALUES(119,'Mert','Cetin',32,'Izmir','HTML',2999.5);
INSERT INTO teachers VALUES(120,'Nilay','Cetin',32,'Izmir','CSS',2999.5);
INSERT INTO teachers VALUES(121,'Selma','Celik',40,'Ankara','SpringBOOT',5550);
INSERT INTO teachers VALUES(122,'Fatih','Can',32,'Ankara','HTML',2550.22);
INSERT INTO teachers VALUES(123,'Nihat','Keskin',32,'Izmir','CSS',3000.5);
INSERT INTO teachers VALUES(124,'Hasan','Temel',37,'Istanbul','S.Security',3000.5);


INSERT INTO courses VALUES(3001,'SpringMVC',10,100.05,'10-01-2023','10-02-2023');
INSERT INTO courses VALUES(3002,'SpringBOOT',8,120.25,'11-02-2023','28-02-2023');
INSERT INTO courses VALUES(3003,'S.Security',6,200.15,'03-03-2023','12-03-2023');
INSERT INTO courses VALUES(3004,'Java',26,159.99,'03-11-2022','12-01-2023');
INSERT INTO courses VALUES(3005,'SQL',6,175.55,'03-01-2023','12-03-2023');
INSERT INTO courses VALUES(3006,'React',12,255.85,'03-06-2023','12-07-2023');
INSERT INTO courses VALUES(3003,'HTML',6,125.99,'03-03-2023','22-03-2023');
INSERT INTO courses VALUES(3003,'CSS',5,125.99,'03-04-2023','22-04-2023');
INSERT INTO courses VALUES(3003,'JavaScript',10,199.99,'03-05-2023','31-05-2023');




1--35 yaşından küçük öğretmenlerin verdikleri derslerin isimlerini ve kredi sayılarını listeleyiniz.
SELECT course_name,credit
FROM courses
WHERE course_name IN (SELECT course_name FROM teachers WHERE age<35);

2--Her bir şehirde verilen derslerin isimlerini ve kredisini listeleyiniz.  

SELECT city,course_name, (SELECT credit FROM courses c WHERE c.course_name=t.course_name )
FROM teachers t;

3--İstanbulda yaşayan öğretmenlerin verdiği derslerin isimlerini ve başlangıç tarihini listeleyiniz.

SELECT course_name,start_date
FROM courses
WHERE course_name IN (SELECT course_name FROM teachers WHERE sehir='Istanbul')

4--İstanbulda yaşayan öğretmenlerin isimlerini(firstname), verdiği derslerin isimlerini ve bitiş tarihini listeleyiniz. 
SELECT firstname, course_name,(SELECT finish_date FROM courses c WHERE c.course_name=t.course_name)
FROM teachers t
WHERE city='Istanbul'

5--'03-03-2023' tarihinden önce başlayan dersleri veren öğretmenlerin maaşlarının ortalamasını bulunuz.
SELECT AVG(salary)
FROM teachers
WHERE course_name IN (SELECT course_name FROM courses WHERE start_date<'03-03-2023')

6--2023 Şubat ve Mayıs ayları arasında başlayan dersleri veren öğretmenlerin toplam maaşını hesaplayınız.

SELECT SUM(salary)
FROM teachers 
WHERE course_name IN (SELECT course_name
                      FROM courses
                      WHERE start_date BETWEEN '01-02-2023' AND '01-05-2023') 

7--Kurs ücreti 125 ten fazla olan derslerin isimlerini, kredilerini ve bu dersleri veren öğretmenlerin
--max ve min maaşlarını listeleyiniz. 
SELECT course_name,credit, (SELECT MAX(salary) FROM teachers t WHERE t.course_name=c.course_name ),
                           (SELECT MIN(salary) FROM teachers t WHERE t.course_name=c.course_name )
FROM courses c
WHERE course_fee>125


8-- Ahmet Han'ın maaşı ortalama maaştan büyük ise tüm bilgilerini listeleyiniz.
SELECT *
FROM teachers
WHERE salary > (
    SELECT AVG(salary)
    FROM teachers
    )
    AND firstname = 'Ahmet'
    AND lastname = 'Han';

9--Yaşı 37 den büyük olan öğretmenlerin yaşını Java dersi alanların yaşlarının minimumu ile güncelleyiniz. 
UPDATE teachers 
SET age = (SELECT MIN(age) FROM teachers WHERE course_name = 'Java')
WHERE age>37;

10--Yaşı 35 den büyük olan öğretmen varsa, bu öğretmenlerin verdiği derslerin isimlerini ve
--başlangıç tarihlerini listeleyiniz.
SELECT course_name,credit
FROM courses c
WHERE EXISTS (SELECT * FROM teachers t WHERE age>35 AND t.course_name=c.course_name)

11--Hiçbir öğretmen tarafından verilmeyen dersleri isim, başlangıç ve bitiş tarihlerini listeleyiniz.

SELECT course_name,start_date,finish_date
FROM courses c
WHERE NOT EXISTS (SELECT * FROM teachers t WHERE t.course_name=c.course_name)

12--En az bir öğretmen tarafından verilen derslerin ücretlerini 10 artırınız.
UPDATE courses c
SET course_fee=course_fee+10
WHERE EXISTS (SELECT * FROM teachers t WHERE t.course_name=c.course_name)

13--Ücreti 170 den fazla olan ders varsa bu dersi veren öğretmenlerin tüm bilgilerini 
--listeleyiniz.(IN kullanmayınız.)
SELECT *
FROM teachers t
WHERE EXISTS (SELECT * FROM courses c WHERE course_fee>170 and c.course_name=t.course_name)

14--Başlangıç tarihi '03-11-2022' olan kursun ismini ' Core' ekleyiniz.
UPDATE courses
SET course_name=course_name || ' Core'
WHERE start_date='03-11-2022'

15--Maaşı ortalama maaştan yüksek olan öğretmenin şehrini Antalya olarak değiştiriniz.

UPDATE teachers
SET city='Antalya'
WHERE salary>(SELECT AVG(salary) FROM teachers)

16--Yaşı en küçük olan öğretmenin maaşını 2 katına çıkarınız.

UPDATE teachers
SET salary=salary*2
WHERE age=(SELECT MIN(age) FROM teachers)

17--En erken başlayan kursun kredisini 2 artırınız.
UPDATE courses
SET credit=credit+2
WHERE start_date=(SELECT MIN(start_date) FROM courses)


