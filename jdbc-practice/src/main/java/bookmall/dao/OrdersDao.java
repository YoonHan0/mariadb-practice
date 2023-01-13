package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.OrdersVo;

public class OrdersDao {

	public void insert(OrdersVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = 
					"INSERT INTO orders(no, order_no, destination, user_no)" +
					" VALUES(null, ?, ?, ?);";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getOrdersNumber());
			pstmt.setString(2, vo.getDestination());
			pstmt.setInt(3, vo.getUserNo());
			
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
	
	public List<OrdersVo> findAll() {
		List<OrdersVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			String sql =
					"SELECT a.no, a.order_no, b.name, b.email, c.sumPrice, a.destination"
					+ " FROM orders a"
					+ " JOIN user b ON a.user_no = b.no"
					+ " JOIN (SELECT a.user_no AS user_no, sum(a.count*b.price) AS sumPrice"
					+ "		FROM cart a"
					+ "		JOIN book b ON a.book_no = b.no"
					+ "		GROUP BY a.user_no) c ON b.no = c.user_no";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrdersVo vo = new OrdersVo();
				vo.setOrdersNo(rs.getLong(1));
				vo.setOrdersNumber(rs.getInt(2));
				vo.setUserName(rs.getString(3));
				vo.setUserEmail(rs.getString(4));
				vo.setSumResult(rs.getInt(5));
				vo.setDestination(rs.getString(6));
				
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

	public List<OrdersVo> findOrderBookAll() {
		List<OrdersVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			String sql =
					"SELECT a.no, a.order_no, b.name, b.email, c.sumPrice, a.destination"
					+ " FROM orders a"
					+ " JOIN user b ON a.user_no = b.no"
					+ " JOIN (SELECT a.user_no AS user_no, sum(a.count*b.price) AS sumPrice"
					+ "		FROM cart a"
					+ "		JOIN book b ON a.book_no = b.no"
					+ "		GROUP BY a.user_no) c ON b.no = c.user_no";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrdersVo vo = new OrdersVo();
				vo.setOrdersNo(rs.getLong(1));
				vo.setOrdersNumber(rs.getInt(2));
				vo.setUserName(rs.getString(3));
				vo.setUserEmail(rs.getString(4));
				vo.setSumResult(rs.getInt(5));
				vo.setDestination(rs.getString(6));
				
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


}
