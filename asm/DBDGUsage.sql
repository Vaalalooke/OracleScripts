-- Database Disk Group Usage 
COL gname     FORM a30
COL dbname    FORM a10
COL file_type FORM a14
SELECT
     gname,
     dbname,
     file_type,
     ROUND (SUM (space) / 1024 / 1024) mb,
     ROUND (SUM (space) / 1024 / 1024 / 1024) gb,
     COUNT (*) "#FILES"
FROM
     (
          SELECT
               gname,
               REGEXP_SUBSTR (
                    full_alias_path,
                    '[[:alnum:]_]*',
                    1,
                    4
               ) dbname,
               file_type,
               space,
               aname,
               system_created,
               alias_directory
          FROM
               (
                    SELECT
                         CONCAT (
                              '+' || gname,
                              SYS_CONNECT_BY_PATH (aname, '/')
                         ) full_alias_path,
                         system_created,
                         alias_directory,
                         file_type,
                         space,
                         LEVEL,
                         gname,
                         aname
                    FROM
                         (
                              SELECT
                                   b.name gname,
                                   a.parent_index pindex,
                                   a.name aname,
                                   a.reference_index rindex,
                                   a.system_created,
                                   a.alias_directory,
                                   c.TYPE file_type,
                                   c.space
                              FROM
                                   v$asm_alias a,
                                   v$asm_diskgroup b,
                                   v$asm_file c
                              WHERE
                                   a.group_number = b.group_number
                                   AND a.group_number = c.group_number(+)
                                   AND a.file_number = c.file_number(+)
                                   AND a.file_incarnation = c.incarnation(+)
                         ) START WITH (MOD (pindex, POWER (2, 24))) = 0
                         AND rindex IN (
                              SELECT
                                   a.reference_index
                              FROM
                                   v$asm_alias a,
                                   v$asm_diskgroup b
                              WHERE
                                   a.group_number = b.group_number
                                   AND (
                                        MOD (
                                             a.parent_index,
                                             POWER (2, 24)
                                        )
                                   ) = 0
                                   AND a.name LIKE '&&db_name'
                         ) CONNECT BY PRIOR rindex = pindex
               )
          WHERE
               NOT file_type IS NULL
               AND system_created = 'Y'
     )
WHERE
     dbname LIKE '&db_name'
GROUP BY
     gname,
     dbname,
     file_type
ORDER BY
     gname,
     dbname,
     file_type
/