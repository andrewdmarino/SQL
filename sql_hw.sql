CREATE TABLE "EMPLOYEE" (
    "emp_no" INT  NOT NULL,
    "emp_title" VARCHAR(40)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    UNIQUE (emp_no),
	CONSTRAINT "pk_EMPLOYEE" PRIMARY KEY (
        "emp_no")
);

CREATE TABLE "DEPT" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(10)   NOT NULL
);

CREATE TABLE "DEPT_EMP" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(30) NOT NULL
);

CREATE TABLE "DEPT_MGR" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "SALARIES" (
    "emp_no_" INT   NOT NULL,
    "salary" DOUBLE PRECISION   NOT NULL
);

CREATE TABLE "TITLE_ID" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL
);

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "fk_EMPLOYEE_emp_no" FOREIGN KEY("emp_no")
REFERENCES "SALARIES" ("emp_no_");

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "fk_EMPLOYEE_emp_title" FOREIGN KEY("emp_title")
REFERENCES "TITLE_ID" ("title_id");

ALTER TABLE "DEPT" ADD CONSTRAINT "fk_DEPT_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPT_MGR" ("dept_no");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEE" ("emp_no");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPT" ("dept_no");