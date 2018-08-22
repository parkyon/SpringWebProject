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
import kr.green.springwebproject.dao.LibraryInfoComment;
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
	
	public boolean modifyLibraryInfo(LibraryInfo libraryInfo,MultipartFile file, String uploadPath, Integer del) throws Exception  {
		
	
		//湲곗〈 泥⑤��뙆�씪 寃쎈줈瑜� 媛��졇�삤湲� �쐞�븿
		LibraryInfo tmp = libraryInfoMapper.getDetailLibraryInfoByNumber(libraryInfo.getNumber());
	
		//�닔�젙�맆 泥⑤��뙆�씪�씠 �엳�뒗 寃쎌슦
		if(file != null && file.getOriginalFilename().length()!= 0) {
			String filePath = UploadFileUtils.uploadFile
					(uploadPath, file.getOriginalFilename(),file.getBytes());
			libraryInfo.setFilepath(filePath);
		}
		//�닔�젙�맆 泥⑤��뙆�씪�씠 �뾾吏�留� 湲곗〈 泥⑤��뙆�씪�씠 吏��썙�졇�빞 �븯�뒗 寃쎌슦
		else if(del != null && tmp.getFilepath() != null) {
			//�떎�젣 �뙆�씪�쓣 �궘�젣
			new File(uploadPath + tmp.getFilepath()
				.replace('/', File.separatorChar)).delete();
			libraryInfo.setFilepath(null);
		}
		//�닔�젙�맆 �뙆�씪�씠 �뾾怨� 湲곗〈 �뙆�씪�쓣 �쑀吏��븯�뒗 寃쎌슦
		else {
			libraryInfo.setFilepath(tmp.getFilepath());
		}
		
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
			
			
			//조회수
			
			
			public boolean LibraryInfoHits(LibraryInfo libraryInfo) {
				libraryInfoMapper.libraryInfoHits(libraryInfo);
				return true;
			}
			
			//main댓글
			public boolean LibraryinfoMainReview(LibraryInfo libraryInfo, LibraryInfoComment libraryInfoComment) {
				libraryInfoMapper.libraryinfoMainReview(libraryInfo, libraryInfoComment);
				return true;
			}
			
			
			//메인 검색
			public ArrayList<LibraryInfo> LM_LibraryInfo(Integer type, String search){
				ArrayList<LibraryInfo> list = null;
				if(type == null)
					type = 0;
				
				list = (ArrayList)libraryInfoMapper.LM_LibraryInfo("%"+search+"%", type);
				return list;
				
			}
}

	
	
