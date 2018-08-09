package kr.green.springwebproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.RecBookReview;
import kr.green.springwebproject.dao.RecBookReviewMapper;
@Service
public class RecBookReviewService {

	@Autowired
	private RecBookReviewMapper recBookReviewMapper;
	
	public ArrayList<RecBookReview> GetReview(RecBook recBook, RecBookReview recBookReview){
		return recBookReviewMapper.getReview(recBook, recBookReview);
	}
	
	public boolean InsertReview(User user,RecBook recBook, RecBookReview recbookreview) {
	
		recbookreview.setWriter(user.getId());
	recBookReviewMapper.insertReview(recBook, recbookreview);
	return true;
	}
	
}
