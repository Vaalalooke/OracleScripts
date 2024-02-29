-- DATAFILES 
col file_name format a70
select
    file_name,
    ceil(bytes / 1024 / 1024) "size MB"
from
    dba_data_files
where
    tablespace_name like '&TSNAME'
/