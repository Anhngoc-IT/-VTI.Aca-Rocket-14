USE management_db_2;

-- ADD data department :
INSERT INTO Department (Department_id, Department_name) VALUES ('19008', 'NN'),
															   ('19009', 'SA'),
                                                               ('190010', 'GG'),
                                                               ('190011', 'FF'),
                                                               ('190012', 'HH'),
                                                               ('190013', 'LK'),
                                                               ('190014', 'MK'),
                                                               ('190015', 'IT'),
                                                               ('190016', 'VV');
   SELECT * FROM Department;                                                         

-- ADD data position :
INSERT INTO Position (Position_id, Position_name) values ('16', 'hh'),
														 ('17', 'nk'),
                                                         ('18', 'jh'),
                                                         ('19', 'a'),
                                                         ('20', 'b'),
                                                         ('21', 'c'),
                                                         ('22', 'd'),
                                                         ('23', 'e'),
                                                         ('24', 'f'),
                                                         ('25', 'g');

-- ADD data account :
INSERT INTO Account (Account_id, Email, User_name, Full_name, Department_id, Position_id, Create_Date) VALUES ('115','123@gmail.com','goc','lx','19008','16','2020-02-02'),
                                                                                                              ('116','2@gmail.com','hung','qb','19009','17','2020-02-02'),
                                                                                                              ('117','3@gmail.com','hoag','hy','190010','18','2020-02-02'),
                                                                                                              ('118','4@gmail.com','cuong','dv','190011','19','2020-02-02'),
                                                                                                              ('119','5@gmail.com','tung','nt','190012','20','2020-02-02'),
                                                                                                              ('120','6@gmail.com','tuan','ba','190013','21','2020-02-02'),
                                                                                                              ('121','7@gmail.com','hong','tt','190014','22','2020-02-02'),
                                                                                                              ('122','8@gmail.com','linh','ng','190015','23','2020-02-02'),
                                                                                                              ('123','9@gmail.com','jung','di','190016','24','2020-02-02');
 select * from Account;
-- ADD data gruop : 
INSERT INTO Gruop (Gruop_id, Gruop_name, Creator_id, Create_Date) values ('6', 'BH-AF-06', '01', '2021-11-03'),
																		 ('7', 'BH-AF-07', '02', '2021-11-03'),
                                                                         ('8', 'BH-AF-08', '03', '2021-11-03'),
                                                                         ('9', 'BH-AF-09', '04', '2021-11-03'),
                                                                         ('10', 'BH-AF-10', '05', '2021-11-03'),
                                                                         ('11', 'BH-AF-11', '06', '2021-11-03'),
                                                                         ('12', 'BH-AF-12', '07', '2021-11-03'),
                                                                         ('13', 'BH-AF-13', '08', '2021-11-03'),
                                                                         ('14', 'BH-AF-14', '09', '2021-11-03'),
                                                                         ('15', 'BH-AF-15', '010', '2021-11-03');

-- data gruop_account : 
INSERT INTO Gruop_Account (Gruop_id, Account_id, Join_Date) VALUES ('6', '115', '2020-01-06' ),
																   ('7', '116', '2020-01-06' ),
                                                                   ('8', '117', '2020-01-06' ),
                                                                   ('9', '118', '2020-01-06' ),
                                                                   ('10', '119', '2020-01-06' ),
                                                                   ('11', '120', '2020-01-06' ),
                                                                   ('12', '121', '2020-01-06' ),
                                                                   ('13', '122', '2020-01-06' ),
                                                                   ('14', '123', '2020-01-06' );
 -- ADD data type_question :
INSERT INTO Type_Question(Type_id, Type_name) VALUES('6','dai'),                                                                 
													('7','ngăn'),
                                                    ('8','hoi'),
                                                    ('9','cam than'),
                                                    ('10','tim thong tin'),
                                                    ('11','dai'),
                                                    ('12','nhanh'),
                                                    ('13','ngan'),
                                                    ('14','dai'),
                                                    ('15','dai');

-- ADD data category_question :
INSERT INTO Category_Question (Category_id, Category_name) VALUES ('6','TT'),
                                                                  ('7','TT'),
                                                                  ('8','TT'),
                                                                  ('9','TT'),
                                                                  ('10','TT'),
                                                                  ('11','TT'),
                                                                  ('12','TT'),
                                                                  ('13','TT'),
                                                                  ('14','TT'),
                                                                  ('15','TT');

