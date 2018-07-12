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

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.service.LibraryInfoService;

@Controller
@RequestMapping(value="/libraryInfo/*")
public class LibraryInfoController {

	@Autowired
	private LibraryInfoService libraryInfoService;
	@Resource
	private String uploadPath;
	
	@RequestMapping(value = "libraryList", method = RequestMethod.GET)
	public String loginHomeGet(Model model, HttpServletRequest request, Integer number) {
				
		if(number == null) {
			number = 1;
		}
		
		ArrayList<LibraryInfo> list = libraryInfoService.getLibraryInfo(number);
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "libraryInfo/libraryList";
	}
	
	@RequestMapping(value="detail")
	public String libraryInfoDetail(HttpServletRequest request,
			Model model, Integer number) {
		
		
		if(number == null) {
			number = 1;
		}
		
		
		LibraryInfo libraryInfo = libraryInfoService.getDetailLibraryInfo(number);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean isAuthor = libraryInfoService.isAuthor(user, libraryInfo);
		
		//파일명 수정하는 과정
		String filepath = libraryInfo.getFilePath();
		if(filepath != null) {
		//filepath : /년/월/일/uuid_파일명
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		model.addAttribute("isAuthor", isAuthor);
		model.addAttribute("libraryInfo", libraryInfo);		
		return "/libraryInfo/detail";
	}
}
