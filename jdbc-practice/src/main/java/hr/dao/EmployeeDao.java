package hr.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hr.vo.EmployeeVo;

public class EmployeeDao {
	public List<EmployeeVo> findByName(String keyword) {
		List<EmployeeVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1. JDBC Driver Class 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			// 2. 연결하기 : "jdbc:mariadb//address:port/dbName?기타 형식"
			String url = "jdbc:mariadb://192.168.10.120:3307/employees?charset=utf8";	// DB와 연결되기 위한 url
			// 2-1 계정 : url, 계정, 비밀번호 입력
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			
			// 3. Statement 준비
			String sql = 
					"SELECT emp_no, first_name, last_name, date_format(hire_date, '%Y-%m-%d')"
					+ " FROM employees"
					+ " WHERE first_name LIKE ?"
					+ "	OR last_name LIKE ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();	// prepareStatement는 sql문을 만들고 binding 해줬으므로 
			
			// 5. 결과 처리
			while(rs.next()) {
				Long no = rs.getLong(1); // Select로 검색하는 Data(1: emp_no)
				String firstName = rs.getString(2); // Select로 검색하는 Data(2: first_name)
				String lastName = rs.getString(3);
				String hireDate = rs.getString(4);
				
				// System.out.println(empNo + ":" + firstName + " " + lastName);
				// main에서 출력해주기 위해서 set 작업
				EmployeeVo vo = new EmployeeVo();
				vo.setNo(no);
				vo.setFirstName(firstName);
				vo.setLastName(lastName);
				vo.setHireDate(hireDate);
				
				// ArrayList에 모두 추가
				result.add(vo);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		} catch (SQLException e) {
			System.out.println("SQL Excption: " + e);
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
				// 
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
