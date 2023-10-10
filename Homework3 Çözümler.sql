--1-musteri tablosundaki tüm kayıtları listeleyiniz.
SELECT * FROM musteri;

--2-Mesleği AVUKAT olanların sadece şehirlerini listeleyiniz.
SELECT sehir FROM musteri WHERE meslek='AVUKAT';

--3-Kadın müşterilerin tüm bilgilerini listeleyiniz.
SELECT * FROM musteri WHERE cinsiyet='K';

--4-Kadın müşterilerin sadece şehir bilgilerini listeleyiniz.
SELECT sehir FROM musteri WHERE cinsiyet='K';

--5-Yaşı 40-50 arasında olan müşterileri listeleyiniz.
SELECT * FROM musteri WHERE yas BETWEEN 40 AND 50;

--6-Erkek müşterilerin mesleklerini listeleyiniz.
SELECT DISTINCT(meslek) FROM musteri WHERE cinsiyet='E';

--7-Yaşı 40-50 arasında OLMAYAN müşterileri listeleyiniz.
SELECT * FROM musteri WHERE yas NOT BETWEEN 40 AND 50;

--8-Yaşı 30-40 arasında olan KADIN müşterilerden ÖĞRETMENLERİ listeleyiniz.
SELECT * FROM musteri 
WHERE yas BETWEEN 30 AND 40 AND cinsiyet='K' AND meslek='ÖĞRETMEN' ;

--9-Yaşı 30-40 arasında OLMAYAN ERKEK müşterilerden AVUKAT OLMAYANLARI listeleyiniz.
SELECT *
FROM musteri
WHERE yas NOT BETWEEN 30 AND 40 AND cinsiyet='E' AND meslek<>'AVUKAT';

--10-Geliri 3000-5000 arasında olan müşterileri listeleyiniz.
SELECT *
FROM musteri
WHERE gelir BETWEEN 3000 AND 5000;

--11-ismi ALİ olan kayıtları siliniz.
DELETE FROM musteri
WHERE isim='ALİ';

--12-yaşı 60 olan kayıtları siliniz.
DELETE FROM musteri
WHERE yas=60;

--13-mesleği 'KUAFÖR' ve cinsiyeti 'K' olan kullanıcıyı siliniz.
DELETE FROM musteri
WHERE meslek='KUAFÖR' AND cinsiyet='K';

--14-geliri 6000 olan veya mesleği 'TESİSATÇI' olan kayıtları siliniz.
DELETE FROM musteri
WHERE gelir=6000 OR meslek='TESİSATÇI';

--15-musteri tablosundaki tüm kayıtları siliniz.
DELETE FROM musteri;

--16-tedarikciler3 tablosunu SCHEMADAN kaldırınız.
DROP TABLE IF EXISTS tedarikciler3;

--17-urunler tablosunu SCHEMADAN kaldırınız. 
DROP TABLE IF EXISTS urunler;