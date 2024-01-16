/*NULL*/
SELECT * FROM TBL_CAR;

ALTER TABLE TBL_CAR MODIFY CAR_BRAND NOT NULL;
ALTER TABLE TBL_CAR DROP CONSTRAINT SYS_C007022;

SELECT * FROM PLAYER
WHERE "POSITION" IS NULL;

SELECT PLAYER_NAME, NVL(NICKNAME, '없음')FROM PLAYER;
SELECT PLAYER_NAME, NVL("POSITION", '미정')FROM PLAYER;
SELECT PLAYER_NAME, NVL2(NATION, '등록', '미등록')FROM PLAYER;

/*AS(ALIAS) : 별칭
 * SELECT절과 FROM절에서 사용할 수 있다
 * AS 뒤에 사용하거나 한 칸 띄어쓰고 작성한다*/
SELECT PLAYER_NAME "선수 이름", BIRTH_DATE AS 생일 FROM PLAYER;

/*CONCATNATION : 연결, ||*/
SELECT PLAYER_NAME || '의 별명은 ' || NICKNAME || '이다' "자기 소개" FROM PLAYER;

/*LIKE : 포함된 문자열 값을 찾고 문자의 개수도 제한을 줄 수 있다
 * WHERE [컬럼명] LIKE '서식';
 * 
 * % : 모든것
 * _ : 글자수
 * 
 * 예)
 * %A : A로 끝나는 모든 것
 * A% : A로 시작하는 모든 것
 * %A% : A 포함
 * A__ : A로 시작하는 3글자
 * A_ : A로 시작하는 2글자
 * */

/*'천마'로 끝나는 팀 이름 찾기*/
SELECT *FROM TEAM
WHERE TEAM_NAME LIKE '%천마';

/*김씨 찾기*/
SELECT *FROM PLAYER
WHERE PLAYER_NAME LIKE '김%';

/*김씨 두자 찾기*/
SELECT *FROM PLAYER
WHERE PLAYER_NAME LIKE '김_';

/*김씨와 이씨 찾기*/
SELECT *FROM PLAYER
WHERE PLAYER_NAME LIKE '김%' OR PLAYER_NAME LIKE '이%';

/*이씨가 아닌 사람 찾기*/
SELECT *FROM PLAYER
WHERE NOT PLAYER_NAME LIKE '이%';

/*
 * 집계 함수 : 결과 행 1개
 * 
 * *주의사항 : NULL은 포함시키지 않는다, WHERE절에서 사용 불가
 * 
 * 평균 : AVG()
 * 최대값 : MAX()
 * 최소값 : MIN()
 * 총 합 : SUM()
 * 개수 : COUNT()
 * */
SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COUNT(HEIGHT) FROM PLAYER;

/*PLAYER 테이블에서 HEIGHT 개수 검색(NULL 포함시켜서 COUNT하기)*/
SELECT COUNT(NVL(HEIGHT, 0)) FROM PLAYER;

/*정렬
 * 
 * ORDER BY 컬럼명, ...ASC : 오름 차순
 * ORDER BY 컬럼명, ...DESC : 내림 차순
 * 
 */
 
 SELECT * FROM PLAYER
 ORDER BY HEIGHT ASC;
 
 SELECT * FROM PLAYER
 WHERE HEIGHT IS NOT NULL
 ORDER BY HEIGHT DESC;
 
SELECT * FROM PLAYER
 WHERE HEIGHT IS NOT NULL
 ORDER BY HEIGHT DESC, WEIGHT DESC;
 
/*GROUP BY : ~별(예 : 포지션 별 평균 키)
 * 
 * GROUP BY 컬럼명 HAVING 조건식
 * *WHERE절에 우선적으로 처리할 조건식을 작성해야 속도가 빠르다
 */

 /*PLAYER 테이블에서 포지션 종류 검색*/
SELECT "POSITION" FROM PLAYER
GROUP BY "POSITION";

/*PLATER 테이블에서 몸무게가 80이상인 선수들의 평균 키가 180이상인 포지션 검색*/
SELECT "POSITION" FROM PLAYER
WHERE WEIGHT >= 80
GROUP BY "POSITION"
HAVING AVG(HEIGHT) >= 180;

