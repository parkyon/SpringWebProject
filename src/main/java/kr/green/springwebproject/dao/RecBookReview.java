package kr.green.springwebproject.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RecBookReview {

	private int recviewnumber;
	private int bno;
	private String content;
	private String writer;

	@Override
	public String toString() {
		return "RecBookReview [recviewnumber=" + recviewnumber + ", bno=" + bno + ", content=" + content + ", writer="
				+ writer + ", reg_date=" + reg_date + "]";
	}
	public int getRecviewnumber() {
		return recviewnumber;
	}
	public void setRecviewnumber(int recviewnumber) {
		this.recviewnumber = recviewnumber;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReg_date() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String to = transFormat.format(reg_date);

		return to;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	private Date reg_date;
}
