SELECT idproduct, productname, price, active, type, iddepartment, stock FROM BB_PRODUCT;

SELECT idshopper, b.idbasket, b.orderplaced, b.dtordered, b.dtcreated
    FROM BB_SHOPPER s INNER JOIN BB_BASKET b USING (idShopper);
    
SELECT idproduct, productname, categoryname, optionname
    FROM BB_PRODUCT p INNER JOIN BB_PRODUCTOPTION 
        USING (IDPRODUCT)
            INNER JOIN bb_productoptiondetail pd USING (idoption)
                INNER JOIN bb_productoptioncategory pc USING (idoptioncategory);

SELECT idproduct, productname, SUM(it.quantity) "Quanitity" FROM bb_product p JOIN bb_basketitem it
   USING (idproduct)
      join BB_BASKET bas using(idbasket)
         GROUP BY idproduct, productname
            order by idproduct;

SELECT b.idbasket, p.idproduct, productname, description
   FROM bb_product p, bb_basketitem it, bb_basket b
      WHERE p.idproduct = it.idproduct
        AND it.idbasket = b.idbasket;

SELECT idbasket, idproduct, productname, description
   FROM bb_product p JOIN bb_basketitem bi USING (idproduct)
     JOIN bb_basket b using(idbasket);
            
SELECT b.idbasket, s.lastname, p.idproduct, productname, description
    FROM bb_product p, bb_basketitem bi, bb_basket b, bb_shopper s
     WHERE p.idproduct = bi.idproduct
        AND bi.idbasket = b.idbasket
            AND b.idshopper = s.idshopper
                ORDER BY s.lastname; 
                
SELECT idbasket,lastname, idproduct, productname, description
    FROM bb_product JOIN bb_basketitem USING (idproduct)
         JOIN bb_basket USING(idbasket)
              JOIN bb_shopper USING(idshopper)
                   ORDER BY lastname; 
                
SELECT IDBASKET, IDSHOPPER,  TO_CHAR(DTCREATED, 'MONTH DD, YYYY') "DATE CREATED" FROM BB_BASKET bas INNER JOIN BB_SHOPPER USING (IDSHOPPER)
    WHERE DTCREATED LIKE '%FEB-12';

SELECT COUNT(IDPRODUCT) AS total_quantity FROM BB_PRODUCT JOIN BB_BASKETITEM 
    USING (IDPRODUCT)
        JOIN BB_BASKET USING (IDBASKET)
            WHERE ORDERPLACED > 0 GROUP BY IDPRODUCT ORDER BY IDPRODUCT;

SELECT COUNT(IDPRODUCT) AS total_quantity FROM BB_PRODUCT p JOIN BB_BASKETITEM it
    USING (IDPRODUCT)
        JOIN BB_BASKET bas USING (IDBASKET)
            WHERE (ORDERPLACED = 1 ) AND (it.QUANTITY < 3) GROUP BY IDPRODUCT;

SELECT IDPRODUCT, PRODUCTNAME, PRICE FROM BB_PRODUCT
    WHERE type='C' and price > (select avg(price) from bb_product where type='C');

CREATE TABLE CONTACTS (
  CONID        NUMBER(4),
  COMP_NAME  VARCHAR2(30),
  EMAIL        VARCHAR2(30),
  LAST_DATE     DATE,
  CON_COUNT       NUMBER(3),
  CONSTRAINT CONID_pk PRIMARY KEY(CONID)
  );
  
INSERT INTO CONTACTS
  VALUES(1, 'Nokia', 'nokia@nokia.com', '01-JAN-12', 1);
INSERT INTO CONTACTS
  VALUES(2, 'HP', 'hp@hp.com', sysdate, 2);
COMMIT;

UPDATE CONTACTS
  SET EMAIL = 'acc@austincc.edu'
  WHERE CONID = 1;
  
SELECT * FROM CONTACTS;