package kr.green.springwebproject.dao;

public class RecBook {

	
	private int recBookNumber;
	private String bookName;
	private String bookType;
	private String bookStory;
	private String bookPhoto;
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
	public String getDisable() {
		return disable;
	}
	public void setDisable(String disable) {
		this.disable = disable;
	}
	private String writer;
	private String author;
	private String disable;
	
}
