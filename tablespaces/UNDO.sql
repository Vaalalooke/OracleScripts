/*************************** UNDO ********************************/
set
    serveroutput on
DECLARE t_space NUMBER;
u_space NUMBER;
e_space NUMBER;
p_free NUMBER;
a_space NUMBER;
f_space NUMBER;
pa_free NUMBER;
iname varchar(10);
tb_name varchar(15);
BEGIN
select
    INSTANCE_NAME into iname
from
    v$instance;

select
    upper(VALUE) into tb_name
from
    V$PARAMETER
where
    NAME = 'undo_tablespace';

dbms_output.put_line(
    'UNDO report for instance ' || iname || ' tablespace name ' || tb_name
);

dbms_output.put_line('---------------------------------- ');

select
    round(sum(bytes /(1024 * 1024))) into e_space
from
    dba_undo_extents
where
    STATUS = 'EXPIRED'
    and tablespace_name =(
        select
            upper(VALUE)
        from
            V$PARAMETER
        where
            NAME = 'undo_tablespace'
    );

select
    nvl(round(sum(bytes /(1024 * 1024))), 0) into u_space
from
    dba_undo_extents
where
    STATUS = 'UNEXPIRED'
    and tablespace_name =(
        select
            upper(VALUE)
        from
            V$PARAMETER
        where
            NAME = 'undo_tablespace'
    );

select
    nvl(round(sum(bytes /(1024 * 1024))), 0) into a_space
from
    dba_undo_extents
where
    STATUS = 'ACTIVE'
    and tablespace_name =(
        select
            upper(VALUE)
        from
            V$PARAMETER
        where
            NAME = 'undo_tablespace'
    );

select
    sum(bytes /(1024 * 1024)) into t_space
from
    dba_data_files
where
    tablespace_name in (
        select
            upper(VALUE)
        from
            V$PARAMETER
        where
            NAME = 'undo_tablespace'
    );

dbms_output.put_line(
    'Total Undo space allocated   : ' || t_space || ' MB.'
);
dbms_output.put_line(
    'Total used space (unexpired) : ' || u_space || ' MB.'
);
dbms_output.put_line(
    'Total active space           : ' || a_space || ' MB.'
);
dbms_output.put_line(
    'Total used space (expired)   : ' || e_space || ' MB.'
);

select
    t_space - u_space - a_space into f_space
from
    dual;

dbms_output.put_line(
    'Total free space             : ' || f_space || ' MB.'
);

select
    round((f_space * 100) / t_space) into p_free
from
    dual;

dbms_output.put_line(
    'Free_percent                 : ' || p_free || ' %'
);

select
    round((a_space * 100) / t_space) into pa_free
from
    dual;

dbms_output.put_line(
    'Active_space_percent         : ' || pa_free || ' %'
);

end;
/