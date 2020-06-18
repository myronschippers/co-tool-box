-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(80) UNIQUE NOT NULL,
    "password" VARCHAR(1000) NOT NULL
);

CREATE TABLE "employees" (
    "id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "suffix" VARCHAR(10)
);

CREATE TABLE "position" (
    "id" SERIAL PRIMARY KEY,
    "position_title" VARCHAR(60) NOT NULL
);

CREATE TABLE "pay_band" (
    "id" SERIAL PRIMARY KEY,
    "max_step" INT,
    "min_pay" NUMERIC(9, 2) NOT NULL,
    "max_pay" NUMERIC(9, 2)
);

CREATE TABLE "department" (
    "id" SERIAL PRIMARY KEY,
    "department_name" VARCHAR(60) NOT NULL,
    "business_sector" VARCHAR(100)
);

CREATE TABLE "access_levels" (
    "id" SERIAL PRIMARY KEY,
    "level" INT NOT NULL,
    "label" VARCHAR(2) NOT NULL
);

-- RELATIONAL TABLES

CREATE TABLE "teams" (
    "id" SERIAL PRIMARY KEY,
    "team_name" VARCHAR(80) NOT NULL,
    "manager_id" INT REFERENCES "employees"
);

CREATE TABLE "annual_review" (
    "id" SERIAL PRIMARY KEY,
    "employee_id" INT REFERENCES "employees" NOT NULL,
    "manager_id" INT REFERENCES "employees" NOT NULL,
    "date_started" DATE,
    "date_completed" DATE,
    "final_score" INT
);

-- JUNCTION TABLES

CREATE TABLE "employees_position" (
    "id" SERIAL PRIMARY KEY,
    "employee_id" INT REFERENCES "employees",
    "position_id" INT REFERENCES "position"
);

CREATE TABLE "position_pay_band" (
    "id" SERIAL PRIMARY KEY,
    "position_id" INT REFERENCES "position",
    "pay_id" INT REFERENCES "pay_band"
);

CREATE TABLE "employees_teams" (
    "id" SERIAL PRIMARY KEY,
    "employee_id" INT REFERENCES "employees",
    "team_id" INT REFERENCES "teams"
);

CREATE TABLE "employees_access" (
    "id" SERIAL PRIMARY KEY,
    "employee_id" INT REFERENCES "employees",
    "access_level_id" INT REFERENCES "access_levels"
);