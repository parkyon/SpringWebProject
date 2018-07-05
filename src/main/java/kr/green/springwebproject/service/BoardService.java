package kr.green.springwebproject.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.utils.UploadFileUtils;


@Service
public class BoardService {

	
		@Autowired
		private BoardMapper boardMapper;
		
		
		public ArrayList<Board> getListBoard(Integer type,Criteria cri, String search) {
			ArrayList<Board> list = null;
			
			if(type == null)
				type = 0;
			if(type == 0) {
				list 
				= (ArrayList)boardMapper.getListPage(cri);
			}
			else if(type == 1) {
				list 
				= (ArrayList)boardMapper.getListPageByTitle(cri,"%"+search+"%");
			}else if(type == 2) {
				 
				list 
				= (ArrayList)boardMapper.getListPageByAuthor(cri,"%"+search+"%");
			}else {
				
				list 
				= (ArrayList)boardMapper.getListPageByContents(cri,"%"+search+"%");
			}
			return list;
				
		}


		
		public int getCountByBoardList(Integer type,Criteria cri, String search) {
			
			int totalCount = 0;
			
			if(type == null)
				type = 0;
			if(type == 0) {
				totalCount = boardMapper.getCountBoard();
				
			}
			else if(type == 1) {
				totalCount 
				= boardMapper.getCountBoardByTitle("%"+search+"%");
			
			}else if(type == 2) {
				totalCount 
				= boardMapper.getCountBoardByAuthor("%"+search+"%");
			
			}else {
				totalCount 
				= boardMapper.getCountBoardByContents("%"+search+"%");
			
			}
			
			
			return totalCount;
		}
		
		
		public Board getBoard(int number) {
			return boardMapper.getBoardByNumber(number);
		}

		
		public boolean isAuthor(User user, Board board) {
			if(user != null) {
				if(user.getId().compareTo(board.getAuthor())==0)
					return true;
				else 
					return false;
			}
			
			return false;
			
		}
	
		
		
	
		
		
		
		public boolean registerBoard(Board board, User user, MultipartFile file, String uploadPath) throws Exception{
			
			board.setAuthor(user.getId());
			
			if(file != null) {
				String filePath = UploadFileUtils.uploadFile
					(uploadPath, file.getOriginalFilename(),file.getBytes());
				board.setFilepath(filePath);
			}
			boardMapper.insertBoard(board);
			
			return true;
		}
		
		
		public boolean deleteBoard(Integer number) {
			Board board = boardMapper.getBoardByNumber(number);
			board.setDisable("TRUE");
			boardMapper.modifyBoardByDisable(board);
			return true;
		}
}
		
		
