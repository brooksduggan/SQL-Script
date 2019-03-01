--DECLARE
--   lv_test_date    DATE := '10-DEC-2012';
--   lv_test_num     CONSTANT NUMBER(3) := 999;
--   lv_test_txt     VARCHAR2(10);
--BEGIN
--    IF lv_test_num > 200 THEN
--        lv_test_txt := 'high';
--    ELSIF lv_test_num > 100 THEN
--        lv_test_txt := 'mid';
--    ELSIF lv_test_num <= 100 THEN
--        lv_test_txt := 'low';
--    END IF;
--    DBMS_OUTPUT.PUT_LINE(lv_test_txt);
--END;

--DECLARE
--   lv_test_date    DATE := '10-DEC-2012';
--   lv_test_num     CONSTANT NUMBER(3) := 999;
--   lv_test_txt     VARCHAR2(10);
--BEGIN
--    CASE
--        WHEN lv_test_num > 200 THEN
--            lv_test_txt := 'high';
--        WHEN lv_test_num > 100 THEN
--            lv_test_txt := 'mid';
--        WHEN lv_test_num <= 100 THEN
--            lv_test_txt := 'low';
--    END CASE;
--    DBMS_OUTPUT.PUT_LINE(lv_test_txt);
--END;

--DECLARE
--   lv_test_date    DATE := '10-DEC-2012';
--   lv_test_bool    BOOLEAN := TRUE;
--   lv_test_owe     CONSTANT NUMBER(3) := 8;
--   lv_test_pay     NUMBER(3) := 8;
--   lv_test_txt     VARCHAR2(10);
--BEGIN
--    IF lv_test_owe - lv_test_pay > 0 THEN
--        lv_test_bool := TRUE;
--    ELSIF lv_test_owe - lv_test_pay <= 0 THEN
--        lv_test_bool := FALSE;
--    END IF;
--    DBMS_OUTPUT.PUT_LINE(sys.diutil.bool_to_int(lv_test_bool));
--END;

--DECLARE
--   lv_test_price     CONSTANT NUMBER(3) := 9;
--   lv_test_amt       NUMBER(3) := 49;
--   lv_test_bought    NUMBER(1) := 0;
--BEGIN
--    LOOP
--            lv_test_bought := lv_test_bought + 1;
--            lv_test_amt := lv_test_amt - lv_test_price;
--        EXIT WHEN lv_test_amt < lv_test_price;
--    END LOOP;
--    DBMS_OUTPUT.PUT_LINE('The amount bought is ' || lv_test_bought ||', and the amount spent is $'
--        || lv_test_price*lv_test_bought ||'.');
--END;

--DECLARE
--    payment_due     DATE := '01-JAN-1996';
--    monthly_pay     NUMBER(3) := 50;
--    total_pay       NUMBER(2) := 0;
--    owed_pledge     NUMBER(4) := 300;
--BEGIN
--    FOR total_pay IN REVERSE 0 .. owed_pledge/monthly_pay LOOP
--         DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--              || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Donation Balance: $'
--                || owed_pledge ||'|');
--         owed_pledge := owed_pledge - monthly_pay;
--         payment_due := payment_due + 31;
--    END LOOP;
--END;

--DECLARE
--    payment_due     DATE := '01-JAN-1996';
--    monthly_pay     NUMBER(3) := 50;
--    total_pay       NUMBER(2) := 0;
--    owed_pledge     NUMBER(4) := 300;
--BEGIN
--    LOOP
--         payment_due := payment_due + 31;
--         total_pay := total_pay + 1;
--         EXIT WHEN owed_pledge = 0;
--        DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--              || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Donation Balance: $'
--                || owed_pledge ||'|');
--         owed_pledge := owed_pledge - monthly_pay;
--    END LOOP;
--END;
--
--DECLARE
--    payment_due     DATE := '01-JAN-1996';
--    monthly_pay     NUMBER(3) := 50;
--    total_pay       NUMBER(2) := 0;
--    owed_pledge     NUMBER(4) := 300;
--BEGIN
--    WHILE owed_pledge > 0
--    LOOP
--         payment_due := payment_due + 31;
--         total_pay := total_pay + 1;
--        DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--              || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Pay to Date: $'
--                || total_pay*monthly_pay ||'|');
--         owed_pledge := owed_pledge - monthly_pay;
--    END LOOP;
--END;

