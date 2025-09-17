# 개발자 함수(function) 생성 : 제품 코드를 입력 받아서, 판매된 최대 가격을 반환하는 함수
use sql_db;

SELECT @@global.tx_isolation;
SELECT @@tx_isolation;

delimiter $$
create function `fn_max`(v_prod varchar(6))
returns int(6)
begin
declare max_prc int(6);
set max_prc = (select max(UNIT_PRICE) from SERVICE where PROD_NO = v_prod);
return max_prc;
end $$

set profiling = 1;

explain
select PROD_NAME, fn_max('CT0002') '최대 판매가'
from PRODUCT
where PROD_NO = 'CT0002';

# 멀티 버퍼 처리
explain
select PROD_NAME, 
  (select fn_max('CT0002') from dual)
from PRODUCT
where PROD_NO = 'CT0002';

drop index jn_SERVICE_PRODUCT_idx2 on SERVICE;
create index jn_SERVICE_PRODUCT_idx2 on SERVICE (PROD_NO asc, UNIT_PRICE desc);
analyze table SERVICE;

# SQL 조인으로만 처리
explain
select PRODUCT.PROD_NAME, max(SERVICE.UNIT_PRICE) 
from SERVICE, PRODUCT
where PRODUCT.PROD_NO = SERVICE.PROD_NO 
and SERVICE.PROD_NO = 'CT0002'
group by PRODUCT.PROD_NAME, SERVICE.UNIT_PRICE;

show profiles;

# SQL에서 루프(Loop) 사용하여 테스트 더미(Dummy) 데이터 입력
create table T1 (C1 int,
C2 int);

create index T1_idx1 on T1 (C1);
create index T1_idx2 on T1 (C2);

delimiter $$
for i in 0..30000
do
  insert into T1 (C1, C2) values (i+1, 100000+i+1);
end for;
commit;;
$$

select * from T1;

analyze table T1;

# SQL에서 루프(Loop) 사용하여 C2 값에 추가로 100000을 더하기, 끝나고 Commit (문제1)

delimiter $$
for i in 0..10000
do
  update T1 SET C2 = C2 + 100000 where C1 = C1 + i ;
end for ;
commit ;
$$

# SQL에서 루프(Loop) 사용하여 C2 값에 추가로 100000을 더하기, 매건별 Commit (문제2)

delimiter $$
for i in 0..10000
do
  update T1 SET C2 = C2 + 100000 where C1 = C1 + i ;
  commit ;
  end for ;
$$

# SQL에서 루프 사용없이 SQL에서 C2 값에 추가로 100000을 더하기 (개선)

update T1 set C2 = C2 + 100000
where C1 in (select C1 from T1 where C1 <= 30000) ;
commit;


select * from T1;

show variables like '%timeout';

set global wait_timeout=180;
set global interactive_timeout=180;
set global lock_wait_timeout=180;

