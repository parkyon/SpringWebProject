package kr.green.springwebproject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping(value ="main", method=RequestMethod.GET)
	public String adminMainGet(Model model) {
		//db에 있는 게시판 모든 글을 가져옴
		ArrayList<Board> list = (ArrayList)boardMapper.getBoardAll();
		//jsp에 해당 게시글을 모두 보냄
		//보낼 때의 이름을 list로 보내면 편함
		model.addAttribute("list", list);
		return "admin/admin";
	}
	@RequestMapping(value ="board/disable")
	public String boardDisable(Model model,Integer number, String disable) {
		Board board = boardMapper.getBoardByNumber(number);
		board.setDisable(disable);
		boardMapper.modifyBoardByDisable(board);
		return "redirect:/admin/main";
	}
	
}
