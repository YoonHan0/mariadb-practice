-- bookshop
SHOW tables;
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

-- UPDATE book
-- SET title = "소설01"
-- WHERE no = 4;

-- SELECT *
-- FROM book;

-- SELECT *
-- FROM category;

-- JOIN을 이용해서 UPDATE 하는 방법
update book a
join category b on a.category_no = b.no
set a.title = b.type
where b.no = 7;