-- ADD data question :
INSERT INTO Question (Question_id, Content, Category_id, Type_id, Creator_id, Create_Date) 
VALUES ('6','A','006','6','006','2019-05-05'),
       ('7','B','007','7','007','2019-05-05'),
       ('8','C','008','8','008','2019-05-05'),
       ('9','D','009','9','009','2019-05-05'),
       ('10','E','010','10','010','2019-05-05'),
       ('11','F','011','11','011','2019-05-05'),
       ('12','G','012','12','012','2019-05-05'),
       ('13','H','013','13','013','2019-05-05'),
       ('14','I','014','14','014','2019-05-05'),
       ('15','K','015','15','015','2019-05-05');
       
-- ADD data answer :
INSERT INTO Answer (Answer_id, Content, Question_id, Is_correct) VALUES ('6','A1','6','0'),
                                                                        ('7','B2','7','0'),
                                                                        ('8','C3','8','0'),
                                                                        ('9','D4','9','0'),
                                                                        ('10','E5','10','0'),
                                                                        ('11','F6','11','0'),
                                                                        ('12','G7','12','0'),
                                                                        ('13','H8','13','0'),
                                                                        ('14','I9','14','0'),
                                                                        ('15','K10','15','0');
                                                                        
-- ADD data exam :
INSERT INTO Exam (Exam_id, Code, Title, Category_id, Duration, Creator_id, Create_Date) 
VALUES                  ('6', '06', 'Test Finally', '6', '20', '6', '2000-09-07'),
      					('7', '07', 'Test Finally', '7', '21', '7', '2000-09-07'),
                        ('8', '08', 'Test Finally', '8', '22', '8', '2000-09-07'),
                        ('9', '09', 'Test Finally', '9', '23', '9', '2000-09-07'),
                        ('10', '10', 'Test Finally', '10', '24', '10', '2000-09-07'),
                        ('11', '11', 'Test Finally', '11', '25', '11', '2000-09-07'),
                        ('12', '12', 'Test Finally', '12', '26', '12', '2000-09-07'),
                        ('13', '13', 'Test Finally', '13', '27', '13', '2000-09-07'),
                        ('14', '14', 'Test Finally', '14', '28', '14', '2000-09-07'),
                        ('15', '15', 'Test Finally', '15', '29', '15', '2000-09-07');

-- ADD data exam_question : 
INSERT INTO Exam_Question (Exam_id, Question_id) VALUES ('6', '6'),
                                                        ('7', '7'),
                                                        ('8', '8'),
													    ('9', '9'),
                                                        ('10', '10'),
                                                        ('11', '11'),
                                                        ('12', '12'),
                                                        ('13', '13'),
                                                        ('14', '14'),
                                                        ('15', '15');

-- Qs2 : lấy ra tất cả các phòng ban     
SELECT * FROM Department ORDER BY  Department_id;

-- Qs3 : Lấy ra id của phòng ban "Sale"
SELECT Department_id FROM Department WHERE Department_name = 'sale';
SELECT Department_name FROM Department WHERE Department_id = '1901';

-- Qs3 : Lấy ra thông tin Account có fullname dài nhât

-- lấy thông tin độ dài
SELECT MAX(char_length(Full_Name)) FROM Account;
-- lấy kết quả 
SELECT * FROM Account WHERE CHAR_LENGTH(Full_Name) =3;

-- Qs5 : Lấy ra thông tin Account có fullname dài nhất và thuộc phòng ban có id = 1903
SELECT MAX(CHAR_LENGTH(Full_Name)) FROM Account WHERE Department_id = 1903;
SELECT * FROM Account WHERE CHAR_LENGTH(Full_Name) = 2 AND Department_id = 1903;

-- Qs6 : lấy ra tên gruop đã tham gia trước ngày 20/12/2019
select * from Gruop;
SELECT 	Gruop_name FROM Gruop WHERE Create_Date < '2021-11-3';											

-- Qs7: lấy ra id của question có >=4 câu trả lời
SELECT Question_id FROM Answer GROUP BY Question_id HAVING Count(*) >= 4;
select * from answer;

-- Qs8 : lấy ra các mã đề thi có thời gian >= 60p , và đc tạo trc 20/12/2019
SELECT Code FROM Exam WHERE Duration >= 60 AND Create_Date < '2019-12-20';

-- QS9 : 
SELECT * FROM Gruop ORDER BY Create_Date DESC LIMIT 5;	

-- Qs10 :
SELECT Count(*) FROM Account Where Department_id = 2;


SELECT User_name FROM Account WHERE User_name LIKE ('D_O');


DELETE FROM Exam WHERE Create_Date < '2019-12-20';	

--- Question 13
DELETE FROM  Question where Content like 'Câu hỏi%';

--- Question 14
SELECT * FROM Account;
UPDATE Account SET Full_Name = "ABC1", Email = "1hhh@gmail.com"
where Account_id = 110;


						