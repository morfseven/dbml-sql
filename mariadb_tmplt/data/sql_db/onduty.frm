TYPE=VIEW
query=select `sql_db`.`perinf`.`MILNUM` AS `MILNUM`,`sql_db`.`perinf`.`RANCOD` AS `RANCOD`,`sql_db`.`perinf`.`ROLCOD` AS `ROLCOD`,`sql_db`.`perinf`.`TELINF` AS `TELINF`,`sql_db`.`perinf`.`LOC` AS `LOC`,`sql_db`.`perinf`.`CER` AS `CER`,`sql_db`.`perinf`.`UNICOD` AS `UNICOD`,`sql_db`.`perinf`.`USEID` AS `USEID`,`sql_db`.`perinf`.`REGDAT` AS `REGDAT` from `sql_db`.`perinf` where `sql_db`.`perinf`.`ROLCOD` = \'SNIPER\'
md5=ff88baa6f8a23a84d0300413db00a689
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=2
timestamp=0001761096894369364
create-version=2
source=select *\nfrom PERINF\nwhere ROLCOD = \'SNIPER\'\nwith check option
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `sql_db`.`perinf`.`MILNUM` AS `MILNUM`,`sql_db`.`perinf`.`RANCOD` AS `RANCOD`,`sql_db`.`perinf`.`ROLCOD` AS `ROLCOD`,`sql_db`.`perinf`.`TELINF` AS `TELINF`,`sql_db`.`perinf`.`LOC` AS `LOC`,`sql_db`.`perinf`.`CER` AS `CER`,`sql_db`.`perinf`.`UNICOD` AS `UNICOD`,`sql_db`.`perinf`.`USEID` AS `USEID`,`sql_db`.`perinf`.`REGDAT` AS `REGDAT` from `sql_db`.`perinf` where `sql_db`.`perinf`.`ROLCOD` = \'SNIPER\'
mariadb-version=100518
