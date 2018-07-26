package kr.green.springwebproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

/* DB�뿉 �엳�뒗 寃뚯떆�뙋�뿉 ���븳 �젙蹂대�� 泥섎━�븯湲� �쐞�븳 硫붿냼�뱶瑜�
 * 媛�吏�怨� �엳�뒗 �씤�꽣�럹�씠�뒪 �빐�떦 �궡�슜�� BoardMapper.xml�뿉
 * 荑쇰━臾몄쑝濡� �옉�꽦�릺�뼱 �엳�쓬 */
public interface BoardMapper {
	public List<Board> getBoard();
	
	public Board getBoardByNumber(
			@Param("number")int number);
	public void modifyBoard(@Param("board")Board board);
	public void insertBoard(@Param("board")Board board);
	public List<Board> getListPage(@Param("cri")Criteria cri);
	public int getCountBoard();
	public int getCountBoardByTitle(@Param("search")String search);
	public List<Board>getListPageByTitle(@Param("cri")Criteria cri,
			@Param("search")String search);
	public int getCountBoardByAuthor(@Param("search")String search);
	public List<Board>getListPageByAuthor(@Param("cri")Criteria cri,
			@Param("search")String search);
	public int getCountBoardByContents(@Param("search")String search);
	public List<Board>getListPageByContents(@Param("cri")Criteria cri,
			@Param("search")String search);

	public List<Board> getBoardAll();
	public List<Board> getListPageByAdmin(@Param("cri")Criteria cri);
	public int getCountBoardByAdmin();
	
	public List<Board> getMyBoards(@Param("author")String author,
			@Param("cri")Criteria cri);
	public int getCountMyBoards(@Param("author")String author);
	public void deleteBoard(@Param("board")Board board);
	
	
	///로그용
	
	public ArrayList<Board> getBoardLog(
			@Param("number")int number);

	
	
}
