package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

public interface LibraryInfoMapper {
	
	public List<LibraryInfo> getLibraryInfo();
	
	public ArrayList<LibraryInfo> getLibraryInfoByNumber(
			@Param("number")int number);
	
	public LibraryInfo getDetailLibraryInfoByNumber(
			@Param("number")int number);

	public void insertLibraryInfo(@Param("libraryInfo")LibraryInfo libraryInfo);
	public void modifyLibraryInfo(@Param("libraryInfo")LibraryInfo libraryInfo);
	public void deleteLibraryInfo(@Param("libraryInfo")LibraryInfo libraryInfo);

	//로그용
	
	public ArrayList<LibraryInfo> getLibraryInfoLog(
			@Param("number")int number);
//최신글용
	
	public int getCountLibraryInfo();
	public List<Board> searchLibraryInfos(@Param("cri")Criteria cri, @Param("search")String search, @Param("type")int type);


	//map
	
	public ArrayList<LibraryInfo> getCoordinate(@Param("number")int number);
	

//datatable
	
	public List<LibraryInfo> SSgetLibraryInfo(@Param("cri")Criteria cri, @Param("search")String search, @Param("type")int type);
	
	public int countLibrary(@Param("cri")Criteria cri, @Param("search")String search, @Param("type")int type);

	//rec
	
	public void recLibraryInf(@Param("libraryInfo")LibraryInfo libraryInfo);
	public void notrecLibraryInf(@Param("libraryInfo")LibraryInfo libraryInfo);
	
	
	
	
	//댓글용
	
	
	
	//조회수
	
	public int libraryInfoHits(@Param("libraryInfo")LibraryInfo libraryInfo);
	
	//댓글 수정 및 삭제
	
	public void deleteComment(@Param("libraryInfo")LibraryInfo libraryInfo);
	public void modifyComment(@Param("libraryInfo")LibraryInfo libraryInfo);
	
	//댓글 수
	public int countComment(@Param("libraryInfo")LibraryInfo libraryInfo);
	
	//메인 댓글수
	public void libraryinfoMainReview(@Param("libraryInfo")LibraryInfo libraryInfo,@Param("libraryInfoComment")LibraryInfoComment libraryInfoComment);
	
	//메인검색
	public ArrayList<LibraryInfo> LM_LibraryInfo(@Param("search")String search,@Param("type")int type);
}
