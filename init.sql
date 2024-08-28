CREATE SCHEMA IF NOT EXISTS user_management;

CREATE TABLE IF NOT EXISTS user_management."user" (
    "Id" VARCHAR(8) PRIMARY KEY,
    "Username" VARCHAR(64) NOT NULL
);