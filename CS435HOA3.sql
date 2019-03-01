--3-1
--DECLARE
--    lv_ship_date bb_basketstatus.dtstage%TYPE;
--    lv_shipper_txt bb_basketstatus.shipper%TYPE;
--    lv_ship_num bb_basketstatus.shippingnum%TYPE;
--    lv_bask_num bb_basketstatus.idbasket%TYPE := 7;
--BEGIN
--    SELECT dtstage, shipper, shippingnum
--        INTO lv_ship_date, lv_shipper_txt, lv_ship_num
--        FROM bb_basketstatus
--        WHERE idbasket = lv_bask_num
--         AND idstage = 5;
--    DBMS_OUTPUT.PUT_LINE('Date Shipped: '||lv_ship_date);
--    DBMS_OUTPUT.PUT_LINE('Shipper: '||lv_shipper_txt);
--    DBMS_OUTPUT.PUT_LINE('Shipping #: '||lv_ship_num);
--END;
--3.2
--DECLARE
--    rec_ship bb_basketstatus%ROWTYPE;
--    lv_bask_num bb_basketstatus.idbasket%TYPE := 3;
--BEGIN
--    SELECT * INTO rec_ship FROM bb_basketstatus WHERE idbasket = lv_bask_num
--        AND idstage = 5;
--    DBMS_OUTPUT.PUT_LINE('Date Shipped: '||rec_ship.dtstage);
--    DBMS_OUTPUT.PUT_LINE('Shipper: '||rec_ship.shipper);
--    DBMS_OUTPUT.PUT_LINE('Shipping #: '||rec_ship.shippingnum);
--    DBMS_OUTPUT.PUT_LINE('Notes: '||rec_ship.notes);
--END;
--3.3
--DECLARE
--    lv_shopperid BB_BASKET.IDSHOPPER%TYPE := 21;
--    lv_total BB_BASKET.TOTAL%TYPE;
--    lv_cust_rate VARCHAR2(5);
--BEGIN
--    SELECT SUM(total) INTO lv_total FROM BB_BASKET WHERE idshopper = lv_shopperid AND orderplaced = 1
--        GROUP BY idshopper;
--    IF lv_total > 200 THEN
--        lv_cust_rate := 'HIGH';
--    ELSIF lv_total <= 200 AND lv_total > 100 THEN
--        lv_cust_rate := 'MED';
--    ELSIF lv_total <= 100 THEN
--        lv_cust_rate := 'LOW';
--    END IF;
--    DBMS_OUTPUT.PUT_LINE('Shopper ID: '||lv_shopperid);
--    DBMS_OUTPUT.PUT_LINE('Total Spent: '||lv_total);
--    DBMS_OUTPUT.PUT_LINE('Customer Rating: '||lv_cust_rate);
--END;
-- 3.5
--DECLARE
--    lv_productid BB_PRODUCT.IDPRODUCT%TYPE := 4;
--    lv_price BB_PRODUCT.PRICE%TYPE;
--    lv_spend BB_PRODUCT.PRICE%TYPE := 100;
--    lv_purch_num NUMBER(3,2) :=0;
--BEGIN
--    SELECT price INTO lv_price FROM BB_PRODUCT WHERE idproduct = lv_productid;
--    
--    WHILE lv_spend >= lv_price
--    LOOP
--        lv_spend := lv_spend - lv_price;
--        lv_purch_num := lv_purch_num + 1;
--    END LOOP;
--    
--    DBMS_OUTPUT.PUT_LINE('Product ID: '||lv_productid);
--    DBMS_OUTPUT.PUT_LINE('Left Over Spending: $'||lv_spend);
--    DBMS_OUTPUT.PUT_LINE('Times Purchased: '||lv_purch_num);
--END;
--3.6
--DECLARE
--    lv_quantity BB_BASKET.QUANTITY%TYPE;
--    lv_shipcost BB_BASKET.TOTAL%TYPE;
--    lv_basketid BB_BASKET.IDBASKET%TYPE := 12;
--BEGIN
--    SELECT quantity INTO lv_quantity FROM BB_BASKET WHERE idbasket = lv_basketid;
--    
--    IF lv_quantity > 10 THEN
--        lv_shipcost := 12;
--    ELSIF lv_quantity <= 10 AND lv_quantity >= 7 THEN
--        lv_shipcost := 10;
--    ELSIF lv_quantity <= 6 AND lv_quantity >= 4 THEN
--        lv_shipcost := 7.5;
--    ELSIF lv_quantity <= 3 AND lv_quantity >= 0 THEN
--        lv_shipcost := 5;
--    END IF;
--    DBMS_OUTPUT.PUT_LINE('Basket ID: '||lv_basketid);
--    DBMS_OUTPUT.PUT_LINE('Item Quantity: '||lv_quantity);
--    DBMS_OUTPUT.PUT_LINE('Shipping Cost: $'||lv_shipcost);
--END;
--3.7
DECLARE
    lv_id BB_BASKET.IDBASKET%TYPE := 12;
    lv_subtotal BB_BASKET.SUBTOTAL%TYPE;
    lv_shipping BB_BASKET.SHIPPING%TYPE;
    lv_tax BB_BASKET.TAX%TYPE;
    lv_total BB_BASKET.TOTAL%TYPE;
BEGIN
    SELECT IDBASKET, SUBTOTAL, SHIPPING, TAX, TOTAL
        INTO lv_id, lv_subtotal, lv_shipping, lv_tax, lv_total
            FROM BB_BASKET WHERE idbasket = lv_id;
    DBMS_OUTPUT.PUT_LINE('Basket ID: '||lv_id);
    DBMS_OUTPUT.PUT_LINE('Subtotal: $'||lv_subtotal);
    DBMS_OUTPUT.PUT_LINE('Shipping Cost: $'||lv_shipping);
    DBMS_OUTPUT.PUT_LINE('Tax: $'||lv_tax);
    DBMS_OUTPUT.PUT_LINE('Total: $'||lv_total);
END;
--3.8
--DECLARE
--    lv_id BB_BASKET.IDBASKET%TYPE := 12;
--    TYPE type_card IS RECORD (
--    sub BB_BASKET.SUBTOTAL%TYPE,
--    ship BB_BASKET.SHIPPING%TYPE,
--    tax BB_BASKET.TAX%TYPE,
--    total BB_BASKET.TOTAL%TYPE);
--  bask_rec type_card;
--BEGIN
--    SELECT SUBTOTAL, SHIPPING, TAX, TOTAL
--        INTO bask_rec
--            FROM BB_BASKET WHERE idbasket = lv_id;
--    DBMS_OUTPUT.PUT_LINE('Basket ID: '||lv_id);
--    DBMS_OUTPUT.PUT_LINE('Subtotal: $'||bask_rec.sub);
--    DBMS_OUTPUT.PUT_LINE('Shipping Cost: $'||bask_rec.ship);
--    DBMS_OUTPUT.PUT_LINE('Tax: $'||bask_rec.tax);
--    DBMS_OUTPUT.PUT_LINE('Total: $'||bask_rec.total);
--END;