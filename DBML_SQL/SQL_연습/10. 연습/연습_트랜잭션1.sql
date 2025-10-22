SET autocommit = 1; -- 각 SQL 문장 실행시 마다 즉시 영구 반영
SET autocommit = 0; -- 각 SQL 문장 실행시에 즉시 반영 안되고 COMMIT, ROLLBACK 시 반영

SELECT * FROM sql_db.PRODUCT where prod_no='CT0001' for update;
select * from sql_db.product where prod_no='CT0001' LOCK IN SHARE MODE;
update sql_db.PRODUCT set prod_name='NOODLE' where PROD_NO='CT0001';
update sql_db.PRODUCT set prod_name='RAMEN' where PROD_NO='CT0001';
update sql_db.PRODUCT set prod_name='NOODLE' where prod_name='RAMEN' ;

SELECT * FROM sql_db.PRODUCT;
commit;
select * from information_schema.innodb_lock_waits;

SELECT * FROM sql_db.PRODUCT where prod_no='CT0002' for update;
SELECT * FROM sql_db.PRODUCT where prod_no='CT0003' for update;

GRANT ALL PRIVILEGES ON *.* to 'manager'@'%' with grant option;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT @@global.tx_isolation;

SELECT @@tx_isolation;