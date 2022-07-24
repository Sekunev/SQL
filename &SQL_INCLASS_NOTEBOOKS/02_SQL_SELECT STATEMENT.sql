
----------------------

-- DISTINCT AlbumId ve MediaTypeId bilgilerini getiriniz.
-- yinelenen satırları ortadan kaldırmak için
SELECT DISTINCT AlbumId, MediaTypeId
FROM	tracks

---- WHERE AND LIMIT

-- Jimi Hendrix' in parçalarının isimlerini getiriniz.

SELECT name
FROM tracks
WHERE Composer = 'Jimi Hendrix';

-----

---10 dolardan yüksek tutara sahip invoice' ları getiriniz.

SELECT *
FROM	invoices
WHERE	total>10

-------
SELECT *
FROM	invoices
WHERE	total>10
ORDER BY	total DESC;

SELECT *
FROM invoices
WHERE total > 10
ORDER by total DESC
LIMIT 3, 5;  /* 3 den başla sonrasında 5 tane getir*/

-- Varsayılan ORDER BY anahtar kelime, kayıtları artan düzende sıralar. 
-- DESC Kayıtları azalan düzende sıralamak için anahtar kelimeyi kullanın . 
-- ASC Verileri artan düzende sıralamak için kullanılır.

---BillingCountry USA olmayan invoice' leri getiriniz ve artan sırayla total sütununu sıralayınız.

SELECT *
FROM	invoices
WHERE NOT BillingCountry = 'USA'
ORDER BY total ASC;
-- NOT tümcedeki bir koşulu olumsuzlaştırmak için kullanılır.
-- Bu örenekte aynı işlemi WHERE BillingCountry <> 'USA' veya BillingCountry != 'USA' ile de yapabilirdik.
---

---yanlış sonuç : değer küçük harf
SELECT *
FROM	invoices
WHERE NOT BillingCountry = 'usa'

--
SELECT *
FROM	invoices
WHERE  BillingCountry <> 'USA'

---
SELECT *
FROM	invoices
WHERE  BillingCountry != 'USA'
ORDER BY total DESC

-- Berlin' de veya London' da 2 dolardan yüksek tutara sahip invoice' ları getiriniz.
-- AND, OR & NOT Operatorleri WHERE ile kullanılır. 
-- AND Yalnızca her iki koşulun da (WHERE yan tümcesinde) True olarak değerlendirildiği kayıtları döndürür.
-- AND operatörü WHERE yan tümcesiyle birlikte kullanılır ve birden çok ifadeyi birleştirir.
-- OR Koşullardan birinin (WHERE yan tümcesinde) True olarak değerlendirildiği kaydı görüntüler 
-- NOT tümcedeki bir koşulu olumsuzlaştırmak için kullanılır

SELECT *
FROM invoices
WHERE (BillingCity = 'Berlin' OR BillingCity = 'London') AND total > 2
---------

-- Berlin' de 2 dolardan yüksek tutara sahip ilk 3 satırdaki invoice' ları getiriniz
SELECT *
FROM invoices
WHERE BillingCity = 'Berlin' AND total > 2
ORDER BY total ASC
LIMIT 3
-- en baştan kaç kayıt istiyorum. Bunun için LİMİT komutu.
----

---2009 ve 2011 yılları arasında düzenlenen en son faturanın tarihini getiriniz

-- BETWEEN karşılaştırma operatörüdür. Bir değerin bir değer aralığında olup olmadığını test etmek için kullanabilirsiniz.

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2010-12-31'
ORDER BY InvoiceDate DESC
LIMIT 2
-----
-- NOT BETWEEN tam tersidir.
-- Tarih değerlerinizi tek tırnak (') içine alın ve sorgunuzda YYYY-AA-GG tarih biçimini kullanın.

SELECT 	*
FROM	invoices
WHERE	InvoiceDate NOT BETWEEN '2009-01-01' AND '2010-12-31'
ORDER BY InvoiceDate DESC


--------
-- Belçika, Norveç, Kanada ve USA' den sipariş veren müşterilerin isim ve soyisimlerini getiriniz.
-- IN Operatör, bir değerin listedeki herhangi bir değerle eşleşip eşleşmediğini belirlemek için kullanılır .

SELECT *
FROM	customers
WHERE	Country IN ('Belgium', 'Canada', 'USA', 'Norway');
-- Aynı sorguyu aşağıdaki gibi de yapabilirdik 
----
SELECT *
FROM	customers
WHERE  Country = 'Belgium' OR  Country = 'Canada' OR Country = 'USA' OR Country = 'Norway';

--- NOT IN Kullanımı
SELECT *
FROM	customers
WHERE	Country  NOT IN ('Belgium', 'Canada', 'USA', 'Norway');

--- Bach' ın parçalarını getiriniz

-- LİKE Operator
--- Sorguladığınız tam değeri tam olarak bilmediğiniz bazı durumlar
--- Yüzde (%): `%` Karakter, sıfır veya daha fazla karakterden oluşan herhangi bir diziyle eşleşir.
--- Alt çizgi ( _ ): `_`Karakter, herhangi bir tek karakterle eşleşir.

SELECT *
FROM tracks
WHERE Composer LIKE '%Bach';

SELECT *
FROM tracks
WHERE Milliseconds  LIKE '_43719';


------
--------------
---------------Aggregate Functions

-- 2011-05-16 tarihinden sonra USA veya Kanada' da düzenlenen en yüksek tutara sahip InvoiceId' yi getiriniz.

SELECT 	InvoiceId, total
FROM	invoices
WHERE	InvoiceDate > '2011-05-16'
AND		BillingCountry IN ('USA', 'Canada')
ORDER BY 2 DESC
LIMIT 1

---Düzenlenen kaç adet invoice mevcut?

SELECT	COUNT(InvoiceId)
FROM	invoices;

------Kaç farklı state'te fatura düzenlenmiştir?

SELECT count(DISTINCT BillingCountry)
FROM invoices
ORDER BY BillingCountry;




