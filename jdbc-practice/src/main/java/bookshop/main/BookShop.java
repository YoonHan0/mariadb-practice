package bookshop.main;

import java.util.List;
import java.util.Scanner;

import bookshop.dao.BookShopDao;
import bookshop.vo.BookShopVo;


public class BookShop {

	public static void main(String[] args) {
		displayBookInfo();
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		Long no = scanner.nextLong();
		scanner.close();
		
		BookShopVo vo = new BookShopVo();
		vo.setBookNo(no);
		vo.setStateCode("Y");
		
		 new BookShopDao().update(vo);
		
		displayBookInfo();
	}

	/* Read */
	private static void displayBookInfo() {
		List<BookShopVo> list = new BookShopDao().findAll();
		
		for(BookShopVo book : list) {
			book.print();
		}
	}
}