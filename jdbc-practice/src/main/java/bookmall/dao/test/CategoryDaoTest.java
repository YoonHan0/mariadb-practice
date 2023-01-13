package bookmall.dao.test;

import bookmall.dao.CategoryDao;
import bookmall.vo.CategoryVo;

public class CategoryDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
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

}
