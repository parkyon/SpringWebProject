package kr.green.springwebproject.pagenation;

public class PageMaker {
	private int totalCount;
	private int startPage, endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=10;
	Criteria criteria;
	
	public int getTotalCount() {
		return totalCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public Criteria getCriteria() {
		return criteria;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calc();
	}
	public void setStartPage(int startPage) {
		if(startPage <= 0)
			this.startPage = 1;
		else
			this.startPage = startPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public void setDisplayPageNum(int displayPageNum) {
		if(displayPageNum <= 5)
			this.displayPageNum = 5;
		else
			this.displayPageNum = displayPageNum;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	} 
	void calc() {
		//현재페이지 : 11, 한페이지에 보이는 게시글 : 10
		//페이지메이커가 보여주는 페이지 수 : 10
		//검색된 총 게시글의 수는 181개
		/* endPage = 20;*/
		endPage = 
			(int) (Math.ceil(
				criteria.getPage()/(double) displayPageNum
				)*displayPageNum);
		/* starPage = 11 */
		startPage = (endPage - displayPageNum)+1;
		/* tempEndPage = 19
		*/
		int tempEndPage = 
			(int)(Math.ceil
				(totalCount/(double)criteria.getPerPageNum())
				);
		/*endPage = 19*/
		if(endPage > tempEndPage)
			endPage = tempEndPage;
		//prev = true
		//next = false
		prev = startPage == 1 ? false : true;
		
		next = endPage * criteria.getPerPageNum() >= totalCount 
				? false:true;
		
	}
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria + "]";
	}
	
}
