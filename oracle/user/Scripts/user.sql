/*
 * 회원번호
 * 이름
 * 비밀번호
 * 핸드폰번호
 * 별명
 * 이메일
 * 주소
 * 생일
 * 성별
 * 추천인
 * 직업
 * */
CREATE TABLE TBL_USER(
	USER_NUMBER NUMBER,
	USER_NAME VARCHAR2(1000),
	USER_PASSWORD VARCHAR2(1000),
	USER_PHONE_NUMBER VARCHAR2(1000),
	USER_NICKNAME VARCHAR2(1000),
	USER_EMAIL VARCHAR2(1000),
	USER_ADDRESS VARCHAR2(1000),
	USER_BIRTH_DAY DATE,
	USER_GENDER CHAR(1) DEFAULT 'N',
	USER_RECOMMENDER_ID VARCHAR2(1000),
	USER_JOB VARCHAR2(1000)
);

ALTER TABLE TBL_USER ADD CONSTRAINT PK_USER PRIMARY KEY(USER_NUMBER);
CREATE SEQUENCE SEQ_USER;

ALTER TABLE TBL_USER ADD USER_ID VARCHAR2(1000);

INSERT INTO TBL_USER
(USER_NUMBER, USER_NAME, USER_PASSWORD, USER_PHONE_NUMBER, USER_NICKNAME, USER_EMAIL, USER_ADDRESS, USER_BIRTH_DAY, USER_RECOMMENDER_ID, USER_JOB)
VALUES(SEQ_USER.NEXTVAL, '김예찬', '1234', '01012341234', '예수님찬양', 'wondo8448@naver.com', '전라북도 전주시', '1997-01-27', NULL, 'STUDENT');

SELECT * FROM TBL_USER;

UPDATE TBL_USER
SET USER_ID = 'KYC'
WHERE USER_NUMBER = 1;