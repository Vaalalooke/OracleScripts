----- INSTANCE STATUS 
column host_name    format a30
column startup_time format a22
select
    host_name,
    instance_name,
    status,
    to_char(startup_time, 'dd-mon-rrrr hh24:mi:ss') startup_time
from
    gv$instance;

select
    name,
    open_mode
from
    v$database;

select
    INSTANCE_NAME,
    HOST_NAME,
    LOGINS
from
    v$instance;

column host_name    clear
column startup_time clear
select
    inst_id,
    name,
    PRIMARY_DB_UNIQUE_NAME,
    DB_UNIQUE_NAME,
    to_char(CREATED, 'dd-mon-rrrr hh24:mi:ss') created,
    log_mode,
    guard_status
from
    gv$database
/