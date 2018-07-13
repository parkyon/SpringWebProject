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
}
