## [데이터 정의 SQL 실습] 
## 테이블 뷰, 생성/변경/삭제

create table RANCOD (
ROLCOD varchar(10) primary key,
ROLDET varchar(40)
);

create table PERINF (
MILNUM varchar(10),
RANCOD varchar(10),
ROLCOD varchar(10),
TELINF varchar(13),
LOC varchar(20),
CER varchar(20),
UNICOD varchar(20),
primary key(MILNUM, RANCOD), 
foreign key(ROLCOD) references RANCOD (ROLCOD)
); 

alter table PERINF 
add column USEID varchar(20);

alter table PERINF 
add column REGDAT datetime;

alter table RANCOD
change column ROLDET jobdet varchar(100);

insert Into rancod (rolcod, jobdet) values ('SNIPER', '저격');
insert Into rancod (rolcod, jobdet) values ('MEDIC', '의료');
insert Into rancod (rolcod, jobdet) values ('DEMOLITION', '폭파');

commit; rollback;

insert Into perinf (milnum, rancod, rolcod, telinf, loc, cer, unicod, useid, regdat)
values ('20-243679', 'SG2', 'SNIPER', '010-1234-5678', '미국', '스쿠버', 'UDT', user(), sysdate());
insert Into perinf (milnum, rancod, rolcod, telinf, loc, cer, unicod, useid, regdat)
values ('23-023456', 'SG0', 'MEDIC', '010-2345-6789', '한국', '응급구조사', '특수전여단', user(), sysdate());
insert Into perinf (milnum, rancod, rolcod, telinf, loc, cer, unicod, useid, regdat)
values ('22-138907', 'SG1', 'DEMOLITION', '010-3456-7890', '캐나다', '화공기사', '특전사령부', user(), sysdate());

commit;

create view onduty
as select *
from PERINF
where ROLCOD = 'SNIPER'
with check option;

## 인덱스 생성 및 삭제

create index idx_PERINF_RANCOD on perinf (ROLCOD);

