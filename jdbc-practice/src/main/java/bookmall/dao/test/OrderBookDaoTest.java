package bookmall.dao.test;

import bookmall.dao.OrderBookDao;
import bookmall.dao.OrdersDao;
import bookmall.vo.OrderBookVo;
import bookmall.vo.OrdersVo;

public class OrderBookDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testInsert() {
		OrderBookVo vo = null;
		OrderBookDao dao = new OrderBookDao();
		
		vo = new OrderBookVo();
		vo.setCount(0);
		vo.setBookNumber(1);
		vo.setOrderNumber(1);
		dao.insert(vo);
		
		vo = new OrderBookVo();
		vo.setCount(0);
		vo.setBookNumber(2);
		vo.setOrderNumber(2);
		dao.insert(vo);
		
	}

}
