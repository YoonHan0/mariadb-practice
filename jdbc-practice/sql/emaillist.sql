-- emailList

-- Insert
INSERT INTO emaillist VALUE(null, '둘', '리', 'dooly@gmail.com');
-- Delete
DELETE FROM emaillist WHERE email = 'dooly@gmail.com';
-- List
SELECT no, first_name, last_name, email FROM emaillist 
ORDER BY no DESC;