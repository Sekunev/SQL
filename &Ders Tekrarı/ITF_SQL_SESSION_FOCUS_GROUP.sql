

--Track tablosunda en uzun süreli ilk 5 track' i getiren bir sorgu yazınız.

SELECT
FROM
WHERE
ORDER BY 
LIMIT

-----

--SELECT

SELECT 1

SELECT 'OWEN'

SELECT '27-05-2022'

SELECT 1 AS ID, 'OWEN' AS INSTRUCTOR, '27-05-2022' AS HIRE_DATE

----


--FROM
SELECT 	Title
FROM	albums	

--

SELECT 	AlbumId, Title, ArtistId
FROM	albums	

--

SELECT 	*
FROM	albums

--WHERE


SELECT 	*
FROM	albums
WHERE	ArtistId = 12 -- =, >, <, <=, >=, <>, BETWEEN ... AND ...


SELECT 	Title
FROM	albums
WHERE	ArtistId = 12

--

SELECT 	ArtistId
FROM	albums
WHERE	ArtistId = 12

---

--ArtistId' si 12 veya 16 olan sanatçıların album bilgilerini getiriniz.

SELECT 	*
FROM	albums
WHERE	ArtistId = 12 OR ArtistId = 16

---USA' de microsoftta çalışan müşterileri getiren bir sorgu yazınız


SELECT *
FROM	customers
WHERE	Country = 'USA' 
AND 	Company = 'Microsoft Corporation'

----

--IN, NOT IN, BETWEEN, NOT BETWEEN, LIKE

--ArtistId' si 12 veya 16 olan sanatçıların album bilgilerini getiriniz.

SELECT	*
FROM	albums
WHERE	ArtistId IN (12, 16)

----

--ArtistId' si 12, 13, 14, 15 veya 16 olmayan sanatçıların album bilgilerini getiriniz.
SELECT	*
FROM	albums
WHERE	ArtistId NOT IN (12, 13, 14, 15, 16)
ORDER BY ArtistId



SELECT	*
FROM	albums
WHERE	ArtistId <> 12 AND ArtistId <> 13 AND ArtistId <> 14 AND ArtistId <> 15 AND ArtistId <> 16
ORDER BY ArtistId


---

--Tutarı 5 ile 10$ arasındaki faturaları getiren bir sorgu yazınız.

SELECT *
FROM	invoices
WHERE	total BETWEEN 5 AND 10 
ORDER BY total


----Tutarı 5 ile 10$ arasında olmayan (5' ten büyük veya 10' dan küçük olmayan) faturaları getiren bir sorgu yazınız.


SELECT *
FROM	invoices
WHERE	total NOT BETWEEN 5 AND 10 
ORDER BY total


----

--like

--Adı R ile başlayıp o ile biten müşterileri getiriniz. 


SELECT *
FROM 	customers





--like

--Adı R ile başlayıp o ile biten müşterileri getiriniz. 

--%, _


SELECT *
FROM 	customers
WHERE	FirstName LIKE 'R%o'

---Grétrystraat 63 kaydını nasıl bulabilirim?

SELECT 	Address
FROM	customers
WHERE 	Address LIKE '%63'

---Sonunda sadece 9 olan kayıtları getiriniz (adres sütununda)


SELECT 	Address
FROM	customers
WHERE 	Address LIKE '% 9'

----

SELECT 	Address
FROM	customers
WHERE 	Address LIKE '%. 9'


---içerisinde . karakteri olan adresleri getiriniz
SELECT 	Address
FROM	customers
WHERE 	Address LIKE '%.%'


----
SELECT 	Address
FROM	customers
WHERE 	Address LIKE '__.%'

----
SELECT 	Address
FROM	customers
WHERE 	Address LIKE '%__.%'

----
SELECT 	Address
FROM	customers
WHERE 	Address LIKE '_.%'


----Aggregation and Group by 


---Count, sum, avg, min, max

