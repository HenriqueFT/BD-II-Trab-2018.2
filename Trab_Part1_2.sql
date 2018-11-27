create or  replace PROCEDURE index_dropper (the_table IN VARCHAR2) IS
    is_first BOOLEAN := TRUE;
    result VARCHAR2(2000);
    CURSOR ind_tables IS   
        SELECT INDEX_NAME 
            FROM all_ind_columns 
                WHERE INDEX_OWNER='CHINOOK' AND TABLE_NAME=the_table;
                
    BEGIN
        FOR ind_tables_loop IN ind_tables LOOP
            IF is_first=true then
                result:= 'DROP INDEX ' || ind_tables_loop.index_name;
                is_first:=false;
            ELSE
                result:= result || ',' || ind_tables_loop.index_name;
            END IF;
        END LOOP; 
        result:= result || ';';
    END;


--execute index_dropper('ALBUM');

