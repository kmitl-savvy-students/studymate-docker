CREATE SCHEMA IF NOT EXISTS public;

SET session_replication_role = 'replica';

DROP TABLE IF EXISTS public."transcript_data";
DROP TABLE IF EXISTS public."transcript";
DROP TABLE IF EXISTS public."user_token";
DROP TABLE IF EXISTS public."user";

DROP TABLE IF EXISTS public."curriculum";
DROP TABLE IF EXISTS public."curriculum_group";
DROP TABLE IF EXISTS public."curriculum_subgroup";
DROP TABLE IF EXISTS public."curriculum_subject";
DROP TABLE IF EXISTS public."gened_group";
DROP TABLE IF EXISTS public."gened_subject";

DROP TABLE IF EXISTS public."subject";

SET session_replication_role = 'origin';

CREATE TABLE IF NOT EXISTS public."curriculum" (
    "id" SERIAL PRIMARY KEY,
    "unique_id" VARCHAR(4) NOT NULL,
    "year" VARCHAR(4) NOT NULL,
    "name_th" VARCHAR(256) NOT NULL,
    "name_en" VARCHAR(256) NOT NULL,
    "degree_name_th" VARCHAR(256) NOT NULL,
    "degree_name_th_short" VARCHAR(128) NOT NULL,
    "degree_name_en" VARCHAR(256) NOT NULL,
    "degree_name_en_short" VARCHAR(128) NOT NULL
);
CREATE TABLE IF NOT EXISTS public."curriculum_group" (
    "category_id" smallint NOT NULL,
    "group_id" smallint NOT NULL,
    "unique_id" varchar(4) NOT NULL,
    "year" varchar(4) NOT NULL,
    "group_name" varchar(200) NOT NULL,
    "credit1" smallint NOT NULL,
    "credit2" smallint NOT NULL,
    "subgroup_flag" varchar(1) NOT NULL,
    "condition" varchar(2) NOT NULL,
    "link" varchar(50) NOT NULL,
    PRIMARY KEY ("category_id", "group_id", "unique_id", "year")
);
CREATE TABLE IF NOT EXISTS public."curriculum_subgroup" (
    "category_id" smallint NOT NULL,
    "group_id" smallint NOT NULL,
    "subgroup_id" smallint NOT NULL,
    "unique_id" varchar(4) NOT NULL,
    "year" varchar(4) NOT NULL,
    "subgroup_name" varchar(200) NOT NULL,
    "credit1" smallint NOT NULL,
    "credit2" smallint NOT NULL,
    "condition" varchar(2) NOT NULL,
    "link" varchar(50) NOT NULL,
    PRIMARY KEY ("category_id", "group_id", "subgroup_id", "unique_id", "year")
);
CREATE TABLE IF NOT EXISTS public."curriculum_subject" (
    "subject_id" varchar(8) NOT NULL,
    "category_id" smallint NOT NULL,
    "group_id" smallint NOT NULL,
    "subgroup_id" smallint NOT NULL,
    "unique_id" varchar(4) NOT NULL,
    "year" varchar(4) NOT NULL,
    "normal_flag" varchar(1) NOT NULL,
    "coop_flag" varchar(1) NOT NULL,
    PRIMARY KEY ("subject_id", "category_id", "group_id", "subgroup_id", "unique_id", "year")
);
CREATE TABLE IF NOT EXISTS public."gened_group" (
    "id" varchar(2) PRIMARY KEY,
    "group_name" varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS public."gened_subject" (
    "subject_id" varchar(8) NOT NULL,
    "group_id" varchar(2) NOT NULL,
    PRIMARY KEY ("subject_id", "group_id")
);
CREATE TABLE IF NOT EXISTS public."subject" (
    "subject_id" varchar(8) PRIMARY KEY,
    "subject_tname" varchar(128) NOT NULL,
    "subject_ename" varchar(128) NOT NULL,
    "credit" integer NOT NULL,
    "lect_hr" integer NOT NULL,
    "prac_hr" integer NOT NULL,
    "prerequisite" varchar(8) NOT NULL,
    "detail" text NOT NULL,
    "self_hr" integer NOT NULL,
    "prerequisite2" varchar(8) NOT NULL,
    "lock_ed" smallint NOT NULL,
    "precondition" smallint NOT NULL,
    "status" varchar(1) NOT NULL,
    "subject_type" varchar(1) NOT NULL,
    "prerequisite3" varchar(8) NOT NULL,
    "prerequisite4" varchar(8) NOT NULL,
    "prerequisite5" varchar(8) NOT NULL,
    "last_modified" timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS public."user" (
    "id" VARCHAR(8) NOT NULL PRIMARY KEY,
    "password" VARCHAR(64) NOT NULL,
    "name_nick" VARCHAR(256) NOT NULL,
    "name_first" VARCHAR(256) NOT NULL,
    "name_last" VARCHAR(256) NOT NULL,
    "profile" VARCHAR(256) NOT NULL,
    "curriculum_id" INT,
    CONSTRAINT fk_user_curriculum
        FOREIGN KEY ("curriculum_id")
        REFERENCES public."curriculum" ("id")
);
CREATE TABLE IF NOT EXISTS public."user_token" (
    "id" VARCHAR(64) NOT NULL PRIMARY KEY,
    "user_id" VARCHAR(8) NOT NULL,
    "created" TIMESTAMP NOT NULL,
    "expired" TIMESTAMP NOT NULL,
    CONSTRAINT fk_usertoken_user
        FOREIGN KEY ("user_id")
        REFERENCES public."user" ("id")
);

CREATE TABLE IF NOT EXISTS public."transcript" (
    "id" SERIAL PRIMARY KEY,
    "user_id" VARCHAR(8) NOT NULL,
    "curriculum_id" INT NOT NULL,
    "created" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_transcript_curriculum
        FOREIGN KEY ("curriculum_id")
        REFERENCES public."curriculum" ("id"),
    CONSTRAINT fk_transcript_user
        FOREIGN KEY ("user_id")
        REFERENCES public."user" ("id")
);
CREATE TABLE IF NOT EXISTS public."transcript_data" (
    "id" SERIAL PRIMARY KEY,
    "transcript_id" INT NOT NULL,
    "subject_id" VARCHAR(8) NOT NULL,
    "semester" INT NOT NULL,
    "year" INT NOT NULL,
    "grade" VARCHAR(4) NOT NULL,
    "credit" INT NOT NULL,
    CONSTRAINT fk_transcriptdata_transcript
        FOREIGN KEY ("transcript_id")
        REFERENCES public."transcript" ("id")
);
