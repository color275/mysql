select TABLE_SCHEMA,TABLE_NAME,PARTITION_METHOD,PARTITION_NAME,SUBPARTITION_NAME,PARTITION_EXPRESSION,PARTITION_DESCRIPTION,
	round(data_length/(1024*1024*1024),2) "DATA(GB)",
	round(index_length/(1024*1024*1024),2) "IDX(GB)",
	TABLE_ROWS
from INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA not in('information_schema','performance_schema','mysql')
and PARTITION_NAME is not NULL
ORDER BY TABLE_SCHEMA,TABLE_NAME,PARTITION_NAME,SUBPARTITION_NAME desc;
