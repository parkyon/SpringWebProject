package kr.green.springwebproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.RecBook;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.BoardService;
import kr.green.springwebproject.service.LibraryInfoService;
import kr.green.springwebproject.service.RecBookService;
import kr.green.springwebproject.service.UserService;

@Controller

public class LoginHomeController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RecBookService recBookService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private LibraryInfoService libraryInfoService;
	
	
	@RequestMapping(value = "/loginhome", method = RequestMethod.GET)
	public String loginHomeGet(Model model, HttpServletRequest request, Integer number ,Criteria cri
			,String search, Integer type) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
	
		return "loginhome";
	
				
	
	}
	
}
	
	