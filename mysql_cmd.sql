########################################
# MySQL 운영 주요 명령어
########################################

select start_time, query_time, lock_time, sql_text from mysql.slow_log where query_time >= 1;

select count(*) from mysql.slow_log where query_time >= 1;

select count(*) from mysql.slow_log where query_time >= 1;

desc mysql.slow_log;


select substr(sql_text,1,100),count(*)
from mysql.slow_log
group by substr(sql_text,1,100)
order by 2 desc;

select *
from mysql.slow_log
where sql_text like 'select productopt0_.PRODUCT_OPTION_VALUE_ID%'
order by query_time
limit 2;

select *
from mysql.slow_log
where sql_text like 'select count(*) as col_0_0_ from BRZC_REVIEW_FEEDBACK_XREF%'
order by query_time
limit 2;

select *
from mysql.slow_log
where sql_text like 'select orderimpl0_.ORDER_ID as ORDER1_92_,%'
order by query_time
limit 2;

select *
from mysql.slow_log
where sql_text like 'select orderimpl0_.ORDER_ID as ORDER1_92_, orderimpl0%'
order by query_time
limit 2;



select productopt0_.PRODUCT_OPTION_VALUE_ID as PRODUCT1_123_, productopt0_.ATTRIBUTE_VALUE


+----------------+---------------------+------+-----+-------------------+-----------------------------+
| Field          | Type                | Null | Key | Default           | Extra                       |
+----------------+---------------------+------+-----+-------------------+-----------------------------+
| start_time     | timestamp           | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| user_host      | mediumtext          | NO   |     | NULL              |                             |
| query_time     | time                | NO   |     | NULL              |                             |
| lock_time      | time                | NO   |     | NULL              |                             |
| rows_sent      | int(11)             | NO   |     | NULL              |                             |
| rows_examined  | int(11)             | NO   |     | NULL              |                             |
| db             | varchar(512)        | NO   |     | NULL              |                             |
| last_insert_id | int(11)             | NO   |     | NULL              |                             |
| insert_id      | int(11)             | NO   |     | NULL              |                             |
| server_id      | int(10) unsigned    | NO   |     | NULL              |                             |
| sql_text       | mediumtext          | NO   |     | NULL              |                             |
| thread_id      | bigint(21) unsigned | NO   |     | NULL              |                             |
+----------------+---------------------+------+-----+-------------------+-----------------------------+


select sum(query_time)/count(*)
from mysql.slow_log
where sql_text like 'select productopt0_.PRODUCT_OPTION_VALUE_ID%';

select sum(query_time)
from mysql.slow_log
where sql_text like 'select productopt0_.PRODUCT_OPTION_VALUE_ID%';

select a,b
from
(
select substr(sql_text,1,50) a, sum(query_time) b
from mysql.slow_log c
where user_host like '%brzc%'
group by substr(sql_text,1,50)
)
order by b desc
limit 10;

select substr(sql_text,1,100) a, sum(query_time)/count(*) b
from mysql.slow_log c
where user_host like '%brzc%'
group by substr(sql_text,1,100)
order by 2;

select *
from mysql.slow_log c
where sql_text like 'select sum(skuinvento0_.QUANTITY-skuinvento0_.QUANTITY_SAFE-skuinvento0_.QUANTITY_RESERVED) as col_0%'
and query_time > 100
limit 1;

select *
from mysql.slow_log c
where sql_text like 'select pagetagimp0_.TAG_ID as TAG1_314_, pagetagimp0_.TAG_END_DATE as TAG2_314_, pagetagimp0_.TAG_ST%'
and query_time > 100
limit 1



select count(*)
from mysql.slow_log
where sql_text like 'select pagetagimp0_.TAG_ID as TAG1_314_, pagetagimp0_.TAG_END_DATE as TAG2_314_, pagetagimp0_.TAG_ST%'

select count(*)
from mysql.slow_log
where sql_text like 'select sum(skuinvento0_.QUANTITY-skuinvento0_.QUANTITY_SAFE-skuinvento0_.QUANTITY_RESERVED) as col_0%'



select * form mysql.slow_log limit 100;

/************************************************************************
 * slow query 확인
*************************************************************************/
select query_time, count(*)
from mysql.slow_log
group by query_time;

------------------------
-- Cluster Info(DRBD).
------------------------
cat /proc/drbd
/sbin/ip addr

------------------------
-- DB 정보 확인
------------------------
-- Characterset Info
show variables like 'char%';
select * from information_schema.SCHEMATA;
select table_schema,table_name,engine,count(*)
from information_schema.tables
where table_schema not in ('information_schema','mysql','performance_schema')
group by table_schema,engine;

