
DROP DATABASE IF EXISTS COMPANY_DB;
CREATE DATABASE COMPANY_DB;
USE COMPANY_DB;


CREATE TABLE DEPT (
    Deptno INT(2) NOT NULL PRIMARY KEY,
    Dname VARCHAR(14),
    Loc VARCHAR(13)
);


INSERT INTO DEPT (Deptno, Dname, Loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');


CREATE TABLE EMP (
    Empno INT(4) NOT NULL PRIMARY KEY,
    Ename VARCHAR(10),
    Job VARCHAR(9),
    Mgr INT(4),
    Hiredate DATE,
    Sal DECIMAL(7,2),
    Comm DECIMAL(7,2),
    Deptno INT(2),
    FOREIGN KEY (Deptno) REFERENCES DEPT(Deptno)
);


INSERT INTO EMP (Empno, Ename, Job, Mgr, Hiredate, Sal, Comm, Deptno) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-08-09', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-03-12', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);


CREATE TABLE STUDENT (
    Rno INT(2) NOT NULL PRIMARY KEY,
    Sname VARCHAR(14),
    City VARCHAR(20),
    State VARCHAR(20)
);


CREATE TABLE EMP_LOG (
    Emp_id INT(5) NOT NULL,
    Log_date DATE,
    New_salary INT(10),
    Action VARCHAR(20)
);


SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM STUDENT;
SELECT * FROM EMP_LOG;

#SELECT UNIQUE JOB FROM EMP TABLE
SELECT DISTINCT JOB
FROM EMP;

# 2. . List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT * FROM EMP  
ORDER BY DEPTNO AND JOB DESC;

#. Display all the unique job groups in the descending order?
SELECT DISTINCT JOB 
FROM emp
ORDER BY JOB DESC ;

# 4. List the emps who joined before 1981. 
SELECT * FROM EMP 
WHERE HIREDATE < "1981-01-01" ;

#5. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal

SELECT EMPNO,
	   ENAME,
       SAL,
       (SAL/30) AS DAILY_SAL,
       (SAL * 12) AS ANN_SAL
FROM EMP 
ORDER BY ANN_SAL ASC;

#6. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698. 

SELECT EMPNO,
	   ENAME,
       SAL,
       TIMESTAMPDIFF(YEAR,HIREDATE,CURDATE()) AS EXP
FROM EMP   
WHERE MGR = "7698" ;
SELECT * FROM EMP;

#7. Display all the details of the emps who’s Comm. Is more than their Sal?

SELECT * 
FROM EMP 
WHERE COMM > SAL;

# 8. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order. 

SELECT * 
FROM EMP  
WHERE JOB IN ("CLERK" ,"ANALYST")
ORDER BY JOB DESC;

# 9. List the emps Who Annual sal ranging from 2000 and 4500. 

SELECT * 
FROM EMP  
WHERE SAL between 2000 AND 4500;

# 10. List the Enames those are starting with ‘S’ and with five characters.

SELECT ENAME
FROM EMP  
WHERE ENAME LIKE "S____"; 

# 11. List the emps whose Empno not starting with digit78.   
SELECT * 
FROM EMP  
WHERE EMPNO NOT LIKE "78%";

#12. List all the Clerks of Deptno 20. 
SELECT *
FROM EMP  
WHERE JOB = "CLERK" AND DEPTNO = 20;

#13. List the Emps who are senior to their own MGRS. 
SELECT 
    E.EMPNO AS EMP_NO,
    E.ENAME AS EMP_NAME,
    E.HIREDATE AS EMP_HIREDATE,
    M.EMPNO AS MGR_NO,
    M.ENAME AS MGR_NAME,
    M.HIREDATE AS MGR_HIREDATE
FROM EMP AS E
JOIN EMP AS M
    ON E.MGR = M.EMPNO
WHERE E.HIREDATE < M.HIREDATE;

#14. List the Emps of Deptno 20 who’s Jobs are same as Deptno10. 

SELECT E.EMPNO AS EMP_NO,
	   E.ENAME AS EMP_NAME,
       E.JOB AS JOB_TITLE,
     E.DEPTNO AS EMP_DEPT
FROM EMP AS E
JOIN EMP AS D
    ON E.JOB = D.JOB
WHERE E.DEPTNO = 20 AND D.DEPTNO = 10;


#15. List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal

SELECT EMPNO,
       ENAME,
       JOB,
       SAL    
FROM EMP    
WHERE SAL IN(
		SELECT SAL  
        FROM EMP 
        WHERE ENAME IN("FORD","SMITH")
)
ORDER BY SAL DESC;

# 16 .List the emps whose jobs same as SMITH or ALLEN. 

SELECT EMPNO,
	   ENAME,
       JOB
FROM EMP 
WHERE JOB IN(
			SELECT JOB
            FROM EMP 
            WHERE ENAME IN ("SMITH" , "ALLEN")
);

#17.Any jobs of deptno 10 those that are not found in deptno 20. 
SELECT DISTINCT JOB
FROM EMP  
WHERE DEPTNO = 10
	AND JOB NOT IN (
    SELECT JOB 
    FROM EMP 
    WHERE DEPTNO = 20);
    
#18. Find the highest sal of EMP table. 

SELECT MAX(SAL) AS HIGHEST_SALARY FROM EMP;

# 19. Find details of highest paid employee. 
SELECT * FROM EMP   
WHERE  SAL = (SELECT MAX(SAL) FROM EMP);

#20 . Find the total sal given to the MGR. 
SELECT MGR,
	   SUM(SAL) AS TOTAL_SAL
FROM EMP   
GROUP BY MGR ;

#21. List the emps whose names contains ‘A’.
SELECT ENAME 
FROM EMP   
WHERE ENAME LIKE "%A%";

# 22. Find all the emps who earn the minimum Salary for each job wise in ascending order. 
SELECT ENAME,
        JOB,
        SAL
FROM EMP  
WHERE (JOB,SAL) IN (
			SELECT JOB,MIN(SAL) FROM EMP 
GROUP BY ENAME,JOB)
ORDER BY JOB ASC;

#23. List the emps whose sal greater than Blake’s sal. 
SELECT * FROM EMP 
WHERE SAL > (SELECT SAL FROM EMP 
				WHERE ENAME  = "BLAKE" );

#24. Create view v1 to select ename, job, dname, loc whose deptno are same. 
CREATE VIEW v1 AS
SELECT E.ENAME, E.JOB, D.DNAME, D.LOC
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
#25. Create a procedure with dno as input parameter to fetch ename and dname. 
DELIMITER $$

CREATE PROCEDURE GetEmpByDept(IN dno INT)
BEGIN
    SELECT E.ENAME, D.DNAME
    FROM EMP E
    JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    WHERE E.DEPTNO = dno;
END $$

DELIMITER ;

#26. Add column Pin with bigint data type in table student. 
ALTER TABLE student
ADD COLUMN Pin BIGINT;

#27. Modify the student table to change the sname length from 14 to 40. 
ALTER TABLE student
MODIFY COLUMN sname VARCHAR(40);

#Create trigger to insert data in emp_log table whenever any update of sal in EMP table. You can set action as ‘New Salary’.
DELIMITER $$

CREATE TRIGGER trg_emp_sal_update
AFTER UPDATE ON EMP
FOR EACH ROW
BEGIN
    IF OLD.SAL <> NEW.SAL THEN
        INSERT INTO emp_log(empno, old_sal, new_sal, action_time, action)
        VALUES (OLD.EMPNO, OLD.SAL, NEW.SAL, NOW(), 'New Salary');
    END IF;
END $$

DELIMITER ;