SELECT	COUNT (CustomerId) AS CNT_CUSTOMER
FROM	customers
WHERE	Country = 'USA'


SELECT	COUNT (*) AS CNT_CUSTOMER
FROM	customers
WHERE	Country = 'USA'



---TOPLAM CİROYU HESAPLAYINIZ// TOTAL SÜTUNU İÇERİSİNDEKİ DEĞERLERİ TOPLAYINIZ.

SELECT 	SUM(TOTAL) AS Total_income
FROM	invoices

----

--ortalama fatura tutarını hesaplayınız

SELECT 	AVG(TOTAL) AS Total_income
FROM	invoices


---

SELECT 	MIN(total) Min_total, MAX(total) Max_total
FROM	invoices


----GROUPING

SELECT	BillingCity, SUM(total) total_income
FROM	invoices
GROUP BY BillingCity

---

SELECT	BillingCountry, SUM(total) total_income
FROM	invoices
GROUP BY BillingCountry

----


SELECT	BillingCountry, BillingCity, SUM(total) total_income_by_city
FROM	invoices
GROUP BY BillingCountry, BillingCity
ORDER BY total_income_by_city -- ASC


SELECT	BillingCountry, BillingCity, SUM(total) total_income_by_city
FROM	invoices
GROUP BY BillingCountry, BillingCity
ORDER BY total_income_by_city DESC
LIMIT		1


--

SELECT	BillingCountry, BillingCity, SUM(total) total_income_by_city
FROM	invoices
GROUP BY BillingCountry, BillingCity
ORDER BY total_income_by_city 
LIMIT		1



--Ülkelere göre düzenlenen minimum / maximum fatura tutarını hesaplayınız


SELECT 	BillingCountry, MIN (total), max(total)
FROM 	invoices
GROUP BY BillingCountry

--
SELECT 	BillingCountry, BillingCity, MIN (total), max(total)
FROM 	invoices
GROUP BY BillingCountry, BillingCity
ORDER BY BillingCountry, BillingCity

---

---Her bir composer' ın track sayısını bulunuz.

SELECT 	Composer, count(TrackId) cnt_track
FROM	tracks
GROUP BY Composer


SELECT 	COUNT (Composer)
FROM	tracks;

--KAÇ FARKLI COMPOSER = KAÇ TANE COMPOSER

--DISTINCT 

SELECT 	COUNT (DISTINCT Composer)
FROM	tracks


SELECT Composer
FROM tracks


---

SELECT 	DISTINCT Composer
FROM	tracks

---

SELECT 	DISTINCT Composer
FROM	tracks
WHERE Composer IS NULL

----

--'Bill Berry-Peter Buck-Mike Mills-Michael Stipe' isimli gruba ait kaç track mevcuttur?

SELECT 	COUNT (TrackId)
FROM	tracks
WHERE	Composer = 'Bill Berry-Peter Buck-Mike Mills-Michael Stipe'
AND		NAME LIKE 'U%';


---JOINS

--INNER & LEFT JOINS

---Track'lerin içinde bulunduğu Album isimlerini getiriniz

SELECT 	name, Title, TrackId, tracks.AlbumId, albums.AlbumId
FROM 	tracks INNER JOIN albums ON tracks.AlbumId = albums.AlbumId



SELECT 	name, Title, TrackId, tracks.AlbumId, albums.AlbumId
FROM 	albums INNER JOIN tracks ON tracks.AlbumId = albums.AlbumId


--Artist tablosundaki her bir artistin çıkardığı albümlerin isimlerini getiriniz.

SELECT 	artists.Name, albums.Title
FROM	artists INNER JOIN albums ON artists.ArtistId = albums.ArtistId
ORDER BY artists.Name


SELECT 	artists.Name, albums.Title
FROM	artists LEFT JOIN albums ON artists.ArtistId = albums.ArtistId
ORDER BY artists.Name













