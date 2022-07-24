----- Database' de kaç farklı composer mevcut?

SELECT 	COUNT (DISTINCT composer) as num_of_composer
FROM 	tracks

---minimum ve maximum süreye sahip track' leri getiriniz

SELECT MIN(Milliseconds) as Minimum_dur , MAX (Milliseconds) as Max_duration
FROM 	tracks

--MIN DURATION TRACK
SELECT	NAME, Milliseconds
FROM	tracks
WHERE	Milliseconds = 1071

--MAX DURATION TRACK
SELECT	NAME, Milliseconds
FROM	tracks
WHERE	Milliseconds = 5286953

--TOPLAM 

SELECT SUM(UnitPrice) AS Toplam_Fiyat
FROM tracks;

---Mağazamız ne kadar kazanmıştır?

SELECT 	SUM(total)
FROM 	invoices

ORTALAMA 

SELECT AVG(UnitPrice) AS Ortalama_Fiyat
FROM tracks;

---Ortalama süreden uzun track name' leri getiriniz

SELECT 	AVG(Milliseconds)
FROM	tracks


SELECT 	name, Milliseconds ,  393599.212103911 AS AVG_DUR
FROM	tracks
WHERE	Milliseconds > 393599.212103911
ORDER BY Milliseconds ASC
--------
--GROUP BY İpuçları: 
-- GROUP BY, aynı değerlere sahip satırları "her ülkedeki müşteri sayısını bul" gibi özet satırlarda gruplandırır. 
-- GROUP BY , sonuç kümesini bir veya daha fazla sütunla gruplandırmak için  
-- genellikle toplama işlevleriyle ( COUNT(), MAX(), MIN(), SUM(), AVG()) ile kullanılır.

--GROUP BY, veri grubu başına yalnızca bir sonuç döndürür.
--GROUP BY Cümlesi her zaman WHERE Cümlesini takip eder.
--GROUP BY Cümlesi her zaman ORDER BY dan önce gelir.
--------
--ÖRNEK; CİNSİYET E GÖRE DATA SCİENCE CİLER.
--SELECT gender, COUNT(job_title)
--FROM employees
--WHERE job_title = 'Data Scientist'
--GROUP BY gender;

---her bir cinsiyet grubunun asgari maaşını bulalım .
--SELECT gender, MIN(salary) AS min_salary
--FROM employees
--GROUP BY gender;
--gender      min_salary
------------  ----------
--Female      67000     
--Male        5500

--SELECT gender, SUM(salary) AS total_salary
--FROM employees
--GROUP BY gender;

--SELECT gender, AVG(salary) AS average_salary
--FROM employees
--GROUP BY gender;

---Her bir composer' ın kaç adet track' e sahip olduğunu getiriniz/raporlayınız.

SELECT	COUNT (NAME), COUNT (*), COUNT (DISTINCT NAME), COUNT (TrackId), COUNT (DISTINCT TrackId)
FROM	tracks


SELECT 	Composer, COUNT (TrackId) AS TRACK_SAYISI
FROM	tracks
GROUP BY	Composer

---Her bir country' deki müşteri sayısını getiriniz.

SELECT	Country, COUNT (CustomerId) AS CNT_CUSTOMER
FROM	customers
GROUP BY Country
ORDER BY 2 DESC  -- 2. yani CNT_CUSTOMER'e göre tersten sıralama yaptı. 

--Albümlerin minimum süreli tracklerini getiriniz

SELECT name, MIN(Milliseconds), AlbumId
FROM tracks
ORDER BY AlbumId

---Her bir country' den kazanılan toplam tutarı hesaplayınız.

SELECT 	BillingCountry, SUM(total) AS total_income
FROM	invoices
GROUP BY BillingCountry
ORDER BY 2

---City kırılımını da eklersek...

SELECT 	BillingCountry, BillingCity, SUM(total) AS total_income
FROM	invoices
GROUP BY BillingCountry, BillingCity

-- bir sütunda NULL değer olup olmadığını sorgulamak için. IS NULL

SELECT 	BillingCountry, BillingCity, BillingState
FROM	invoices
WHERE 	BillingState IS NULL