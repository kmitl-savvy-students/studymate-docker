CREATE SCHEMA IF NOT EXISTS user_management;

CREATE TABLE IF NOT EXISTS user_management."user" (
    "Id" VARCHAR(8) NOT NULL PRIMARY KEY,
    "Password" VARCHAR(64) NOT NULL,
    "Gender" VARCHAR(6) NULL CHECK ("Gender" IN ('MALE', 'FEMALE', 'UNSPECIFIED')),
    "NameNick" VARCHAR(256) NULL,
    "NameFirst" VARCHAR(256) NULL,
    "NameLast" VARCHAR(256) NULL
);

CREATE TABLE IF NOT EXISTS user_management."signin_token" (
    "Id" VARCHAR(64) NOT NULL PRIMARY KEY,
    "UserId" VARCHAR(8) NOT NULL REFERENCES  user_management."user"("Id"),
    "TimeCreated" TIMESTAMP NOT NULL,
    "TimeExpired" TIMESTAMP NOT NULL
);