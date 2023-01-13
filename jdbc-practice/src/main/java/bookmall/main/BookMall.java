package bookmall.main;

import java.util.List;
import java.util.Scanner;

import bookmall.dao.BookDao;
import bookmall.dao.CartDao;
import bookmall.dao.CategoryDao;
import bookmall.dao.OrdersDao;
import bookmall.dao.UserDao;
import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;
import bookmall.vo.OrdersVo;
import bookmall.vo.UserVo;

public class BookMall {

	public static void main(String[] args) {

		System.out.println("## 회원 리스트 출력 ##");
		displayUserInfo();

		System.out.println("\n ## 카테고리 ## ");
		displayCategoryInfo();
		System.out.print("\n");

		System.out.println("\n ## 상품리스트 ## ");
		displaybookInfo();
		System.out.print("\n");

		System.out.println("\n ## 카트 ## ");
		displayCartInfo();
		System.out.print("\n");

		System.out.println("\n ## 주문 ## ");
		displayOrderInfo();
		System.out.print("\n");
		
		System.out.println("## \n 주문 도서 리스트 ## ");
		displayOrderBookInfo();
		System.out.print("\n");
	}

	private static void displayOrderBookInfo() {
		List<OrdersVo> list = new OrdersDao().findOrderBookAll();

		for (OrdersVo order : list) {
			order.print();
		}		
	}

	private static void displayOrderInfo() {
		List<OrdersVo> list = new OrdersDao().findAll();

		for (OrdersVo order : list) {
			order.print();
		}
	}

	private static void displayCartInfo() {
		List<CartVo> list = new CartDao().findAll();

		for (CartVo cart : list) {
			cart.print();
		}
	}

	private static void displaybookInfo() {
		List<BookVo> list = new BookDao().findAll();

		for (BookVo book : list) {
			book.print();
		}
	}

	private static void displayCategoryInfo() {
		List<CategoryVo> list = new CategoryDao().findAll();

		for (CategoryVo category : list) {
			category.print();
		}
	}

	private static void displayUserInfo() {
		List<UserVo> list = new UserDao().findAll();

		for (UserVo user : list) {
			user.print();
		}
	}
}
