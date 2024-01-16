/*
 * SUB QUERY
 * 
 * FROM절 : IN LINE VIEW
 * SELECT절 : SCALAR
 * WHERE절 : SUB QUERY
 * */

/*PLAYER 테이블에서 전체 평균 키와 포지션별 평균 키 구하기*/
SELECT "POSITION", AVG(HEIGHT), (SELECT AVG(HEIGHT) FROM PLAYER)
FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

SELECT * FROM PLAYER
(
	SELECT * FROM PLAYER
	WHERE TEAM_NAME 'K01'
)
WHERE "POSITION" = 'GK';

/*PLAYER 테이블에서 평균 몸무게보다 더 많이 나가는 선수들 검색, SUB QUERY*/
SELECT * FROM PLAYER
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);

/*
 * SQL 실행 순서
 * 
 * FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
 * */

/*PLAYER 테이블에서 정남일 선수가 소속된 팀의 선수들 조회*/
SELECT * FROM PLAYER
WHERE TEAM_ID =
(
	SELECT TEAM_ID FROM PLAYER
	WHERE PLAYER_NAME = '정남일'
);

/*PLAYER 테이블에서 평균 키보다 작은 선수 검색*/
SELECT AVG(HEIGHT) FROM PLAYER;

SELECT * FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER);

/*SCHEDULE 테이블에서 경기 일정이 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회*/
SELECT * FROM STADIUM;
WHERE STADIUM_ID IN 
(
	SELECT STADIUM_ID FROM SCHEDULE
	WHERE SCHE_DATE BETWEEN '20120501' AND '20120502'
);

/*TCL 버튼 클릭하여 AUTO에서 NONE으로 변경, 아래 실습 후 반드시 롤백 진행*/

/*PLAYER 테이블에서 NICKNAME이 NULL인 선수들을 정태민 선수의 닉네임으로 바꾸기*/
UPDATE PLAYER
SET NICKNAME =
(
	SELECT NICKNAME FROM PLAYER
	WHERE PLAYER_NAME = '정태민'
)
WHERE NICKNAME IS NULL;

/*EMPLOYEES 테이블에서 평균 급여보다 낮은 사원들의 급여를 20% 인상*/
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY FROM EMPLOYEES);

SELECT AVG(SALARY FROM EMPLOYEES);

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.2
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

/*PLAYER 테이블에서 평균 키보다 큰 선수들을 삭제*/
SELECT * FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

DELETE FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

/*
 * ROWNUM
 * 결과 행 앞에 1부터 1씩 증가하는 시퀀스를 붙여준다.
 * */
SELECT ROWNUM, E.* FROM EMPLOYEES E;

/*EMP 테이블에서 SAL을 내림차순으로 정렬한 후 ROWNUM을 붙여서 조회한다*/
SELECT ROWNUM, E.* FROM
(SELECT * FROM EMP
ORDER BY SAL DESC) E;

 /* 연봉 1위부터 5위까지 조회한다 */
SELECT ROWNUM R, E.* FROM
(SELECT ROWNUM R * FROM EMP
ORDER BY SAL DESC) E
WHERE ROWNUM BETWEEN 1 AND 5;

/*JOIN*/
/*EMP 테이블에서 사원번호로 DEPT 테이블의 지역 검색*/
SELECT * FROM EMP; 
SELECT * FROM DEPT;

SELECT E.ENAME, LOC FROM DEPT D JOIN EMP E;
ON D.DEPTNO = E.DEPTNO;

/*PLAYER 테이블에서 송종국 선수가 속한 팀의 전화번호 검색하기*/
SELECT COUNT(*) FROM PLAYER;
SELECT COUNT(*) FROM TEAM;

SELECT TEAM_NAME, TEL FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID AND P.PLAYER_NAME = '송종국';

/*JOBS 테이블에서 JOB_ID로 직원들의 JOB_TITLE, EMAIL, 성, 이름 검색*/
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;

SELECT JOB_TITLE, EMAIL, E.LAST_NAME, E.FIRST_NAME
FROM JOBS J JOIN EMPLOYEES
ON J.JOB_ID = E.JOB_ID;

/*EMPLOYEES 테이블에서 HIREDATE가 2003~2005년가지인 사원의 정보와 부서명 검색*/
SELECT E.LAST_NAME || '' || E.FIRST_NAME NAME, DEPARTMENT_NAME
FROM DEPARTMENT D JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID AND E.HIRE_DATE BETWEEN '20030101' AND '20051231';

/*EMP 테이블에서 ENAME에 'L'이 있는 사원들의 DNAME과 LOC 검색*/
SELECT E.ENAME, DNAME, LOC FROM DEPT D JOIN EMP E
ON D.DEPTNO = E.DEPTNO AND E.ENAME LIKE '&L&';
