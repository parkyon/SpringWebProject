package kr.green.springwebproject.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

	public boolean registerLibraryInfo(LibraryInfo libraryInfo, User user, MultipartFile file, String uploadPath) throws Exception{
		
		libraryInfo.setAuthor(user.getId());
		
		if(file != null) {
			String filePath = UploadFileUtils.uploadFile
				(uploadPath, file.getOriginalFilename(),file.getBytes());
			libraryInfo.setFilepath(filePath);
		}
		
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

	
	//로그용
	
	
			public ArrayList<LibraryInfo> getLibraryInfoLog(int number) {
				return libraryInfoMapper.getLibraryInfoLog(number);
						}
//최신글 용
			public int getCountByLibraryInfoList(Integer type, String search, Criteria cri) {
				int totalCount2 = 0;
				if(type == null)
					type = 0;
				if(type == 0) {
					totalCount2 = libraryInfoMapper.getCountLibraryInfo();
				}
				
				return totalCount2;
			}

			public ArrayList<LibraryInfo> getListLibraryInfo(Integer type, String search, Criteria cri) {
				ArrayList<LibraryInfo> list2 = null;
				if(type == null)
					type = 0;
				
				list2 
				= (ArrayList)libraryInfoMapper.searchLibraryInfos(cri, "%"+search+"%", type);
			return list2;
			}
			

			
			

			

			
			//server side 용
			
			public int CountLibrary(Integer type, String search, Criteria cri, int aaa) {
				
				
				int totalCount2 = 0;
				if(type == null)
					type = 0;
				if(type == 0) {
					totalCount2 = libraryInfoMapper.getCountLibraryInfo();
				}
				
				return totalCount2;
			}
			
			
		
			public ArrayList<LibraryInfo> SSgetLibraryInfo(Integer type, String search, Criteria cri) {
				ArrayList<LibraryInfo> list2 = null;
				if(type == null)
					type = 0;
				
				list2 
				= (ArrayList)libraryInfoMapper.searchLibraryInfos(cri, "%"+search+"%", type);
			return list2;
			}
			
			
			//rec
			
			public boolean RecLibraryInfo(LibraryInfo libraryInfo) {
				libraryInfoMapper.recLibraryInf(libraryInfo);
				return true;
			}
			public boolean NotRecLibraryInfo(LibraryInfo libraryInfo) {
				libraryInfoMapper.notrecLibraryInf(libraryInfo);
				return true;
			}
			
			
			
//댓글용
			
			
			public List<LibraryInfo> getComment(int bno) {
				return libraryInfoMapper.getCommentByCno(bno);
			}
			
			public boolean insertComment(User user, LibraryInfo libraryInfo) {
			libraryInfo.setWriter(user.getId());
			
			libraryInfoMapper.insertComment(libraryInfo);
			
			return true;
			}
			
			
			

			public int getCountByComment(Integer type, String search, Criteria cri) {
				int totalCount2 = 0;
				if(type == null)
					type = 0;
				if(type == 0) {
					totalCount2 = libraryInfoMapper.getCountComment();
				}
				
				return totalCount2;
			}

			public ArrayList<LibraryInfo> getListComment(Integer type, String search, Criteria cri) {
				ArrayList<LibraryInfo> list2 = null;
				if(type == null)
					type = 0;
				
				list2 
				= (ArrayList)libraryInfoMapper.searchComment(cri, "%"+search+"%", type);
			return list2;
			}
}
	
	
