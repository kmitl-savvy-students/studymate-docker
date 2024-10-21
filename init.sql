CREATE SCHEMA IF NOT EXISTS public;

CREATE TABLE IF NOT EXISTS public."User" (
    "Id" VARCHAR(8) NOT NULL PRIMARY KEY,
    "Password" VARCHAR(64) NOT NULL,
    "Gender" VARCHAR(6) NOT NULL,
    "NameNick" VARCHAR(256) NOT NULL,
    "NameFirst" VARCHAR(256) NOT NULL,
    "NameLast" VARCHAR(256) NOT NULL,
    "Profile" VARCHAR(256) NOT NULL,
);
CREATE TABLE IF NOT EXISTS public."UserToken" (
    "Id" VARCHAR(64) NOT NULL PRIMARY KEY,
    "UserId" VARCHAR(8) NOT NULL,
    "Created" TIMESTAMP NOT NULL,
    "Expired" TIMESTAMP NOT NULL,
    CONSTRAINT fk_user
        FOREIGN KEY ("UserId")
        REFERENCES public."User" ("Id")
);

CREATE TABLE public."Curriculum" (
    "Id" SERIAL PRIMARY KEY,              
    "UniqueId" VARCHAR(4) NOT NULL,     
    "Year" VARCHAR(4) NOT NULL,            
    "NameTh" VARCHAR(256),                
    "NameEn" VARCHAR(256),                 
    "DegreeNameTh" VARCHAR(256),            
    "DegreeNameThShort" VARCHAR(128),        
    "DegreeNameEn" VARCHAR(256),             
    "DegreeNameEnShort" VARCHAR(128),         
);

CREATE TABLE public."Transcript" (
    "Id" SERIAL PRIMARY KEY,            
    "UserId" VARCHAR(8) NOT NULL,           
    "CurriculumId" INT NOT NULL,            
    "Created" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_curriculum
        FOREIGN KEY ("CurriculumId")
        REFERENCES public."Curriculum" ("Id"),
    CONSTRAINT fk_user
        FOREIGN KEY ("UserId")
        REFERENCES public."User" ("Id"),
);
CREATE TABLE public."TranscriptData" (
    "Id" SERIAL PRIMARY KEY,                 
    "TranscriptId" INT NOT NULL,            
    "SubjectId" VARCHAR(8) NOT NULL,        
    "Grade" VARCHAR(4) NOT NULL,                    
    CONSTRAINT fk_transcript
        FOREIGN KEY ("TranscriptId")
        REFERENCES public."Transcript" ("Id"),
);

INSERT INTO public."Curriculum" ("Id", "Year", "Name", "NameEng", "Degree", "DegreeShort", "DegreeEng", "DegreeEngShort") VALUES
('0155', '2565', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (หลักสูตรนานาชาติ)', 'Bachelor of Engineering Program in Computer Engineering (International Program)', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0132', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ภาคปกติ)', 'Bachelor of Engineering Program in Computer Engineering ', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('1182', '2564', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'B.Eng. (Computer Engineering)'),
('0132', '2560', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ (ภาคปกติ)', 'Bachelor of Engineering Program in Computer Engineering (Continuing Education)', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2554', 'วิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Curriculum for Bachelor of Engineering Program in Computer', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2552', 'หลักสูตรวิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Bachelor of Engineering Program in Computer Engineering', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)'),
('0105', '2546', 'วิศวกรรมศาสตร์บัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์', 'Curriculum for Bachelor of Engineering Program in Computer', 'วิศวกรรมศาสตร์บัณฑิต (วิศวกรรมคอมพิวเตอร์)', 'วศ.บ. (วิศวกรรมคอมพิวเตอร์)', 'Bachelor of Engineering (Computer Engineering)', 'B.Eng. (Computer Engineering)');