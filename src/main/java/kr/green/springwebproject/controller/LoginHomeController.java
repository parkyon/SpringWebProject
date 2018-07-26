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
		
		if(number == null) {
			number = 1;
		}
		if(cri == null) {
			cri = new Criteria();
		}
		//자유게시판 최신글
		PageMaker pageMaker = new PageMaker();
		int totalCount = boardService.getCountByBoardList(type, search, cri);
		ArrayList<Board> list = boardService.getListBoard(type, search, cri);

		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		boolean admin = userService.isAdmin(user);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		model.addAttribute("admin", admin);
		
		//도서 정보 최신글
		int totalCount2 = libraryInfoService.getCountByLibraryInfoList(type, search, cri);
		ArrayList<LibraryInfo> list2 = libraryInfoService.getListLibraryInfo(type, search, cri);
		model.addAttribute("list2", list2);
		
		
		//추천 도서 최신글
		int totalCount1 = recBookService.getCountByRecBookList(type, search, cri);
		
		ArrayList<RecBook> list1 =recBookService.getRecBook(type,search,cri);
		
		model.addAttribute("list1", list1);
		
		return "loginhome";
	
				
	
	}
}
	
	
	