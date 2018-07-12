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
	
}