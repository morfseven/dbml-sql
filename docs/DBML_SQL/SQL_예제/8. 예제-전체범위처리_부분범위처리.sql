## 전체 범위 처리 vs 부분 범위 처리
# 전체 컬럼을 조회, FTS에 해당
select *
from EMP;

# 특정 컬럼과 특정 행을 조회, 데이터량 감소
select ENAME, JOB
from EMP;

# 특정 컬럼을 조회, 데이터량 감소
select ENAME, JOB
from EMP
where JOB = 'CLERK';

# 두개 이상 테이블 조인 연결하여, 특정 컬럼과 특정 행을 조회
select a.ENAME, a.JOB, b.DNAME
from EMP a, DEPT b
where a.DEPTNO = b.DEPTNO
and  a.JOB = 'CLERK';

# 두개 이상 테이블 조인 연결하여, 특정 컬럼과 특정 행을 정렬 후 조회
select a.ENAME, a.JOB, b.DNAME
from EMP a, DEPT b
where a.DEPTNO = b.DEPTNO
and  JOB = 'CLERK'
Order by b.DEPTNO desc, JOB asc;

## 전체 범위 처리와 부분 범위 처리 이해
# HIREDATE 컬럼에 인덱스 생성
drop index hiredate_idx1 on EMP;
create index hiredate_idx1 on EMP (HIREDATE DESC);
drop index hiredate_idx2 on EMP;
analyze table EMP;

## Session 재접속
SET profiling=1; 

explain
select ENAME, JOB, HIREDATE, SAL                                 
from EMP             
where ifnull(HIREDATE, '2001-01-01') > '2010-01-01' -- 인덱스 컬럼에 가공이 발생하여 전체 벙위 처리
and SAL > 15000 
order by HIREDATE desc, SAL desc;

# 인덱스 컬럼 가공을 해제하였으나, 조인 순서에 따른 인덱스가 아니어서 차이가 크지 않음
explain
select ENAME, JOB, HIREDATE, SAL                                 
from EMP              
where HIREDATE > '2010-01-01'
and SAL > 15000 
order by HIREDATE desc, SAL desc;

show profiles;

## Session 재접속
# 새로운 인덱스를 만들었더라도, 기존 버퍼 캐시에 기존 인덱스 정보가 남아 있으면 성능이 왜곡될 수 있음
# HIREDATE와 SAL을 조합한 추가 인덱스 생성

SET profiling=1; 

explain
select ENAME, JOB, HIREDATE, SAL                                 
from EMP           
where HIREDATE > '2010-01-01'
and SAL > 15000 
order by HIREDATE desc, SAL desc;

create index hiredate_idx2 on EMP (HIREDATE desc, SAL desc);
analyze table EMP;

# 조인 순서에 따른 새로운 인덱스를 사용하면, 부분 범위처리로 성능 향상
explain
select ENAME, JOB, HIREDATE, SAL                                  
from EMP force index (hiredate_idx2)
where HIREDATE > '2010-01-01'        
and SAL > 15000
order by HIREDATE desc, SAL desc;

show profiles;
set profiling=0;
