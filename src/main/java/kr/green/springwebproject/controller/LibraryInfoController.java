package kr.green.springwebproject.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.LibraryInfoService;
import kr.green.springwebproject.service.UserService;
import kr.green.springwebproject.utils.MediaUtils;
import kr.green.springwebproject.utils.UploadFileUtils;

@Controller
@RequestMapping(value="/libraryInfo/*")
public class LibraryInfoController {

	@Autowired
	private LibraryInfoService libraryInfoService;
	@Resource
	private String uploadPath;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="libraryInfoMain", method = RequestMethod.GET)
	public String libraryInfoMain(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		return "libraryInfo/libraryInfoMain";
	}
	
	@RequestMapping(value = "libraryList", method = RequestMethod.GET)
	public String loginHomeGet(Model model, HttpServletRequest request, Integer number) {
				
		if(number == null) {
			number = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<LibraryInfo> list = libraryInfoService.getLibraryInfo(number);
		
		model.addAttribute("list", list);
	
		return "libraryInfo/libraryList";
	}
	
	@RequestMapping(value="detail")
	public String libraryInfoDetail(HttpServletRequest request,
			Model model, Integer number, Integer bno, Criteria cri
			,String search, Integer type ) {
		
		
		LibraryInfo libraryInfo = libraryInfoService.getDetailLibraryInfo(number);
		libraryInfoService.LibraryInfoHits(libraryInfo);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = libraryInfoService.isAuthor(user, libraryInfo);
		
		
		String filepath = libraryInfo.getFilepath();
		if(filepath != null) {
		//filepath : /�뀈/�썡/�씪/uuid_�뙆�씪紐�
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		//파일명 수정하는 과정
		
		
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("libraryInfo", libraryInfo);		
		
	
		List<LibraryInfo> comment = libraryInfoService.getComment(number); 
		model.addAttribute("comment", comment);
		System.out.println(comment);
		
	
	
		return "/libraryInfo/detail";
	}
	
	@RequestMapping(value ="detail", method = RequestMethod.POST)
	public String DPOST(LibraryInfo libraryInfo
			,HttpServletRequest request,  String content, Model model) throws Exception {
		
		
		System.out.println(content);
		System.out.println(libraryInfo.getNumber());
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		libraryInfoService.insertComment(user, libraryInfo);
		
		model.addAttribute("number", libraryInfo.getNumber());
		
		
		
	return "redirect:/libraryInfo/detail";
	}
	
	@RequestMapping(value ="register", method = RequestMethod.GET)
	public String libraryInfoRegisterGet() {
		
		return "/libraryInfo/register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String boardRegisterPost(LibraryInfo libraryInfo
			,HttpServletRequest request, MultipartFile file) throws Exception {
	
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		libraryInfoService.registerLibraryInfo(libraryInfo, user, file, uploadPath);
	System.out.println(libraryInfo);
	System.out.println("이건 유저정보");
	System.out.println(user);
	return "redirect:/libraryInfo/libraryList";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String libraryInfoModifyGet(HttpServletRequest request,
			Model model,Integer del, Integer number) {
				
		LibraryInfo libraryInfo = libraryInfoService.getDetailLibraryInfo(number);
		
		model.addAttribute("libraryInfo", libraryInfo);
		//파일명 수정하는 과정
		
		
		return "/libraryInfo/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String libraryInfoModifyPost(HttpServletRequest request,
			Model model, LibraryInfo libraryInfo, MultipartFile file, Integer del) 
			throws Exception {
		
		libraryInfoService.modifyLibraryInfo(libraryInfo);
		
		return "redirect:/libraryInfo/libraryList";
	}
	@RequestMapping(value="/delete")
	public String deleteLibraryInfo(LibraryInfo libaryInfo) {
		libraryInfoService.deleteLibaryInfo(libaryInfo);
		return "redirect:/libraryInfo/libraryList";
	}
	
	
	
	@RequestMapping(value="recentlyLibraryInfo")
	public String recentlyLibraryInfo(Model model, HttpServletRequest request, Integer number ,Criteria cri
			,String search, Integer type) {
		int totalCount2 = libraryInfoService.getCountByLibraryInfoList(type, search, cri);
		ArrayList<LibraryInfo> list2 = libraryInfoService.getListLibraryInfo(type, search, cri);
		model.addAttribute("list2", list2);
		
		return "/libraryInfo/recentlyLibraryInfo";
	}
	
	@RequestMapping(value="rec")
	public String rec(LibraryInfo libraryInfo) {
		libraryInfoService.RecLibraryInfo(libraryInfo);
		return "redirect:/libraryInfo/libraryList";
	}
	
	@RequestMapping(value="notrec")
	public String notrec(LibraryInfo libraryInfo) {
		libraryInfoService.NotRecLibraryInfo(libraryInfo);
		return "redirect:/libraryInfo/libraryList";
	}


	//첨부파일
	
	@ResponseBody
	@RequestMapping("download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	    	String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        /*	�솗�옣�옄瑜� �넻�빐 誘몃뵒�뼱 ���엯 �젙蹂대�� 媛��졇�샂*/
	        MediaType mType = MediaUtils.getMediaType(FormatName);
	        
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        
	        /*	�씠誘몄��씠硫� */
	        if(mType != null) {
	        	headers.setContentType(mType);
	        }else {
	        	fileName = fileName.substring(fileName.indexOf("_")+1);
		        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		        headers.add("Content-Disposition",  "attachment; filename=\"" 
					+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        }
	        entity = new ResponseEntity<byte[]>(
	        		IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<String> displayFile(MultipartFile file)
			throws Exception{
		String fileName = UploadFileUtils.uploadFile
				(uploadPath, file.getOriginalFilename(),file.getBytes());
	    
	    return new ResponseEntity<String>(fileName,
				HttpStatus.OK);
	}
	
}
