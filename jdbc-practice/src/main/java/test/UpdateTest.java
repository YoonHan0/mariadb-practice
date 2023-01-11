package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateTest {

	public static void main(String[] args) {
		DeptVo vo = new DeptVo();
		vo.setNo(1L);
		vo.setName("경영지원");

		Boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");
	}

	private static Boolean update(DeptVo vo) {
		Connection conn = null;
		Statement stmt = null;
		boolean result = false;
		try {
			// 1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기 : "jdbc:mariadb//address:port/dbName?기타 형식"
			String url = "jdbc:mariadb://192.168.10.120:3307/webdb?charset=utf8"; // DB와 연결되기 위한 url
			// 2-1 계정 : url, 계정, 비밀번호 입력
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. SQL 실행
			String sql = 
					"UPDATE dept" +
					" SET name='" + vo.getName() + "'" +
					" WHERE no = " + vo.getNo();
			int count = stmt.executeUpdate(sql);

			// 결과 처리
			result = count == 1;

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("SQL Excption: " + e);
		} finally {
			try {

				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}


}
