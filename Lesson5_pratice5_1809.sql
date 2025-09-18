CREATE DATABASE company;

use company;

CREATE TABLE employees(
 id int AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50) not null,
 department VARCHAR(50) not NULL,
 salary DECIMAL(10,2) not NULL
);

DELIMITER //

CREATE TRIGGER update_department
BEFORE INSERT ON employees
for EACH ROW
BEGIN
   if new. salary >= 5000 then 
   set new.department = 'Manager';
   ELSEIF new.salary >=3000 then 
   set new.department = 'sales';
   else 
   SET new.department = 'Support';
   END IF;
END //

DELIMITER ;

INSERT INTO employees (name, department, salary)
VALUES ('John Doe', 'A', 3500),
                    ('Jane Smith', 'A', 2000),
                    ('David Johnson', 'A', 6000);