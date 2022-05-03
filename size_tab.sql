SELECT
	table_schema,table_name,
	round(data_length/(1024*1024*1024),2) "DATA(GB)",
	round(index_length/(1024*1024*1024),2) "IDX(GB)",
	round((data_length+index_length)/(1024*1024*1024),2) "Total(GB)",
	table_rows,ENGINE
FROM information_schema.TABLES
WHERE table_schema not in('information_schema','performance_schema','mysql','sys')
and table_schema not in ('sys')
ORDER BY table_schema,data_length desc;