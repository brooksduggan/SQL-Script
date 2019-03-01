--BEGIN
--  UPDATE bb_shopper
--   SET zipcode = 67488
--   WHERE idshopper = 37;
--  IF SQL%ROWCOUNT > 0 THEN
--    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' rows updated'); --shows how many SQL rows are updated
--  ELSE
--    DBMS_OUTPUT.PUT_LINE('No rows changed');
--  END IF;
--END;

--DECLARE --if there's more than one row returned, use Cursor
--  CURSOR cur_bask IS
--    SELECT idbasket, dtcreated, quantity, subtotal --if there are more than 1 fields selected, need a Record
--     FROM bb_basket
--     WHERE idshopper = 26
--       AND orderplaced = 0;
--  TYPE type_bask IS RECORD (
--    id bb_basket.idbasket%TYPE,
--    dtcrt bb_basket.dtcreated%TYPE,
--    qty bb_basket.quantity%TYPE,
--    sub bb_basket.subtotal%TYPE );
--  rec_bask type_bask;
--  lv_days_num NUMBER(5);
--BEGIN
--  OPEN cur_bask;
--  LOOP
--    FETCH cur_bask INTO rec_bask;
--     EXIT WHEN cur_bask%NOTFOUND;
--     lv_days_num := SYSDATE - rec_bask.dtcrt;
--     DBMS_OUTPUT.PUT_LINE(rec_bask.id||' * '||rec_bask.dtcrt||' * '||
--                 rec_bask.qty||' * '||rec_bask.sub||' * '||lv_days_num);
--  END LOOP;
--  CLOSE cur_bask;
--END;

--DECLARE --large benefit to reduce the code, no need for record with the FOR LOOP method
--  CURSOR cur_bask IS
--    SELECT idbasket, dtcreated, quantity, subtotal
--     FROM bb_basket
--     WHERE idshopper = 26
--       AND orderplaced = 0;
--  lv_days_num NUMBER(5);
--BEGIN
--   FOR rec_bask IN cur_bask LOOP
--     lv_days_num := SYSDATE - rec_bask.dtcreated;
--     DBMS_OUTPUT.PUT_LINE(rec_bask.idbasket||' * '||rec_bask.dtcreated||' * '||rec_bask.quantity||' * '||rec_bask.subtotal||' * '||lv_days_num);
--  END LOOP;
--END;

DECLARE
  ex_id_fk EXCEPTION;
  PRAGMA EXCEPTION_INIT(ex_id_fk, -2291);
BEGIN
  UPDATE bb_basketitem
   SET idbasket = 99
   WHERE idbasketitem = 38;
EXCEPTION
    WHEN ex_id_fk THEN
        DBMS_OUTPUT.PUT_LINE('There is no id with that number/name');
END;