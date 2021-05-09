CREATE SCHEMA IF NOT EXISTS management_db_2;
Use management_db_2;

-- Table 1:Department
CREATE TABLE IF NOT EXISTS Department (

    Department_id          INT PRIMARY KEY,
    Department_name        VARCHAR(50) NOT NULL
);

-- Table 2: Position
CREATE TABLE IF NOT EXISTS Position (

    Position_id            INT PRIMARY KEY,
    Position_name          VARCHAR(50) NOT NULL
);

-- Table 3: Account
CREATE TABLE IF NOT EXISTS Account (

  Account_id               INT PRIMARY KEY, 
  Email                    VARCHAR(100),
  User_name                VARCHAR(50) NOT NULL,
  Full_Name                VARCHAR(100) NOT NULL,
  Department_id            INT null,
  Position_id              INT null,
  Create_Date              Date,
  
  CONSTRAINT FK_Account_Position FOREIGN KEY (Position_id) REFERENCES Position (Position_id),
  CONSTRAINT FK_Account_Department FOREIGN KEY (Department_id) REFERENCES Department (Department_id),
  UNIQUE (Email)
);

-- Table 4: Group
CREATE TABLE IF NOT EXISTS Gruop (

   Gruop_id               INT PRIMARY KEY,
   Gruop_name             VARCHAR(50) NOT NULL,
   Creator_id             INT NOT NULL,
   Create_Date            Date,
   
   UNIQUE (Gruop_name, Gruop_id, Creator_id)
);

-- Table 5: GroupAccount
CREATE TABLE IF NOT EXISTS Gruop_Account(

    Gruop_id               INT NOT NULL,
    Account_id             INT NOT NULL ,
    Join_Date              Date,
    
    CONSTRAINT FK_Gruop_Account FOREIGN KEY (Gruop_id) REFERENCES Gruop (Gruop_id),
    CONSTRAINT FK_Gruop_Account_ FOREIGN KEY (Account_id) REFERENCES Account (Account_id)
);

-- Table 6: TypeQuestion
CREATE TABLE IF NOT EXISTS Type_Question(

    Type_id                INT PRIMARY KEY,
    Type_name              VARCHAR(50) NOT NULL
);

-- Table 7: CategoryQuestion
CREATE TABLE IF NOT EXISTS Category_Question(

    Category_id            INT PRIMARY KEY,
    Category_name          VARCHAR(50) NOT NULL
);

-- Table 8: Question
CREATE TABLE IF NOT EXISTS Question(

    Question_id            INT PRIMARY KEY,
    Content                VARCHAR(50) ,
    Category_id            INT NOT NULL,
    Type_id                INT NOT NULL,
    Creator_id             INT NOT NULL,
    Create_Date            DATE,
    
    UNIQUE (Category_id, Type_id, Creator_id),
    CONSTRAINT FK_Question FOREIGN KEY (Category_id) REFERENCES Category_Question (Category_id),
    CONSTRAINT FK_Question_ FOREIGN KEY (Type_id) REFERENCES Type_Question (Type_id)
);

-- Table 9: Answer
CREATE TABLE IF NOT EXISTS Answer(

    Answer_id              INT PRIMARY KEY,
    Content                VARCHAR(255) NOT NULL,
    Question_id            INT,
    Is_correct             boolean,
    
    CONSTRAINT FK_Answer_Question FOREIGN KEY (Question_id) REFERENCES Question (Question_id),
    UNIQUE (Content)
);

-- Table 10: Exam
CREATE TABLE IF NOT EXISTS Exam(

   Exam_id                 INT PRIMARY KEY,
   Code                    INT NOT NULL,
   Title                   VARCHAR(50),
   Category_id             INT NOT NULL,
   Duration                TIME NOT NULL, 
   Creator_id              INT NOT NULL,
   Create_Date             Date,
   
   CONSTRAINT FF_Exam FOREIGN KEY (Category_id) REFERENCES Category_Question (Category_id),
   CONSTRAINT FK_Exam_ FOREIGN KEY (Creator_id) REFERENCES Question (Question_id),
   Unique (Code, Category_id, Duration, Creator_id)
);

