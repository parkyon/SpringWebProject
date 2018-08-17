package kr.green.springwebproject.dao;

import java.util.Date;

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
			
			
	//파일첨부
			
			private String filepath;

			public String getFilepath() {
				return filepath;
			}
			public void setFilepath(String filepath) {
				this.filepath = filepath;
			}
			public void setCreated_date(Date created_date) {
				// TODO Auto-generated method stub
				
			}
			

			
			
			
			
	
			//추천수
			
			private int recomand;
			public int getRecomand() {
				return recomand;
			}
			public void setRecomand(int recomand) {
				this.recomand = recomand;
			}
			
			private int notrecomand;
			public int getNotrecomand() {
				return notrecomand;
			}
			public void setNotrecomand(int notrecomand) {
				this.notrecomand = notrecomand;
			}
			
			
			//리뷰
			
			private String review;



			public String getReview() {
				return review;
			}
			public void setReview(String review) {
				this.review = review;
			}
			
			private int price;
			public int getPrice() {
				return price;
			}
			public void setPrice(int price) {
				this.price = price;
			}
			public String getPublisher() {
				return publisher;
			}
			public void setPublisher(String publisher) {
				this.publisher = publisher;
			}

			private String publisher;
			
			
			private String sell;



			public String getSell() {
				return sell;
			}
			public void setSell(String sell) {
				this.sell = sell;
			}
			private int guestReview;



			public int getGuestReview() {
				return guestReview;
			}
			public void setGuestReview(int guestReview) {
				this.guestReview = guestReview;
			}
}
