package kr.green.springwebproject.dao;

import java.util.Date;

public class RecBookReview {

	private int recviewnumber;
	private int bno;
	private String content;
	private String writer;

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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	private Date reg_date;
}
