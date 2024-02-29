--- Tablespace and datafiles space 
col Datafile for a75 
   SELECT t.tablespace_name "Tablespace", 
         t.status "Status", 
         ROUND (MAX (d.bytes) / 1024 / 1024, 2) "Size MB", 
         ROUND ( 
            (MAX (d.bytes) / 1024 / 1024) 
            - (SUM (DECODE (f.bytes, NULL, 0, f.bytes)) / 1024 / 1024), 
            2) 
            "MB Used", 
         ROUND (SUM (DECODE (f.bytes, NULL, 0, f.bytes)) / 1024 / 1024, 2) 
            "MB Free", 
         d.autoextensible "Aut_ext", 
         SUBSTR (d.file_name, 1, 80) "Datafile" 
    FROM DBA_FREE_SPACE f, DBA_DATA_FILES d, DBA_TABLESPACES t 
   WHERE     t.tablespace_name = d.tablespace_name 
         AND f.tablespace_name(+) = d.tablespace_name 
         AND f.file_id(+) = d.file_id 
         AND t.tablespace_name LIKE '%&tbsp_name%' 
         AND d.file_name LIKE 'datafile_path%' 
GROUP BY t.tablespace_name, 
         d.file_name, 
         t.pct_increase, 
         t.status, 
         d.autoextensible 
ORDER BY 1, 3 DESC 
/ 