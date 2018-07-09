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
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.AdminService;
@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value ="/board", method=RequestMethod.GET)
	public String adminMainGet(Model model,Criteria cri
	,HttpServletRequest request) {
		if(cri == null) {
			cri = new Criteria();
		}
	
		
		
		
		int totalCount = adminService.getcountAdminBoard();
		ArrayList<Board> list = adminService.getAdminBoards(cri); 
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = !adminService.isSuperAdmin(user);
		model.addAttribute("admin", admin);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/board";
	}
	@RequestMapping(value ="board/disable")
	public String boardDisable(Model model,Integer number, String disable
			,Integer page) {
		
		adminService.setBoardDissable(number, disable);
		if(page == null)
			page = 1;
		model.addAttribute("page", page);
		return "redirect:/admin/board";
	}
	@RequestMapping(value="/user")
	public String adminUser(HttpServletRequest request,
			Model model, Criteria cri) {
		HttpSession session = request.getSession();
		User nowUser = (User)session.getAttribute("user"); 
		PageMaker pageMaker = new PageMaker();
		if(!adminService.isSuperAdmin(nowUser))
			return "redirect:/admin/board";
		
		
		
		if(cri == null)
			cri = new Criteria();
		
		int totalCount 
			= adminService.countUsersExceptLoginUSer(nowUser);
		
		
		
		
		ArrayList<User> list = adminService.userListExceptLoginUser(nowUser, cri);
		
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/user";
	}
	@RequestMapping(value="/user/set")
	public String adminUserSet(Model model, Integer page, String admin
			, String id) {
		adminService.userSet(admin, id);
		model.addAttribute("page", page);
		return "redirect:/admin/user";
	}
	@RequestMapping(value="/board/delete")
	public String delete(Model model, Integer page, 
			Integer number) {
		
		if(page == null)
			page = 1;
		model.addAttribute("page", page);
		adminService.boardDelete(number);
		return "redirect:/admin/board";
	}
}









