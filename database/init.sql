-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL
);

CREATE TABLE "employees" (
    "id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR (100) NOT NULL,
    "last_name" VARCHAR (100) NOT NULL,
    "suffix" VARCHAR (10)
);

CREATE TABLE "pay_band" (
    "id" SERIAL PRIMARY KEY,
    "max_step",
    "min_pay",
    "max_pay"
);

-- RELATIONAL TABLES

CREATE TABLE "position" (
    "id" SERIAL PRIMARY KEY,
    "position_title",
    "pay_band_id"
);

CREATE TABLE "teams" (
    "id" SERIAL PRIMARY KEY,
    "team_name",
    "manager_id"
);

-- JUNCTION TABLES

CREATE TABLE "employees_position" ();

CREATE TABLE "position_pay_band" ();

CREATE TABLE "employees_teams" ();