use SQL_DB;

create table BRANCH (
  BR_NO varchar(6) not null,
  BR_NAME varchar(10) not null,
  BR_ADDR varchar(30) null,
  primary key (BR_NO));
  
insert into BRANCH values ('BR0001', 'SEOUL', '서초구.서초대로1길.30');
insert into BRANCH values ('BR0002', 'BUSAN', '해운대구.달맞이길.199');  
insert into BRANCH values ('BR0003', 'DAEGU', '중구.동성로3길.12-3'); 
insert into BRANCH values ('BR0004', 'GWANJU','광산구.임방울대로.327'); 
insert into BRANCH values ('BR0005', 'DAEJEON','중구.대종로480번길.15'); 
insert into BRANCH values ('BR0006', 'JEJU','제주시.한림읍.협재2길.6'); 

create table CUSTOMER (
  CUST_NO varchar(6) not null,
  CUST_NAME varchar(10) null,
  BONUS_POINT INT null,
  CREDIT_LIMIT INT null,
  BR_NO varchar(6) null,
  primary key (CUST_NO),
  constraint `fk_CUSTOMER_BRANCH`
    foreign key (BR_NO)
    references BRANCH (BR_NO)
    on delete no action
    on update no action);
    
insert into CUSTOMER values ('CR0001', 'POENIX',30000, 5000000, 'BR0001'); 
insert into CUSTOMER values ('CR0002', 'JAMES', 10000, 1000000, 'BR0001'); 
insert into CUSTOMER values ('CR0003', 'MILLER', 3000, 100000, 'BR0002'); 
insert into CUSTOMER values ('CR0004', 'JOHN', 5000, 700000, 'BR0002'); 
insert into CUSTOMER values ('CR0005', 'TIGER', 1000, 1000000, 'BR0003'); 
insert into CUSTOMER values ('CR0006', 'AUSTIN', 10000, 900000, 'BR0003'); 
insert into CUSTOMER values ('CR0007', 'LILY', 10000, 1000000, 'BR0004'); 
insert into CUSTOMER values ('CR0008', 'ELLEN', 4000, 800000, 'BR0004'); 
insert into CUSTOMER values ('CR0009', 'JULIET', 5000, 700000, 'BR0005'); 
insert into CUSTOMER values ('CR0010', 'SUJI', 20000, 1000000, 'BR0005'); 
insert into CUSTOMER values ('CR0011', 'OLIVIA', 7000, 500000, 'BR0006'); 
insert into CUSTOMER values ('CR0012', 'SOPHIA', 15000, 1000000, 'BR0006'); 

create table PRODUCT (
  PROD_NO varchar(6) not null,
  PROD_NAME varchar(10) null,
  PROD_CLASS varchar(10) null,
  UNIT_PRICE INT null,
  primary key (PROD_NO));
  
insert into PRODUCT values ('FD0001', 'RAMEN', 'FOODS', 15000);
insert into PRODUCT values ('FD0002', 'TUNA', 'FOODS', 20000);
insert into PRODUCT values ('FD0003', 'SALAD', 'FOODS', 13000);
insert into PRODUCT values ('FD0004', 'CHICKEN', 'FOODS', 20000);
insert into PRODUCT values ('FD0005', 'BANANA', 'FOODS', 5000);
insert into PRODUCT values ('FD0006', 'APPLE', 'FOODS', 35000); 
insert into PRODUCT values ('FD0007', 'PEAR', 'FOODS', 35000); 
insert into PRODUCT values ('FD0008', 'PINEAPPLE', 'FOODS', 30000); 
insert into PRODUCT values ('FD0009', 'PEACH', 'FOODS', 30000); 
insert into PRODUCT values ('FD0010', 'TOMATO', 'FOODS', 30000); 
insert into PRODUCT values ('CT0001', 'SOCKS', 'CLOTHES', 15000); 
insert into PRODUCT values ('CT0002', 'SHIRTS', 'CLOTHES', 50000); 
insert into PRODUCT values ('CT0003', 'SKIRTS', 'CLOTHES', 70000); 
insert into PRODUCT values ('CT0004', 'PANTS', 'CLOTHES', 50000); 
insert into PRODUCT values ('CT0005', 'HATS', 'CLOTHES', 30000); 
insert into PRODUCT values ('OT0001', 'UTILITY', 'OTHERS', 20000); 

commit;

create table SERVICE(
  SALEDATE varchar(8) not null,
  CUST_NO varchar(6) not null,
  PROD_NO varchar(6) not null,
  SALE_AMT INT null,
  SALE_CLASS varchar(1) null,
  UNIT_PRICE INT null,
  primary key (SALEDATE, CUST_NO, PROD_NO),
  constraint fk_SERVICE_CUSTOMER
    foreign key (CUST_NO)
    references CUSTOMER (CUST_NO),
  constraint fk_SERVICE_PRODUCT
    foreign key (PROD_NO)
    references PRODUCT (PROD_NO));
    
