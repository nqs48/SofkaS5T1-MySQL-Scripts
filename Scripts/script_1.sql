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
  type_doc VARCHAR(3) NOT NULL,
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
  customer_cus_id INT NOT NULL,
  PRIMARY KEY (inv_id),
  INDEX fk_invoice_product1_idx (product_prod_id ASC) VISIBLE,
  INDEX fk_invoice_customer1_idx (customer_cus_id ASC) VISIBLE,
  CONSTRAINT fk_invoice_product1
    FOREIGN KEY (product_prod_id)
    REFERENCES product (prod_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_invoice_customer1
    FOREIGN KEY (customer_cus_id)
    REFERENCES customer (cus_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table sale
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sale (
  sale_id INT NOT NULL AUTO_INCREMENT,
  status VARCHAR(1) NOT NULL,
  date DATETIME NOT NULL,
  invoice_inv_id INT NOT NULL,
  PRIMARY KEY (sale_id),
  INDEX fk_sale_invoice1_idx (invoice_inv_id ASC) VISIBLE,
  CONSTRAINT fk_sale_invoice1
    FOREIGN KEY (invoice_inv_id)
    REFERENCES invoice (inv_id)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



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

-- -----------------------------------------------------
--  Insert data product
-- -----------------------------------------------------