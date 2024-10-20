CREATE SCHEMA IF NOT EXISTS public;

-- USER TABLES
CREATE TABLE IF NOT EXISTS public."User" (
    "Id" VARCHAR(8) NOT NULL PRIMARY KEY,
    "Password" VARCHAR(64) NOT NULL,
    "Gender" VARCHAR(6) NOT NULL,
    "NameNick" VARCHAR(256) NOT NULL,
    "NameFirst" VARCHAR(256) NOT NULL,
    "NameLast" VARCHAR(256) NOT NULL
);
CREATE TABLE IF NOT EXISTS public."UserToken" (
    "Id" VARCHAR(64) NOT NULL PRIMARY KEY,
    "UserId" VARCHAR(8) NOT NULL REFERENCES public."User"("Id"),
    "Created" TIMESTAMP NOT NULL,
    "Expired" TIMESTAMP NOT NULL
);

-- CURRICULUM TABLES
CREATE TABLE IF NOT EXISTS public."Curriculum" (
    "Id" VARCHAR(4) NOT NULL,
    "Year" VARCHAR(4) NOT NULL,
    "Name" VARCHAR(256) NOT NULL,
    "NameEng" VARCHAR(256) NOT NULL,
    "Degree" VARCHAR(256) NOT NULL,
    "DegreeShort" VARCHAR(128) NOT NULL,
    "DegreeEng" VARCHAR(256) NOT NULL,
    "DegreeEngShort" VARCHAR(128) NOT NULL
);

-- POPULATE DATA
INSERT INTO public."Curriculum" ("Id", "Year", "Name", "NameEng", "Degree", "DegreeShort", "DegreeEng", "DegreeEngShort") VALUES
('0155', '2565', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (หลักสูตรนานาชาติ)', 'Bachelor of Engineering Program in Computer Engineering (International Program)', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0132', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ภาคปกติ)', 'Bachelor of Engineering Program in Computer Engineering ', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('1182', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'B.Eng. (Computer Engineering)'),
('0132', '2560', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ภาคปกติ)', 'Bachelor of Engineering Program in Computer Engineering (Continuing Education)', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2554', 'วิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Curriculum for Bachelor of Engineering Program in Computer', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2552', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2546', 'วิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Curriculum for Bachelor of Engineering Program in Computer', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)');