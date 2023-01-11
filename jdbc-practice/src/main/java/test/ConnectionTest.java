package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			// 1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			// 2. 연결하기 : "jdbc:mariadb//address:port/dbName?기타 형식"
			String url = "jdbc:mariadb://192.168.10.120:3307/webdb?charset=utf8";	// DB와 연결되기 위한 url
			conn = DriverManager.getConnection(url, "webdb", "webdb");
			
			System.out.println("연결 성공!");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("SQL Excption: " + e);
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// 
				e.printStackTrace();
			}
		}
	}

}