-- 파라메터 확인
select * from information_schema.GLOBAL_VARIABLES-- VARIABLE_NAME like '%%';

-- Memory
SHOW variables LIKE '%innodb_buffer_pool_size%';
SHOW variables LIKE 'key_buffer_size';
SHOW variables LIKE 'innodb_additional_mem_pool_size';
SHOW variables LIKE 'innodb_log_buffer_size';
SHOW variables LIKE 'datadir';
SHOW variables LIKE 'max_binlog_size';
SHOW variables LIKE 'expire_logs_days';
SHOW variables LIKE 'log_bin';
SHOW variables LIKE 'log_bin_basename';

-- Location for Data
show variables like 'data%';
show variables like 'log%';
status;
show databases;


------------------------
-- 유저 & 권한 확인
------------------------
-- 유저 확인
select user,host from mysql.user order by user,host;



-- dba 생성
create user 'gsdba'@'localhost' identified by 'Ahdxhd275!' password expire never;
create user 'gsdba'@'localhost' identified WITH mysql_native_password BY 'Ahdxhd275!';
grant all privileges on *.* to 'gsdba'@'localhost';
drop user 'gsdba'@'localhost';

CREATE USER 'username'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pa$$word';


--Your password does not satisfy the current policy require
SHOW VARIABLES LIKE 'validate_password%';

-- 유저 생성(DB세이퍼 통해 접속 시 165.243.210.12%로 생성)


GRANT SELECT,INSERT,DELETE,UPDATE ON agr_app.* TO 'GSI_APP'@'10.52.164.122' identified by 'prod_#gsiapp!23'; -- APP계정
GRANT SELECT,INSERT,DELETE,UPDATE ON agr_app.* TO 'dml_mychoi'@'165.243.210.12%' identified by 'dev_#mychoi!23'; -- 개인계정

-- 유저 패스워드 변경
update user set password=password('jsunsam#dev123') where user='i_jsunsam@165.243.210.12%';
set password for 'dml_yhkim'@'165.243.210.12%' = password('dml_yhkim#!23'); -- 권고

-- 권한 확인하기
SHOW GRANTS FOR 'User_Name'@'IP_Addr';
grant all privileges on *.* to 사용자명@호스트 identified by '비밀번호' with grant option;


-- 특정 사용자에게 특정 DB의 특정 테이블의 정해준 컬럼에만 update 권한 부여하기
grant update(Col1,Col2,Col3) on `DB_Name`.`Table_Name` to 'User_Name'@'IP_Addr' identified by '비밀번호';

-- 모든 호스트에서 접속가능하고 select 권한만 갖는 사용자를 추가할 땐
grant select on `DB_Name`.* to 'User_Name'@% identified by '비밀번호';

-- ip주소가 192.168.0.으로 시작하는 컴퓨터에서 접속가능한 사용자를 추가할 땐
grant all privileges on *.* to 'User_Name'@'192.168.0.%' identified by '비밀번호';


-- 모든 권한 삭제
REVOKE ALL PRIVILEGES ON *.* FROM 사용자명@호스트;

-- Usage 권한 부여
GRANT USAGE ON *.* TO 'User_Name'@'IP_Addr' IDENTIFIED BY 'USER_NAME';

-- Usage (삭제하면 로그인조차 안됨) 권한 삭제
REVOKE USAGE ON *.* FROM 'User_Name'@'IP_Addr';

-- 프로시저 실행 권한 주기
grant execute on `DB_Name`.`Proc_Name` to 'User_Name'@'IP_Addr';

-- 유저 삭제
drop user 'User_Name'@'IP_Addr';

flush privileges;

------------------------
-- 오브젝트
------------------------
-- 오브젝트 확인
select * from information_schema.TABLES; -- 테이블에 대한 통계정보 제공
select * from INFORMATION_SCHEMA.COLUMNS; -- 테이블에 있는 컬럼의 정보를 제공
select * from INFORMATION_SCHEMA.STATISTICS; -- 인덱스에 대한 통계정보 제공
select * from information_schema.STATISTICS; -- 테이블/인덱스 통계정보 제공
select * from information_schema.VIEWS; -- 뷰 정보 제공
select * from information_schema.KEY_COLUMN_USAGE;
select * from information_schema.ROUTINES; -- 프로시저/함수 정보 제공
select * from information_schema.TRIGGERS; -- 트리거 정보 제공
select * from information_schema.TABLE_PRIVILEGES; -- 테이블별 부여된 권한 확인
select * from information_schema.USER_PRIVILEGES; -- 유저별 부여된 권한 확인

