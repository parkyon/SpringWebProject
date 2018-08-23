package kr.green.springwebproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface RecBookReviewMapper {

	
	
	public ArrayList<RecBookReview> getReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);

	public void insertReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);
	

	//삭제/ 수정
	public void deleteReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);

	public void modifyReview(@Param("user")User user,@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);
	
	//댓글 숫자
	
	public int countReview(@Param("recBook")RecBook recBook, @Param("recbookreview")RecBookReview recbookreview);
}