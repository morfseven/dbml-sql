SET autocommit = 1; -- 각 SQL 문장 실행시 마다 즉시 영구 반영
SET autocommit = 0; -- 각 SQL 문장 실행시에 즉시 반영 안되고 COMMIT, ROLLBACK 시 반영

SELECT * FROM sql_db.PRODUCT;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT @@tx_isolation;

ROLLBACK;

SELECT * FROM sql_db.PRODUCT where prod_no='CT0001' for update;
select * from sql_db.product where prod_no='CT0001' LOCK IN SHARE MODE;
update sql_db.PRODUCT set prod_name='UDON' where PROD_NO='CT0001';

SELECT * FROM sql_db.PRODUCT where prod_no='CT0001' for update nowait;
update sql_db.PRODUCT set prod_name='NOODLE' where PROD_NO='CT0001';
