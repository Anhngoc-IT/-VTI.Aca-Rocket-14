USE management_db_2;

--- Qs1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban .
SELECT 
       ac.Account_id, 
       ac.Full_Name, 
       de.Department_id, 
       de.Department_name
FROM Account ac 
LEFT JOIN Department de ON ac.Department_id = de.Department_id ;

-- Qs2 : Lấy ra thông tin các account đc tạo sau ngày 20/12/2010
SELECT * FROM Account;
SELECT 
       ac.Email,
       ac.User_name,
       ac.Full_name
FROM Account ac 
WHERE Create_Date > 2010-20-12;

-- Qs 3 : Lấy ra tất cả các developer
SELECT * FROM Account;
SELECT 
       ac.*,
       po.* 
FROM Account ac 
LEFT JOIN Position po ON ac.Position_id = po.Position_id
WHERE Position_name = 'developer';

-- Qs4 : lấy ra danh sách các phòng ban có > 3 nhân viên

SELECT 
     Department_name AS bo_phan,
     GROUP_CONCAT(ac.Full_Name) AS Thong_tin_nhanvien,
     COUNT(ac.Department_id) AS Thanh_vien
FROM Department de
LEFT JOIN Account ac ON de.Department_id = ac.Department_id
GROUP BY Department_name
HAVING COUNT(ac.Department_id) > 3; 

-- Qs5 : Lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT 
      a.Question_id,
      a.Content,
      b.Question_id,
      COUNT(*) AS TOTAL
FROM Question a 
INNER JOIN Exam_Question b ON a.Question_id = b.Question_id
GROUP BY b.Question_id
HAVING COUNT(*) = 
(SELECT COUNT(*) FROM Exam_Question GROUP BY Question_id ORDER BY COUNT(*) DESC limit 1);

-- Qs6 : Thống kê mỗi category Question đc sử dụng trong bao nhiêu question
SELECT 
	  a.Category_id,
      a.Category_name,
      b.Category_id,
      COUNT(b.Category_id) AS TOTAL_Question
FROM Category_Question a
LEFT JOIN Question b ON a.Category_id = b.Category_id
GROUP BY a.Category_id;

-- Qs7 : Thống kê mỗi question đc sử dụng trong bao nhiêu exam;
SELECT 
       a.Exam_id,
       a.Question_id,
       b.Exam_id,
       COUNT(b.Exam_id) AS TOTAL_Exam
FROM Exam_Question a
LEFT JOIN Exam b ON a.Exam_id = b.Exam_id
GROUP BY a.Exam_id;

-- Qs 8 : Lấy ra question có nhiều câu trả lời nhất
SELECT 
      a.Question_id,
      b.Answer_id,
      b.Question_id,
      COUNT(b.Question_id) AS TOTAL_Answer
FROM Question a 
LEFT JOIN Answer b ON  a.Question_id =   b.Question_id
GROUP BY a.Question_id
HAVING COUNT(b.Question_id) = 
(SELECT COUNT(Question_id) FROM Answer GROUP BY Question_id  
ORDER BY COUNT(Question_id) DESC LIMIT 1);
       
-- Qs 9 : Thống kê số lượng account trong mỗi group
SELECT 
      a.Gruop_id,
      a.Account_id,
      b.Gruop_id,
      b.Gruop_name,
      COUNT(b.Gruop_id) AS TOTAL_Gruop
FROM Gruop_Account a 
LEFT JOIN Gruop b ON a.Gruop_id = b.Gruop_id
GROUP BY a.Gruop_id;

-- Qs 10: Tìm chức vụ có ít người nhất
SELECT 
      a.Position_id,
      a.Position_name,
      b.Account_id,
      b.User_name,
      b.Position_id,
      COUNT(b.Position_id) AS Total_user
FROM Position a
LEFT JOIN Account b ON  a.Position_id = b.Position_id
GROUP BY a.Position_id
HAVING Total_user = (SELECT COUNT(Position_id) FROM Position 
ORDER BY COUNT(Position_id) ASC LIMIT 1);

-- Qs 11 : Thống kê mỗi phòng ban có bao nhiêu : dev, Test, PMdepartment
SELECT 
   /*   a.Account_id,
      a.Position_id,
      a.Department_id,
      b.Department_id, */
      b.Department_name,
     /* c.Position_id, */
      c.Position_name,
      COUNT(*) AS TOTAL
FROM Account a 
LEFT JOIN Department b ON a.Department_id = b.Department_id
LEFT JOIN Position c ON a.Position_id = c.Position_id      
GROUP BY b.Department_id, c.Position_id
ORDER BY b.Department_id, c.Position_id;

-- Qs 12 : Lấy thông tin chi tiết của câu hỏi bao gồm :thông tin cơ bản của question, 
--            loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì...-- 
 SELECT 
       a.Type_id ,
       a.Creator_id,
       b.Type_id,
       b.Type_name,
       c.Question_id,
       COUNT(*) AS Total
FROM Question a 
LEFT JOIN Type_Question b ON  a.Type_id = b.Type_id
LEFT JOIN Answer c ON a.Question_id = c.Question_id
GROUP BY a.Type_id, a.Creator_id, b.Type_id, c.Question_id    
ORDER BY a.Type_id, a.Creator_id, b.Type_id, c.Question_id ;

-- Qs 13 : Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT 
      a.Question_id,
      a.Content,
      a.Type_id,
      b.Type_id,
      b.Type_name,
      COUNT(*) AS TOTAL
FROM Question a
INNER JOIN Type_Question b ON a.Type_id = b.Type_id
GROUP BY a.Type_id, b.Type_id
ORDER BY a.Type_id, b.Type_id;

-- QS 14 + 15 : Lấy ra Gruop không có account nào 
SELECT
      a.Gruop_id,
      a.Gruop_name,
      b.Gruop_id
FROM Gruop a
LEFT JOIN Gruop_Account b ON a.Gruop_id = b.Gruop_id
WHERE b.Gruop_id IS NULL
GROUP BY a.Gruop_id
ORDER BY a.Gruop_id;

-- Qs 16: Lấy ra Question không có Answer nào 
SELECT 
      a.Question_id,
      a.Content,
      b.Question_id,
      b.Content
FROM Question a
LEFT JOIN Answer b ON a.Question_id = b.Question_id
WHERE b.Question_id IS NULL
GROUP BY a.Question_id
      