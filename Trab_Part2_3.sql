
CREATE USER estagiario IDENTIFIED BY senha;
REVOKE ALL PRIVILEGES FROM estagiario;
GRANT CONNECT TO estagiario;
GRANT RESOURCE TO estagiario;

--Aqui segue os GRANTS dados a cada procedure
GRANT EXECUTE ON inserindo TO estagiario;

commit;



CREATE OR REPLACE PROCEDURE insert_invoice 
(new_invoiceid IN NUMBER,new_customerid IN NUMBER,new_invoicedate IN DATE,new_billingaddress IN VARCHAR2,new_billingcity IN VARCHAR2,new_billingstate IN VARCHAR2 ,new_billingcountry IN VARCHAR2,new_billingpostalcode IN VARCHAR2,new_total IN NUMBER) IS
    
    total NUMBER;
    command VARCHAR2(2000);
    
BEGIN

    IF new_total > 10 THEN
    
        total := new_total - (new_total/10);  --10% de desconto
        
    END IF;
    INSERT INTO invoice (invoiceid,customerid,invoicedate,billingaddress,billingcity,billingstate,billingcountry,billingpostalcode,total)
     VALUES (new_invoiceid , new_customerid , new_invoicedate , new_billingaddress , new_billingcity,new_billingstate,new_billingcountry,new_billingpostalcode,total);
    /*
    command:= 'INSERT INTO invoice (invoiceid,customerid,invoicedate,billingaddress,billingcity,billingstate,billingcountry,billingpostalcode,total) ' ||
     'VALUES (' || new_invoiceid || ',' || new_customerid || ',' || new_invoicedate || ',' || new_billingaddress || ',' || new_billingcity || ',' || new_billingstate ||  ',' ||new_billingcountry || ',' ||new_billingpostalcode || ',' || new_total || ');';
    */
END;

DELETE FROM invoice WHERE invoiceid = 14625;

EXECUTE insert_invoice (14625,1,SYSDATE,null,null,null,null,null,100);

SELECT * FROM invoice WHERE customerid = 1;
