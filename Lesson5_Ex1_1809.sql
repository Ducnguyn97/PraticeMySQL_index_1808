CREATE DATABASE demo;

USE demo;

CREATE TABLE Product(
id int AUTO_INCREMENT PRIMARY KEY,
pCode VARCHAR(50) not null,
pName VARCHAR(50) not null,
pPrice double check(pPrice >0),
pAmount int not null,
pDescription VARCHAR(200) ,
pStatus bit not null
);

INSERT INTO Product(pCode, pName, pPrice, pAmount, pDescription, pStatus)
VALUES
('P001', 'Laptop Dell Inspiron 15', 1200.50, 10, 'Laptop văn phòng cấu hình ổn', b'1'),
('P002', 'Smartphone Samsung Galaxy S21', 899.99, 25, 'Điện thoại thông minh cao cấp', b'1'),
('P003', 'Tai nghe Bluetooth Sony WH-1000XM4', 350.00, 50, 'Tai nghe chống ồn cao cấp', b'1'),
('P004', 'Chuột không dây Logitech M590', 45.00, 100, 'Chuột yên tĩnh, kết nối Bluetooth & USB', b'1'),
('P005', 'USB Kingston 64GB', 15.00, 200, 'USB 3.0 dung lượng 64GB', b'1'),
('P006', 'Màn hình LG UltraWide 29 inch', 320.00, 15, 'Màn hình siêu rộng, phù hợp đa nhiệm', b'1'),
('P007', 'Bàn phím cơ Keychron K2', 90.00, 30, 'Bàn phím cơ Bluetooth, hot swap', b'1'),
('P008', 'Ổ cứng SSD Samsung 1TB', 120.00, 40, 'SSD tốc độ cao NVMe PCIe Gen3', b'1'),
('P009', 'Loa Bluetooth JBL Charge 5', 150.00, 35, 'Loa di động, pin 20 giờ, chống nước', b'1'),
('P010', 'Webcam Logitech C920 HD Pro', 85.00, 20, 'Webcam FullHD, micro kép', b'1');

ALTER TABLE Product
ADD UNIQUE INDEX idx_pCode(pCode);

ALTER TABLE Product 
ADD INDEX idx_pName_pCode(pCode, pName);
EXPLAIN SELECT * 
FROM Product;

CREATE VIEW product_v AS 
SELECT pCode, pName, pPrice, pStatus
FROM product;

SELECT *
FROM product_v;

CREATE OR REPLACE VIEW product_v as
SELECT pCode, pName, pPrice, pStatus, pAmount
FROM product_v;

DROP VIEW product_v;

DELIMITER //
DROP PROCEDURE IF EXISTS `showInfo`//
CREATE PROCEDURE showInfo()
BEGIN
   SELECT * 
   FROM product;
END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertproduct`//
CREATE PROCEDURE insertproduct(
IN pCode VARCHAR(50), 
IN pName VARCHAR(50), 
IN pPrice DOUBLE,
IN pAmount int, 
IN pDescription VARCHAR(50), 
IN pStatus bit
)
BEGIN
   INSERT INTO Product(pCode, pName, pPrice, pAmount, pDescription, pStatus)
VALUES(pCode, pName, pPrice, pAmount, pDescription, pStatus);
END //

DELIMITER ;