-- Table 11: ExamQuestion
CREATE TABLE IF NOT EXISTS Exam_Question(

    Exam_id                INT ,
    Question_id            INT,
    
    CONSTRAINT FK_Exam_Question FOREIGN KEY (Question_id) REFERENCES Question (Question_id),
    CONSTRAINT FK_Exam_Question_ FOREIGN KEY (Exam_id) REFERENCES Exam (Exam_id)
);

-- ADD data department :
INSERT INTO Department (Department_id, Department_name) VALUES ('1900', 'Dev');
INSERT INTO Department (Department_id, Department_name) VALUES ('1901', 'Sale');
INSERT INTO Department (Department_id, Department_name) VALUES ('1902', 'PM');
INSERT INTO Department (Department_id, Department_name) VALUES ('1903', 'Marketing');
INSERT INTO Department (Department_id, Department_name) VALUES ('1904', 'CEO');
INSERT INTO Department (Department_id, Department_name) VALUES ('1905', 'Budget');
INSERT INTO Department (Department_id, Department_name) VALUES ('1906', 'Manager');

SELECT * FROM Department;

-- ADD data position :
INSERT INTO Position (Position_id, Position_name) values ('11', 'kk');
INSERT INTO Position (Position_id, Position_name) values ('12', 'hk');
INSERT INTO Position (Position_id, Position_name) values ('13', 'hkt');
INSERT INTO Position (Position_id, Position_name) values ('14', 'jkh');
INSERT INTO Position (Position_id, Position_name) values ('15', 'mnm');

SELECT * FROM Position;

-- ADD data account :
INSERT INTO Account (Account_id, Email, User_name, Full_name, Department_id, Position_id, Create_Date) VALUES ('110','hhh@gmail.com','a','ABC','1900','11','2020-02-02');
INSERT INTO Account (Account_id, Email, User_name, Full_name, Department_id, Position_id, Create_Date) VALUES ('111','NNN@gmail.com','B','H1','1901','12','2021-1-6');
INSERT INTO Account (Account_id, Email, User_name, Full_name, Department_id, Position_id, Create_Date) VALUES ('112','BBB@gmail.com','C','H2','1902','13','2020-9-02');
INSERT INTO Account (Account_id, Email, User_name, Full_name, Department_id, Position_id, Create_Date) VALUES ('113','KKK@gmail.com','D','H3','1903','14','2010-09-22');
INSERT INTO Account (Account_id, Email, User_name, Full_name, Department_id, Position_id, Create_Date) VALUES ('114','aaa@gmail.com','E','H4','1904','15','2019-09-02');
 
 SELECT* FROM Account;

-- ADD data gruop : 
INSERT INTO Gruop (Gruop_id, Gruop_name, Creator_id, Create_Date) values ('1', 'BH-AF-01', '111', '2021-11-03');
INSERT INTO Gruop (Gruop_id, Gruop_name, Creator_id, Create_Date) values ('2', 'BH-AF-02', '112', '2020-01-06');
INSERT INTO Gruop (Gruop_id, Gruop_name, Creator_id, Create_Date) values ('3', 'BH-AF-03', '113', '2011-01-09');
INSERT INTO Gruop (Gruop_id, Gruop_name, Creator_id, Create_Date) values ('4', 'BH-AF-04', '114', '2021-09-05');
INSERT INTO Gruop (Gruop_id, Gruop_name, Creator_id, Create_Date) values ('5', 'BH-AF-05', '115', '2010-01-07');

select * from Gruop;

-- ADD data gruop_account : 
INSERT INTO Gruop_Account (Gruop_id, Account_id, Join_Date) VALUES ('1', '110', '2020-01-06' );
INSERT INTO Gruop_Account (Gruop_id, Account_id, Join_Date) VALUES ('2', '111', '2021-11-03' );
INSERT INTO Gruop_Account (Gruop_id, Account_id, Join_Date) VALUES ('3', '112', '2021-2-01' );
INSERT INTO Gruop_Account (Gruop_id, Account_id, Join_Date) VALUES ('4', '113', '2011-10-1' );
INSERT INTO Gruop_Account (Gruop_id, Account_id, Join_Date) VALUES ('5', '114', '2013-01-10' );

select * from Gruop_Account;

