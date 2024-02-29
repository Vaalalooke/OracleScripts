-- TBSP DATAFILES by File Name 
column maxbytes   format 999999999999999
column user_bytes format 999999999999999
column file_name  format a100
select
    file_name,
    bytes / 1024 / 1024 MB,
    user_bytes / 1024 / 1024 FREE_MB,
    maxbytes / 1024 / 1024 MAXMB,
    autoextensible,
    increment_by
from
    dba_data_files
where
    file_name like '%&file_name%'
/