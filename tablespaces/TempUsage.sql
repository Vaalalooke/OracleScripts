-- Temp usage 
column osuser format a12 
column sid_serial format a12 
column tablespace format a12 
column mb_used format 999999 
column inst_id format 99 
column program format a48 
column username format a15 
column spid format 999999 
column module format a35 
SELECT
    s.inst_id,
    S.sid || ',' || S.serial # sid_serial, S.username, S.osuser, P.spid, S.module, 
    S.program,
    SUM (T.blocks) * TBS.block_size / 1024 / 1024 mb_used,
    T.tablespace,
    COUNT(*) sort_ops
FROM
    gv$sort_usage T,
    gv$session S,
    dba_tablespaces TBS,
    gv$process P
WHERE
    T.session_addr = S.saddr
    AND S.paddr = P.addr
    AND T.tablespace = TBS.tablespace_name
GROUP BY
    s.inst_id,
    S.sid,
    S.serial #, S.username, S.osuser, P.spid, S.module, 
    S.program,
    TBS.block_size,
    T.tablespace
ORDER BY
    MB_USED desc
/