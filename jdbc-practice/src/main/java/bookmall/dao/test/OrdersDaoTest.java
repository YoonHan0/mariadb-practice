package bookmall.dao.test;

import bookmall.dao.OrdersDao;
import bookmall.vo.OrdersVo;


public class OrdersDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
		OrdersVo vo = null;
		OrdersDao dao = new OrdersDao();
		
		vo = new OrdersVo();
		vo.setOrdersNumber(1);
		vo.setDestination("부산 덕천동");
		vo.setUserNo(1);
		dao.insert(vo);
		
		vo = new OrdersVo();
		vo.setOrdersNumber(1+1);
		vo.setDestination("울산 삼산동");
		vo.setUserNo(2);
		dao.insert(vo);
		
	}

}
