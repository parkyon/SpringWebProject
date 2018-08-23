package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

public interface LibraryInfoCommentMapper {

	
	
	
	public ArrayList<LibraryInfoComment> getComment(@Param("libraryInfo")LibraryInfo libraryInfo,@Param("libraryInfoComment")LibraryInfoComment libraryInfoComment);
	
	
	
	public void insertComment(@Param("libraryInfo")LibraryInfo libraryInfo,@Param("libraryInfoComment")LibraryInfoComment libraryInfoComment);
	
	
	public void deleteComment(@Param("libraryInfo")LibraryInfo libraryInfo,@Param("libraryInfoComment")LibraryInfoComment libraryInfoComment);
	
	public void modifyComment(@Param("user")User user,@Param("libraryInfo")LibraryInfo libraryInfo,@Param("libraryInfoComment")LibraryInfoComment libraryInfoComment);
	
	public int countComment(@Param("libraryInfo")LibraryInfo libraryInfo,@Param("libraryInfoComment")LibraryInfoComment libraryInfoComment);
	
	
}
