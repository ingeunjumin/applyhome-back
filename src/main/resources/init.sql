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

