-- MORE THAN x% 
col "Tablespace" for a50
col "Size MB"    for 999999999
col "%Used"      for 999
col "Add (80%)"  for 999999
select
    tsu.tablespace_name "Tablespace",
    ceil(tsu.used_mb) "Size MB",
    decode(ceil(tsf.free_mb), NULL, 0, ceil(tsf.free_mb)) "free MB",
    100 - floor(tsf.free_mb / tsu.used_mb * 100) "%Used",
    ceil((tsu.used_mb - tsf.free_mb) / (& & PERC / 100)) - tsu.used_mb "Add (&&PERC%)"
from
    (
        select
            tablespace_name,
            sum(bytes) / 1024 / 1024 used_mb
        from
            dba_data_files
        group by
            tablespace_name
    ) tsu,
    (
        select
            ts.tablespace_name,
            nvl(sum(bytes) / 1024 / 1024, 0) free_mb
        from
            dba_tablespaces ts,
            dba_free_space fs
        where
            ts.tablespace_name = fs.tablespace_name (+)
        group by
            ts.tablespace_name
    ) tsf
where
    tsu.tablespace_name = tsf.tablespace_name (+)
    and 100 - floor(tsf.free_mb / tsu.used_mb * 100) >= & & PERC
    and tsu.tablespace_name like '&TBSP'
order by
    3,
    4
/