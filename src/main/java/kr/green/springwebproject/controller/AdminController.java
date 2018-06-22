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
@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	@Autowired
	BoardMapper boardMapper;
	@Autowired
	UserMapper userMapper;
	
	@RequestMapping(value ="/board", method=RequestMethod.GET)
	public String adminMainGet(Model model,Criteria cri
	,HttpServletRequest request) {
		if(cri == null) {
			cri = new Criteria();
		}
		int totalCount=0;
		PageMaker pageMaker = new PageMaker();
		ArrayList<Board> list=null;
		pageMaker.setCriteria(cri);
		
		
		totalCount = boardMapper.getCountBoardByAdmin();
		list 
		= (ArrayList)boardMapper.getListPageByAdmin(cri);
		
		
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = false;
		if(user.getAdmin().compareTo("ADMIN")==0)
			admin = true;
		model.addAttribute("admin", admin);
		return "admin/board";
	}
	@RequestMapping(value ="board/disable")
	public String boardDisable(Model model,Integer number, String disable
			,Integer page) {
		Board board = boardMapper.getBoardByNumber(number);
		board.setDisable(disable);
		boardMapper.modifyBoardByDisable(board);
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
		
		ArrayList<User> list=null;
		
		if(cri == null)
			cri = new Criteria();
		int totalCount = 0;
		totalCount 
			= userMapper.countUsersExceptLoginUser(nowUser);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		list = 
			(ArrayList)userMapper.userListExceptLoginUser(nowUser, cri);
		
		model.addAttribute("list", list);
		
		return "admin/user";
	}
	@RequestMapping(value="/user/set")
	public String adminUserSet(Model model, Integer page, String admin
			, String id) {
		User user = userMapper.loginById(id);
		user.setAdmin(admin);
		userMapper.updateUser(user);
		model.addAttribute("page", page);
		return "redirect:/admin/user";
	}
}









