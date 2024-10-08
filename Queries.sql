use org;

-- 1 Write a SQL Query to fetch 'FirstName' from Worker Table using the alias name as <Worker_Name>.
Select FirstName as Worker_Name from Worker;

-- 2 Write a SQL Query to fetch 'FirstName' from Worker Table in Upper Case
SELECT UPPER(FirstName) from Worker; 

-- 3 Write a SQL Query to fetch Unique values of Department from Worker Table
SELECT DISTINCT Department from Worker;

-- 4 Write a SQL Query to fetch first three characters of First_name from Worker table
SELECT substring(FirstName,1,3) FROM Worker;

-- 5 Write a SQL Query to find the position of the alphabet ('b') in the first name column 'Amitabh' from Worker Table
SELECT INSTR(FirstName , 'b') from Worker WHERE FirstName='Amitabh';

-- 6 Write a SQL Query to print firstname from worker table after removing all the white spaces from right side
SELECT RTRIM(firstName) FROM Worker;

-- 7 Write a SQL Query to print firstname from worker table after removing all the white spaces from left side
SELECT LTRIM(firstName) FROM Worker;

-- 8 Write a SQL Query that fetches the Unique values of Department from Worker Table and print its length
SELECT DISTINCT Department,LENGTH(Department) FROM Worker; 

-- 9 Write a SQL Query to print the FirstName from Worker Table after replacing 'a' with 'A'
SELECT REPLACE(FirstName , 'a' , 'A') FROM Worker;

-- 10 Write a SQL Query to print the firstname and lastname from worker table into a single column CompleteName
SELECT CONCAT(FirstName, " " , LastName) FROM Worker AS CompleteName;

-- 11 Write a SQL Query to print all worker details from Worker table order by first name Ascending
SELECT * FROM Worker ORDER BY FirstName ASC;

-- 12 Write a SQL Query to print all worker details from worker table order by first name ascending and department ascending
SELECT * FROM Worker ORDER BY FirstName ASC , Department DESC;

-- 13 Write a SQL Query to print details of workers with the first name as 'Vipul' and 'Satish' from worker table
SELECT * FROM Worker WHERE FirstName IN ('Vipul' , 'Satish');

-- 14 Write a SQL Query to print details of Workers excluding First names , "Vipul" , and "Satish" from Worker table
SELECT * FROM Worker WHERE FirstName  NOT IN ('Vipul' , 'Satish');

-- 15 Write a SQL Query to print details of Worker with department name as 'Admin*'
SELECT * FROM Worker WHERE Department LIKE 'admin%';

-- 16 Write a SQL Query to print details of Workers whose first name contains 'a'
SELECT * FROM Worker WHERE firstname LIKE '%a%';

-- 17 Write a SQL Query to print details of Workers whose first name ends with 'a'
SELECT * FROM Worker WHERE firstname LIKE '%a';

-- 18 Write a SQL Query to print details of workers whose FirstName ends with 'h' and contains six alphabets
SELECT * FROM Worker WHERE Firstname LIKE '_____h';

-- 19 Write a SQL Query to print details of workers whose salary lies between 100000 and 500000
SELECT * FROM Worker where Salary between 100000 and 500000;

-- 20 Write a SQL Query to print details of Workers who have joined in Feb'2014
SELECT * FROM Worker WHERE Year(joiningdate)=2014 and Month(JoiningDate)=02;

-- 21 Write a SQL Query to fetch the count of Employees working in Department 'Admin'
SELECT Department , COUNT(WorkerId) FROM Worker WHERE Department='Admin';

-- 22 Write a SQL Query to fetch worker full names with salaries >=50000 and <=100000
SELECT CONCAT(FirstName , " " , LastName) , Salary FROM Worker WHERE Salary BETWEEN 50000 and 100000;

-- 23 Write a SQL Query to count the number of Workers for each department in descending order
SELECT Department , COUNT(WorkerId) FROM Worker GROUP BY DEPARTMENT ORDER BY COUNT(WorkerId) DESC;

