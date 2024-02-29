-- ASM Storage usage per disk group, disk, data type  
select name, state, 
   round(((total_mb/decode(type,'HIGH',3,'NORMAL',2,1))/1024),2) TOTAL_GB, 
   round((((total_mb/decode(type,'HIGH',3,'NORMAL',2,1)-usable_file_mb))/1024),2) USED_GB, 
   round(((total_mb/decode(type,'HIGH',3,'NORMAL',2,1))/1024),2)-round((((total_mb/decode(type,'HIGH',3,'NORMAL',2,1)-usable_file_mb))/1024),2) FREE_GB, 
   round((1-(usable_file_mb/(total_mb/decode(type,'HIGH',3,'NORMAL',2,1))))*100,2) PCT_USED, 
   round(((usable_file_mb/(total_mb/decode(type,'HIGH',3,'NORMAL',2,1))))*100,2) PCT_FREE 
   from v$asm_diskgroup 
   order by 6 desc 
/