-- 오브젝트 수정
show table status;
show procedure status;
show function status;
show create tables from 테이블명;
show create procedure 프로시저명;
show create procedure 함수명;

------------------------
-- DB 크기 확인
------------------------
-- 전체
SELECT table_schema "Database Name",
ROUND(SUM(data_length + index_length) / 1024 / 1024 / 1024,2) "Size(MB)"
FROM information_schema.TABLES
GROUP BY table_schema;

-- DB
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

-- 테이블(인덱스 정보 포함)
SELECT
	table_schema,table_name,
	round(data_length/(1024*1024*1024),2) "DATA(GB)",
	round(index_length/(1024*1024*1024),2) "IDX(GB)",
	round((data_length+index_length)/(1024*1024*1024),2) "Total(GB)",
	table_rows,ENGINE
FROM information_schema.TABLES
WHERE table_schema not in('information_schema','performance_schema','mysql')
ORDER BY data_length desc;

select table_schema,table_name,engine,count(*)
from information_schema.tables

-- 컬럼
SELECT
ORDINAL_POSITION '필드순번',
COLUMN_NAME '필드명',
DATA_TYPE '데이터 TYPE',
COLUMN_TYPE '데이터 LENGTH',
COLUMN_KEY 'KEY',
IS_NULLABLE 'NULL값여부',
EXTRA '자동여부',
COLUMN_DEFAULT '디폴트값',
COLUMN_COMMENT '필드설명'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
TABLE_SCHEMA = 'tms'
AND TABLE_NAME = 'tms_auto_push_list_01'
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- 파티션
show variables like '%partition%';
show plugins;
select TABLE_SCHEMA,TABLE_NAME,PARTITION_METHOD,PARTITION_NAME,SUBPARTITION_NAME,PARTITION_EXPRESSION,PARTITION_DESCRIPTION,
	round(data_length/(1024*1024*1024),2) "DATA(GB)",
	round(index_length/(1024*1024*1024),2) "IDX(GB)",
	TABLE_ROWS
from INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA not in('information_schema','performance_schema','mysql')
and PARTITION_NAME is not NULL
ORDER BY TABLE_SCHEMA,TABLE_NAME,PARTITION_NAME,SUBPARTITION_NAME desc;


select TABLE_SCHEMA,TABLE_NAME,PARTITION_METHOD,PARTITION_NAME,PARTITION_ORDINAL_POSITION
from INFORMATION_SCHEMA.PARTITIONS
where PARTITION_ORDINAL_POSITION in
     (
     select min(PARTITION_ORDINAL_POSITION)
     from INFORMATION_SCHEMA.PARTITIONS
     group by TABLE_SCHEMA,TABLE_NAME
     )
and PARTITION_NAME is not NULL;

-- 파티션 Min/Max 조회(연말 파티션 생성 시 확인 용도)
select C.TABLE_SCHEMA,C.MIN_TAB PART_NAME,C.PARTITION_METHOD,C.PARTITION_EXPRESSION,C.MIN_PART,C.POS_MIN,D.MAX_PART,D.POS_MAX,E.CNT_PART
from
(
select A.TABLE_SCHEMA,A.TABLE_NAME MIN_TAB,A.PARTITION_METHOD,A.PARTITION_EXPRESSION,A.PARTITION_NAME MIN_PART,B.POS_MIN
from INFORMATION_SCHEMA.PARTITIONS A,
     (
     select TABLE_SCHEMA,TABLE_NAME,min(PARTITION_ORDINAL_POSITION) POS_MIN
     from INFORMATION_SCHEMA.PARTITIONS
     where PARTITION_NAME is not NULL
     group by TABLE_SCHEMA,TABLE_NAME
     ) B
where A.TABLE_SCHEMA = B.TABLE_SCHEMA
and A.TABLE_NAME = B.TABLE_NAME
and A.PARTITION_ORDINAL_POSITION = B.POS_MIN
) C,
(
select A.TABLE_SCHEMA,A.TABLE_NAME MAX_TAB,A.PARTITION_METHOD,A.PARTITION_EXPRESSION,A.PARTITION_NAME MAX_PART ,B.POS_MAX
from INFORMATION_SCHEMA.PARTITIONS A,
     (
     select TABLE_SCHEMA,TABLE_NAME,max(PARTITION_ORDINAL_POSITION) POS_MAX
     from INFORMATION_SCHEMA.PARTITIONS
     where PARTITION_NAME is not NULL
     group by TABLE_SCHEMA,TABLE_NAME
     ) B
where A.TABLE_SCHEMA = B.TABLE_SCHEMA
and A.TABLE_NAME = B.TABLE_NAME
and A.PARTITION_ORDINAL_POSITION = B.POS_MAX
) D,
(
select TABLE_SCHEMA,TABLE_NAME,count(PARTITION_NAME) CNT_PART from INFORMATION_SCHEMA.PARTITIONS
where PARTITION_NAME is not NULL
group by TABLE_SCHEMA,TABLE_NAME
) E
where C.MIN_TAB = D.MAX_TAB
and C.MIN_TAB = E.TABLE_NAME
;
-- by 정아
 select TABLE_SCHEMA, TABLE_NAME, PARTITION_METHOD, max(min_part_name) as min_part_name, max(max_part_name) as max_part_name
