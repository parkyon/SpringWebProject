package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

public interface LibraryInfoMapper {
	
	public List<LibraryInfo> getLibraryInfo();
	
	public ArrayList<LibraryInfo> getLibraryInfoByNumber(
			@Param("number")int number);
	
}