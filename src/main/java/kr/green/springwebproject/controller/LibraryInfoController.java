package kr.green.springwebproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.springwebproject.dao.LibraryInfo;
import kr.green.springwebproject.service.LibraryInfoService;

@Controller
@RequestMapping(value="/libraryInfo/*")
public class LibraryInfoController {

	@Autowired
	private LibraryInfoService libraryInfoService;
	
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
}