from (
select a.TABLE_SCHEMA,a.TABLE_NAME,PARTITION_METHOD
      ,case when PARTITION_ORDINAL_POSITION=1 then PARTITION_NAME end as min_part_name
      ,case when PARTITION_ORDINAL_POSITION <> 1 then PARTITION_NAME end as max_part_name
from INFORMATION_SCHEMA.PARTITIONS as a,
     (select TABLE_SCHEMA,TABLE_NAME,min(PARTITION_ORDINAL_POSITION) as min1, max(PARTITION_ORDINAL_POSITION) as max1 from INFORMATION_SCHEMA.PARTITIONS where PARTITION_NAME is not NULL group by TABLE_SCHEMA,TABLE_NAME) as t
where a.PARTITION_NAME is not NULL
and (a.PARTITION_ORDINAL_POSITION = t.min1 or a.PARTITION_ORDINAL_POSITION  = t.max1)
and a.TABLE_SCHEMA=t.TABLE_SCHEMA
and a.TABLE_NAME=t.TABLE_NAME
group by a.TABLE_SCHEMA,a.TABLE_NAME,a.PARTITION_NAME
) t1
group by TABLE_SCHEMA, TABLE_NAME, PARTITION_METHOD
order by TABLE_SCHEMA, TABLE_NAME
;


------------------------
-- Lock 정보 확인
------------------------
-- 전체적인 정보 확인
show engine innodb status\G

-- INNODB_LOCK_WAITS 은 현재 wait 으로 대기하고 있는 session에 대해 나타낸다.
select * from information_schema.INNODB_LOCK_WAITS;

-- INNODB_LOCKS 은 현재 lock 정보를 보여준다
select * FROM information_schema.INNODB_LOCKS;

-- INNODB_TRX 은 해당 lock을 걸고 있는 transaction이 어떤 상태인가를 보여준다.
select * FROM information_schema.INNODB_TRX;

-- 해당 lock 정보를 한번에 볼 수 있는 쿼리는 다음과 같다.
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
     AND wl.lock_id = ilw.requested_lock_id
;


------------------------
-- 성능 분석 & SQL튜닝
------------------------
-- 실행 계획 확인
EXPLAIN EXTENDED
SELECT ~ FROM ~ WHERE ~ ;

-- SQL 수행 트레이스
/*
SHOW PROFILE [type [, type] ... ]
    [FOR QUERY n]
    [LIMIT row_count [OFFSET offset]]

type:
    ALL
  | BLOCK IO
  | CONTEXT SWITCHES
  | CPU
  | IPC
  | MEMORY
  | PAGE FAULTS
  | SOURCE
  | SWAPS
*/
SET PROFILING = 1; -- 프로파일링 활성화
SHOW PROFILES; -- 프로파일 확인
SELECT ~ FROM ~ WHERE ~ ; -- SQL 수행
SHOW PROFILES; -- 프로파일 확인
SHOW PROFILE CPU, BLOCK IO FOR QUERY 1; -- 트레이스 확인
SET PROFILING = 0; -- 프로파일 비활성화

-- 관련 성능 지표 확인
select * from information_schema.GLOBAL_STATUS;
select * from information_schema.SESSION_STATUS;
select * from information_schema.PROFILING;


------------------------
-- 모니터링
------------------------
select * from information_schema.PROCESSLIST;
show processlist; -- 세션 확인
show full processlist; -- 세션 확인(SQL Full Text 포함)
show master status\G -- 마스터 상태 확인
show slave status\G -- 슬레이브 상태 확인




##############################################
## 운영 관련 설정 (MySQL on Linux )
##############################################
------------------------------------------------------
-- 환경변수파일(MySQL)
------------------------------------------------------
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs


