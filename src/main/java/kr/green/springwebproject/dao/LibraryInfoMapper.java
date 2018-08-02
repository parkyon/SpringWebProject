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
	
	
}
