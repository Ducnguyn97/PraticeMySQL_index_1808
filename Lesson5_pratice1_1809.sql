ALTER TABLE customers add index idx_customerName(customerName);

EXPLAIN SELECT * 
FROM classicmodels.customers
WHERE customerName = 'Land of Toys Inc.';

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * 
FROM customers 
WHERE contactFirstName= 'Jean' or contactFirstName = 'King';