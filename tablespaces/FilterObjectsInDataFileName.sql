-- Objects in a data file 
select
  a.segment_name,
  a.file_id,
  b.file_name Datafile_name
from
  dba_extents a,
  dba_data_files b
where
  a.file_id = b.file_id
  and b.file_name = '%&data_file_name%'
/