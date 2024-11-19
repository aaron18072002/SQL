SHOW DATABASES;
USE mysql;

CREATE TABLE ACCOUNT
	(accno INT, lastname VARCHAR(25), firstname VARCHAR(25), bal INT);
    
SELECT * FROM ACCOUNT;

INSERT INTO ACCOUNT(accno, lastname, firstname, bal)
VALUES (1,'Johnny','Evan',10000);

SET @currentBalOfNemo = (SELECT bal FROM ACCOUNT WHERE accno = 2);

SET SQL_SAFE_UPDATES = 0; 
UPDATE ACCOUNT
SET bal = @currentBalOfNemo + 35000
WHERE accno = 2;
SET SQL_SAFE_UPDATES = 1;

INSERT INTO ACCOUNT(accno,lastname,firstname,bal)
VALUES (3, 'Nguyen','C',12000),
	   (4, 'Nguyen','D',13000),
       (5, 'Nguyen','E',14000);


