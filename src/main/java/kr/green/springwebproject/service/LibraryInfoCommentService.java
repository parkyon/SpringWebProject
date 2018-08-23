package kr.green.springwebproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.LibraryInfoComment;
import kr.green.springwebproject.dao.LibraryInfoCommentMapper;
import kr.green.springwebproject.dao.User;

@Service
public class LibraryInfoCommentService {
	@Autowired
	private LibraryInfoCommentMapper libraryInfoCommentMapper;
	
	public ArrayList<LibraryInfoComment> GetComment(LibraryInfo libraryInfo, LibraryInfoComment libraryInfoComment){
	return libraryInfoCommentMapper.getComment(libraryInfo, libraryInfoComment);

	}
	
	public boolean InsertComment(User user, LibraryInfo libraryInfo, LibraryInfoComment libraryInfoComment) {
		
		libraryInfoComment.setWriter(user.getId());
		libraryInfoCommentMapper.insertComment(libraryInfo, libraryInfoComment);
		return false;
		
	}
	
	
	public boolean ModifyComment(LibraryInfo libraryInfo, LibraryInfoComment libraryInfoComment, User user) {
		libraryInfoCommentMapper.modifyComment(user, libraryInfo, libraryInfoComment);
		return true;
	}
	
	
	public boolean DeleteComment(Integer cno, LibraryInfo libraryInfo, LibraryInfoComment libraryInfoComment) {
		libraryInfoCommentMapper.deleteComment(libraryInfo, libraryInfoComment);
		return true;
		
	}
	
	public int CountComment(LibraryInfo libraryInfo, LibraryInfoComment libraryInfoComment) {
		int totalCount = 0;
		totalCount = libraryInfoCommentMapper.countComment(libraryInfo, libraryInfoComment);
		return totalCount;
	}
	
	
	
}
