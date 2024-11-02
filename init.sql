CREATE SCHEMA IF NOT EXISTS public;

SET session_replication_role = 'replica';

DROP TABLE IF EXISTS public."transcript_data";
DROP TABLE IF EXISTS public."transcript";
DROP TABLE IF EXISTS public."user_token";
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public."curriculum";

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

CREATE TABLE IF NOT EXISTS public."user" (
    "id" VARCHAR(8) NOT NULL PRIMARY KEY,
    "password" VARCHAR(64) NOT NULL,
    "gender" VARCHAR(6) NOT NULL,
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

INSERT INTO public."curriculum" ("id", "unique_id", "year", "name_th", "name_en", "degree_name_th", "degree_name_th_short", "degree_name_en", "degree_name_en_short") VALUES
('1', '0155', '2565', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (หลักสูตรนานาชาติ)', 'Bachelor of Engineering Program in Computer Engineering (International Program)', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('2', '0105', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('3', '0132', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ภาคปกติ)', 'Bachelor of Engineering Program in Computer Engineering ', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('4', '1182', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('5', '0132', '2560', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ภาคปกติ)', 'Bachelor of Engineering Program in Computer Engineering (Continuing Education)', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('6', '0105', '2554', 'วิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Curriculum for Bachelor of Engineering Program in Computer', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('7', '0105', '2552', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('8', '0105', '2546', 'วิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Curriculum for Bachelor of Engineering Program in Computer', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)');