## 실습을 위한 기본 스키마 생성
use sql_db;

CREATE TABLE DEPT(
	DEPTNO 		INT(2) primary key,
	DNAME 		VARCHAR(14),
	LOC 		VARCHAR(13) 
	);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
	EMPNO 		INT(4),
	ENAME 		VARCHAR(10),
    KNAME       VARCHAR(20),
	JOB 		VARCHAR(9),
	MGR 		INT(4),
	HIREDATE 	DATE,
	SAL 		INT(7),
	COMM 		INT(7),
	DEPTNO 		INT(2),
    PRIMARY KEY(EMPNO, ENAME),
    FOREIGN KEY(deptno) references dept(deptno)
);
    
INSERT INTO EMP VALUES (5779, 'SMITH', '스미스', 'AUDITOR', 1003,STR_TO_DATE('2021-12-24', '%Y-%m-%d'), 13000, NULL, NULL);
INSERT INTO EMP VALUES (3378, 'ALLEN', '알랜', 'CLERK', 3209,STR_TO_DATE('2008-02-20', '%Y-%m-%d'), 16000, 3000, 30);
INSERT INTO EMP VALUES (3379, 'ALLEN', '알랜', 'SALESMAN', 3209,STR_TO_DATE('2010-02-20', '%Y-%m-%d'), 19000, 3000, 30);
INSERT INTO EMP VALUES (3747, 'WARD', '워드', 'SALESMAN', 3209,STR_TO_DATE('2012-02-22', '%Y-%m-%d'), 12500, 5000, 30);
INSERT INTO EMP VALUES (2101, 'JONES', '존스', 'MANAGER', 1003,STR_TO_DATE('2002-04-02', '%Y-%m-%d'), 29750, NULL, 20);
INSERT INTO EMP VALUES (3207, 'MARTIN', '마틴', 'SALESMAN', 3209,STR_TO_DATE('2008-09-28', '%Y-%m-%d'), 12500, 14000, 30);
INSERT INTO EMP VALUES (3209, 'BLAKE', '블레이크', 'MANAGER', 1003,STR_TO_DATE('2008-05-01', '%Y-%m-%d'), 28500, NULL, 30);
INSERT INTO EMP VALUES (2103, 'CLARK', '클라크', 'MANAGER', 1003,STR_TO_DATE('2007-06-09', '%Y-%m-%d'), 24500, NULL, 10);
INSERT INTO EMP VALUES (3001, 'SCOTT', '스콧', 'ANALYST', 2101,STR_TO_DATE('2001-12-09', '%Y-%m-%d'), 30000, NULL, 20);
INSERT INTO EMP VALUES (1003, 'KING', '킹', 'PRESIDENT', NULL,STR_TO_DATE('2000-11-17', '%Y-%m-%d'), 50000, NULL, NULL);
INSERT INTO EMP VALUES (5677, 'TURNER', '터너', 'SALESMAN', 3209,STR_TO_DATE('2021-09-08', '%Y-%m-%d'), 15000, 1000, 30);
INSERT INTO EMP VALUES (7776, 'ADAMS', '아담스', 'CLERK', 2101,STR_TO_DATE('2023-01-12', '%Y-%m-%d'), 11000, NULL, 20);
INSERT INTO EMP VALUES (7779, 'JAMES', '제임스', 'SALESMAN', 3209,STR_TO_DATE('2023-12-03', '%Y-%m-%d'), 12000, NULL, 30);
INSERT INTO EMP VALUES (4779, 'FORD', '포드', 'ANALYST', 2101,STR_TO_DATE('2018-12-03', '%Y-%m-%d'), 30000, NULL, 20);
INSERT INTO EMP VALUES (7979, 'MILLER', '밀러', 'CLERK', 2103,STR_TO_DATE('2023-01-23', '%Y-%m-%d'), 13000, NULL, 10);
INSERT INTO EMP VALUES (3477, 'COUNTER', '카운터', 'CLERK', 2103,STR_TO_DATE('2013-01-21', '%Y-%m-%d'), 21000, NULL, 10);

COMMIT;

## 함수를 통한 데이터 가공

create table DEPT(
DEPTNO   int(2) primary key,
DNAME    varchar(14),
LOC      varchar(13) 
);

create table EMP (
EMPNO     int(4),
ENAME     varchar(10),
KNAME     varchar(20),
JOB       varchar(9),
MGR       int(4),
HIREDATE  date,
SAL       int(7),
COMM      int(7),
DEPTNO    Int(2),
primary key(EMPNO, ENAME),
foreign key(deptno) references dept(deptno)
);

# 반올림 round, ceil
select round(8960,-2); -- 백자리에서 반올림 
select ceil(302.6);

# 내림 floor
select floor(302.6);

# 나머지 mod
select mod(7,5); -- 7을 5로 나눈 나머지 2

# date 타입의 수식연산 기본적으로 DATE 타입의 수식 연산은 일자 기준
select 
ENAME, JOB, sysdate(), HIREDATE, datediff(sysdate(), hiredate) "TOTAL DAYS",
CEIL(datediff(sysdate(), HIREDATE)/7) "WEEKS",
ROUND(MOD(datediff(sysdate(), HIREDATE),7)) "DAYS"
from EMP
where HIREDATE > '2010-01-01';

select ENAME 이름 , JOB 역할, date_format(hiredate, '%Y-%m-%d') as 입사일
from EMP
where deptno = 20
order by HIREDATE desc;

## 문자열 자르고 붙이기, CONCAT 및 SUBSTRING

select CONCAT (ENAME,' ', SUBSTRING(JOB,1,1),SUBSTRING(JOB,5,1),SUBSTRING(JOB,7,1)) '관리자 목록'
from EMP
where JOB like 'mana%';

## 문자열 크기 조회

select ename 영어이름, LENGTH(ENAME) '영어 문자열 길이', KNAME 한글표기, LENGTH(kname) '한국 문자열 길이'  from EMP;

SELECT schema_name , default_character_set_name
FROM information_schema.schemata ;

## 흐름 제어 하기
## IF문 조건식이 참이면 첫번째, 거짓이면 두번째’ 출력

select if (100>1000, '첫번째', '두번째') 결과값; 

## 흐름 제어 하기
## case when then else end;

select ENAME 이름, JOB 역할, CASE DEPTNO # CASE 값에 해당할 때 (여기서는 DEPTNO일 때)
WHEN 10 THEN '회계팀' # WHEN 값에 해당하는 것을 찾아 THEN 뒤의 값을 반환
WHEN 20 THEN '연구팀'
WHEN 30 THEN '영업팀'
WHEN 40 THEN '운영팀'
ELSE '미배정' # WHEN 뒤의 값이 없으면, ELSE뒤 값을 반환 
END 부서명
from EMP;

## 그룹함수 이해, having 조건

select JOB 역할, 12 * avg(SAL) 연봉,
COUNT(*) '대상 직원수'
from EMP
group by job having COUNT(*) > 2;