############################
# MySQL Env.
############################
export MYSQL_DBNAME=ECIN_M
export MYSQL_HOME=/applications/mysql


######################
## ETC Env.
######################
export PATH=$PATH:$HOME/bin:$MYSQL_HOME/bin
export PS1=`hostname`:\('$MYSQL_DBNAME'\):'$PWD']
export LANG=ko_KR.UTF-8
clear
echo "============================================================================"
echo "Connection Time: "`date`
echo "============================================================================"
echo ""
echo "============================================================================"
echo " # MySQL 데몬 확인 "
echo "============================================================================"
ps uxa | grep mysqld | grep -v grep
echo ""
echo "============================================================================"
echo " # DB세션(ESTABLISHED) 수: "`/usr/sbin/lsof -i :3306 | wc -l`
echo "============================================================================"
/usr/sbin/lsof -i :3306
echo ""
echo "============================================================================"
echo " # 디스크 여유공간"
echo "============================================================================"
df -h
echo " "


######################
## DBA Env.
######################
alias zcd='cd $MYSQL_HOME'
alias zlog='cd $MYSQL_HOME/log'
alias zdata='cd $MYSQL_HOME/data'
alias zdba='cd $MYSQL_HOME/DBA'

alias zss='$MYSQL_HOME/DBA/SCRIPTS/mysql_conn.sh'
alias talert='tail -100f $MYSQL_HOME/log/mysql.err'
alias valert='vi $MYSQL_HOME/log/mysql.err'

alias zproc='sh $MYSQL_HOME/DBA/SCRIPTS/mon_proc.sh'
alias zslave='sh $MYSQL_HOME/DBA/SCRIPTS/mon_slave.sh'
alias zdellog='sh $MYSQL_HOME/DBA/SCRIPTS/chk_binlog.sh'


------------------------------------------------------
-- 접속정보 저장
------------------------------------------------------
-- 등록
$MYSQL_HOME/bin/mysql_config_editor set --login-path=conn_root --host=localhost --user=root --password

-- 등록정보 확인
$MYSQL_HOME/bin/mysql_config_editor print --all

-- 확인
$MYSQL_HOME/bin/mysqladmin --login-path=conn_root -i3 processlist

------------------------------------------------------
-- 주요 스크립트
------------------------------------------------------

cd $MYSQL_HOME/DBA
mkdir -p BACKUP LOG MONITORING PERFORMANCE SCRIPTS WORK
scp -rp $MYSQL_HOME/DBA/SCRIPTS/* mysql@10.52.207.49:$MYSQL_HOME/DBA/SCRIPTS    */

echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # Bin-Log 히스토리 "' | $MYSQL_HOME/bin/mysql  --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'show binary logs;' | $MYSQL_HOME/bin/mysql --login-path=conn_root  -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # 현재 Bin-Log 정보 "' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'show master status;' | $MYSQL_HOME/bin/mysql --login-path=conn_root  -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # Bin-Log 보관주기 "' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "Ex> SET GLOBAL expire_logs_days = 3"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo "show global variables like 'expire_logs_days';" | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # Bin-Log 삭제명령어 "' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "Ex> PURGE BINARY LOGS TO 'mysql-bin.xxxxxx' or PURGE BINARY LOGS BEFORE '2017-07-01 00:00:00'"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # DB 접속: " `date`' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
$MYSQL_HOME/bin/mysql --login-path=conn_root


$MYSQL_HOME/bin/mysqladmin --login-path=conn_root -i3 processlist


while true
do
echo "---------------------------------------------------------------------------------------"
echo " 슬레이브 상태 확인 :  " `date`
echo "---------------------------------------------------------------------------------------"
$MYSQL_HOME/bin/mysql --login-path=conn_root -e 'SHOW SLAVE STATUS\G' | egrep "Master_Log_File|Master_Log_Pos|Relay_Master_Log_File|Exec_Master_Log_Pos|Running|Last|Seconds"
sleep 5
done


echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # DB상태"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'status;' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # DB 목록"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'show databases;' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo " # DB 접속: " `date`' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
echo 'system echo "------------------------------------------"' | $MYSQL_HOME/bin/mysql --login-path=conn_root -t
$MYSQL_HOME/bin/mysql --login-path=conn_root


******************************************************
* general_log 활성화
******************************************************

>> 활성화
set global general_log=on;

>> 비활성화
set global general_log=off;

>> enable 확인
show variables like 'general%';

>> 수집 데이터 확인
SELECT * FROM mysql.general_log\G

>> 로그 확인
pmsmaster01.log