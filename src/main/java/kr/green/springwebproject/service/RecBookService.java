package kr.green.springwebproject.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.RecBookMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.utils.UploadFileUtils;
@Service
public class RecBookService {
	@Autowired
	private RecBookMapper recBookMapper;

	public ArrayList<RecBook> getRecBook(Integer recBookNumber) {
		return recBookMapper.getRecBookListByNumber(recBookNumber);

	}

	public RecBook getDetailRecBook(Integer recBookNumber) {
		// TODO Auto-generated method stub
		return recBookMapper.getDetailRecBookByNumber(recBookNumber);
	}

	public boolean isAuthor(User user, RecBook recBook) {
		if(user != null) {
			if(user.getId().compareTo(recBook.getAuthor())==0)
				return true;
			else 
				return false;
		}
		
		return false;
	}


	public boolean registerRecBook(RecBook recBook, User user, MultipartFile file, String uploadPath)throws Exception{
		
		recBook.setAuthor(user.getId());
		
		if(file != null) {
			String filePath = UploadFileUtils.uploadFile
				(uploadPath, file.getOriginalFilename(),file.getBytes());
			recBook.setFilepath(filePath);
		}
		
		
		recBookMapper.insertRecBook(recBook);
		
		return true;
		// TODO Auto-generated method stub
		
	}

	public boolean modifyRecBook(RecBook recBook,MultipartFile file
			, String uploadPath, Integer del) throws Exception  {
		
		//湲곗〈 泥⑤��뙆�씪 寃쎈줈瑜� 媛��졇�삤湲� �쐞�븿
		RecBook tmp = recBookMapper.getDetailRecBookByNumber(recBook.getRecBookNumber());
	
		//�닔�젙�맆 泥⑤��뙆�씪�씠 �엳�뒗 寃쎌슦
		if(file != null && file.getOriginalFilename().length()!= 0) {
			String filePath = UploadFileUtils.uploadFile
					(uploadPath, file.getOriginalFilename(),file.getBytes());
			recBook.setFilepath(filePath);
		}
		//�닔�젙�맆 泥⑤��뙆�씪�씠 �뾾吏�留� 湲곗〈 泥⑤��뙆�씪�씠 吏��썙�졇�빞 �븯�뒗 寃쎌슦
		else if(del != null && tmp.getFilepath() != null) {
			//�떎�젣 �뙆�씪�쓣 �궘�젣
			new File(uploadPath + tmp.getFilepath()
				.replace('/', File.separatorChar)).delete();
			recBook.setFilepath(null);
		}
		//�닔�젙�맆 �뙆�씪�씠 �뾾怨� 湲곗〈 �뙆�씪�쓣 �쑀吏��븯�뒗 寃쎌슦
		else {
			recBook.setFilepath(tmp.getFilepath());
		}
		
		recBookMapper.modifyRecBook(recBook);
	
		return false;
		
	}

	public boolean DeleteRecBook(Integer recBookNumber, RecBook recBook) {
		// TODO Auto-generated method stub
		recBookMapper.deleteRecBook(recBook);
		return false;
		
	}
	
	//로그용
	
	
			public ArrayList<RecBook> getRecBookLog(int recBookNumber) {
				return recBookMapper.getRecBookLog(recBookNumber);
						}

			
			
			//최신글용
			public int getCountByRecBookList(Integer type, String search, Criteria cri) {
				int totalCount1 = 0;
				if(type == null)
					type = 0;
				if(type == 0) {
					totalCount1 = recBookMapper.getCountRecBook();
				}
				
				return totalCount1;
			}

			public ArrayList<RecBook> getRecBook(Integer type, String search, Criteria cri) {
				ArrayList<RecBook> list1 = null;
				if(type == null)
					type = 0;
				
				list1 
				= (ArrayList)recBookMapper.searchRecBooks(cri, "%"+search+"%", type);
			return list1;
			}
			
			
			//조회수
			public boolean RecBookHits(RecBook recBook) {
				recBookMapper.recBookHits(recBook);
				return true;
			}

}
