-- COUNNT : tracks LİSTESİNDEKİ Name sutunununda kaç isim olduğu sonucu 

SELECT COUNT  (name)
FROM tracks;
-- Bu işlemi * ile de yapabiliriz.
SELECT COUNT (*)
FROM tracks;
-- dikkat : COUNT (name) bu şekilde NULL değerleri göstermez, ama COUNT (*) bu NULL değerleri gösterir.
-- Output' u yeniden adlandırmak için AS kullanılır.
SELECT COUNT (Composer) AS Yeni_isim
FROM tracks;


-- COUNT DISTINCT yinelenen değerleri göstermez

SELECT COUNT (DISTINCT BillingCountry) AS FARKLI_SEHIR_SAYISI
FROM invoices;

-- invoices Tablosundaki 'Germany' sayısını 'Almanya_sayısı' isimli tabloda gösterdi.

SELECT COUNT (*) AS Almanya_sayısı
FROM invoices
WHERE BillingCountry='Germany'

Batı Virginia Eyaletinden öğrenci sayısını "number_of_students" olarak döndürmek için lütfen bir sorgu yazın.


---------------------------------
MİN AND MAX FONCTİONS

 --- tracks LİSTESİNİN UnitPrice SUTUNUNDAKİ EN DÜŞÜK RAKAM	
SELECT MIN (UnitPrice) AS EN_DÜŞÜK_FİYAT
FROM tracks;
--- Aynı işlemi MIN KULLANmadan yapalım.

SELECT UnitPrice AS EN_DÜŞÜK_FİYAT
FROM tracks
ORDER BY  UnitPrice
LIMIT 1

/*--- track tablosunun bestecisi (Composer='AC/DC') olan  millisecond sutunundaki en büyük değer.*/

SELECT max(Milliseconds) AS EN_YÜKSEK_KAPASİTE
FROM tracks
WHERE Composer='AC/DC';


SELECT SUM(UnitPrice) AS Toplam_Fiyat
FROM tracks;

SELECT AVG(UnitPrice) AS Ortalama_Fiyat
FROM tracks

