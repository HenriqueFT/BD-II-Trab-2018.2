select * from invoiceline;

select * from invoice where invoiceid = 180;

delete from invoiceline where invoiceid = 180;

delete from invoice where invoiceid = 180;

rollback;

create or replace procedure deleteinvoice(Id int) is
begin
  delete from invoiceline where invoiceid = Id;
  delete from invoice where invoiceid = Id;
  commit;
end;

execute deleteinvoice(180);

rollback;

create or replace function invoicelinecount(Id int) return int is
  vCount int;
begin
  select count(*) into vCount from invoiceline where invoiceid = Id;
  return vCount;
end;

select invoiceid, count(*) from invoiceline group by invoiceid;

select invoicelinecount(227) from dual;

select * from invoice
where invoicelinecount(invoiceid) > 10;

begin
  delete from invoiceline where invoiceid = 180;
  delete from invoice where invoiceid = 180;
end;


create or replace FUNCTION LISTA_TABELAS(ow IN varchar2) return varchar2 IS
  result VARCHAR2(2000);
  vr varchar2(30);
  CURSOR c1 IS
    SELECT TABLE_NAME, OWNER FROM ALL_TABLES where owner = vr;
BEGIN
  vr := ow;
  FOR c1_rec IN c1 LOOP
    result := result || ', ' || c1_rec.owner || '.' || c1_rec.table_name;
  END LOOP;
  return result;
END;

 

    SELECT * FROM ALL_TABLES
    where owner = 'CHINOOK';



select 'select count(*) from ' || table_name || ';'
from all_tables
where owner = 'CHINOOK';

select count(*) from ALBUM;
select count(*) from ARTIST;
select count(*) from CUSTOMER;
select count(*) from EMPLOYEE;
select count(*) from GENRE;
select count(*) from INVOICE;
select count(*) from INVOICELINE;
select count(*) from MEDIATYPE;
select count(*) from PLAYLIST;
select count(*) from PLAYLISTTRACK;
select count(*) from TRACK;


select * from all_tab_columns;