-- CREATE database IF NOT EXISTS applyhome DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 유저 테이블
CREATE TABLE IF NOT EXISTS users(
    user_no INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '회원 번호',
    user_id VARCHAR(30) COMMENT '회원 아이디',
    user_password VARCHAR(200) COMMENT '회원 비밀번호',
    user_name VARCHAR(20) COMMENT '회원 이름',
    phone VARCHAR(20) COMMENT '회원 핸드폰 번호',
    email VARCHAR(30) COMMENT '회원 이메일',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '가입 날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 권한 테이블
CREATE TABLE IF NOT EXISTS auth_authority(
   role_id INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '권한 번호',
   role_name VARCHAR(20) COMMENT '권한 이름',
   role_description VARCHAR(30) COMMENT '권한 설명'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 유저 권한 테이블
CREATE TABLE IF NOT EXISTS auth_users_authority(
    user_no INTEGER(4) NOT NULL COMMENT '회원 번호',
    role_id INTEGER(4) NOT NULL COMMENT '권한 번호',
    FOREIGN KEY (user_no) REFERENCES users (user_no) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES auth_authority (role_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 주변 상권 테이블
CREATE TABLE IF NOT EXISTS business_area(
	business_no INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '상권 번호',
	business_type VARCHAR(30) COMMENT '병원, 마트, 지하철',
	business_name VARCHAR(40) COMMENT '상권 이름',
	latitude VARCHAR(40) COMMENT '위도',
	longitude VARCHAR(40) COMMENT '경도',
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '데이터 생성 날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 매매가격 통계 테이블
CREATE TABLE IF NOT EXISTS statistics_sale_price(
	sale_price_no INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '매매 번호',
	area VARCHAR(20) COMMENT '지역 이름',
	gu VARCHAR(10) COMMENT '구 이름',
	dong VARCHAR(20) COMMENT '동 이름',
	price INTEGER(4) COMMENT '매매 가격',
	create_at DATETIME COMMENT '매매 날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 아파트 테이블
CREATE TABLE IF NOT EXISTS apartments(
	apartments_no INTEGER(8) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '아파트 번호',
	apartments_name VARCHAR(50) COMMENT '아파트명',
	price INTEGER(4) COMMENT '아파트 가격',
	addr VARCHAR(50) COMMENT '아파트 도로명(지번) 주소',
	gu VARCHAR(20) COMMENT '구 이름(법정구)',
	dong VARCHAR(20) COMMENT '동 이름(법정동)',
	latitude VARCHAR(40) COMMENT '위도',
	longitude VARCHAR(40) COMMENT '경도',
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '아파트 건립날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 아파트 매매 거래 내역 테이블
CREATE TABLE IF NOT EXISTS history_sale_contract(
	sale_contract_no BIGINT(20) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '매매 번호',
	apartments_no INTEGER(8) COMMENT '아파트 번호',
	sale_price INTEGER(4) COMMENT '거래금액',
	create_at DATETIME COMMENT '계약 일',
	floor VARCHAR(20) COMMENT '층',
	area_for_exclusive_use VARCHAR(30) COMMENT '면적',
	gu VARCHAR(20) COMMENT '구 이름(법정구)',
	dong VARCHAR(20) COMMENT '동 이름(법정동)',
	CONSTRAINT history_sale_contract_id_fk FOREIGN KEY (apartments_no) REFERENCES apartments(apartments_no) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ALTER TABLE 테이블이름 ADD 컬럼명 VARCHAR(20);