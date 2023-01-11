package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TxTest02 {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			// 1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기 : "jdbc:mariadb//address:port/dbName?기타 형식"
			String url = "jdbc:mariadb://192.168.10.120:3307/webdb?charset=utf8"; // DB와 연결되기 위한 url
			// 2-1 계정 : url, 계정, 비밀번호 입력
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			txCreateDepartmentAndEmployee(conn, "영업1", "둘리");
			txCreateDepartmentAndEmployee(conn, "영업2", "마이콜");

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("SQL Excption: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void txCreateDepartmentAndEmployee(
			Connection conn, 
			String deptName, 
			String empName) throws SQLException {

		try {
			// begin Transactinon
			conn.setAutoCommit(false);

			// ================== DML1 ==================
			// 3. Statement 준비
			String sql1 = 
					"INSERT" + 
					" INTO dept VALUES(null, ?)";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);

			// 4. binding
			pstmt1.setString(1, deptName);
			// 5. SQL 실행
			pstmt1.executeUpdate();
			pstmt1.close();
			
			// ================== Last ID(no) ==================
			String sql2 = "SELECT LAST_INSERT_ID() FROM DUAL";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			ResultSet rs = pstmt2.executeQuery();
			
			Long deptNo = rs.next() ? rs.getLong(1) : 0;
			rs.close();
			pstmt2.close();
			
			// ================== DML2 ==================
			String sql3 = 
					"INSERT" + 
					" INTO emp VALUES(null, ?, ?)";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);

			// 4. binding
			pstmt3.setString(1, empName);
			pstmt3.setLong(2, deptNo);
			
			// 5. SQL 실행
			pstmt3.executeUpdate();
			pstmt3.close();
			
			conn.commit();
			
		} catch (SQLException e) {
			conn.rollback();
			e.printStackTrace();
		}
	}

}
