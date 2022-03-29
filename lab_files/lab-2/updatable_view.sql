# However, to create an updatable view, the SELECT statement that defines the view must not contain any of the following elements:

# Aggregate functions such as MIN, MAX, SUM, AVG, and COUNT.
# DISTINCT
# GROUP BY clause.
# HAVING clause.
#UNION or UNION ALL clause.
# Left join or outer join.
# Subquery in the SELECT clause or in the WHERE clause that refers to the table appeared in the FROM clause.
# Reference to non-updatable view in the FROM clause.
# Reference only to literal values.
# Multiple references to any column of the base table.

#================================
#Let’s create an updatable view.
#=================================
CREATE VIEW officeInfo  AS 
   SELECT officeCode, phone, city
   FROM offices;
   
   SELECT * FROM   officeInfo;

 #================================
 # Update
 #================================
UPDATE officeInfo 
SET 
    phone = '+33 14 723 5555'
WHERE
    officeCode = 4;
#================================   
# Checking updatable view information
#================================
SELECT 
    table_name, 
    is_updatable
FROM
    information_schema.views
WHERE
    table_schema = 'classicmodels';
    
#================================
# Removing rows through the view
#================================
-- create a new table named items
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(11 , 2 ) NOT NULL
);

-- insert data into the items table
INSERT INTO items(name,price) 
VALUES('Laptop',700.56),('Desktop',699.99),('iPad',700.50) ;

-- create a view based on items table
CREATE VIEW LuxuryItems AS
    SELECT 
        *
    FROM
        items
    WHERE
        price > 700;
-- query data from the LuxuryItems view
SELECT 
    *
FROM
    LuxuryItems;
DELETE FROM LuxuryItems 
WHERE
    id = 3;
