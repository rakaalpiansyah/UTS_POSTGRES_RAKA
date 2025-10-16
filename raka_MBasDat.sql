CREATE SCHEMA SALAM;

CREATE TABLE SALAM.mahasiswas (
    id SERIAL PRIMARY KEY, 
    nim VARCHAR(10) NOT NULL UNIQUE, 
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    ipk NUMERIC(3, 2) CHECK (ipk >= 0.00 AND ipk <= 4.00)
);

INSERT INTO SALAM.mahasiswas (nim, nama, email, ipk)
VALUES ('1237050112', 'Raka Alpiansyah', 'Raka Alpiansyah@gmail.com', 3.76);
DELETE FROM SALAM.mahasiswas WHERE nim = '202301123';

-- 1. Membuat role/user baru
CREATE ROLE backend_dev WITH LOGIN PASSWORD 'rakaal';
CREATE ROLE bi_dev WITH LOGIN PASSWORD 'rakaal';
CREATE ROLE data_engineer WITH LOGIN PASSWORD 'rakaal';

-- Memberikan hak akses untuk masuk ke skema SALAM
GRANT USAGE ON SCHEMA SALAM TO backend_dev;
GRANT USAGE ON SCHEMA SALAM TO bi_dev;
GRANT USAGE ON SCHEMA SALAM TO data_engineer;

-- 2. Memberikan hak akses sesuai ketentuan
-- a. backend_dev
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- b. bi_dev
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- c. data_engineer
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON SCHEMA SALAM TO data_engineer;

SELECT * FROM SALAM.mahasiswas;

INSERT INTO SALAM.mahasiswas (nim, nama, email, ipk) VALUES ('123705011', 'Budi', 'budi@gmail.com', 3.9);
UPDATE SALAM.mahasiswas SET nama = 'budi soetomo' WHERE nim = '123705011'; 
DELETE FROM SALAM.mahasiswas WHERE nim = '123705011'; 


DROP TABLE SALAM.mahasiswas;


SELECT * FROM SALAM.mahasiswas; 

DELETE FROM SALAM.mahasiswas WHERE nim = '1237050112';


SELECT * FROM SALAM.mahasiswas; 

ALTER TABLE SALAM.mahasiswas ADD COLUMN tahun_masuk DATE; 

ALTER TABLE SALAM.mahasiswas ADD COLUMN dospem VARCHAR(100);

UPDATE SALAM.mahasiswas
SET dospem = 'Dr. a'
WHERE nim = '1237050112';

INSERT INTO SALAM.mahasiswas (nim, nama, email, ipk, dospem, tahun_masuk)
VALUES 
('1237050', 'riri', 'riri@gmail.com', 3.90, 'Dr. Riri', '2023-09-01');

INSERT INTO salam.mahasiswas (nim,nama,email,ipk,tahun_masuk) VALUES
	 ('1237050112','Raka Alpiansyah','Raka Alpiansyah@gmail.com',3.76,NULL),
	 ('123705011','budi soetomo','budi@gmail.com',3.90,NULL);
