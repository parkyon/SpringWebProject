package kr.green.springwebproject.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.LibraryInfo;
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
	
		public boolean modifyBoard(Board board, MultipartFile file
				, String uploadPath, Integer del) throws Exception  {
			//�닔�젙�맂 �궇吏쒕줈 created_date瑜� �뾽�뜲�씠�듃
			Date created_date = new Date();
			board.setCreated_date(created_date);
			//湲곗〈 泥⑤��뙆�씪 寃쎈줈瑜� 媛��졇�삤湲� �쐞�븿
			Board tmp = boardMapper.getBoardByNumber(board.getNumber());
		
			//�닔�젙�맆 泥⑤��뙆�씪�씠 �엳�뒗 寃쎌슦
			if(file != null && file.getOriginalFilename().length()!= 0) {
				String filePath = UploadFileUtils.uploadFile
						(uploadPath, file.getOriginalFilename(),file.getBytes());
				board.setFilepath(filePath);
			}
			//�닔�젙�맆 泥⑤��뙆�씪�씠 �뾾吏�留� 湲곗〈 泥⑤��뙆�씪�씠 吏��썙�졇�빞 �븯�뒗 寃쎌슦
			else if(del != null && tmp.getFilepath() != null) {
				//�떎�젣 �뙆�씪�쓣 �궘�젣
				new File(uploadPath + tmp.getFilepath()
					.replace('/', File.separatorChar)).delete();
				board.setFilepath(null);
			}
			//�닔�젙�맆 �뙆�씪�씠 �뾾怨� 湲곗〈 �뙆�씪�쓣 �쑀吏��븯�뒗 寃쎌슦
			else {
				board.setFilepath(tmp.getFilepath());
			}
			
			boardMapper.modifyBoard(board);
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
		
		
		public boolean deleteBoard(Integer number, Board board) {
			
			
			boardMapper.deleteBoard(board);
			return true;
		}
		
		
		//로그용
		
		
		public ArrayList<Board> getBoardLog(int number) {
			return boardMapper.getBoardLog(number);
					}
		
		
}
		
		
