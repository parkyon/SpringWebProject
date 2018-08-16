package kr.green.springwebproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface BoardCommentMapper {
	
	
	public ArrayList<BoardComment> getBoardComment(@Param("board")Board board, @Param("boardComment")BoardComment boardComment);
	
	public void insertBoardComment(@Param("board")Board board, @Param("boardComment")BoardComment boardComment);
	
	public void deleteBoardComment(@Param("board")Board board, @Param("boardComment")BoardComment boardComment);
	
	public void modifyBoardComment(@Param("board")Board board, @Param("boardComment")BoardComment boardComment);

	public int commentCount(@Param("board")Board board, @Param("boardComment")BoardComment boardComment);
}
