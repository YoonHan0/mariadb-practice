-- emailList

-- Insert
INSERT INTO emaillist VALUE(null, '윤', '한영', 'yoon@gmail.com');
-- Delete
DELETE FROM emaillist WHERE email = 'dooly@gmail.com';
-- List
SELECT no, first_name, last_name, email FROM emaillist 
ORDER BY no DESC;

SHOW tables;
SELECT *
FROM emaillist;

DESC guestbook;

INSERT INTO guestbook VALUE(null, '윤한영', '1234', '안녕하세요~', now());

SELECT * FROM guestbook;