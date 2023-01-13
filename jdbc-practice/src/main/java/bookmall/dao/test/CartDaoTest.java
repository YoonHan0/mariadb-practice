package bookmall.dao.test;

import bookmall.dao.CartDao;
import bookmall.vo.CartVo;

public class CartDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
		CartVo vo = null;
		CartDao dao = new CartDao();
		
		vo = new CartVo();
		vo.setCount(2);
		vo.setUser_no(1);
		vo.setBook_no(4);
		dao.insert(vo);
		
	}

}
