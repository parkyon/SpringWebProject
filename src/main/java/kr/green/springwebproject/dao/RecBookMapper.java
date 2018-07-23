package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RecBookMapper {

	public ArrayList<LibraryInfo> getRecBookListByNumber(
			@Param("recBookNumber")int recBookNumber);

	public void insertRecBook(@Param("recBook")RecBook recBook);
	public void modifyRecBook(@Param("recBook")RecBook recBook);
	public void deleteRecBook(@Param("recBook")RecBook recBook);

	public RecBook getDetailRecBookByNumber(@Param("recBookNumber")int recBookNumber);
	
}
