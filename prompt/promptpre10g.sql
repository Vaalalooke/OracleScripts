-- Pre 10g
undefine usr db 
col usr new_value usr 
col db  new_value db 
set termout off 
select lower(user) usr, 
       global_name db 
  from   global_name 
/ 
set termout on 
set sqlprompt '&&usr.@&&db.> ' 
