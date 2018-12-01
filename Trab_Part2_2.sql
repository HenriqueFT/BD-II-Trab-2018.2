CREATE OR REPLACE TRIGGER desconto BEFORE INSERT ON invoice FOR EACH ROW

    DECLARE
        total number(10,2) := :NEW.TOTAL;   

BEGIN

    IF total > 10 THEN
    
        :NEW.TOTAL := total - (total/10);  --10% de desconto
        
    END IF;
    
END;

BEGIN
    INSERT INTO invoice (invoiceid,customerid,invoicedate,billingaddress,billingcity,billingstate,billingcountry,billingpostalcode,total)
    VALUES (14625,1,SYSDATE,null,null,null,null,null,50);
END;

SELECT * from INVOICE WHERE customerid = 1;

