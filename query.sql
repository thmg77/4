1. List all the student details studying in fourth semester ‘C’section. 

SELECT S.*, SS.SEM, SS.SEC 
FROM STUDENT S, SEMSEC SS, CLASS C 
WHERE S.USN = C.USN AND 
SS.SSID = C.SSID AND 
SS.SEM = 4 AND 
SS.SEc='C'; 

2. Compute the total number of male and female students in each semester 
and in each section. 

SELECT SS.SEM, SS.SEC, S.GENDER, COUNT (S.GENDER) AS COUNT FROM 
STUDENT S, SEMSEC SS, CLASS C 
WHERES.USN = C.USNAND 
SS.SSID =C.SSID 
GROUP BY SS.SEM, SS.SEC, S.GENDER 
ORDER BYSEM; 

3. Create a view of Test1 marks of student USN ‘1BI15CS101’ in allsubjects. 

CREATE VIEW STU_TEST1_MARKS_VIEW AS 
SELECT TEST1, SUBCODE 
FROM IAMARKS 
WHERE USN = '1RN13CS091'; 

4. Calculate the FinalIA (average of best two test marks) and update the 
corresponding table for allstudents. 

UPDATE IAMARKS
SET FINALIA=GREATEST(TEST1+TEST2,TEST2+TEST3,TEST1+TEST3)/2;
SELECT * FROM IAMARKS;
UPDATE IAMARKS
SET FINALIA=GREATEST(TEST1+TEST2,TEST2+TEST3,TEST1+TEST3)/2;

5. Categorize students based on the followingcriterion: If FinalIA = 17 to 20 then CAT 
=‘Outstanding’ If FinalIA = 12 to 16 then CAT = 
‘Average’ If FinalIA< 12 then CAT = ‘Weak’ 
Give these details only for 8th semester A, B, and C section students.

SELECT S.USN,S.SNAME,S.ADDRESS,S.PHONE,S.GENDER,
(CASE
WHEN IA.FINALIA BETWEEN 17 AND 20 THEN 'OUTSTANDING'
WHEN IA. FINALIA BETWEEN 12 AND 16 THEN 'AVERAGE'
ELSE 'WEAK'
END) AS CAT
FROM STUDENT S, SEMSEC SS, IAMARKS IA, SUBJECT SUB WHERE S.USN = IA.USN
AND SS.SSID = IA.SSID AND SUB.SUBCODE = IA.SUBCODE AND SUB.SEM = 8;
