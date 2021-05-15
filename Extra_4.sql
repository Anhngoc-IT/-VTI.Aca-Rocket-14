CREATE SCHEMA IF NOT EXISTS Extra_4;

USE Extra_4;

-- QS1 :
CREATE TABLE IF NOT EXISTS Department(
      Department_Number    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      Department_Name      VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employee_Table(
      Employee_Number      INT  PRIMARY KEY,
      Employee_Name        VARCHAR(255) NOT NULL,
      Department_Number    INT UNSIGNED,
      CONSTRAINT FK_Employee_Table FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);

CREATE TABLE IF NOT EXISTS Employee_Skill_Table(
	  Skill_Code           INT PRIMARY KEY ,
      Date_Registered      DATETIME DEFAULT NOW(),
      Employee_Number      INT,
      CONSTRAINT fk_Employee_Skill_Table FOREIGN KEY (Employee_Number) REFERENCES Employee_Table (Employee_Number)
);

-- QS2 :
INSERT INTO Department(Department_Number, Department_Name) VALUES ('001','Developer'),
																  ('002','Marketing'),
                                                                  ('003','Tester'),
                                                                  ('004','CEO'),
                                                                  ('005','PM'),
                                                                  ('006','Director'),
                                                                  ('007','Manager'),
                                                                  ('008','Employee'),
                                                                  ('009','IT'),
                                                                  ('010','java');
                                                                
INSERT INTO Employee_Table(Employee_Number, Employee_Name, Department_Number) VALUES ('1901','Pham Xuan Huan','001'),
                                                                                     ('1902','Dang Thi Le Hang','002'),
                                                                                     ('1903','Nguyen Minh Hoang','003'),
                                                                                     ('1904','Pham Kiem Huynh Minh','004'),
                                                                                     ('1905','Le Roi','005'),
                                                                                     ('1906','Bui Xuan Huan','006'),
                                                                                     ('1907','Thay Giao Ba','007'),
                                                                                     ('1908','Levi','008'),
                                                                                     ('1909','Faker','009'),
                                                                                     ('1910','Bui Duy Linh','010');

INSERT INTO Employee_Skill_Table(Skill_Code, Date_Registered, Employee_Number) VALUES ('01','2000-01-06','1901'),
                                                                                      ('02','2000-01-06','1902'),
                                                                                      ('03','2000-01-06','1903'),
                                                                                      ('04','2000-01-06','1904'),
                                                                                      ('05','2000-01-06','1905'),
                                                                                      ('06','2000-01-06','1906'),
                                                                                      ('07','2000-01-06','1907'),
                                                                                      ('08','2000-01-06','1908'),
                                                                                      ('09','2000-01-06','1909'),
                                                                                      ('10','2000-01-06','1910');

-- QS3 : Viết lệnh để lấy ra danh sách nhân viên (name) có skill java

-- qs4 : Viết lệnh để lấy ra danh sách phòng ban > 3 nhân viên      
SELECT
      Employee_Number AS Bo_phan,
      a.Department_Number,
      GROUP_CONCAT(a.Employee_Name) AS Name,
      b.Department_Number,
      COUNT(b.Department_Number) AS TOTAL
FROM Employee_Table a
LEFT JOIN Department b ON a.Department_Number = b.Department_Number
GROUP BY Employee_Number
HAVING COUNT(a.Employee_Name) > 3;
     

      