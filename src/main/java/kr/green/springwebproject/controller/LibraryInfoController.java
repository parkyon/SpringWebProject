package kr.green.springwebproject.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.LibraryInfoService;
import kr.green.springwebproject.service.UserService;

@Controller
@RequestMapping(value="/libraryInfo/*")
public class LibraryInfoController {

	@Autowired
	private LibraryInfoService libraryInfoService;
	@Resource
	private String uploadPath;
	@Autowired
	private UserService userService;
	
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
			Model model, Integer number) {
		
	
		LibraryInfo libraryInfo = libraryInfoService.getDetailLibraryInfo(number);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = libraryInfoService.isAuthor(user, libraryInfo);
		
		//파일명 수정하는 과정
		
		
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("libraryInfo", libraryInfo);		
		
	
		return "/libraryInfo/detail";
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
		libraryInfoService.registerLibraryInfo(libraryInfo, user);
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
	
	
	
}
