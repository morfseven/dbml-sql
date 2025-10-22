## 데이터 조회 및 조인 SQL
# 데이터 조회, 영업팀 구성원의 이름, 역할, 연봉 조회

select * from DEPT; -- Full Table Scan
SELECT ename 이름, job 역할, sal*12 연봉 FROM emp
WHERE deptno = 30;

# 이름이 M으로 시작하는 구성원의 이름, 역할, 연봉 조회
SELECT ename 이름, job 역할, sal*12 연봉 FROM emp
WHERE ename like 'M%';

# 데이터 조인, 부서코드 (DEPT_NO) = 연결고리
SELECT emp.ename 'EMP 직원명', emp.deptno 'EMP 부서번호', dept.deptno 'DEPT 부서번호', dept.dname 'DEPT 부서명'
FROM emp, dept
WHERE emp.deptno = dept.deptno;

# 조인 조건 이외의 조인 삽입
SELECT emp.ename 'EMP 직원명', emp.deptno 'EMP 부서번호', dept.dname 'DEPT 부서명'
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.ename = 'SCOTT';

#Outer 조인 활용
SELECT emp.ename 'EMP 직원명',
emp.job 'EMP 역할',
dept.dname 'DEPT 부서명'
FROM emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno;

# Self 조인
SELECT concat(worker.ename,' works for ', manager.ename) '직원, 관리자'
FROM emp worker, emp manager
WHERE worker.mgr = manager.empno;

# 조인 View
CREATE OR REPLACE VIEW empjoindept
AS SELECT emp.ename 'EMP 직원명',
emp.deptno 'EMP 부서번호',
dept.dname 'DEPT 부서명'
FROM emp, dept
 WHERE emp.deptno = dept.deptno;
 
select * from empjoindept;

# 서브쿼리(SUB-QUERY)의 사용
SELECT ename 이름, job 역할
FROM emp
WHERE job =
(SELECT job
FROM emp
WHERE ename = 'JONES');

# 서브 쿼리(Sub-Query)내에서 Group함수 사용
SELECT ename 이름, job 역할, sal 급여
FROM emp
WHERE sal < ( SELECT AVG(sal)
FROM emp);

# 서브 쿼리(Sub-Query)의 결과가 두개 이상일 때 In을 사용
SELECT empno 사번, ename 이름, sal 급여, deptno 부서번호
FROM emp
WHERE deptno IN
(SELECT deptno
 FROM dept
 WHERE loc ='CHICAGO' OR loc = 'DALLAS'
 );
 
 # 두개 이상의 서브 쿼리(Sub-Query)를 사용
SELECT empno 사번, ename 이름, hiredate 입사일
FROM emp
WHERE sal < (SELECT AVG(sal)
FROM emp )
AND deptno IN (SELECT deptno
FROM emp
WHERE ename = 'ALLEN');
