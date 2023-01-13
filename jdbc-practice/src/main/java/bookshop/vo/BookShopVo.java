package bookshop.vo;

public class BookShopVo {
	private Long bookNo;
	private String title;
	private String author;
	private String stateCode;

	public Long getBookNo() {
		return bookNo;
	}

	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public void rent() {
		stateCode = "y";
		System.out.println(title + "이(가) 대여 됐습니다.");
	}

	public void print() {
		String check = "재고있음";
		if(stateCode.equals("y")) {
			check = "대여중";
		}
		System.out.println(bookNo + ". " + "책 제목:" + title + ", 작가:" + author + ", 대여 유무:" +  check);
	}
}