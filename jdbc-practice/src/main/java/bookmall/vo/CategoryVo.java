package bookmall.vo;

public class CategoryVo {
	private Long categoryNo;
	private String categoryType;
	
	public Long getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	public void print() {	// Categroy Type 출력
		System.out.print(categoryType + " ");
	}
}
