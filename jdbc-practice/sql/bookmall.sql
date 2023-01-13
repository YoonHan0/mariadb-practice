SHOW tables;

DESC user;

SELECT *
FROM cart;
SELECT *
FROM user;
SELECT *
FROM book;

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
GROUP BY a.user_no;

-- order_book
DESC order_book;
SELECT * FROM order_book;

SELECT *
FROM order_book a
JOIN orders b ON a.orders_no = b.no

INSERT INTO orders(no, order_no, destination, user_no)
VALUES(null, 1, "부산 덕천동", 1);