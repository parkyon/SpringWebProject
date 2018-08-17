package kr.green.springwebproject.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

/* DB�뿉�꽌 寃뚯떆�뙋 �젙蹂대�� 媛��졇�� ���옣�븷 �겢�옒�뒪 */
public class Board {
	/* 硫ㅻ쾭 : DB �뀒�씠釉�(board)�뿉 �엳�뒗 �냽�꽦怨� �씠由꾩쓣
	 * �씪移� �떆耳쒖빞�븳�떎. */
	private Integer number;
	private String title;
	private String author;
	private String contents;
	
	private Date created_date;
	private String filepath;
	
	
	
	
	public String getCreated_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String to = transFormat.format(created_date);

		return to;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Integer getNumber() {
		return number;
	}
	public String getTitle() {
		return title;
	}
	public String getAuthor() {
		return author;
	}
	public String getContents() {
		return contents;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "Board [number=" + number + ", title=" + title + ", author=" + author + ", contents=" + contents + "]";
	}
	
	
	////로그용
	
	private String action;
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getChangedate() {
		return changedate;
	}
	public void setChangedate(String changedate) {
		this.changedate = changedate;
	}


	private String changedate;

	
	//기타
	//조회수

			private int hits;
			public int getHits() {
				return hits;
			}
			public void setHits(int hits) {
				this.hits = hits;
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
					
			private int review;




			public int getReview() {
				return review;
			}
			public void setReview(int review) {
				this.review = review;
			}
}
