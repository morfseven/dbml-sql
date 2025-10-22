
## [실습]
# ERD 작성 방법(사용법) 중심으로 설명합니다. DBMS 설치는 별도 안내합니다.
# 다음 SQL 문장은 Maria DB 상용 운영 예시 환경에서, 동일한 DBMS가 설치된다는 전제에서 설명합니다.
 
# 논리 모델, 물리 모델 설명, DDL 생성 (Forward Engineering)
# 개별 DDL 및 DML 생성

CREATE SCHEMA IF NOT EXISTS sql_db DEFAULT CHARACTER SET utf8mb4 ;
USE `sql_db` ;

CREATE USER 'manager'@'%' IDENTIFIED BY 'passwd'; # PC에 직접 설치한 경우에만 생성합니다. 제가 드린 컨테이너 기반 생성 시에는 기존 생성됩니다.

GRANT ALL PRIVILEGES ON sql_db.* TO 'manager'@'%';
FLUSH PRIVILEGES;

# 이후로는 manager로 다시 접속하여 사용합니다.

create table 직무코드 (
주특기코드 varchar(10) primary key,
임무상세 varchar(40)
);

create table 인사정보 (
군번 varchar(10),
계급코드 varchar(10),
주특기코드 varchar(10),
연락처 varchar(13),
위치 varchar(20),
자격증 varchar(20),
부대코드 varchar(20), 
primary key(군번, 주특기코드), 
foreign key(주특기코드) references 직무코드 (주특기코드)
);

insert Into 직무코드 (주특기코드, 임무상세) values ( 'SNIPER', '저격');
insert Into 직무코드 (주특기코드, 임무상세) values ( 'MEDIC', '의료');
insert Into 직무코드 (주특기코드, 임무상세) values ( 'DEMOLITION', '폭파');
insert Into 인사정보 (군번, 계급코드, 주특기코드, 연락처, 위치, 자격증, 부대코드) values ('20-243679', 'SG2', 'SNIPER', '010-XXX', '미국', '스쿠버', 'UDT');
insert Into 인사정보 (군번, 계급코드, 주특기코드, 연락처, 위치, 자격증, 부대코드) values ('23-023456', 'SG0', 'MEDIC', '010-XXX', '한국', '응급구조사', '특수전여단');
insert Into 인사정보 (군번, 계급코드, 주특기코드, 연락처, 위치, 자격증, 부대코드) values ('22-138907', 'SG1', 'DEMOLITION', '010-XXX', '캐나다', '화공기사', '특전사령부');

commit; rollback;
