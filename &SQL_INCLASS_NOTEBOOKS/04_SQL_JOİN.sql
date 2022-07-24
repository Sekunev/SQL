-- JOİN
--JOIN yan tümcesi, aralarında ilgili bir sütuna dayalı olarak iki veya daha fazla tablodaki satırları birleştirmek için kullanılır.
-- tracks tablosundaki her bir track' in genre bilgisini getiriniz.
-- INNER JOIN  her iki tabloda da eşleşen değerlere sahip kayıtları seçer.

SELECT *
FROM tracks
INNER JOIN genres ON tracks.GenreId=genres.GenreId

-- Üstteki kod'da GenreId sutunu mükererrer oldu düzeltelim:

SELECT	tracks.* , genres.Name
FROM	tracks INNER JOIN genres ON tracks.GenreId = genres.GenreId

-- Hem tracks hem de genres tablolarında aynı isimli name sutunları bulunuyor. içerikleri farklı ama. o halde name lerin isimlerini değiştirelim.

SELECT	tracks.name AS Track_name, genres.Name AS Genre_name
FROM	tracks INNER JOIN genres ON tracks.GenreId = genres.GenreId

-- Çok uzun kodlamalarda tablo isimlerini tekrar tekrar yazmamak için  tablo isimlerini kodlayabiliriz.

SELECT	A.name AS Track_name , B.Name AS genre_name
FROM	tracks AS A
INNER JOIN genres AS B 
ON A.GenreId = B.GenreId

-------------

---yukarıdaki sorgu sonucunda kaç farklı genre_name vardır?
SELECT	count (DISTINCT B.Name)
FROM	tracks AS A
INNER JOIN genres AS B 
ON A.GenreId = B.GenreId


--- Her bir çalışanın '2010-09-14' tarihinden itibaren satış bilgilerini getiriniz.

SELECT	 EmployeeId, employees.FirstName, invoices.*
FROM	employees
		INNER JOIN customers ON employees.EmployeeId = customers.SupportRepId
		INNER JOIN invoices ON invoices.CustomerId = customers.CustomerId
WHERE InvoiceDate > 2010-12-05
GROUP BY employees.EmployeeId
ORDER BY InvoiceDate

---------

--Her faturanın müşterisinin isim bilgisini getiriniz

SELECT invoices.InvoiceId,  customers.FirstName, customers.LastName
FROM invoices
JOIN customers ON invoices.CustomerId=customers.CustomerId

----
-- pekiii Kaç farklı müşteri için fatura düzenlenmiş.

SELECT 	count (distinct CustomerId)
FROM	invoices 

---Her bir artist' in Albüm bilgilerini yazdırınız.


SELECT artists.Name AS artist_name, albums.*
FROM albums
INNER JOIN artists ON albums.ArtistId=artists.ArtistId
ORDER by 1

--LEFT JOIN
--LEFT JOIN sözcük, soldaki tablodan (tablo1) tüm kayıtları ve sağdaki tablodan (tablo2) eşleşen kayıtları döndürür. 
--Sonuç, eşleşme yoksa sağ taraftan 0 kayıttır.

--Acaba db' deki tüm artistlerin Albüm bilgisi mevcut mudur?

SELECT artists.Name AS artist_name, albums.Title
FROM artists
LEFT JOIN albums ON albums.ArtistId=artists.ArtistId
ORDER by 2

-- artist tablosunun tamamını aldık LEFT JOIN metodu uygulayarak karşılarına albüm bilgilerini getirdik. Order BY ile sıralama yapınca da NULL değerler ortaya çıktı.

----

---Her bir Artistin track' lerini getiriniz.

SELECT artists.name, tracks.name AS TRACK_NAME
FROM artists
		LEFT JOIN albums ON artists.ArtistId=albums.ArtistId
		LEFT JOIN tracks ON albums.AlbumId=tracks.AlbumId


---

---Her bir Track' in bulunduğu faturaları getiriniz.

---Benim çözümüm..
SELECT tracks.Name AS TRACK_NAME, invoice_items.InvoiceId, invoices.total
FROM tracks
		INNER JOIN invoice_items ON tracks.TrackId=invoice_items.TrackId
		INNER JOIN invoices ON invoice_items.InvoiceId=invoices.InvoiceId

-- ders çözümü. sadece fatura ıd bilgisi mevcut.
SELECT A.name AS TRACK_NAME, B.InvoiceId
FROM 	tracks AS A
		INNER JOIN invoice_items AS B ON A.TrackId = B.TrackId


------HER BİR TRACK EN AZ BİR FATURADA BULUNUYOR MU?
---Benim çözümüm..
SELECT DISTINCT tracks.name, invoices.InvoiceId
FROM tracks
		LEFT JOIN invoice_items ON tracks.TrackId=invoice_items.TrackId
		LEFT JOIN invoices ON invoice_items.InvoiceId=invoices.InvoiceId
ORDER BY invoices.InvoiceId

-- ders çözümü. uzatmadan.
SELECT 	DISTINCT A.name AS TRACK_NAME, B.InvoiceId
FROM 	tracks AS A
		LEFT JOIN invoice_items AS B ON A.TrackId = B.TrackId
ORDER BY 2

-- Farklı tablolarda artistid sayıları.
SELECT 	COUNT (albums.ArtistId), 	COUNT (artists.ArtistId)
FROM	artists LEFT JOIN albums ON albums.ArtistId = artists.ArtistId


--- Hangi türde kaçar adet track olduğunu getiriniz.

SELECT 		GenreId AS Tür, Count(tracks.name) AS Tür_miktarı
FROM 		tracks
GROUP BY 	GenreId

-- genre isimlerine göre sıralama yapmak isteseydik;

SELECT 		genres.name AS Tür_adı, Count(tracks.name) AS Tür_miktarı
FROM 		tracks
INNER JOIN genres ON tracks.GenreId=genres.GenreId
GROUP BY 	tracks.GenreId
ORDER BY 1











