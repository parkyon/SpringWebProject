package kr.green.springwebproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardComment;
import kr.green.springwebproject.dao.BoardCommentMapper;
import kr.green.springwebproject.dao.User;

@Service
public class BoardCommentService {

	@Autowired
	private BoardCommentMapper boardCommentMapper;
	
	
	
	public ArrayList<BoardComment> GetBoardComment(Board board,BoardComment boardComment){
		return boardCommentMapper.getBoardComment(board, boardComment);
	}
	
	public boolean InsertBoardComment(User user, Board board, BoardComment boardComment) {
		boardComment.setWriter(user.getId());
		boardCommentMapper.insertBoardComment(board, boardComment);
		return true;
	}
	
	public boolean DeleteBoardComment(Integer cno, BoardComment boardComment, Board board) {
		boardCommentMapper.deleteBoardComment(board, boardComment);
		return true;
	}
	public boolean modifyBoardComment(Integer cno, BoardComment boardComment, Board board) {
		boardCommentMapper.modifyBoardComment(board, boardComment);
		return true;
	}
	public int CountComment(BoardComment boardComment, Board board) {
		int totalCount = 0;
		totalCount = boardCommentMapper.commentCount(board, boardComment);
		return totalCount;
	}
}
