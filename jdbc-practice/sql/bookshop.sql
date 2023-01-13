-- bookshop

DESC book;
DESC author;

SELECT title, rent, author_no
FROM book;

SELECT *
FROM book;

SELECT *
FROM author;

INSERT INTO book(no, title, author_no) VALUE(null, "title_test03", 3);

INSERT INTO author VALUE(null, "또치");
SELECT *
FROM author;

DELETE
FROM author
WHERE no = 1;

DELETE
FROM book
WHERE no = 1;


select a.no, a.title, b.name, a.rent
from book a
JOIN author b ON a.author_no = b.no
order by a.no desc;

UPDATE book
SET title = "update_title02", rent = "n"
WHERE no = 5;
