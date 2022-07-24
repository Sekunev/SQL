SELECT * FROM vacation_table

-- vacation_table' ı silelim.

DROP TABLE vacation_table

-- yeniden oluşturalım.

CREATE TABLE vacation_table 
(
place_id int PRIMARY KEY,
country text,
hotel_name text NOT NULL,
employee_id int,
vacation_length int,
budged REAL,
FOREIGN KEY (employee_id) REFERENCES employees (EmployeeId)
);

SELECT * FROM vacation_table 

ALTER TABLE vacation_table
ADD City varchar(50) not null
;

SELECT * FROM vacation_table

-- eklediğimiz sutunu tekrar silelim.

ALTER TABLE vacation_table
DROP  City ;

