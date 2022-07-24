-- Jane Peacock'dan sonra işe giren çalışanları bulacağız. 
-- Sorgumuz, çalışanların ad, soyad ve maaş bilgilerini getirmelidir.

SELECT FirstName, LastName, HireDate
FROM employees
WHERE HireDate >= (SELECT HireDate FROM employees WHERE LastName = 'Edwards');


-- Tek Satırlı Alt Sorgular: (= , > , >= , <= , <> , != kullanılır.)
-- Öernek: Tek Satırlı Alt Sorgumuz fatura ortalamasınıbuldu.
-- ve bize ortalamanın üzerinde olan faturalar döndürdü.

SELECT InvoiceId, BillingCountry, total AS Faturalar
FROM invoices
WHERE total >(SELECT AVG(total) FROM invoices)

-- Çok Satırlı Alt Sorgular: (IN, NOT IN, ANY, ALL operatörler kullanılır.)
-- Title'ı Sales Support Agent olan çalışanların danışmanlık yaptığı müşterileri bulun. 
-- (adı, çalışanlar tablosundan soyadı)

SELECT FirstName, LastName, SupportRepId
FROM customers
WHERE SupportRepId in (SELECT EmployeeId FROM employees WHERE Title = 'Sales Support Agent')


---Album title' ı 'Faceless' veya 'Let There Be Rock' olan track' lerin bilgilerini getiriniz.

SELECT 	TrackId, AlbumId, Name
FROM	tracks
WHERE	AlbumId IN (SELECT AlbumId FROM albums WHERE Title IN ('Faceless', 'Let There Be Rock'))

-- or ile çözüm 

SELECT 	TrackId, AlbumId, Name
FROM	tracks
WHERE	AlbumId = (SELECT AlbumId FROM albums WHERE Title = 'Faceless')
OR		AlbumId = (SELECT AlbumId FROM albums WHERE Title = 'Let There Be Rock')

-- or ile veya

SELECT 	TrackId, AlbumId, Name
FROM	tracks
WHERE	AlbumId IN (SELECT AlbumId FROM albums WHERE Title = 'Faceless' OR Title = 'Let There Be Rock')


-----Facelift isimli albümde bulunan ve 4 dakikadan az süreli kaç adet track vardır?


SELECT 	COUNT (TrackId)
FROM 	tracks
WHERE	Milliseconds < 4*60*1000
AND		AlbumId = (SELECT AlbumId
					FROM 	albums 
					WHERE 	Title = 'Facelift')
					
					
--5--Based on the previous question, find the albums whose total duration is higher than 70 minutes. 
--Your solution should include album title and total duration.	

SELECT A.AlbumId, A.total_duration, albums.Title
FROM
	(
	select 	AlbumId, SUM (Milliseconds) AS TOTAL_DURATION
	from 	tracks
	GROUP BY AlbumId
	) A INNER JOIN albums ON A.AlbumId = albums.AlbumId
WHERE 	TOTAL_DURATION > 70*60*1000
ORDER BY TOTAL_DURATION