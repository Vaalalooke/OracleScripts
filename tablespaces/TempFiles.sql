-- TEMP FILES 
column file_name format a80
select
    tablespace_name,
    file_name,
    bytes / 1024 / 1024 as MB,
    status
from
    dba_temp_files
/