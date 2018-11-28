SELECT a.table_name, a.column_name, a.constraint_name
          FROM all_cons_columns a
          JOIN all_constraints c ON a.constraint_name = c.constraint_name AND a.owner = c.owner
         WHERE c.constraint_type = 'R'
           AND a.table_name = c.table_name
           AND a.owner = 'CHINOOK'
 
