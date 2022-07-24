-- Çalışanlar isminde bir tablo oluşturalım.

CREATE TABLE çalışanlar(
çalışan_id INT PRIMARY KEY NOT NULL,
adı TEXT,
soyadı TEXT,
telefon INT,
maaş INT) 

-- faturalar isminde bir tablo daha oluşturalım.
CREATE TABLE faturalar(
fatura_id INT PRIMARY KEY NOT NULL,
tutar INT,
tarih INT,
çalışan_id INT,
FOREIGN KEY (çalışan_id)  -- çalışanlar tablosunun "çalışan_id" sutununu faturalar tablosuna FOREIGN KEY olarak tanımladık.
REFERENCES çalışanlar(çalışan_id)
); 

-- Çalışanlar tablosuna veriler ekleyelim.

INSERT INTO Çalışanlar (çalışan_id, adı, soyadı, telefon, maaş)
VALUES (2, 'Hatice', 'KARA', 654321, 3000),
(3, 'Gencer', 'ÇOLAK', NULL, 5000);

-- FOREIGN KEY tablolar arasındaki bağlantıları yok edecek eylemleri önlemek için kullanılır .

-- faturalar tablosuna veriler ekleyelim.
-- dikkat faturalar tablosunda çalışan_ıd'yi FOREIGN KEY olarak tanımladık.
-- bu yüzden çalışanlar tablosunda çalışan_id' ye girmediğimiz değeri burada giremeyiz.
INSERT INTO faturalar (fatura_id, çalışan_id, tutar, tarih)
VALUES (6, 3, 500, '2001-02-28');

-- şimdi de 250 tl satış yapan çalışanların kim olduğunu bulalım.

SELECT adı, soyadı
FROM çalışanlar
WHERE çalışan_id in (SELECT çalışan_id FROM faturalar WHERE tutar = '250')

-- aynı ilemi şimdi de JOIN ile yapalım.

SELECT DISTINCT adı, soyadı
FROM faturalar
INNER JOIN çalışanlar ON faturalar.çalışan_id= çalışanlar.çalışan_id
WHERE tutar='250';

-- tablomuzun ismini satış ile değiştirelim.

ALTER TABLE faturalar
RENAME TO satış;

-- tekrar eski haline döndürelim.

ALTER TABLE satış
RENAME TO faturalar;

-- Tabloya Yeni Sütun Eklemek:

ALTER TABLE faturalar
ADD COLUMN şehir;


-- Veritabanındaki bir tabloyu kaldırmak için deyimi kullanırız.

`DROP TABLE table_name

-- vacation_table isimli bir tablo oluşturalım.

CREATE TABLE vacation_table 
(
place_id int,
country text,
hotel_name text,
employee_id int,
vacation_length int,
budged REAL
);

-- veri ekleyelim.

INSERT INTO vacation_table 
VALUES
(1, 'USA', 'California', 1, 10, 20000),
(2, 'Rwanda', 'Rwanda', 2, 15, 20000),
(3, 'USA', 'Holidayinn', 3, 10.5, 20.500),
(4, 'USA', 'Holidayinn', 5, 10.5, 20.555)

INSERT INTO vacation_table 
VALUES
(5, 'USA', 'Holidayinn', 6, 10.5, 'null')

SELECT * FROM vocation_table

