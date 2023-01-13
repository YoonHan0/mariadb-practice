package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.OrderBookVo;

public class OrderBookDao {

	public void insert(OrderBookVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		OrdersDao returnCount = new OrdersDao();

		try {
			conn = getConnection();
			
			String sql = 
					"INSERT INTO order_book(no, count, book_no, orders_no)"
					+ " VALUES(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, returnCount.returnCount(vo.getBookNumber()));
			pstmt.setInt(2, vo.getBookNumber());
			pstmt.setInt(3, vo.getOrderNumber());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public List<OrderBookVo> findAll() {
		List<OrderBookVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			String sql =
					"select b.no, b.title, o.count"
					+ " from order_book o join book b"
					+ " on o.book_no = b.no";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBookVo vo = new OrderBookVo();
				
				vo.setBookNumber(rs.getInt(1));
				vo.setBookName(rs.getString(2));
				vo.setCount(rs.getInt(3));
				
				result.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://192.168.10.120:3307/bookmall?charset=utf8";
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		}
		
		return conn;
	}
	

}
