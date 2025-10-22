# union all

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'SALESMAN'
and EMP.DEPTNO = '30'

union all

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'CLERK'
and EMP.DEPTNO = '30';

# union

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'SALESMAN'
and EMP.DEPTNO = '30'

union

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'CLERK'
and EMP.DEPTNO = '30';

# intersect

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'SALESMAN'
and EMP.DEPTNO = '30'

intersect

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'CLERK'
and EMP.DEPTNO = '30';

# minus

select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'SALESMAN'
and EMP.DEPTNO = '30'
and EMP.ENAME not in (
select EMP.ENAME 'EMP 이름'
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
and EMP.JOB = 'CLERK'
and EMP.DEPTNO = '30)')

# 조인 이외의 연결 방법
# 스칼라 서브쿼리 Scalar Sub-query

# 기본키(PK), 외래키(FK) 미부여 상태
SET profiling=1; 

explain
select EMPNO 사번, (select DNAME from DEPT b where b.DEPTNO = a.DEPTNO) 부서
from EMP a;

# left outer join을 이용하여 변경 (또는 인라인뷰로 변경)

explain
select a.EMPNO 사번, b.DNAME 부서
from EMP a left outer join DEPT b
on a.DEPTNO = b.DEPTNO;

show profiles;
## Scalar Sub-query가 더 실행 시간이 단축된 것을 확인 가능 (키가 없는 경우)

set profiling=0;
describe emp;

# 함수(function) 생성 : 사번을 입력 받아서, 사원명을 반환하는 함수
delimiter $$
create function fn_ename(v_empno int(4)) 
returns varchar(10) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
 begin
 declare v_ename varchar(10);
 set v_ename = (select ENAME from EMP where EMPNO = v_empno);
 return v_ename;
 end $$
 
 select JOB 역할, fn_ename(1003) 직원명 from emp
 where MGR is null;