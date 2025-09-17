-- 전체 사용자 목록 조회
SELECT user, host
FROM mysql.user;

-- 참고, 현재 접속한 계정에 대해서만 조회
SELECT USER();
SELECT CURRENT_USER();

/*  참고, 오라클인 경우
전체 계정에 대해서 조회
SELECT username, account_status, created
FROM dba_users
ORDER BY username;

현재 접속한 계정에 대해서만 조회
SELECT username
FROM user_users;


*/


-- 특정 스키마 대상으로 기존 생성된 테이블들에 대해서, 컬럼명, 데이터 타입, 자릿수 등 표준화 일치 여부 조회 SQL
SELECT 
    TABLE_SCHEMA     AS schema_name,
    TABLE_NAME       AS table_name,
    COLUMN_NAME      AS column_name,
    COLUMN_TYPE      AS column_type,   -- 전체 타입 정의 (예: varchar(50))
    DATA_TYPE        AS data_type,     -- 기본 타입명 (예: varchar, int)
    CHARACTER_MAXIMUM_LENGTH AS char_length,
    NUMERIC_PRECISION       AS num_precision,
    NUMERIC_SCALE           AS num_scale,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    EXTRA
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'sql_db'
-- WHERE TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
ORDER BY TABLE_SCHEMA, COLUMN_NAME, TABLE_NAME, ORDINAL_POSITION;

-- 불일치 데이터 타입 수정
ALTER TABLE sql_db.DEPT MODIFY LOC varchar(13);