-- ADD data type_question :
INSERT INTO Type_Question(Type_id, Type_name) VALUES('1','dai');
INSERT INTO Type_Question(Type_id, Type_name) VALUES('2','ngan');
INSERT INTO Type_Question(Type_id, Type_name) VALUES('3','nhanh');
INSERT INTO Type_Question(Type_id, Type_name) VALUES('4','dai');
INSERT INTO Type_Question(Type_id, Type_name) VALUES('5','ngan');

SELECT * FROM Type_Question;

-- ADD data category_question :
INSERT INTO Category_Question (Category_id, Category_name) VALUES ('1','TT');
INSERT INTO Category_Question (Category_id, Category_name) VALUES ('2','CN');
INSERT INTO Category_Question (Category_id, Category_name) VALUES ('3','CT');
INSERT INTO Category_Question (Category_id, Category_name) VALUES ('4','LM');
INSERT INTO Category_Question (Category_id, Category_name) VALUES ('5','HS');

SELECT * FROM Category_Question;

-- ADD data question :
INSERT INTO Question (Question_id, Content, Category_id, Type_id, Creator_id, Create_Date) VALUES ('1','ABCD','001','1','003','2019-05-05');
INSERT INTO Question (Question_id, Content, Category_id, Type_id, Creator_id, Create_Date) VALUES ('2','ABCDE','002','2','001','2019-05-05');
INSERT INTO Question (Question_id, Content, Category_id, Type_id, Creator_id, Create_Date) VALUES ('3','ABC','003','3','002','2019-05-05');
INSERT INTO Question (Question_id, Content, Category_id, Type_id, Creator_id, Create_Date) VALUES ('4','ABD','004','4','004','2019-05-05');
INSERT INTO Question (Question_id, Content, Category_id, Type_id, Creator_id, Create_Date) VALUES ('5','AB','005','5','005','2019-05-05');

SELECT * FROM Question;

-- ADD data answer :
INSERT INTO Answer (Answer_id, Content, Question_id, Is_correct) VALUES ('1','ABCD','1','0');
INSERT INTO Answer (Answer_id, Content, Question_id, Is_correct) VALUES ('2','ABC','2','0');
INSERT INTO Answer (Answer_id, Content, Question_id, Is_correct) VALUES ('3','ABD','3','1');
INSERT INTO Answer (Answer_id, Content, Question_id, Is_correct) VALUES ('4','ABCDE','4','0');
INSERT INTO Answer (Answer_id, Content, Question_id, Is_correct) VALUES ('5','AB','5','1');

SELECT * FROM Answer;

-- ADD data exam :
INSERT INTO Exam (Exam_id, Code, Title, Category_id, Duration, Creator_id, Create_Date) 
VALUES ('1', '01', 'Test Finally', '1', '15', '1', '2000-09-07');

INSERT INTO Exam (Exam_id, Code, Title, Category_id, Duration, Creator_id, Create_Date) 
VALUES ('2', '02', 'Test Midterm', '2', '16', '2', '2010-01-07');

INSERT INTO Exam (Exam_id, Code, Title, Category_id, Duration, Creator_id, Create_Date) 
VALUES ('3', '03', 'Test Math', '3', '17', '3', '2020-06-03');

INSERT INTO Exam (Exam_id, Code, Title, Category_id, Duration, Creator_id, Create_Date) 
VALUES ('4', '04', 'Test Literature', '4', '18', '4', '2019-05-05');

INSERT INTO Exam (Exam_id, Code, Title, Category_id, Duration, Creator_id, Create_Date) 
VALUES ('5', '05', 'Test Chemical', '5', '19', '5', '2021-09-05');

SELECT * FROM Exam;


-- ADD data exam_question : 
INSERT INTO Exam_Question (Exam_id, Question_id) VALUES ('1', '1');
INSERT INTO Exam_Question (Exam_id, Question_id) VALUES ('2', '2');
INSERT INTO Exam_Question (Exam_id, Question_id) VALUES ('3', '3');
INSERT INTO Exam_Question (Exam_id, Question_id) VALUES ('4', '4');
INSERT INTO Exam_Question (Exam_id, Question_id) VALUES ('5', '5');
select * from Exam_Question;