SHOW tables;

DESC user;

SELECT *
FROM cart;
SELECT *
FROM user;
SELECT *
FROM orders;

SELECT no, name, phone, email, password
FROM user;

SELECT no, type
FROM category;

INSERT INTO category(no, type)
VALUES(null, "예술");
INSERT INTO book(no, title, price, category_no)
VALUES(null, "소설01", 3000, 7);
INSERT INTO cart(no, count, book_no, user_no)
VALUES(null, 3, 5, 1);
INSERT INTO cart(no, count, book_no, user_no)
VALUES(null, 3, 4, 2);

SELECT *
FROM user;
INSERT INTO user(no, name, phone, email, password)
VALUES(null, "윤한영", "010-1111-1111", "test01@tset.com", "1111");
INSERT INTO orders(no, order_no, destination, user_no)
VALUES(null, 1, "부산 덕천동", 1);

DELETE
FROM category;
DELETE
FROM book
WHERE no = 3;

SELECT a.no, a.title, a.price, b.type
FROM book a
JOIN category b ON a.category_no = b.no;


SELECT *
FROM cart;
SELECT *
FROM user;
SELECT *
FROM book;

-- cart에 담은 책, 개수
SELECT a.no, b.name, c.title, a.count
FROM cart a
JOIN user b ON a.user_no = b.no
JOIN book c ON a.book_no = c.no;

SELECT *
FROM orders;

DESC orders;

-- orders 테이블 출력
SELECT a.no, a.order_no, b.name, b.email, c.sumPrice, a.destination
FROM orders a
JOIN user b ON a.user_no = b.no
JOIN (SELECT a.user_no AS user_no, sum(a.count*b.price) AS sumPrice
		FROM cart a
		JOIN book b ON a.book_no = b.no
		GROUP BY a.user_no) c ON b.no = c.user_no;

SELECT *
FROM user a
JOIN cart b ON a.no = b.user_no;

-- 책 가격 구하기
SELECT a.user_no, sum(a.count*b.price)
FROM cart a
JOIN book b ON a.book_no = b.no
GROUP BY a.user_no
HAVING a.user_no = 1;

-- order_book
DESC order_book;
SELECT * FROM order_book;

SELECT *
FROM order_book a
JOIN orders b ON a.orders_no = b.no;

INSERT INTO order_book(no, order_no, destination, user_no)
VALUES(null, 1, "부산 덕천동", 1);

-- JOIN을 이용해서 UPDATE 하는 방법
-- update book a
-- join category b on a.category_no = b.no
-- set a.title = b.type
-- where b.no = 7;

INSERT INTO orders(no, order_no, destination, price, user_no)
VALUES(null, 1, "부산 덕천동", (SELECT sum(a.count*b.price)
							FROM cart a
							JOIN book b ON a.book_no = b.no
							GROUP BY a.user_no
							HAVING a.user_no = 1),1);
DELETE
FROM orders;
SELECT *
FROM orders;

SELECT sum(a.count*b.price)
FROM cart a
JOIN book b ON a.book_no = b.no
GROUP BY a.user_no
HAVING a.user_no = 1;

DESC order_book;
SELECT * FROM order_book;
SELECT * FROM book;
SELECT * FROM cart;
UPDATE cart
SET book_no = 1
WHERE no = 1;

INSERT INTO order_book(no, count, book_no, orders_no)
VALUES(null, 0, 1, 2);

DELETE
FROM order_book;

SELECT count
FROM cart
WHERE book_no = (SELECT b.no
				FROM order_book a
				JOIN book b ON a.book_no = b.no
				WHERE a.book_no = b.no);

SELECT b.no
FROM order_book a
JOIN book b ON a.book_no = b.no
WHERE a.book_no = b.no;