-- Creator by : Pham Xuan Ngoc
-- Exercise 1 : Design a table
CREATE SCHEMA IF NOT EXISTS Management;
USE Management;

-- CREATE THE TABLES :
CREATE TABLE IF NOT EXISTS Trainee(
	Trainee_id             INT AUTO_INCREMENT PRIMARY KEY,
    Full_name              VARCHAR(100) NOT NULL,
    Birth_date             DATE NOT NULL,
    Gender                 ENUM('MALE', 'FEMAL', 'UNKNOW'),
    ET_IQ                  TINYINT UNSIGNED    CHECK ( ET_IQ >= 0 AND ET_IQ <= 20),
    ET_Gmath               TINYINT UNSIGNED    CHECK ( ET_Gmath >= 0 AND ET_Gmath <=20),
    ET_English             TINYINT UNSIGNED    CHECK (ET_English >= 0 AND ET_English <= 50),
    Training_Class         VARCHAR(255) NOT NULL,
    Evaluation_Notes       VARCHAR(255),
    UNIQUE (Full_name)
);
-- Change the table Trainee to ADD one more field named VTI_Account
ALTER TABLE Trainee 
      ADD VTI_Account VARCHAR(255) UNIQUE NOT NULL
      AFTER Evaluation_Notes;


-- Exercise 2 : CREATE TABLE will have less than 1 milion records
CREATE TABLE IF NOT EXISTS Data_Type_1(
    ID                     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   Name_                   NVARCHAR(100) NOT NULL,
   Code_                   VARCHAR(5) CHECK (Code_ < 6) NOT NULL,
   Modified_Date           DATETIME DEFAULT NOW()
);


-- Exercise 3 :  CREATE TABLE will have more than 1 milion records
CREATE TABLE IF NOT EXISTS Data_Type_2(
    ID                     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    _Name                  VARCHAR(100) NOT NULL,
    Birth_Date             DATE NOT NULL,
    Gender                 BIT,
    IsDeleted_Flag         ENUM('0', '1')
);
