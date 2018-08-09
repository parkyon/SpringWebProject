package kr.green.springwebproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface RecBookReviewMapper {

	
	
	public ArrayList<RecBookReview> getReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);

}
