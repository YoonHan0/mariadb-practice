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
		vo.setBookNumber(0);
		vo.setOrderNumber(0);
		
		vo = new OrderBookVo();
		vo.setOrdersNumber(2);
		vo.setDestination("울산 삼산동");
		vo.setPrice(0);
		vo.setUserNo(2);
		dao.insert(vo);
		
	}

}
