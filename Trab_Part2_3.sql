

CREATE OR REPLACE PROCEDURE inserindo (new_customerID IN NUMBER,new_invoicedate IN DATE)

        total number(10,2) := :new.TOTAL;
BEGIN

    IF total > 10 THEN
    
        :new.TOTAL := total - (total/10);  --10% de desconto
        
    END IF;
    
END;
