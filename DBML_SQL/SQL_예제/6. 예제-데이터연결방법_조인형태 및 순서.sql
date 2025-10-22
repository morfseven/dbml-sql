## explain으로 SQL 실행계획을 확인할 수 있으며,
## profiling으로 SQL 실행결과를 점검할 수 있음 (profiling은 session 단위로 동작)

# show profile for query ID;
# show profile all for query ID;

# DBMS 세션 재접속 (RECONNECT)하면 리셋됨
# SQL은 관련된 단위 (세션 및 트랜잭션)으로 분리하여 실행할 것을 권고
-- 동일 테이블 대상으로 이미 실행된 SQL이 있다면 DBMS Optimizer가 이를 다시 참조하기 때문애
-- 새로운 사용자 세션에서도 이 SQL들을 실행했던 순서대로 동일하게 진행하지 않는다면 결과 예측 불가

## 12차시 데이터 연결 SQL, 데이터 연결 관점, 조인 유형 및 순서 SQL

SET profiling=1; 

# 조인 형태 및 순서에 따른 SQL 실행
explain
select EMP.ENAME 'EMP 직원명', DEPT.DNAME 'DEPT 부서명'
from EMP, DEPT 
where EMP.DEPTNO = DEPT.DEPTNO
and DEPT.DEPTNO ='20'
and EMP.ENAME = 'SCOTT';

# 조인 순서 변경 SQL
explain
select straight_join EMP.ENAME 'EMP 직원명',  DEPT.DNAME 'DEPT 부서명'
from EMP, DEPT 
where EMP.DEPTNO = DEPT.DEPTNO
and DEPT.DEPTNO ='20'
and EMP.ENAME = 'SCOTT';

# 조인 순서 변경으로 실행 시간이 단축된 것을 확인 가능 (SQL 튜닝)
show profiles;

# 동일한 SQL인데, 기본키(PK) 및 외래키(FK)를 제거한 후 조회한 결과
explain
select EMP.ENAME 'EMP 직원명',  DEPT.DNAME 'DEPT 부서명'
from EMP, DEPT 
where EMP.DEPTNO = DEPT.DEPTNO
and DEPT.DEPTNO ='20'
and EMP.ENAME = 'SCOTT';

# 키 제거한 상태에서, 조인 순서 변경 SQL
explain
select straight_join EMP.ENAME 'EMP 직원명',  DEPT.DNAME 'DEPT 부서명'
from EMP, DEPT 
where EMP.DEPTNO = DEPT.DEPTNO
and DEPT.DEPTNO ='20'
and EMP.ENAME = 'SCOTT';

