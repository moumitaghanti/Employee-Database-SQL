---Data Engineering

-- Drop Tables if Existing
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/z2Ek26
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Logical ERD
CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_Emp (
    emp_no Integer   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date Date   NOT NULL,
    to_date Date   NOT NULL
);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no Integer   NOT NULL,
    from_date Date   NOT NULL,
    to_date Date   NOT NULL
);

CREATE TABLE Employees (
    emp_no Integer   NOT NULL,
    birth_date Date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date Date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no Integer   NOT NULL,
    salary Integer   NOT NULL,
    from_date Date   NOT NULL,
    to_date Date   NOT NULL
);

CREATE TABLE Titles (
    emp_no Integer   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date Date   NOT NULL,
    to_date Date   NOT NULL
);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


--Query from the tables generated
SELECT * FROM Departments;
SELECT * FROM Dept_Emp;
SELECT * FROM Dept_Manager;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Titles;


--selection from salaries and title
select   t.title as Titles, avg(s.salary) as avg_salary
from Salaries s join Titles t
on s.emp_no =t.emp_no
group by Titles;