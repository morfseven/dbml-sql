## 데이터 처리 및 통제 SQL

/* 뷰 생성을 위해서 데이터는 사전 입력 완료
insert Into ROLCOD (rolcod, jobdet) values ('SNIPER', '저격');
insert Into ROLCOD (rolcod, jobdet) values ('MEDIC', '의료');
insert Into ROLCOD (rolcod, jobdet) values ('DEMOLITION', '폭파');

insert Into PERINF (milnum, rancod, rolcod, telinf, loc, cer, unicod, useid, regdat)
values ('20-243679', 'SG2', 'SNIPER', '010-1234-5678', '미국', '스쿠버', 'UDT', user(), sysdate());
insert Into PERINF (milnum, rancod, rolcod, telinf, loc, cer, unicod, useid, regdat)
values ('23-023456', 'SG0', 'MEDIC', '010-2345-6789', '한국', '응급구조사', '특수전여단', user(), sysdate());
insert Into PERINF (milnum, rancod, rolcod, telinf, loc, cer, unicod, useid, regdat)
values ('22-138907', 'SG1', 'DEMOLITION', '010-3456-7890', '캐나다', '화공기사', '특전사령부', user(), sysdate());
*/

# DML insert/ update/ delete
update RANCOD set jobdet ='화기' where rolcod='SNIPER';
commit;
update PERINF set loc ='한국' where milnum ='20-243679' and rolcod='SNIPER';
rollback;
commit;

delete from RANCOD where rolcod='DEMOLITION';
delete from PERINF where milnum ='22-138907' and rolcod='DEMOLITION';

# 데이터 통제 commit/ rollback, grand/ revoke, ROLE
# create user '계정'@'접속위치' identified by '패스워드';

create user 'test'@'127.0.0.1' identified by 'Password'; -- 내부접속만 허용
create user 'test2'@'%' identified by 'Password'; -- 외부접속 허용

create role dba;
grant all privileges on *.* to dba;
grant dba to 'user'@'%';
select current_role;
set role dba;

create role developer;
grant select, insert, update, delete on sqldb.* to developer;
grant developer to 'user'@'%';
select current_role;
set role developer;
