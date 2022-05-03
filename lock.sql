SELECT straight_join
 w.trx_mysql_thread_id waiting_thread,
     w.trx_id waiting_trx_id,
     w.trx_query waiting_query,
     b.trx_mysql_thread_id blocking_thread,
     b.trx_id blocking_trx_id,
     b.trx_query blocking_query,
     bl.lock_id blocking_lock_id,
     bl.lock_mode blocking_lock_mode,
     bl.lock_type blocking_lock_type,
     bl.lock_table blocking_lock_table,
     bl.lock_index blocking_lock_index,
     wl.lock_id waiting_lock_id,
     wl.lock_mode waiting_lock_mode,
     wl.lock_type waiting_lock_type,
     wl.lock_table waiting_lock_table,
     wl.lock_index waiting_lock_index
 FROM information_schema.INNODB_LOCK_WAITS ilw ,
     information_schema.INNODB_TRX b ,
     information_schema.INNODB_TRX w ,
     information_schema.INNODB_LOCKS bl ,
     information_schema.INNODB_LOCKS wl
 WHERE b.trx_id = ilw.blocking_trx_id
     AND w.trx_id = ilw.requesting_trx_id
     AND bl.lock_id = ilw.blocking_lock_id
     AND wl.lock_id = ilw.requested_lock_id\G