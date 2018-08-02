package kr.green.springwebproject.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("com.example.demo.comment.mapper.CommentMapper")
public interface CommentMapper {

	public int commentCount() throws Exception;
	 
    // 댓글 목록
    public List<Comment> commentList() throws Exception;
 
    // 댓글 작성
    public int commentInsert(Comment comment) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(Comment comment) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int cno) throws Exception;
	
	
}
