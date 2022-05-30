-- -----------------------------------------------------------------------------------
-- 1. SQL query where you can obtain the products sold by entering document type and document number.
-- -----------------------------------------------------------------------------------

SELECT sale_id,cus_document,product_prod_id FROM invoice INNER JOIN sale ON inv_id=invoice_inv_id  WHERE cus_document = 1004620934 AND type_doc = "TI" AND status = "A";
SELECT sale_id,cus_document,product_prod_id FROM invoice INNER JOIN sale ON inv_id=invoice_inv_id  WHERE cus_document = 1004960454 AND type_doc = "CC" AND status = "A";

-- -----------------------------------------------------------------------------------
-- 2. Consult products by name, which must show who or who have been their suppliers.
-- -----------------------------------------------------------------------------------

SELECT name, supplier_sup_id FROM product WHERE name = "Monster";
SELECT name, supplier_sup_id FROM product WHERE name = "apple";
