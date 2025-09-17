## 다음 SQL은, 모델을 먼저 생성한 후에, Forward Engineering으로 자동 생성한 SQL 문장입니다. (실습 환경 MySQL Workbench)
## 아래 DDL을 그대로 실행시키셔도 되고, 수업시간에 배운데로 모델을 생성한 후에 Forward Engineering으로 생성하셔도 됩니다. (모델 파일은 별도 첨부하지 않음)

CREATE SCHEMA IF NOT EXISTS sql_std DEFAULT CHARACTER SET utf8mb4 ;
USE `sql_std` ;

CREATE TABLE IF NOT EXISTS `sql_std`.`FATHER` (
  `rol_cod` VARCHAR(10) NOT NULL,
  `rol_nam` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`rol_cod`));

CREATE TABLE IF NOT EXISTS `sql_std`.`MOTHER` (
  `dep_cod` VARCHAR(10) NOT NULL,
  `dep_nam` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`dep_cod`));

CREATE TABLE IF NOT EXISTS `sql_std`.`CHILD` (
  `emp_num` INT(6) NOT NULL,
  `emp_nam` VARCHAR(12) NULL,
  `joi_dat` DATE NULL,
  `sal_amo` INT(10) NULL,
  `dep_cod` VARCHAR(20) NULL DEFAULT NULL,
  `rol_cod` VARCHAR(10) NULL,
  PRIMARY KEY (`emp_num`),
  INDEX `FATHER_rolcod_idx` (`rol_cod` ASC),
  INDEX `MOTHER_depcod_idx` (`dep_cod` ASC),
  CONSTRAINT `CHILD_FATHER_fk`
    FOREIGN KEY (`rol_cod`)
    REFERENCES `sql_std`.`FATHER` (`rol_cod`),
  CONSTRAINT `CHILD_MOTHER_fk`
    FOREIGN KEY (`dep_cod`)
    REFERENCES `sql_std`.`MOTHER` (`dep_cod`)
);
