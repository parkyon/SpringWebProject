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
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping(value="list")
	public String boardList(Model model,Criteria cri
			,String search, Integer type,HttpServletRequest request) {
		//Criteria cri = new Criteria(1,5);
		if(cri == null) {
			cri = new Criteria();
		}
		int totalCount=0;
		PageMaker pageMaker = new PageMaker();
		ArrayList<Board> list=null;
		pageMaker.setCriteria(cri);
		
		if(type == null)
			type = 0;
		if(type == 0) {
			totalCount = boardMapper.getCountBoard();
			list 
			= (ArrayList)boardMapper.getListPage(cri);
		}
		else if(type == 1) {
			totalCount 
			= boardMapper.getCountBoardByTitle("%"+search+"%");
			list 
			= (ArrayList)boardMapper.getListPageByTitle(cri,"%"+search+"%");
		}else if(type == 2) {
			totalCount 
			= boardMapper.getCountBoardByAuthor("%"+search+"%");
			list 
			= (ArrayList)boardMapper.getListPageByAuthor(cri,"%"+search+"%");
		}else {
			totalCount 
			= boardMapper.getCountBoardByContents("%"+search+"%");
			list 
			= (ArrayList)boardMapper.getListPageByContents(cri,"%"+search+"%");
		}
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = false;
		if(user.getAdmin().compareTo("ADMIN")==0)
			admin = true;
		model.addAttribute("admin", admin);
		
		return "/board/list";
	}
	@RequestMapping(value="detail")
	public String boardDetail(HttpServletRequest request,
			Model model) {
		int number = 
			Integer.parseInt(request.getParameter("number"));
		
		Board board = boardMapper.getBoardByNumber(number);
		model.addAttribute("board", board);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = false;
		if(user != null) {
			if(user.getId().compareTo(board.getAuthor())==0)
				isAuthor = true;
			else 
				isAuthor = false;
		}
		model.addAttribute("isAuthor", isAuthor);
		return "/board/detail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String boardModifyGet(HttpServletRequest request,
			Model model) {
		int number = 
				Integer.parseInt(request.getParameter("number"));
			
		Board board = boardMapper.getBoardByNumber(number);
		model.addAttribute("board", board);
		
		return "/board/modify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String boardModifyPost(HttpServletRequest request,
			Model model, Board board) {
		
		boardMapper.modifyBoard(board);
		
		return "redirect:/board/list";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String boardRegisterGet() {
		return "/board/register";
	}
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String boardRegisterPost(Board board
			,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		board.setAuthor(user.getId());
		boardMapper.insertBoard(board);
		return "redirect:/board/list";
	}
}






