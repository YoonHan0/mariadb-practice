package bookmall.vo;

public class UserVo {
	private Long userNo;
	private String name;
	private String phone;
	private String email;
	private String password;
	
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void print() {
		System.out.println("이름: " + name + " | 전화번호: " + phone + " | 이메일: " + email);		
	}
}
