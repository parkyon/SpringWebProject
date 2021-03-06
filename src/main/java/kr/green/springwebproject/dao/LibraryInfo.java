package kr.green.springwebproject.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class LibraryInfo {

	private Integer number;
	private String libraryName;
	private String cityName;
	private String libraryType;
	private String holiday;
	private String openSeat;
	private String bookCount;
	private String bookCount2;
	private String bookCount3;
	private String loadAddress;
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getLibraryName() {
		return libraryName;
	}
	public void setLibraryName(String libraryName) {
		this.libraryName = libraryName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getLibraryType() {
		return libraryType;
	}
	public void setLibraryType(String libraryType) {
		this.libraryType = libraryType;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getOpenSeat() {
		return openSeat;
	}
	public void setOpenSeat(String openSeat) {
		this.openSeat = openSeat;
	}
	public String getBookCount() {
		return bookCount;
	}
	public void setBookCount(String bookCount) {
		this.bookCount = bookCount;
	}
	public String getBookCount2() {
		return bookCount2;
	}
	public void setBookCount2(String bookCount2) {
		this.bookCount2 = bookCount2;
	}
	public String getBookCount3() {
		return bookCount3;
	}
	public void setBookCount3(String bookCount3) {
		this.bookCount3 = bookCount3;
	}
	public String getLoadAddress() {
		return loadAddress;
	}
	public void setLoadAddress(String loadAddress) {
		this.loadAddress = loadAddress;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	private String operation;
	private String phoneNumber;
	private String homepage;
	private String filepath;
	private String author;
	private Date reg_date;


	public String getReg_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String to = transFormat.format(reg_date);

		return to;
	}
	
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	//로그용
	
	private Date changedate;
	public Date getChangedate() {
		return changedate;
	}
	public void setChangedate(Date changedate) {
		this.changedate = changedate;
	}

	private String action;
	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	
	//지도용 위도 경도
	
	private double latitude;
	public double getLatitude() {
		return latitude;
	}
	public void setLatitudel(double latitude) {
		this.latitude = latitude;
	}
	private double longtitude;
	
	public double getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(double longtitude) {
		this.longtitude = longtitude;
	}
	
	//추천수
	


	private int recomand;
	public int getRecomand() {
		return recomand;
	}
	public void setRecomand(int recomand) {
		this.recomand = recomand;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	private int notrecomand;
	public int getNotrecomand() {
		return notrecomand;
	}
	public void setNotrecomand(int notrecomand) {
		this.notrecomand = notrecomand;
	}
	
	
	
	

	//조회수

		private int hits;
		public int getHits() {
			return hits;
		}
		public void setHits(int hits) {
			this.hits = hits;
		}
		
		
		private String publisher;
		private int price;
		public String getPublisher() {
			return publisher;
		}
		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		
		private int review;
		public int getReview() {
			return review;
		}
		public void setReview(int review) {
			this.review = review;
		}
}




