-- -----------------------------------------------------
-- Schema store_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS store_db DEFAULT CHARACTER SET utf8;
USE store_db ;

-- -----------------------------------------------------
-- Table `mydb`.`Custumer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS custumer (
  cus_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  type_doc VARCHAR(3) NOT NULL,
  document INT UNSIGNED NOT NULL,
  PRIMARY KEY (cus_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table store_db.supplier
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS supplier (
  sup_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  telephone VARCHAR(12) NOT NULL,
  PRIMARY KEY (sup_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table store_db.product
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
-- Table store_db.invoice
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS invoice (
  inv_id INT NOT NULL AUTO_INCREMENT,
  seller VARCHAR(45) NOT NULL,
  product_prod_id INT NOT NULL,
  Custumer_cus_id INT NOT NULL,
  PRIMARY KEY (inv_id),
  INDEX fk_invoice_product1_idx (product_prod_id ASC) VISIBLE,
  INDEX fk_invoice_Custumer1_idx (Custumer_cus_id ASC) VISIBLE,
  CONSTRAINT fk_invoice_product1
    FOREIGN KEY (product_prod_id)
    REFERENCES product (prod_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_invoice_Custumer1
    FOREIGN KEY (Custumer_cus_id)
    REFERENCES custumer (cus_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table store_db.sale
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
