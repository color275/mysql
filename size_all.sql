SELECT
	count(*) NUM_OF_TABLE,
	table_schema,concat(round(sum(table_rows)/1000000,2),'M') rows,
	concat(round(sum(data_length)/(1024*1024*1024),2),'G') DATA,
	concat(round(sum(index_length)/(1024*1024*1024),2),'G') idx,
	concat(round(sum(data_length+index_length)/(1024*1024*1024),2),'G') total_size,
	round(sum(index_length)/sum(data_length),2) idxfrac
FROM information_schema.TABLES
GROUP BY table_schema
ORDER BY sum(data_length+index_length) DESC LIMIT 10;