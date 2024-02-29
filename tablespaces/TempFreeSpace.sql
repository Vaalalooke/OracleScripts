column tablespace_size format 999999999999999 
column ALLOCATED_SPACE format 999999999999999 
column FREE_SPACE      format 999999999999999 
select
    tablespace_name,
    tablespace_size / 1024 / 1024 / 1024 tablespace_size_gb,
    allocated_space / 1024 / 1024 / 1024 allocated_space_gb,
    free_space / 1024 / 1024 / 1024 free_space_gb
from
    DBA_TEMP_FREE_SPACE
/