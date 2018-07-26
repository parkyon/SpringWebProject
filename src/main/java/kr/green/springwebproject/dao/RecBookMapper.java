package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

public interface RecBookMapper {

	public ArrayList<RecBook> getRecBookListByNumber(
			@Param("recBookNumber")int recBookNumber);

	public void insertRecBook(@Param("recBook")RecBook recBook);
	public void modifyRecBook(@Param("recBook")RecBook recBook);
	public void deleteRecBook(@Param("recBook")RecBook recBook);

	public RecBook getDetailRecBookByNumber(@Param("recBookNumber")int recBookNumber);
	
	
	//로그용
	
	public ArrayList<RecBook> getRecBookLog(
			@Param("recBookNumber")int recBookNumber);

	
	//최신글용
	
	public int getCountRecBook();

	public ArrayList searchRecBooks(@Param("cri")Criteria cri, @Param("search")String search, @Param("type")int type);

	

	

}
