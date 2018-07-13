package kr.green.springwebproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/recBook/*")
public class RecBookController {

	@RequestMapping(value = "/recBookList", method = RequestMethod.GET)
	public String loginHomeGet(Model model, HttpServletRequest request) {
				
		return "recBook/recBookList";
	}
	
}
