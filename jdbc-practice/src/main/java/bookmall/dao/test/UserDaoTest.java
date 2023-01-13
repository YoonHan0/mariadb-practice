package bookmall.dao.test;

import bookmall.dao.UserDao;
import bookmall.vo.UserVo;

public class UserDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
		UserVo vo = null;
		UserDao dao = new UserDao();

		vo = new UserVo();
		vo.setName("정성웅");
		vo.setPhone("010-2222-2222");
		vo.setEmail("test02@test.com");
		vo.setPassword("2222");
		dao.insert(vo);

	}

}
