package kr.green.springwebproject.pagenation;

public class Criteria {
	private int page;
	private int perPageNum;
	
	public Criteria() {
		page = 1;
		perPageNum = 5;
	}
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	public int getPageStart() {
		return (page-1)*perPageNum;
	}
}
