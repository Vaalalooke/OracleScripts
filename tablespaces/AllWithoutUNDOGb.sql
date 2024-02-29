-- ALL WITHOUT UNDO GB 
col tablespace_name format a40
col "size GB" format 999,999.999
col "free GB" format 999,999.999
col "% Used" format 999.99
select
    tsu.tablespace_name,
    (tsu.used_gb) "size GB",
    decode((tsf.free_gb), NULL, 0, ceil(tsf.free_gb)) "free GB",
    decode(
        100 - (tsf.free_gb / tsu.used_gb * 100),
        NULL,
        100,
        100 - (tsf.free_gb / tsu.used_gb * 100)
    ) "% used"
from
    (
        select
            tablespace_name,
            sum(bytes) / 1024 / 1024 / 1024 used_gb
        from
            dba_data_files
        group by
            tablespace_name
        union
        all
        select
            tablespace_name || '  **TEMP**',
            sum(bytes) / 1024 / 1024 / 1024 used_gb
        from
            dba_temp_files
        group by
            tablespace_name
    ) tsu,
    (
        select
            tablespace_name,
            sum(bytes) / 1024 / 1024 / 1024 free_gb
        from
            dba_free_space
        group by
            tablespace_name
    ) tsf
where
    tsu.tablespace_name = tsf.tablespace_name (+)
order by
    3 desc
/