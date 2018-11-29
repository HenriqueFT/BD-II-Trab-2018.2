select * from user_tab_columns;

create or replace FUNCTION LISTA_TABELAS(ow IN varchar2) return varchar2 IS
  result VARCHAR2(2000);
  vr varchar2(30);
  CURSOR c1 IS
    SELECT TABLE_NAME, OWNER FROM ALL_TABLES where owner = vr;
BEGIN
    open c1;
  vr := ow;
  FOR c1_rec IN c1 LOOP
    result := result || ', ' || c1_rec.owner || '.' || c1_rec.table_name;
  END LOOP;
  close c1;
  return result;
END;

SELECT * FROM ALL_TABLES
    where owner = 'CHINOOK';



SELECT lista_tabelas('CHINOOK') FROM dual;

SELECT * FROM ALL_TABLES
where owner = 'CHINOOK';

select 'select count(*) from ' || table_name || ';'
from all_tables
where owner = 'CHINOOK';


SELECT INDEX_NAME,TABLE_NAME,COLUMN_NAME FROM ALL_INDEXES WHERE OWNER ='CHINOOK';

SELECT * FROM all_ind_columns  WHERE INDEX_OWNER='CHINOOK';


        SELECT INDEX_NAME 
            FROM all_ind_columns 
                WHERE INDEX_OWNER='CHINOOK' AND TABLE_NAME='ARTIST';

BEGIN
    DECLARE nome VARCHAR2(20);
    nome:='ARTIST';
        
    SELECT * FROM ALL_IND_COLUMNS WHERE TABLE_NAME='artist';

END;

SELECT artist.name, album.title FROM album JOIN artist ON album.artistid=artist.artistid  

SELECT constraint_name,table_name from ALL_CONSTRAINTS where owner = 'CHINOOK' AND constraint_type = 'R';

SELECT constraint_name,table_name,column_name from ALL_CONS_COLUMNS where owner = 'CHINOOK' ;

SELECT all_cons_columns.constraint_name ,all_cons_columns.table_name,all_cons_columns.column_name 
    FROM all_cons_columns all_c_c,all_constraints all_c INNER JOIN ALL_CONSTRAINTS ON all_constraints.constraint_name = all_cons_columns.constraint_name
    WHERE ALL_CONSTRAINTS.constrait_type ='R';



BEGIN
    DECLARE
        CURSOR c_const IS
            SELECT constraint_name,table_name from ALL_CONSTRAINTS where owner = 'CHINOOK' AND constraint_type = 'R';
            
        CURSOR c_all_col IS
            SELECT constraint_name,table_name,column_name from ALL_CONS_COLUMNS where owner = 'CHINOOK';
    BEGIN 
        open c_const;
        open c_all_col;
        SELECT * FROM ALL_CONSTRAINTS JOIN c_const ON c_all_col.constraint_name = c_const.constraint_name;
        close c_const;
        close c_all_col;
    END;
END;
    
SELECT * from invoiceline;

select * from invoice;

select * from TRACK;
select * from CUSTOMER;

SELECT * FROM invoice JOIN invoiceline ON invoice.invoiceid = invoiceline.invoiceid;


SELECT * from invoice where TOTAL >= 10;

SELECT * from track 
    JOIN album ON track.albumid = album.albumid 
    JOIN artist ON artist.artistid = album.artistid 
    WHERE artist.name = 'Queen';

IN
