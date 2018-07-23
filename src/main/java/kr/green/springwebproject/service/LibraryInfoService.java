package kr.green.springwebproject.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.LibraryInfoMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.utils.UploadFileUtils;

@Service
public class LibraryInfoService {
	@Autowired
	private LibraryInfoMapper libraryInfoMapper;
	
	
	public ArrayList<LibraryInfo> getLibraryInfo(int number) {
		return libraryInfoMapper.getLibraryInfoByNumber(number);
				}
	
	public LibraryInfo getDetailLibraryInfo(int number) {
		// TODO Auto-generated method stub
		return libraryInfoMapper.getDetailLibraryInfoByNumber(number);

		
	}

	public boolean isAuthor(User user, LibraryInfo libraryInfo) {
		// TODO Auto-generated method stub
		if(user != null) {
			if(user.getId().compareTo(libraryInfo.getAuthor())==0)
				return true;
			else 
				return false;
		}
		
		return false;
	}

	public boolean registerLibraryInfo(LibraryInfo libraryInfo, User user) throws Exception{
		
		libraryInfo.setAuthor(user.getId());
		
		libraryInfoMapper.insertLibraryInfo(libraryInfo);
		
		return true;
	}
	
	public boolean modifyLibraryInfo(LibraryInfo libraryInfo) throws Exception  {
		//수정된 날짜로 created_date를 업데이트
		Date created_date = new Date();
		
		//기존 첨부파일 경로를 가져오기 위함

		//수정될 첨부파일이 있는 경우
		
		
		libraryInfoMapper.modifyLibraryInfo(libraryInfo);
		return false;
	}

	public boolean deleteLibaryInfo(LibraryInfo	libaryInfo) {
		// TODO Auto-generated method stub
		libraryInfoMapper.deleteLibraryInfo(libaryInfo);
		return true;

	}

	

	
}
	
	