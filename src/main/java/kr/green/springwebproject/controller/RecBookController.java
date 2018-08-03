package kr.green.springwebproject.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.service.RecBookService;
import kr.green.springwebproject.service.UserService;

@Controller
@RequestMapping(value="/recBook/*")
public class RecBookController {
	@Autowired
	private UserService userService;
	@Autowired
	private RecBookService recBookService;
	
	
	@RequestMapping(value="/recBookMain",method = RequestMethod.GET)
	public String recBookListMainGet(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		return "recBook/recBookMain";
	}
	@RequestMapping(value = "/recBookList", method = RequestMethod.GET)
	public String recBookListGet(Model model, HttpServletRequest request, Integer number) {
		
		if(number == null) {
			number = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<RecBook> list = recBookService.getRecBook(number);
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "recBook/recBookList";
	}
	@RequestMapping(value="detail")
	public String recBookDetail(HttpServletRequest request,
			Model model, Integer number) {
		
	
		RecBook recBook = recBookService.getDetailRecBook(number);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = recBookService.isAuthor(user, recBook);
		
		
		
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("recBook", recBook);		
		return "/recBook/detail";
	}
	

	@RequestMapping(value ="register", method = RequestMethod.GET)
	public String recBookRegisterGet() {
		
		return "/recBook/register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String boardRegisterPost(RecBook recBook
			,HttpServletRequest request, MultipartFile file) throws Exception {
	
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		recBookService.registerRecBook(recBook, user);
	System.out.println(recBook);
	System.out.println(user);
	
	
		return "redirect:/recBook/recBookList";
	}
	
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String recBookModifyGet(HttpServletRequest request,
			Model model,Integer del, Integer number) {
				
		RecBook recBook = recBookService.getDetailRecBook(number);
		
		model.addAttribute("recBook", recBook);
		//파일명 수정하는 과정
		
		
		return "/recBook/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String recBookModifyPost(HttpServletRequest request,
			Model model, RecBook recBook, MultipartFile file, Integer del) 
			throws Exception {
		
		recBookService.modifyRecBook(recBook);
		
		return "redirect:/recBook/recBookList";
	}
	@RequestMapping(value="/delete")
	public String deleteRecBook(RecBook libaryInfo) {
		recBookService.deleteLibaryInfo(libaryInfo);
		return "redirect:/recBook/recBookList";
	}
	
	
	
	//최신글 5개
	
	
	@RequestMapping(value="recentlyRecBookList")
	public String recntlyRecBook(Model model, HttpServletRequest request, Integer number ,Criteria cri
			,String search, Integer type) {
int totalCount1 = recBookService.getCountByRecBookList(type, search, cri);
		
		ArrayList<RecBook> list1 =recBookService.getRecBook(type,search,cri);
		
		model.addAttribute("list1", list1);
		
		return "/recBook/recentlyRecBookList";
	}
	
}


