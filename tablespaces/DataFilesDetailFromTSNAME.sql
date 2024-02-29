-- TBSPDATAFILES 
column file_name format a80
select
    file_name,
    bytes / 1024 / 1024 MB,
    autoextensible,
    increment_by
from
    dba_data_files
where
    tablespace_name like '&tsname'
/