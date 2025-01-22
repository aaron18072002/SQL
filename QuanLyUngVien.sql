﻿CREATE DATABASE [QuanLyUngVien]
CONTAINMENT = NONE
ON PRIMARY 
( 
    NAME = N'QuanLyUngVien_TSQL_FILE', 
    FILENAME = N'D:\SQL\QuanLyUngVien.mdf'
)
LOG ON
( 
    NAME = N'QuanLyUngVien_TSQL_FILE_LOG', 
    FILENAME = N'D:\SQL\QuanLyUngVien_LOG.ldf'
);

USE [QuanLyUngVien];

DROP TABLE IF EXISTS CANDIDATES_CERTIFICATES;

DROP TABLE IF EXISTS CERTIFICATES;

CREATE TABLE CERTIFICATES (
	certificateID VARCHAR(30),
	certificateName NVARCHAR(40),
	cerfificateRank NVARCHAR(30),
	certificateDate DATE,
	PRIMARY KEY (certificateID)
);

CREATE TABLE CANDIDATES (
	candidateID VARCHAR(30),
	fullName NVARCHAR(40),
	birthDay DATE,
	phone CHAR(10) UNIQUE,
	email VARCHAR(30),
	candidateType VARCHAR(30),
	PRIMARY KEY (candidateID)
);

CREATE TABLE CANDIDATES_CERTIFICATES (
	cd_cf_id INT IDENTITY(1,1),
	candidateID VARCHAR(30),
	certificateID VARCHAR(30),
	PRIMARY KEY (cd_cf_id)
);

ALTER TABLE CANDIDATES_CERTIFICATES
ADD CONSTRAINT fk_CANDIDATES_CERTIFICATES_CANDIDATES
FOREIGN KEY (candidateID) REFERENCES CANDIDATES(candidateID);
ALTER TABLE CANDIDATES_CERTIFICATES
ADD CONSTRAINT fk_CANDIDATES_CERTIFICATES_CERTIFICATES
FOREIGN KEY (certificateID) REFERENCES CERTIFICATES(certificateID);

CREATE TABLE EXPERIENCES (
	experienceID VARCHAR(30),
	expInYear INT, 
	PRIMARY KEY (experienceID)
);

CREATE TABLE PROSKILLS (
	proSkillID VARCHAR(30),
	proSkillName NVARCHAR(30), 
	PRIMARY KEY (proSkillID)
);

CREATE TABLE PROSKILLS_EXPERIENCES (
	pk_e_id INT IDENTITY(1,1),
	proSkillID VARCHAR(30),
	experienceID VARCHAR(30),
	PRIMARY KEY (pk_e_id)
);

ALTER TABLE EXPERIENCES
ADD CONSTRAINT fk_EXPERIENCES_CANDIDATES
FOREIGN KEY (experienceID) REFERENCES CANDIDATES(candidateID);

ALTER TABLE PROSKILLS_EXPERIENCES
ADD CONSTRAINT fk_PROSKILLS_EXPERIENCES_EXPERIENCES
FOREIGN KEY (experienceID) REFERENCES EXPERIENCES(experienceID);
ALTER TABLE PROSKILLS_EXPERIENCES
ADD CONSTRAINT fk_PROSKILLS_EXPERIENCES_PROSKILLS
FOREIGN KEY (proSkillID) REFERENCES PROSKILLS(proSkillID);

CREATE TABLE FRESHERS (
	fresherID VARCHAR(30),
	graduationDate DATE,
	graduationRank NVARCHAR(30),
	PRIMARY KEY (fresherID)
)

ALTER TABLE FRESHERS
ADD CONSTRAINT fk_FRESHERS_CANDIDATES
FOREIGN KEY (fresherID) REFERENCES CANDIDATES(candidateID);

CREATE TABLE INTERNS (
	internID VARCHAR(30),
	major NVARCHAR(30),
	semester NVARCHAR(30),
	universityName NVARCHAR(30),
	PRIMARY KEY (internID)
)

ALTER TABLE INTERNS
ADD CONSTRAINT fk_INTERNS_CANDIDATES
FOREIGN KEY (internID) REFERENCES CANDIDATES(candidateID);

ALTER TABLE CERTIFICATES
DROP CONSTRAINT UQ_CERTIFICATES_certificateName;
INSERT INTO CERTIFICATES(certificateID,certificateName,cerfificateRank,certificateDate)
VALUES ('CC01',N'Chứng chỉ JAVA 8',N'Giỏi',GETDATE());

SELECT * FROM CERTIFICATES;

SELECT * FROM CERTIFICATES
WHERE certificateID = 'CC02' AND
	  certificateName = 'fd';

INSERT INTO CANDIDATES(candidateID,fullName,birthDay,phone,email,candidateType)
VALUES ('UV01',N'Nguyễn Văn A','2002-07-18','0906413507','nguyenvana@fpt.com','Fresher');

INSERT INTO FRESHERS(fresherID,graduationDate,graduationRank)
VALUES ('UV01','2025-06-06',N'Giỏi');

SELECT C.fullName
FROM CANDIDATES AS C;

SELECT * FROM CERTIFICATES;

SELECT * FROM CANDIDATES;
SELECT * FROM FRESHERS;
SELECT * FROM INTERNS;
SELECT * FROM EXPERIENCES;

SELECT C.*, 
	   E.expInYear, 
	   F.graduationDate, F.graduationRank, 
	   I.major, I.semester, I.universityName
FROM CANDIDATES AS C
LEFT JOIN EXPERIENCES AS E
ON C.candidateID = E.experienceID
LEFT JOIN FRESHERS AS F
ON F.fresherID = C.candidateID
LEFT JOIN INTERNS AS I
ON C.candidateID = I.internID;
