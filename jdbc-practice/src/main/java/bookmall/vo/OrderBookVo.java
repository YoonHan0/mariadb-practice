package bookmall.vo;

public class OrderBookVo {
	private Long no;
	private int count;
	private int orderNumber;
	private int bookNumber;
	private String bookName;
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public int getBookNumber() {
		return bookNumber;
	}
	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void print() {
		System.out.println(bookNumber + " | 책 이름: " +
							bookName + " | 수량: " +
							count);
		
	}
	
}