-- 24 Write a SQL Query to print details of Workers who are also managers
SELECT DISTINCT w.* , t.WorkTitle FROM Worker AS w RIGHT JOIN Title as t ON t.worker_ref_id=w.workerid WHERE t.WorkTitle='Manager'; 

-- 25 Write a SQL Query to fetch number of Different titles in the Organisation
SELECT DISTINCT WorkTitle , COUNT(WorkTitle) FROM Title GROUP BY Worktitle;

-- 26 Write a SQL Query to show only odd rows from a table
SELECT * FROM Worker WHERE MOD(WorkerId , 2)!=0;

-- 27 Write a SQL Query to show only even rows from a table
SELECT * FROM Worker WHERE MOD(WorkerId , 2)=0;

-- 28 Write a SQL Query to clone a new table with other table
CREATE TABLE WorkerClone LIKE Worker;
INSERT INTO WorkerClone SELECT * FROM Worker;
SELECT * FROM WorkerClone;

-- 29 Write a SQL Query to fetch intersecting records of two tables
-- Intersecting records are the ones that have same values in two tables
SELECT w.* , b.* FROM Worker AS w INNER JOIN Bonus AS b ON w.WorkerId=b.Worker_ref_id; 

-- 30 Write a SQL Query to show records from one table that other table does not have
SELECT * FROM Worker WHERE WorkerId NOT IN (SELECT Worker_ref_id FROM Bonus);

-- 31 Write a SQL Query to show current Date and Time
SELECT curdate();
SELECT now();

-- 32 Write a SQL Query to show to top n (say 5) records of a table order by descending order
SELECT * FROM Worker ORDER BY WorkerId DESC LIMIT 5 ;

-- 33 Write a SQL Query to determine the nth (say n=5) highest salary from a table
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 4,1 ;

-- 34 

-- 35 Write a SQL Query to fetch the list of Employees with the same salary
SELECT * FROM Worker w1 , Worker w2 WHERE w1.Salary=w2.Salary;

-- 36 Write a SQL Query to show the second highest salary from a table
SELECT WorkerId,Salary FROM Worker ORDER BY Salary DESC LIMIT 1,1; 

-- 37 Write a SQL Query to show one row twice in results from a table
SELECT * FROM Worker UNION ALL SELECT * FROM Worker ORDER BY WorkerId;

-- 38 Write a SQL Query to list worker id who does not get bonus
SELECT * FROM Worker WHERE WorkerId NOT IN (SELECT Worker_ref_id FROM Bonus);

-- 39 Write a SQL Query to fetch the first 50% records from a table
SELECT * FROM Worker WHERE WorkerId <= (SELECT COUNT(WorkerId)/2 FROM Worker);

-- 40 Write a SQL Query to fetch the departments that have less than 4 people in it 
SELECT Department , COUNT(Department) FROM Worker GROUP BY Department HAVING COUNT(Department)<4;

-- 41 Write a SQL Query to show all departments along with the number of people in there
SELECT Department , COUNT(Department) AS DepCount FROM Worker GROUP BY Department;

-- 42 Write a SQL Query to show the last record from a Table
SELECT * FROM Worker WHERE WorkerId=(SELECT max(WorkerId) FROM Worker);

-- 43 Write a SQL Query to show the first row from a Table
SELECT * FROM Worker WHERE WorkerId=(SELECT min(WorkerId) FROM Worker);

-- 44 Write a SQL Query to fetch last five records from a table
(SELECT * FROM Worker ORDER BY WorkerId DESC LIMIT 5) ORDER BY WorkerId;

-- 45 Write a SQL Query to print name of Employees having highest salary in each department
(SELECT MAX(Salary) , Department FROM Worker Group BY Department) ORDER BY MAX(Salary);

-- 46 Write a SQL Query to fetch three max salaries from a table
SELECT Salary , FirstName FROM Worker ORDER BY Salary DESC LIMIT 3; 
