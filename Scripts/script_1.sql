-- -----------------------------------------------------------------------------------
-- 1. Create the required tables with the necessary relationships
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Schema store_db 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS store_db DEFAULT CHARACTER SET utf8;
USE store_db ;

-- -----------------------------------------------------
-- Table custumer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS customer (
  cus_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  type_doc VARCHAR(2) NOT NULL,
  document INT UNSIGNED NOT NULL,
  PRIMARY KEY (cus_id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table supplier
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS supplier (
  sup_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  telephone VARCHAR(15) NOT NULL,
  PRIMARY KEY (sup_id))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product (
  prod_id INT NOT NULL AUTO_INCREMENT,
  supplier_sup_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  price INT UNSIGNED NOT NULL,
  PRIMARY KEY (prod_id),
  INDEX fk_product_supplier_idx (supplier_sup_id ASC) VISIBLE,
  CONSTRAINT fk_product_supplier
    FOREIGN KEY (supplier_sup_id)
    REFERENCES supplier (sup_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table invoice
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS invoice (
  inv_id INT NOT NULL AUTO_INCREMENT,
  seller VARCHAR(45) NOT NULL,
  product_prod_id INT NOT NULL,
  PRIMARY KEY (inv_id),
  INDEX fk_invoice_product1_idx (product_prod_id ASC) VISIBLE,
  CONSTRAINT fk_invoice_product1
    FOREIGN KEY (product_prod_id)
    REFERENCES product (prod_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table sale
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sale (
  sale_id INT NOT NULL AUTO_INCREMENT,
  cus_document INT UNSIGNED NOT NULL,
  type_doc VARCHAR(2) NOT NULL,
  status VARCHAR(1) NOT NULL,
  date DATETIME NOT NULL,
  invoice_inv_id INT NOT NULL,
  PRIMARY KEY (sale_id),
  INDEX fk_sale_invoice1_idx (invoice_inv_id ASC) VISIBLE,
  CONSTRAINT fk_sale_invoice1
    FOREIGN KEY (invoice_inv_id)
    REFERENCES invoice (inv_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------------------------------------
-- 2. Fill the tables with previous information to be able to manipulate the database at the data level.
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Insert data customer 
-- -----------------------------------------------------

INSERT INTO customer (name,type_doc,document)
VALUES
  ("Nash Nicholson","cc",211295824),
  ("Orson Burks","ti",252409685),
  ("Flynn Carpenter","cc",183427410),
  ("Karina Mullins","cc",290995022),
  ("Rosalyn Cannon","cc",598788284);

  SELECT * FROM store_db.customer;


-- -----------------------------------------------------
--  Insert data supplier
-- -----------------------------------------------------

INSERT INTO supplier (name,telephone)
VALUES
  ("Eu Ltd","1-885-424-7207"),
  ("Accumsan Interdum Libero Limited","285-5268"),
  ("Rhoncus Id Corp.","1-447-963-1754"),
  ("Fringilla Foundation","1-913-245-2863"),
  ("At Lacus Incorporated","815-1246");

  SELECT * FROM store_db.supplier;

-- -----------------------------------------------------
--  Insert data product
-- -----------------------------------------------------
INSERT INTO product (supplier_sup_id,name,price) 
VALUES 
(1, 'RedBull',6000),
(1, 'Cocacola',6000),
(2, 'Rice',6000),
(2, 'Mustard',14000),
(4, 'Kitchen Oil',10000);

SELECT * FROM store_db.product;

-- -----------------------------------------------------
--  Insert data invoice
-- -----------------------------------------------------

INSERT INTO invoice (product_prod_id,seller) 
VALUES 
(1,"Harry Styles"),
(1,"Harry Styles"),
(4,"Harry Styles"),
(4,"Harry Styles"),
(5,"Harry Styles"),
(2,"Harry Styles"),
(3,"Harry Styles");

SELECT * FROM store_db.invoice;

-- -----------------------------------------------------
--  Insert data sale
-- -----------------------------------------------------
INSERT INTO sale (cus_document,type_doc,status,date,invoice_inv_id) 
VALUES 
("1073446734","CC","A","2022-02-13 18:01:44",1),
("1073346734","TI","A","2022-04-22 01:25:22",2),
("1073295734","CE","A","2022-04-28 10:38:40",3),
("1071047734","CC","A","2022-06-12 11:01:55",4),
("1004629734","CC","A","2022-07-18 12:56:42",5),
("1004960454","CC","A","2022-07-20 12:56:42",6),
("1004620934","TI","A","2022-07-22 14:43:12",7);

SELECT * FROM store_db.sale;



-- -----------------------------------------------------------------------------------
-- 3. Carry out two logical deletions and two physical deletions of sales made.
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Physical deletion of sales registers made
-- -----------------------------------------------------

DELETE FROM sale WHERE sale_id = 1;
DELETE FROM sale WHERE sale_id = 3;

SELECT * FROM sale;

-- -----------------------------------------------------
-- Logical Delete of sales registers made
-- -----------------------------------------------------

UPDATE sale SET status = "D" WHERE sale_id = 2;
UPDATE sale SET status = "D" WHERE sale_id = 4;

SELECT * FROM sale WHERE status = 'A';


-- -----------------------------------------------------------------------------------
-- 4. Updated three products in your name and the supplier that supplies them.
-- -----------------------------------------------------------------------------------

UPDATE product SET name = "pepsi", price = 5500, supplier_sup_id = 1 WHERE (prod_id = 2);
UPDATE product SET name = "Monster", price = 6500, supplier_sup_id = 5 WHERE (prod_id = 1);
UPDATE product SET name = "apple", price = 2500, supplier_sup_id = 3 WHERE (prod_id = 3);


SELECT * FROM product;