--DECLARE
--    payment_due     DATE := '01-JAN-1996';
--    monthly_pay     NUMBER(3) := 50;
--    total_pay       NUMBER(2) := 0;
--    owed_pledge     NUMBER(4) := 300;
--    pay_plan       NUMBER(2) := 1;
--BEGIN
--    CASE
--    WHEN pay_plan = 0 THEN
--        monthly_pay := owed_pledge*1.25;
--        DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--                  || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Pay to Date: $'
--                    || total_pay*monthly_pay ||'|');
--             owed_pledge := owed_pledge - monthly_pay;
--    WHEN pay_plan = 1 THEN
--        WHILE owed_pledge > 0
--        LOOP
--             payment_due := payment_due + 31;
--             total_pay := total_pay + 1;
--            DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--                  || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Pay to Date: $'
--                    || total_pay*monthly_pay*1.5 ||'|');
--             owed_pledge := owed_pledge - monthly_pay;
--        END LOOP;
--    WHEN pay_plan = 2 THEN
--        monthly_pay := owed_pledge/24;
--        WHILE owed_pledge > 0
--            LOOP
--                 payment_due := payment_due + 31;
--                 total_pay := total_pay + 1;
--                DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--                      || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Pay to Date: $'
--                        || total_pay*monthly_pay*2 ||'|');
--                 owed_pledge := owed_pledge - monthly_pay;
--            END LOOP;    
--    END CASE;        
--END;

--DECLARE
--    payment_due     DATE := '01-JAN-1996';
--    monthly_pay     NUMBER(3) := 50;
--    total_pay       NUMBER(2) := 0;
--    owed_pledge     NUMBER(4) := 300;
--BEGIN
--    WHILE owed_pledge > 0
--    LOOP
--         payment_due := payment_due + 31;
--         total_pay := total_pay + 1;
--        DBMS_OUTPUT.PUT_LINE('Payment number: ' || total_pay ||' | Due Date: '
--              || payment_due ||' | Payment Amount: $' || monthly_pay || ' | Pay to Date: $'
--                || total_pay*monthly_pay ||'|');
--         owed_pledge := owed_pledge - monthly_pay;
--    END LOOP;
--END;

DECLARE
    donor_type      VARCHAR2(2) := 'I';
    pledge_amt      NUMBER(5) := 500;
    match_perc     NUMBER(5, 3) := 1.05;
BEGIN
    IF donor_type = 'I' THEN
        IF pledge_amt >= 100 AND pledge_amt <= 249 THEN
            match_perc := 1.5;
            pledge_amt := pledge_amt*match_perc;
        END IF;
        IF pledge_amt >= 250 AND pledge_amt <= 499 THEN
            match_perc := 1.3;
            pledge_amt := pledge_amt*match_perc;
        END IF;
        IF pledge_amt >= 500 THEN
            match_perc := 1.2;
            pledge_amt := pledge_amt*match_perc;
        END IF;
    END IF;    
    IF donor_type IN ('B') THEN
        IF pledge_amt >= 100 AND pledge_amt <= 499 THEN
            match_perc := 1.2;
            pledge_amt := pledge_amt*match_perc;
        END IF;
        IF pledge_amt >= 500 AND pledge_amt <= 999 THEN
            match_perc := 1.1;
            pledge_amt := pledge_amt*match_perc;
        END IF;
        IF pledge_amt >= 1000 THEN
            match_perc := 1.05;
            pledge_amt := pledge_amt*match_perc;
        END IF;
    END IF;
    IF donor_type IN ('G') THEN
        IF pledge_amt >= 100 THEN
            match_perc := 1.2;
            pledge_amt := pledge_amt*match_perc;
        END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE('The total donation is $' || pledge_amt);
END;