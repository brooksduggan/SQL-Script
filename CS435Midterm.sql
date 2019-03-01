--select IDPRODUCT, PRODUCTNAME, PRICE from bb_product where PRICE > 11;

--select IDPLEDGE, IDDONOR, PLEDGEDATE, PLEDGEAMT from dd_pledge where PLEDGEDATE <= '20-OCT-12';

--DECLARE
--    lv_rental_num NUMBER(2) := 39;
--    lv_rating VARCHAR2(6);
--BEGIN
--    IF lv_rental_num <= 4 THEN
--        lv_rating := 'Dump';
--    ELSIF lv_rental_num <= 20 AND lv_rental_num >= 5 THEN
--        lv_rating := 'Low';
--    ELSIF lv_rental_num <= 35 AND lv_rental_num >= 21 THEN
--        lv_rating := 'Mid';
--    ELSIF lv_rental_num >=36 THEN
--        lv_rating := 'High';
--    END IF;
--    DBMS_OUTPUT.PUT_LINE('The rating for this movie according to rentals is: '|| lv_rating);
--END;

--DECLARE
--    lv_rental_num NUMBER(2);
--    lv_movieid MM_RENTAL.MOVIE_ID%TYPE := 25;
--    lv_rating VARCHAR2(6);
--BEGIN
--SELECT COUNT(MOVIE_ID) INTO lv_rental_num from MM_RENTAL where MOVIE_ID = lv_movieid;
--    IF lv_rental_num <= 4 THEN
--        lv_rating := 'Dump';
--    ELSIF lv_rental_num <= 20 AND lv_rental_num >= 5 THEN
--        lv_rating := 'Low';
--    ELSIF lv_rental_num <= 35 AND lv_rental_num >= 21 THEN
--        lv_rating := 'Mid';
--    ELSIF lv_rental_num >=36 THEN
--        lv_rating := 'High';
--    END IF;
--    DBMS_OUTPUT.PUT_LINE('The rating for this movie according to rentals is: '|| lv_rating);
--END;

DECLARE
    TYPE type_basket IS RECORD (
        basket bb_basket.idBasket%TYPE,
        created bb_basket.dtcreated%TYPE,
        qty bb_basket.quantity%TYPE,
        sub bb_basket.subtotal%TYPE);
        rec_basket type_basket;
    lv_days_num NUMBER(3);
    lv_shopper_num NUMBER(3) := 27;
BEGIN
    SELECT idBasket, dtcreated, quantity, subtotal
        INTO rec_basket
            FROM bb_basket
                WHERE idShopper = lv_shopper_num
                    AND orderplaced = 0;
lv_days_num := TO_DATE('02/28/12','mm/dd/yy') - rec_basket.created;
DBMS_OUTPUT.PUT_LINE(rec_basket.basket);
DBMS_OUTPUT.PUT_LINE(rec_basket.created);
DBMS_OUTPUT.PUT_LINE(rec_basket.qty);
DBMS_OUTPUT.PUT_LINE(rec_basket.sub);
DBMS_OUTPUT.PUT_LINE(lv_days_num);
END;