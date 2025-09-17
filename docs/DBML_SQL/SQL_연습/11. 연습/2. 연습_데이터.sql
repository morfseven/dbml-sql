use sql_std;

insert into DEPINF values ('10', '회계팀');
insert into DEPINF values ('20', '영업팀');
insert into DEPINF values ('30', '운영팀');

insert into ROLINF values ('E10', '임원');
insert into ROLINF values ('L10', '팀장');
insert into ROLINF values ('L20', '매니저');
insert into ROLINF values ('S10', '사업개발');
insert into ROLINF values ('S20', '세일즈');
insert into ROLINF values ('O10', '운영기획');
insert into ROLINF values ('O20', '운영기술');
insert into ROLINF values ('A10', '회계관리');
insert into ROLINF values ('A20', '재무관리');
commit;

INSERT INTO PERINF VALUES (5779, '스미스', STR_TO_DATE('2021-12-24', '%Y-%m-%d'), 13000,'30', 'L10');
INSERT INTO PERINF VALUES (3378, '알랜', STR_TO_DATE('2008-02-20', '%Y-%m-%d'), 16000, '30', 'L20');
INSERT INTO PERINF VALUES (3379, '알랜', STR_TO_DATE('2010-02-20', '%Y-%m-%d'), 19000, '20', 'L20');
INSERT INTO PERINF VALUES (3747, '워드', STR_TO_DATE('2012-02-22', '%Y-%m-%d'), 12500, '30', 'S10');
INSERT INTO PERINF VALUES (2101, '존스', STR_TO_DATE('2002-04-02', '%Y-%m-%d'), 29750, '20', 'E10');
INSERT INTO PERINF VALUES (3207, '마틴', STR_TO_DATE('2008-09-28', '%Y-%m-%d'), 12500, '20', 'S20');
INSERT INTO PERINF VALUES (3209, '블레이크', STR_TO_DATE('2008-05-01', '%Y-%m-%d'), 28500, '10', 'L10');
INSERT INTO PERINF VALUES (2103, '클라크', STR_TO_DATE('2007-06-09', '%Y-%m-%d'), 24500,'10', 'A10');
INSERT INTO PERINF VALUES (3001, '스콧', STR_TO_DATE('2001-12-09', '%Y-%m-%d'), 30000, '10', 'E10');
INSERT INTO PERINF VALUES (1003, '킹', STR_TO_DATE('2000-11-17', '%Y-%m-%d'), 50000, NULL, 'E10');
INSERT INTO PERINF VALUES (7776, '아담스', STR_TO_DATE('2023-01-12', '%Y-%m-%d'), 11000, '30', 'O20');
INSERT INTO PERINF VALUES (4779, '포드', STR_TO_DATE('2018-12-03', '%Y-%m-%d'), 30000, '20', 'L10');
INSERT INTO PERINF VALUES (7979, '밀러', STR_TO_DATE('2023-01-23', '%Y-%m-%d'), 13000, '10', 'A10');
INSERT INTO PERINF VALUES (3477, '카운터', STR_TO_DATE('2013-01-21', '%Y-%m-%d'), 21000, '30', 'O10');

commit;
