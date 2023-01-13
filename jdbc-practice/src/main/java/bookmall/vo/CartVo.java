package bookmall.vo;

public class CartVo {
	private Long cartNo;
	private int count;
	private int book_no;
	private int user_no;
	private String userName;
	private String bookTitle;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Long getCartNo() {
		return cartNo;
	}
	public void setCartNo(Long cartNo) {
		this.cartNo = cartNo;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void print() {
		System.out.println("사용자: " + userName + " | 책 제목: " + bookTitle + " | 개수: " + count);
		
	}
}
