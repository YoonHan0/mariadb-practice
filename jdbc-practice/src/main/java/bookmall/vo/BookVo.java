package bookmall.vo;

public class BookVo {
	private Long bookNo;
	private String bookTitle;
	private int bookPrice;
	private int category_no;
	private String categoryType;

	
	
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
	public String getCategoryType() {
		return categoryType;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public void print() {
		System.out.println("책이름: " + bookTitle + 	" | 가격: " + bookPrice + " | 종류: " + categoryType);	
	}
}
