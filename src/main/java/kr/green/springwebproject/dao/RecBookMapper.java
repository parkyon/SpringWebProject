package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RecBookMapper {

	public ArrayList<LibraryInfo> getRecBookListByNumber(
			@Param("recBookNumber")int recBookNumber);

	public void insertRecBook(@Param("number")RecBook recBook);


	public RecBook getDetailRecBookByNumber(@Param("recBookNumber")int recBookNumber);
	
}
