-- Temp segment usage per session.– 
  SELECT S.sid || ‘, 
         ’ || S.serial# sid_serial, 
         S.username, 
         S.osuser, 
         P.spid, 
         S.module, 
         P.program, 
         SUM (T.blocks) * TBS.block_size / 1024 / 1024 mb_used, 
         T.tablespace, 
         COUNT (*) statements 
    FROM v$sort_usage T, 
         v$session S, 
         dba_tablespaces TBS, 
         v$process P 
   WHERE     T.session_addr = S.saddr 
         AND S.paddr = P.addr 
         AND T.tablespace = TBS.tablespace_name 
GROUP BY S.sid, 
         S.serial#, 
         S.username, 
         S.osuser, 
         P.spid, 
         S.module, 
         P.program, 
         TBS.block_size, 
         T.tablespace 
ORDER BY sid_serial 
/