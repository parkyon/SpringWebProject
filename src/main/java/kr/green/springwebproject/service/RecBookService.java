package kr.green.springwebproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.RecBookMapper;
import kr.green.springwebproject.dao.User;
@Service
public class RecBookService {
	@Autowired
	private RecBookMapper recBookMapper;

	public ArrayList<LibraryInfo> getRecBook(Integer recBookNumber) {
		return recBookMapper.getRecBookListByNumber(recBookNumber);

	}

	public RecBook getDetailRecBook(Integer recBookNumber) {
		// TODO Auto-generated method stub
		return recBookMapper.getDetailRecBookByNumber(recBookNumber);
	}

	public boolean isAuthor(User user, RecBook recBook) {
		if(user != null) {
			if(user.getId().compareTo(recBook.getAuthor())==0)
				return true;
			else 
				return false;
		}
		
		return false;
	}


	public boolean registerRecBook(RecBook recBook, User user) {
		
		recBook.setAuthor(user.getId());
		
		recBookMapper.insertRecBook(recBook);
		
		return true;
		// TODO Auto-generated method stub
		
	}

	public boolean modifyRecBook(RecBook recBook) {
		// TODO Auto-generated method stub
		recBookMapper.modifyRecBook(recBook);
		return false;
		
	}

	public boolean deleteLibaryInfo(RecBook recBook) {
		// TODO Auto-generated method stub
		recBookMapper.deleteRecBook(recBook);
		return false;
		
	}

}
