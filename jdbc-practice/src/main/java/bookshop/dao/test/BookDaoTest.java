package bookshop.dao.test;

import bookshop.dao.BookShopDao;
import bookshop.vo.BookShopVo;

public class BookDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
		BookShopVo vo = null;
		BookShopDao dao = new BookShopDao();
		
		vo = new BookShopVo();
		vo.setTitle("title_test02");
		vo.setAuthor("2");
		dao.insert(vo);
		
	}

}