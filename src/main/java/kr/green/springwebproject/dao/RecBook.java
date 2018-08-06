package kr.green.springwebproject.dao;

public class RecBook {

	
	private int recBookNumber;
	private String bookName;
	private String bookType;
	private String bookStory;
	private String bookPhoto;
	private int number;
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getRecBookNumber() {
		return recBookNumber;
	}
	public void setRecBookNumber(int recBookNumber) {
		this.recBookNumber = recBookNumber;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public String getBookStory() {
		return bookStory;
	}
	public void setBookStory(String bookStory) {
		this.bookStory = bookStory;
	}
	public String getBookPhoto() {
		return bookPhoto;
	}
	public void setBookPhoto(String bookPhoto) {
		this.bookPhoto = bookPhoto;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	private String writer;
	private String author;
	
	
	//로그용
	
	private String changedate;
	private String action;
	public String getChangedate() {
		return changedate;
	}
	public void setChangedate(String changedate) {
		this.changedate = changedate;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	//최신글용
	private String title;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	//조회수

			private int hits;
			public int getHits() {
				return hits;
			}
			public void setHits(int hits) {
				this.hits = hits;
			}
}
