USE Management;

--- QS 1:
INSERT INTO Trainee(Trainee_id, Full_name, Birth_date, Gender,
                    ET_IQ, ET_Gmath, ET_English, Training_Class,
                    Evaluation_Notes, VTI_Account)
                    VALUES ('001', 'Huynh Cong Dat', '2000-01-12', '1', '15', '20', '17', 'BH-01', 'Good', 'HCD@VITAacademy.com'),
						   ('002', 'Pham Xuan Ngoc', '2001-06-02', '0', '13', '20', '17', 'BH-01', 'Good', 'PXN@VITAacademy.com'),
                           ('003', 'Nguyen Manh Hung', '2010-01-11', '1', '14', '20', '17', 'BH-01', 'Good', 'NMH@VITAacademy.com'),
                           ('004', 'Dao Thi Trang', '2000-06-07', '0', '15', '20', '17', 'BH-01', 'Good', 'DTT@VITAacademy.com'),
                           ('005', 'Dinh Bo Linh', '2002-07-10', '1', '15', '20', '17', 'BH-01', 'Good', 'DBL@VITAacademy.com'),
                           ('006', 'Dang Thị Hang', '2003-06-1', '0', '15', '20', '17', 'BH-01', 'Good', 'DTH@VITAacademy.com'),
                           ('007', 'Pham Van Vinh', '2001-09-3', '1', '15', '20', '17', 'BH-01', 'Good', 'PVV@VITAacademy.com'),
                           ('008', 'Huynh Cong Luan', '2002-07-12', '1', '15', '20', '17', 'BH-01', 'Good', 'HCL@VITAacademy.com'),
                           ('009', 'Nguyen Thi Van Anh', '2000-05-6', '0', '15', '20', '17', 'BH-01', 'Good', 'NTVA@VITAacademy.com'),
                           ('010', 'Quach Thi Thu Phuong', '2000-06-12', '0', '15', '20', '17', 'BH-01', 'Good', 'QTTP@VITAacademy.com');


--- Qs2
SELECT * FROM Trainee ORDER BY Birth_date DESC;
--- QS3
SELECT MAX(CHAR_LENGTH(Full_name)) FROM Trainee;
SELECT * FROM Trainee Where CHAR_LENGTH(Full_name) = 20;

--- Qs4
SELECT Full_name,
	   CASE 
       WHEN ET_IQ + ET_Gmath >= 20 AND 
            ET_IQ >= 8 AND 
            ET_Gmath >= 8 AND 
            ET_English >= 18 
	  Then 'ET' END AS Result 
FROM Trainee WHERE ET_IQ + ET_Gmath >= 20 AND
                   ET_IQ >= 8 AND
                   ET_Gmath >= 8 AND 
				   ET_English >= 18 ;
--- Qs5
DELETE FROM Trainee WHERE Trainee_id = 3;
SELECT * FROM Trainee;
--- Qs6 
UPDATE Trainee SET Training_Class = 'BH-02' WHERE Trainee_id = 5;

