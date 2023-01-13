package bookmall.main;

import java.util.List;

import bookmall.dao.BookDao;
import bookmall.dao.CartDao;
import bookmall.dao.CategoryDao;
import bookmall.dao.OrderBookDao;
import bookmall.dao.OrdersDao;
import bookmall.dao.UserDao;
import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;
import bookmall.vo.OrderBookVo;
import bookmall.vo.OrdersVo;
import bookmall.vo.UserVo;

public class BookMall {

	public static void main(String[] args) {

		System.out.println("## 회원 리스트 출력 ##");
		testInsert();
		displayUserInfo();

		System.out.println("\n ## 카테고리 ## ");
		testCategoryInsert();
		displayCategoryInfo();
		System.out.print("\n");

		System.out.println("\n ## 상품리스트 ## ");
		testBookInsert();
		displaybookInfo();
		System.out.print("\n");

		System.out.println("\n ## 카트 ## ");
		testCartInsert();
		displayCartInfo();
		System.out.print("\n");

		System.out.println("\n ## 주문 ## ");
		OrderstestInsert();
		displayOrderInfo();
		System.out.print("\n");
		
		System.out.println("\n ## 주문 도서 리스트 ## ");
		testOrderBookInsert();
		displayOrderBookInfo();
		System.out.print("\n");
	}

	private static void displayOrderBookInfo() {
		List<OrderBookVo> list = new OrderBookDao().findAll();

		for (OrderBookVo orderBook : list) {
			orderBook.print();
		}		
	}
	private static void testOrderBookInsert() {
		OrderBookVo vo = null;
		OrderBookDao dao = new OrderBookDao();
		
		vo = new OrderBookVo();
		vo.setCount(0);
		vo.setBookNumber(2);
		vo.setOrderNumber(1);
		dao.insert(vo);
		
		vo = new OrderBookVo();
		vo.setCount(0);
		vo.setBookNumber(3);
		vo.setOrderNumber(2);
		dao.insert(vo);
		
	}
	private static void displayOrderInfo() {
		List<OrdersVo> list = new OrdersDao().findAll();

		for (OrdersVo order : list) {
			order.print();
		}
	}
	private static void OrderstestInsert() {
		OrdersVo vo = null;
		OrdersDao dao = new OrdersDao();
		
		vo = new OrdersVo();
		vo.setOrdersNumber(1);
		vo.setDestination("부산 덕천동");
		vo.setPrice(0);
		vo.setUserNo(1);
		dao.insert(vo);
		
		vo = new OrdersVo();
		vo.setOrdersNumber(2);
		vo.setDestination("울산 삼산동");
		vo.setPrice(0);
		vo.setUserNo(2);
		dao.insert(vo);
		
	}

	private static void displayCartInfo() {
		List<CartVo> list = new CartDao().findAll();

		for (CartVo cart : list) {
			cart.print();
		}
	}
	private static void testCartInsert() {
		CartVo vo = null;
		CartDao dao = new CartDao();
		
		vo = new CartVo();
		vo.setCount(2);
		vo.setUser_no(1);
		vo.setBook_no(2);
		dao.insert(vo);
		
		vo = new CartVo();
		vo.setCount(3);
		vo.setUser_no(2);
		vo.setBook_no(3);
		dao.insert(vo);
	}

	private static void displaybookInfo() {
		List<BookVo> list = new BookDao().findAll();

		for (BookVo book : list) {
			book.print();
		}
	}
	private static void testBookInsert() {
		BookVo vo = null;
		BookDao dao = new BookDao();
		
		vo = new BookVo();
		vo.setBookTitle("소설01");
		vo.setBookPrice(2000);
		vo.setCategory_no(1);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setBookTitle("IT01");
		vo.setBookPrice(3000);
		vo.setCategory_no(2);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setBookTitle("예술01");
		vo.setBookPrice(5000);
		vo.setCategory_no(3);
		dao.insert(vo);
	}

	private static void displayCategoryInfo() {
		List<CategoryVo> list = new CategoryDao().findAll();

		for (CategoryVo category : list) {
			category.print();
		}
	}
	private static void testCategoryInsert() {
		CategoryVo vo = null;
		CategoryDao dao = new CategoryDao();
		
		vo = new CategoryVo();
		vo.setCategoryType("소설");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setCategoryType("IT");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setCategoryType("예술");
		dao.insert(vo);
		
	}

	private static void displayUserInfo() {
		List<UserVo> list = new UserDao().findAll();

		for (UserVo user : list) {
			user.print();
		}
	}
	private static void testInsert() {
		UserVo vo = null;
		UserDao dao = new UserDao();
		
		vo = new UserVo();
		vo.setName("윤한영");
		vo.setPhone("010-1111-1111");
		vo.setEmail("test01@test.com");
		vo.setPassword("1111");
		dao.insert(vo);

		vo = new UserVo();
		vo.setName("정성웅");
		vo.setPhone("010-2222-2222");
		vo.setEmail("test02@test.com");
		vo.setPassword("2222");
		dao.insert(vo);

	}
}
