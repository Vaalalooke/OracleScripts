/**************** FLASH RECOVERY AREA ******************/
column name              format a50
column space_limit       format 999999999999999
column space_used        format 999999999999999
column space_reclaimable format 999999999999999
select
    name,
    space_limit / 1024 / 1024 / 1024 space_limit_gb,
    space_used / 1024 / 1024 / 1024 space_used_gb,
    space_used / space_limit * 100 perc_use,
    space_reclaimable / 1024 / 1024 / 1024 space_reclaimable_gb
from
    v$recovery_file_dest
/