DELIMITER //
CREATE PROCEDURE getCusByID(IN cusNum INT(11))

BEGIN
 SELECT *
 FROM customers
 WHERE customerNumber = cusNum;
END //

DELIMITER ;

CALL getCusByID(175);


DELIMITER //
CREATE PROCEDURE getCustomersCountByCity(
     IN in_city VARCHAR(50),
     OUT Total INT
)

BEGIN
 SELECT COUNT(customerNumber)
 INTO Total
 FROM customers
 WHERE city = in_city;
END //

DELIMITER ;

CALL getCustomersCountByCity('Lyon', @total);
SELECT @total;

DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter,1); 
CALL SetCounter(@counter,1); 
CALL SetCounter(@counter,5); 
SELECT @counter; 



