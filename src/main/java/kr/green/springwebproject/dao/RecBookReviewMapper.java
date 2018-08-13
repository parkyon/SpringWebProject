package kr.green.springwebproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface RecBookReviewMapper {

	
	
	public ArrayList<RecBookReview> getReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);

	public void insertReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);
	

	
	public void deleteReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);

	public void modifyReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);
}