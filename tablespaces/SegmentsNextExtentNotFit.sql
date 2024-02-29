-- EXTENTS 
define blk_size=8192 
prompt 
prompt Segments with next extent larger than Largest Free Extent 
prompt _________________________________________________________ 
 
set feedback on 
col owner           format a10 heading 'Owner' 
col tablespace_name format a10 heading 'Tablespace' 
col segment_type    format a7 heading 'Type' 
col segment_name    format a30 heading 'Segment' 
col "NxtBlks"       format 99999999 
col max_blocks      format 99999999 heading 'MaxBlks' 
break on owner on tablespace_name on segment_type 
 
select owner, 
       tablespace_name, 
       segment_type, 
       segment_name, 
       next_extent/&blk_size "NxtBlks", 
       max_blocks 
from sys.DBA_SEGMENTS, 
     (select tablespace_name fs_ts_name, 
             max(blocks) as max_blocks 
      from sys.DBA_FREE_SPACE 
      group by tablespace_name) 
where segment_type != 'ROLLBACK' 
  and segment_type != 'CACHE' 
  and next_extent >= max_blocks * &blk_size 
  and tablespace_name = fs_ts_name 
order by owner, tablespace_name, segment_type 
/