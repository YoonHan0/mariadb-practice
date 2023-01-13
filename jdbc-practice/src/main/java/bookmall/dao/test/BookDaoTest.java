package bookmall.dao.test;

import bookmall.dao.BookDao;
import bookmall.vo.BookVo;

public class BookDaoTest {
	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
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
}
