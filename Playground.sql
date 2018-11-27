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