insert into SERVICE values ('20221204', 'CR0001', 'FD0010', 10, 'F', 15000); 
insert into SERVICE values ('20231224', 'CR0001', 'FD0001', 10, 'F', 17000); 
insert into SERVICE values ('20231231', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20221203', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20231223', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20231230', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20221213', 'CR0001', 'FD0008', 10, 'F', 30000); 
insert into SERVICE values ('20231123', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20231130', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20211204', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20221224', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20221231', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20211203', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20221223', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20221230', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20201213', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20211123', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20221130', 'CR0001', 'FD0004', 10, 'F', 20000);

insert into SERVICE values ('20210704', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20220724', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20220731', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20210703', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20221023', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20220730', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20210713', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20220723', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20220830', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20190804', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20200824', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20200929', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20190903', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20200923', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20200930', 'CR0001', 'FD0004', 10, 'F', 20000); 
insert into SERVICE values ('20191014', 'CR0001', 'FD0009', 10, 'F', 30000); 
insert into SERVICE values ('20201024', 'CR0001', 'FD0001', 10, 'F', 15000); 
insert into SERVICE values ('20201030', 'CR0001', 'FD0004', 10, 'F', 20000);

insert into SERVICE values ('20240104', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240110', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240303', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240103', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240109', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240302', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240113', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240119', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240312', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230104', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230110', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230303', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230103', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230109', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230302', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230113', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230119', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230312', 'CR0002', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20220104', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220110', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220303', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220103', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220109', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220302', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220113', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220119', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220312', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220304', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220410', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220403', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220503', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220509', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220502', 'CR0002', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220513', 'CR0002', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220519', 'CR0002', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220512', 'CR0002', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20240307', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20240313', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20240303', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20240306', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20240312', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20240302', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20240316', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20240322', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20240312', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20230307', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20230313', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20230303', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20230306', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20230312', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20230302', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20230317', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20230322', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20230312', 'CR0003', 'FD0001', 10, 'N', 15000);

insert into SERVICE values ('20230907', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20230913', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20230903', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20230906', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20230912', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20230702', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20230716', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20230722', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20230712', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20220707', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20220713', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20220703', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20220706', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20220812', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20220802', 'CR0003', 'FD0001', 10, 'N', 15000);
insert into SERVICE values ('20220816', 'CR0003', 'FD0003', 10, 'F', 13000); 
insert into SERVICE values ('20220822', 'CR0003', 'FD0002', 10, 'F', 20000); 
insert into SERVICE values ('20220812', 'CR0003', 'FD0001', 10, 'N', 15000);

insert into SERVICE values ('20240304', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20240823', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240814', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240813', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20240822', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240923', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240907', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20240223', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240315', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230308', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20230914', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230909', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230901', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20230915', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230803', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230813', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20230822', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20231019', 'CR0004', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20230304', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20230113', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230304', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230303', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20230112', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230311', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230713', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20230722', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230713', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220704', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20220713', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220704', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220703', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20220712', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220703', 'CR0004', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220713', 'CR0004', 'CT0003', 10, 'F', 70000); 
insert into SERVICE values ('20220722', 'CR0004', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220713', 'CR0004', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20240104', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20240210', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240316', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20240103', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20240209', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240315', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20240113', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20240219', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240325', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230104', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20230210', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230316', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230103', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20230209', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230315', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230113', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20230219', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230325', 'CR0005', 'CT0003', 10, 'F', 70000);

insert into SERVICE values ('20230704', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20230710', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230716', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230703', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20230709', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230715', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230813', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20230819', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230825', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20220804', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20220810', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220916', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20220903', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20220909', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220915', 'CR0005', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20220913', 'CR0005', 'CT0004', 10, 'F', 50000); 
insert into SERVICE values ('20220919', 'CR0005', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220925', 'CR0005', 'CT0003', 10, 'F', 70000);

insert into SERVICE values ('20240104', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240110', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240407', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20240103', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240109', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240406', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20240113', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240119', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240416', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20230104', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230110', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230407', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20230103', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230109', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230406', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20230113', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230119', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230416', 'CR0006', 'CT0003', 5, 'F', 70000);

insert into SERVICE values ('20230704', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230710', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230707', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20230703', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230709', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230706', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20230713', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230719', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230816', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20220804', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220810', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220807', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20220803', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220809', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220806', 'CR0006', 'CT0003', 5, 'F', 70000);
insert into SERVICE values ('20220813', 'CR0006', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220811', 'CR0006', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220915','CR0006', 'CT0003', 5, 'F', 70000);

insert into SERVICE values ('20240303', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240117', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240505', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240302', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240116', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240504', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240312', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240126', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240524', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230307', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230117', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230505', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230302', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230116', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230504', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230312', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230126', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230524', 'CR0007', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20230703', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230717', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230705', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230702', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230716', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230704', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230712', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230726', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230724', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220703', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220817', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220805', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220802', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220816', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220804', 'CR0007', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220812', 'CR0007', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220826', 'CR0007', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220826', 'CR0007', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20240104', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240113', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20240505', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20240103', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240112', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20240504', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20240113', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240122', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20240514', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230104', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230113', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20230505', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230103', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230112', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20230504', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230313', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230122', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20230514', 'CR0008', 'CT0003', 10, 'F', 70000);

insert into SERVICE values ('20230704', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230713', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20230705', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230703', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230712', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20230704', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20230813', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230822', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20230814', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20220804', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220813', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20220805', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20220803', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220912', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20220904', 'CR0008', 'CT0003', 10, 'F', 70000);
insert into SERVICE values ('20220913', 'CR0008', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220922', 'CR0008', 'CT0005', 5, 'F', 20000); 
insert into SERVICE values ('20220914', 'CR0008', 'CT0003', 10, 'F', 70000);

insert into SERVICE values ('20240604', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240615', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240608', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20240603', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240614', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240607', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20240403', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240624', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240617', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20230604', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230715', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230708', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20230703', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230714', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230707', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20230713', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230824', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230817', 'CR0009', 'CT0005', 20, 'F', 20000);

insert into SERVICE values ('20230104', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230215', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230508', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20230103', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230214', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230507', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20230113', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230224', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230517', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20220104', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220215', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220508', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20220103', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220214', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220507', 'CR0009', 'CT0005', 20, 'F', 20000);
insert into SERVICE values ('20220113', 'CR0009', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220224', 'CR0009', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220517', 'CR0009', 'CT0005', 20, 'F', 20000);

insert into SERVICE values ('20240104', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240131', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240308', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20240103', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240130', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240307', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20240113', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240120', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240317', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230104', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230131', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230308', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230103', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230130', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230307', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230113', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230120', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230317', 'CR0010', 'CT0002', 5, 'F', 50000);

insert into SERVICE values ('20230704', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230731', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230708', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230703', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230730', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230707', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230713', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230720', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230817', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20220804', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220831', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220808', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20220803', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220730', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220907', 'CR0010', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20220913', 'CR0010', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220920', 'CR0010', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220917', 'CR0010', 'CT0002', 5, 'F', 50000);

insert into SERVICE values ('20240104', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240105', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240303', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240103', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240104', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240302', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20240113', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20240114', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20240312', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230104', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230105', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230303', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230103', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230104', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230302', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230113', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230114', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230312', 'CR0011', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20230704', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230705', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230703', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230703', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230704', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230702', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20230713', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20230814', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20230812', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220804', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220805', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220803', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220803', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220904', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220902', 'CR0011', 'CT0002', 10, 'F', 50000);
insert into SERVICE values ('20220913', 'CR0011', 'CT0001', 10, 'F', 15000); 
insert into SERVICE values ('20220914', 'CR0011', 'CT0005', 10, 'F', 20000); 
insert into SERVICE values ('20220912', 'CR0011', 'CT0002', 10, 'F', 50000);

insert into SERVICE values ('20240101', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20240303', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20240515', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20240102', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20240304', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20240516', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20240112', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20240314', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20240526', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230101', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20230303', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20230515', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230102', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20230304', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20230516', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230112', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20230314', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20231026', 'CR0012', 'CT0002', 5, 'F', 50000);

insert into SERVICE values ('20230701', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20230703', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20230715', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230702', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20230704', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20230716', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20230712', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20230714', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20230726', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20220801', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20220803', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20220815', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20220802', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20220904', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20220916', 'CR0012', 'CT0002', 5, 'F', 50000);
insert into SERVICE values ('20220912', 'CR0012', 'FD0001', 10, 'N', 15000); 
insert into SERVICE values ('20220914', 'CR0012', 'CT0002', 10, 'F', 50000); 
insert into SERVICE values ('20220926', 'CR0012', 'CT0002', 5, 'F', 50000);

commit;


create index jn_SERVICE_PRODUCT_idx ON SERVICE (PROD_NO asc, SALEDATE asc) visible;
create index jn_SERVICE_CUSTOMER_idx ON SERVICE (CUST_NO asc, SALEDATE asc) visible;

/* 상기 인덱스 재생성 필요 시, 기존 인덱스 삭세할 때 사용합니다.
drop index jn_SERVICE_PRODUCT_idx ON SERVICE;
drop index jn_SERVICE_CUSTOMER_idx ON SERVICE;
*/

optimize table PRODUCT; # ANALYZE table PRODUCT;
optimize table CUSTOMER; # ANALYZE table CUSTOMER;
optimize table BRANCH; # ANALYZE table BRANCH;
optimize table SERVICE; # ANALYZE table SERVICE;

set profiling=1;

explain
select a.BR_NAME, SUM(c.SALE_AMT*c.UNIT_PRICE) as SUM_SALE_AMT
from BRANCH a, CUSTOMER b, SERVICE c
where a.BR_NO = b.BR_NO
and b.CUST_NO = c.CUST_NO
and c.SALEDATE between '20231223' and  '20241224'
group by a.BR_NAME;

explain
select b.BR_NAME, SUM(v.SUM_SALE_AMT)
from (select CUST_NO, SUM(SALE_AMT*UNIT_PRICE) as SUM_SALE_AMT
from SERVICE
where SALEDATE between '20231223' and '20241224'
group by CUST_NO) v, CUSTOMER a, BRANCH b
where   b.BR_NO = a.BR_NO
 and    a.CUST_NO = v.CUST_NO
group by b.BR_NAME;                                               

show profiles;
call clearProfilingHistory();

# reconnection 후 재실행하기 (상단 Reconnect to DBMS 아이콘 클릭)
# reconnection을 안하면, 동일 세션에서 동일 테이블에 대해 이미 적용된 SQL 실행 계획 및 결과가 영향을 미침
set profiling=1;

explain
select SUM(SALE_AMT) as TOTAL_SALE_QTY,
SUM(SALE_AMT * a.UNIT_PRICE) as TOTAL_SALE_AMT
from PRODUCT a, SERVICE b
where a.PROD_NO = b.PROD_NO
and a.PROD_CLASS in ('CLOTHES', 'FOODS')
and  b.SALEDATE between '20231223' and '20241224';

explain
select SUM(V.TOTAL_QTY) as TOTAL_SALE_QTY,
	   SUM((V.TOTAL_QTY*A.UNIT_PRICE)) as TOTAL_SALE_AMT
from (select PROD_NO, SUM(SALE_AMT) as TOTAL_QTY
	  from SERVICE where SALEDATE between '20231223' and '20241224'
	  group by PROD_NO) v, PRODUCT a
where a.PROD_NO = v.PROD_NO
and a.PROD_CLASS in ('CLOTHES', 'FOODS');       

show profiles;
call clearProfilingHistory();

# reconnection 후 재실행하기 (상단 Reconnect to DBMS 아이콘 클릭)
# reconnection을 안하면, 동일 세션에서 동일 테이블에 대해 이미 적용된 SQL 실행 계획 및 결과가 영향을 미침
set profiling=1;   

explain
select distinct a.CUST_NAME, b.BR_NAME
from CUSTOMER a, BRANCH b, SERVICE c
where a.BR_NO = b.BR_NO and a.CUST_NO = c.CUST_NO
and c.SALEDATE LIKE '2024%' ;                               

explain
select a.CUST_NAME, b.BR_NAME
from CUSTOMER a, BRANCH b
where a.BR_NO = b.BR_NO
and a.CUST_NO in (select CUST_NO from SERVICE  
where SALEDATE like '2024%');         

explain
select a.CUST_NAME, BR_NAME
from CUSTOMER a,  BRANCH b
where exists (select 'X' from  SERVICE c
where a.CUST_NO = c.CUST_NO and SALEDATE like '2024%')   
and a.BR_NO = b.BR_NO ;            

show profiles;
call clearProfilingHistory();
 
set profiling=0;      
select count(*) from service;                   

-- DELETE CUSTOMER A
SELECT COUNT(CUST_NO) FROM CUSTOMER A   -- 삭제 시에는 이 줄을 지우고 위 줄을 살린다.
WHERE  A.CUST_NO IN (SELECT CUST_NO FROM SERVICE
                     WHERE  SALEDATE LIKE '2024%'
                     GROUP BY CUST_NO HAVING SUM(SALE_AMT*UNIT_PRICE) < 200000)
OR NOT EXISTS (SELECT 'X' FROM SERVICE C WHERE  C.CUST_NO = A.CUST_NO
                      AND C.SALEDATE LIKE '2024%');               

SELECT CUST_NO,
       SUM(SALE_AMT*UNIT_PRICE) AS SUM_SALE_AMT
FROM   SERVICE
WHERE  SALEDATE BETWEEN '20231001' AND '20231231'
GROUP  BY CUST_NO
ORDER  BY SUM_SALE_AMT DESC;


