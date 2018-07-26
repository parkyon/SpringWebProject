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
import kr.green.springwebproject.service.AdminService;
import kr.green.springwebproject.service.BoardService;
import kr.green.springwebproject.service.LibraryInfoService;
import kr.green.springwebproject.service.RecBookService;
import kr.green.springwebproject.service.UserService;
@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	@Autowired
	private RecBookService recBookService;
	@Autowired
	private LibraryInfoService libraryInfoService;
	
	@RequestMapping(value ="/board", method=RequestMethod.GET)
	public String adminMainGet() {
		
		return "admin/board";
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
	
	
	
	//로그용
	@RequestMapping(value="/recBookLog")
	public String recBookLog(Model model, HttpServletRequest request, Integer recBookNumber) {
		
		if(recBookNumber == null) {
			recBookNumber = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<RecBook> list = recBookService.getRecBookLog(recBookNumber);
		
		model.addAttribute("list", list);
		return "admin/recBookLog";
	}
	@RequestMapping(value="/accountLog")
	public String accountLog(Model model, HttpServletRequest request, String id) {
		
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<User> list = userService.getUserLog(id);
		
		model.addAttribute("list", list); 
		return "admin/accountLog";
	}
	@RequestMapping(value="/libraryInfoLog")
	public String libraryInfoLog(Model model, HttpServletRequest request, Integer number) {
		
		if(number == null) {
			number = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<LibraryInfo> list = libraryInfoService.getLibraryInfoLog(number);
		
		model.addAttribute("list", list);
		return "admin/libraryInfoLog";
	}
	
	@RequestMapping(value="/boardLog")
	public String boardLog(Model model, HttpServletRequest request, Integer number) {
		
		if(number == null) {
			number = 1;
		}
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		model.addAttribute("admin", admin);
		
		
		ArrayList<Board> list = boardService.getBoardLog(number);
		
		model.addAttribute("list", list);
		
				
				
		
		return "admin/boardLog";
	}
	
	@RequestMapping(value="/Userdelete")
	public String withdraw(HttpServletRequest r) {
		HttpSession session = r.getSession();
		User user = (User)session.getAttribute("user");
		userService.userDelete(user);
		
		
		
		return "admin/user";
	}

}









