CREATE OR REPLACE PROCEDURE index_dropper (the_table IN VARCHAR2) IS

    CURSOR ind_tables IS   
        SELECT INDEX_NAME 
            FROM all_ind_columns 
                WHERE INDEX_OWNER='CHINOOK' AND TABLE_NAME=the_table;
                
    BEGIN
    
        FOR ind_tables_loop IN ind_tables LOOP
            BEGIN
                DROP INDEX ind_tables_loop.index_name;
            END;
        END LOOP;
    END;
    
