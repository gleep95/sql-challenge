DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE "departments" (
	"dept_no" VARCHAR NOT NULL,
	"dept_name" VARCHAR NOT NULL,
	PRIMARY KEY ("dept_no")
);

CREATE TABLE "titles" (
	"title_id" VARCHAR NOT NULL,
	"title" VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);


CREATE TABLE "employees" (
	"emp_no" INT NOT NULL,
	"emp_title_id" VARCHAR NOT NULL,
	"birth_date" DATE NOT NULL,
	"first_name" VARCHAR NOT NULL,
	"last_name" VARCHAR NOT NULL,
	"sex" VARCHAR NOT NULL,
	"hire_date" DATE NOT NULL,
	PRIMARY KEY ("emp_no")
);
ALTER TABLE "employees" ADD CONSTRAINT "foreign_key_employees_title_id" FOREIGN KEY ("emp_title_id")
REFERENCES "titles" ("title_id");

CREATE TABLE "dept_emp" (
	"emp_no" INT NOT NULL,
	"dept_no" VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "foreign_key_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "foreign_key_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

CREATE TABLE "dept_manager" (
	"dept_no" VARCHAR NOT NULL,
	"emp_no" INT NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "foreign_key_mgr_dept_no" FOREIGN KEY ("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "foreign_key_mgr_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");



CREATE TABLE "salaries" (
	"emp_no" INT NOT NULL,
	"salary" INT NOT NULL,
	PRIMARY KEY (emp_no)
);

ALTER TABLE "salaries" ADD CONSTRAINT "foreign_key_salaries_emp_no" FOREIGN KEY ("emp_no")
REFERENCES "employees" ("emp_no");

COPY departments FROM 'C:\Temp\departments.csv' WITH CSV HEADER;
COPY titles FROM 'C:\Temp\titles.csv' WITH CSV HEADER;
COPY employees FROM 'C:\Temp\employees.csv' WITH CSV HEADER;
COPY dept_emp FROM 'C:\Temp\dept_emp.csv' WITH CSV HEADER;
COPY dept_manager FROM 'C:\Temp\dept_manager.csv' WITH CSV HEADER;
COPY salaries FROM 'C:\Temp\salaries.csv' WITH CSV HEADER;





