-- Disk Groups Detail
select
    distinct GROUP_NUMBER,
    NAME,
    TOTAL_MB,
    FREE_MB,
    USABLE_FILE_MB,
    ROUND(100 *(1 -(FREE_MB / TOTAL_MB)), 2) PERC_OCC,
    ROUND(100 *(1 -(USABLE_FILE_MB / TOTAL_MB)), 2) PERC_OCC_USABLE,
    state
from
    GV$ASM_DISKGROUP
/