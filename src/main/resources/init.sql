-- CREATE database IF NOT EXISTS applyhome DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 유저 테이블
CREATE TABLE IF NOT EXISTS users(
    user_no INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '회원 번호',
    user_id VARCHAR(30) COMMENT '회원 아이디',
    user_password VARCHAR(200) COMMENT '회원 비밀번호',
    user_name VARCHAR(20) COMMENT '회원 이름',
    phone VARCHAR(20) COMMENT '회원 핸드폰 번호',
    email VARCHAR(30) COMMENT '회원 이메일',
    auth VARCHAR(20) COMMENT '회원 권한',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '가입 날짜'
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
	addr VARCHAR(50) COMMENT '아파트 도로명 주소',
	dong_count INTEGER(4) COMMENT '동수',
	sedae_count INTEGER(4) COMMENT '세대수',
	latitude VARCHAR(40) COMMENT '위도',
	longitude VARCHAR(40) COMMENT '경도',
	is_sold BOOLEAN COMMENT '분양예정 여부',
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '데이터 생성 날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 아파트 정보 테이블
CREATE TABLE IF NOT EXISTS apartments_info(
	apartments_info_no INTEGER(8) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '아파트 정보 번호',
	apartments_no INTEGER(8) COMMENT '아파트 번호',
	dong VARCHAR(10) COMMENT '아파트 동',
	footage VARCHAR(10) COMMENT '아파트 평수(ex: 24평 32평)',
	apartments_type VARCHAR(20) COMMENT '아파트 타입',
	apartments_img VARCHAR(150) COMMENT '평수 사진 이미지',
	max_floor VARCHAR(10) COMMENT '아파트 최고 층',
	create_at DATETIME COMMENT '아파트 건립날짜',
	CONSTRAINT apartments_info_id_fk FOREIGN KEY (apartments_no) REFERENCES apartments(apartments_no) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 아파트 매매 거래 내역 테이블
CREATE TABLE IF NOT EXISTS history_sale_contract(
	sale_contract_no BIGINT(20) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '매매 계약 번호',
	apartments_no INTEGER(8) COMMENT '아파트 번호',
	sale_type VARCHAR(20) COMMENT '매매 타입(직거래 인지 아닌지)',
	sale_price INTEGER(4) COMMENT '매매 가격',
	create_at DATETIME COMMENT '계약날짜',
	CONSTRAINT history_sale_contract_id_fk FOREIGN KEY (apartments_no) REFERENCES apartments(apartments_no) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 아파트 전/월세 내역 테이블
CREATE TABLE IF NOT EXISTS history_rent_contract(
	rent_contract_no BIGINT(20) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '전/월세 계약 번호',
	apartments_no INTEGER(8) COMMENT '아파트 번호',
	rent_type VARCHAR(20) COMMENT '타입 (전세, 월세)',
	rent_price INTEGER(4) COMMENT '전/월세 가격',
	create_at DATETIME COMMENT '계약날짜',
	CONSTRAINT history_rent_contract_id_fk FOREIGN KEY (apartments_no) REFERENCES apartments(apartments_no) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

