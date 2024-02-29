-- TEMP DETAIL 
select
    tablespace_name,
    round(
        (
            total_blocks *(
                select
                    value / 1024
                from
                    v$parameter
                where
                    name like 'db_block_size'
            )
        ) / 1024 / 1024,
        3
    ) as "Total(GB)",
    round(
        (used_blocks) *(
            select
                value / 1024
            from
                v$parameter
            where
                name like 'db_block_size'
        ) / 1024
    ) as "Used(MB)",
    round(
        (
            (
                total_blocks *(
                    select
                        value / 1024
                    from
                        v$parameter
                    where
                        name like 'db_block_size'
                )
            ) / 1024
        ) - (used_blocks) *(
            select
                value / 1024
            from
                v$parameter
            where
                name like 'db_block_size'
        ) / 1024
    ) as "Free(MB)",
    max_used_size
from
    v$sort_segment
/