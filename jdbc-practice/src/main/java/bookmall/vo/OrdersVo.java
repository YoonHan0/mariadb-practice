package bookmall.vo;

public class OrdersVo {
	private Long ordersNo;
	private int ordersNumber;
	private String destination;
	private int price;
	private int userNo;
	private String userName;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getSumResult() {
		return sumResult;
	}
	public void setSumResult(int sumResult) {
		this.sumResult = sumResult;
	}
	private String userEmail;
	private int sumResult;
		
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Long getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(Long ordersNo) {
		this.ordersNo = ordersNo;
	}


	public int getOrdersNumber() {
		return ordersNumber;
	}
	public void setOrdersNumber(int ordersNumber) {
		this.ordersNumber = ordersNumber;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public void print() {
		System.out.println("주문번호: " + ordersNumber + 
							" | 주문고객: " + userName +
							" | 이메일: " + userEmail +
							" | 총 금액: " + sumResult +
							" | 배송지: " + destination);
	}

}
