package kr.green.springwebproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.springwebproject.pagenation.Criteria;

/* DB에 있는 게시판에 대한 정보를 처리하기 위한 메소드를
 * 가지고 있는 인터페이스 해당 내용은 BoardMapper.xml에
 * 쿼리문으로 작성되어 있음 */
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
	public void modifyBoardByDisable(@Param("board")Board board);
	public List<Board> getBoardAll();
	public List<Board> getListPageByAdmin(@Param("cri")Criteria cri);
	public int getCountBoardByAdmin();
	
	public List<Board> getMyBoards(@Param("author")String author,
			@Param("cri")Criteria cri);
	public int getCountMyBoards(@Param("author")String author);
}
